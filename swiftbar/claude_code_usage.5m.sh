#!/usr/bin/env bash
#<xbar.title>Claude Usage</xbar.title>
#<xbar.version>1.1</xbar.version>
#<xbar.author>Rodrigo Nemmen da Silva</xbar.author>
#<xbar.desc>Display remaining Claude Code API rate limit capacity</xbar.desc>
#<xbar.dependencies>curl,python3</xbar.dependencies>
#<xbar.image>https://raw.githubusercontent.com/rsnemmen/claude-usage/refs/heads/main/SCR-20260219-jges.png</xbar.image>

# Local changes from upstream:
# - Show remaining capacity instead of used utilization.
# - Invert progress bars, pace, and warning thresholds to match.
# - Use a compact 18x18 dual-bar icon without the provider logo.

# User variables
# ================
#<xbar.var>boolean(VAR_SHOW_7D="false"): Also show 7-day window in title (e.g. 45%/23%).</xbar.var>
#<xbar.var>boolean(VAR_COLORS="true"): Color-code title at warning/critical levels.</xbar.var>
#<xbar.var>boolean(VAR_SHOW_RESET="true"): Show time-until-reset for each window in the dropdown.</xbar.var>
#<xbar.var>boolean(VAR_SHOW_BARS="true"): Show compact dual progress bars (5h top, 7d bottom).</xbar.var>
#<xbar.var>boolean(VAR_SHOW_PACE="false"): Show expected remaining capacity under the 7d window.</xbar.var>

umask 077

SHOW_7D="${VAR_SHOW_7D:-false}"
COLORS="${VAR_COLORS:-true}"
SHOW_RESET="${VAR_SHOW_RESET:-true}"
SHOW_BARS="${VAR_SHOW_BARS:-true}"
SHOW_PACE="${VAR_SHOW_PACE:-false}"

CLAUDE_ICON="iVBORw0KGgoAAAANSUhEUgAAABIAAAASCAYAAABWzo5XAAAAAXNSR0IArs4c6QAAAHhlWElmTU0AKgAAAAgABAEaAAUAAAABAAAAPgEbAAUAAAABAAAARgEoAAMAAAABAAIAAIdpAAQAAAABAAAATgAAAAAAAABIAAAAAQAAAEgAAAABAAOgAQADAAAAAQABAACgAgAEAAAAAQAAABKgAwAEAAAAAQAAABIAAAAAqSaGYgAAAAlwSFlzAAALEwAACxMBAJqcGAAAAdJJREFUOBGV0z1IVWEYB3Cv2ZAVlQUpWDnYJqZBREPU1tISBo1OBkEfWBGNQhTR1iwu2hIENdYUVBRBBjXVUEZRYBLah2CD3X5/O/cQ14vRA7/zPO/Hec857zmnqakuqtVqM11U6ob+r2mBQ3zjYu1MdR/3aKv1/TObvI9ffKqdKA+zwOYsIPewv+FiBrbSWky8oU6cKtrX1C+Kuludi3xkaX65oI4WJnlOLx185TUZmyi0yk9JXGf5Puo8zjzfGeACiSPcJu0xErno+vJO6guDu3hAYpwZnvCY3G1ijp76cxu2TTxP7qwWi0WRlzBCP0OMcou2isMWq43wky/MME0vZ9lELaqKjK0m8/ICHjLW4jDPSzrYQDt9JBb/pPKYua+4zyTvmapUKgvy8nCXnWSPpsjj1GJKcZm7TJN4R3vuqAwd6zSGyfdzh2fkEbrIFkQ3A+Tx+lnLbPkdWGSvjnFWcYJOhhjlMD84wCO2c9QjfZaXorlWyLlCFtrNLJcYZAdznCPfzgcmyLe1U24cBrfxhmOZIednvVrUg+rEHvJzH0x/wzB4hisZlNeQ/+p00c7ncpOTDU/+u9Ok8gWoN/KW7FEZ2n9vSdm/YuGkdrJ/K8ZvZcjUYTq3RuAAAAAASUVORK5CYII="

# === Helper: show error with logo and warning ===

show_error() {
  local message="$1"
  echo "!"
  echo "---"
  printf '%s\n' "$message"
  echo "---"
  echo "Refresh | refresh=true"
  exit 0
}

_CACHE_DIR="${TMPDIR:-/tmp}"
USAGE_CACHE="${_CACHE_DIR}.claude_swiftbar_cache_v2"
TOKEN_CACHE="${_CACHE_DIR}.claude_swiftbar_token"
CACHE_TTL=300    # 5 minutes — matches poll interval
TOKEN_TTL=900    # 15 minutes
STALE_TTL=86400  # 24 hours — stale fallback on API failures
IS_STALE=false

# Falls back to stale USAGE_CACHE (up to STALE_TTL old) when the API call fails.
# Sets $parsed and $IS_STALE on success; calls show_error (exits) when no usable cache exists.
_use_stale_or_error() {
  local message="$1"
  if [ -f "$USAGE_CACHE" ]; then
    local sa stale
    sa=$(( $(date -u +%s) - $(stat -f %m "$USAGE_CACHE" 2>/dev/null || echo 0) ))
    if [ "$sa" -lt "$STALE_TTL" ]; then
      stale="$(cat "$USAGE_CACHE" 2>/dev/null)"
      if [ -n "$stale" ]; then
        parsed="$stale"
        IS_STALE=true
        return 0
      fi
    fi
  fi
  show_error "$message"
}

# === Get token (cached) ===

TOKEN=""
if [ -f "$TOKEN_CACHE" ]; then
  cache_age=$(( $(date -u +%s) - $(stat -f %m "$TOKEN_CACHE" 2>/dev/null || echo 0) ))
  if [ "$cache_age" -lt "$TOKEN_TTL" ]; then
    TOKEN="$(cat "$TOKEN_CACHE" 2>/dev/null)"
  fi
fi

if [ -z "$TOKEN" ]; then
  RAW_CREDS="$(security find-generic-password -s "Claude Code-credentials" -w 2>/dev/null)"
  if [ -z "$RAW_CREDS" ]; then
    show_error "No Claude Code credentials found in Keychain. Sign in to Claude Code first."
  fi
  TOKEN="$(printf '%s' "$RAW_CREDS" | python3 -c "
import json, sys
try:
    d = json.loads(sys.stdin.read().strip())
    if 'claudeAiOauth' in d:
        print(d['claudeAiOauth']['accessToken'])
    elif 'accessToken' in d:
        print(d['accessToken'])
    else:
        sys.exit(1)
except Exception:
    sys.exit(1)
" 2>/dev/null)"
  if [ -z "$TOKEN" ]; then
    show_error "Could not parse Claude Code credentials."
  fi
  _t="$(mktemp "${TOKEN_CACHE}.XXXXXX")" \
    && printf '%s' "$TOKEN" > "$_t" \
    && chmod 600 "$_t" \
    && mv "$_t" "$TOKEN_CACHE"
fi

# === Load usage from cache or fetch from API ===

parsed=""

if [ -f "$USAGE_CACHE" ]; then
  cache_age=$(( $(date -u +%s) - $(stat -f %m "$USAGE_CACHE" 2>/dev/null || echo 0) ))
  if [ "$cache_age" -lt "$CACHE_TTL" ]; then
    parsed="$(cat "$USAGE_CACHE" 2>/dev/null)"
  fi
fi

if [ -z "$parsed" ]; then
  response="$(curl -s --connect-timeout 5 --max-time 10 -w "\n%{http_code}" \
    -H "Authorization: Bearer ${TOKEN}" \
    -H "anthropic-beta: oauth-2025-04-20" \
    -H "Accept: application/json" \
    "https://api.anthropic.com/api/oauth/usage")"

  http_code="$(printf '%s\n' "$response" | tail -n 1)"
  body="$(printf '%s\n' "$response" | sed '$d')"

  if [ -z "$http_code" ] || [ "$http_code" = "000" ]; then
    _use_stale_or_error "No internet connection."
  elif [ "$http_code" = "401" ]; then
    rm -f "$TOKEN_CACHE" "$USAGE_CACHE"
    show_error "Token expired. Please sign in to Claude Code again."
  elif [ "$http_code" = "429" ]; then
    _use_stale_or_error "Usage API rate limited. Will retry shortly."
  elif [ "$http_code" -lt 200 ] || [ "$http_code" -ge 300 ]; then
    _use_stale_or_error "API error: HTTP $http_code"
  fi

  if [ -z "$parsed" ]; then
    parsed="$(printf '%s' "$body" | python3 -c "
import json, sys
try:
    d = json.loads(sys.stdin.read())
    def get_remaining(window, default='0'):
        try:
            w = d.get(window)
            if not w:
                return default
            v = w.get('utilization')
            if v is None:
                return default
            return str(max(0, min(100, 100 - float(v))))
        except Exception:
            return default
    if not any(isinstance(d.get(w), dict) and d[w].get('utilization') is not None
               for w in ('five_hour', 'seven_day', 'seven_day_opus')):
        sys.exit(1)
    print(get_remaining('five_hour', '0'))
    print(get_remaining('seven_day', '0'))
    print((d.get('five_hour') or {}).get('resets_at') or '')
    print((d.get('seven_day') or {}).get('resets_at') or '')
except Exception as e:
    sys.stderr.write(str(e) + '\n')
    sys.exit(1)
" 2>/dev/null)"
  fi

  if [ -z "$parsed" ]; then
    _use_stale_or_error "Could not parse API response"
  fi

  if [ "$IS_STALE" = "false" ]; then
    _t="$(mktemp "${USAGE_CACHE}.XXXXXX")" && printf '%s\n' "$parsed" > "$_t" && mv "$_t" "$USAGE_CACHE"
  fi
fi

REMAINING_5H="$(printf '%s\n' "$parsed" | sed -n '1p')"
REMAINING_7D="$(printf '%s\n' "$parsed" | sed -n '2p')"
RESET_5H="$(printf '%s\n' "$parsed" | sed -n '3p')"
RESET_7D="$( printf '%s\n' "$parsed" | sed -n '4p')"

format_pct() {
  python3 -c "print(round(float('${1:-0}')))" 2>/dev/null || echo "0"
}

PCT_5H="$(format_pct "$REMAINING_5H")"
PCT_7D="$(format_pct "$REMAINING_7D")"

# === Helper: human-readable countdown from ISO 8601 timestamp ===

time_until() {
  local ts="$1"
  [ -z "$ts" ] && echo "?" && return
  TS="$ts" python3 -c "
import os
from datetime import datetime, timezone
ts = os.environ['TS']
try:
    if ts.endswith('Z'):
        ts = ts[:-1] + '+00:00'
    reset = datetime.fromisoformat(ts)
    now = datetime.now(timezone.utc)
    diff = reset - now
    secs = diff.total_seconds()
    if secs <= 0:
        print('now')
    else:
        days  = int(secs // 86400)
        hours = int((secs % 86400) // 3600)
        mins  = int((secs % 3600) // 60)
        if days > 0:
            print(f'{days}d {hours}h')
        elif hours > 0:
            print(f'{hours}h {mins}m')
        else:
            print(f'{mins}m')
except Exception:
    print('?')
" 2>/dev/null || echo "?"
}

# === Helper: expected remaining capacity at uniform pace ===
# pace_pct <resets_at_iso8601> <window_days>

pace_pct() {
  local ts="$1"
  local days="$2"
  [ -z "$ts" ] && echo "0" && return
  TS="$ts" DAYS="$days" python3 -c "
import os
from datetime import datetime, timezone, timedelta
ts = os.environ['TS']
days = int(os.environ['DAYS'])
try:
    if ts.endswith('Z'):
        ts = ts[:-1] + '+00:00'
    resets_at = datetime.fromisoformat(ts)
    now = datetime.now(timezone.utc)
    window = timedelta(days=days)
    start = resets_at - window
    total = window.total_seconds()
    pct = max(0.0, min(100.0, (resets_at - now).total_seconds() / total * 100))
    print(round(pct))
except Exception:
    print(0)
" 2>/dev/null || echo "0"
}

# === Helper: color for a given percentage ===

color_for_pct() {
  local pct=$1
  if [ "$COLORS" = "true" ]; then
    [ "$pct" -le 10 ] 2>/dev/null && echo "#CC0000" && return
    [ "$pct" -le 30 ] 2>/dev/null && echo "#CC8800" && return
  fi
  echo ""
}

# === Helper: ASCII progress bar (20 chars) ===

make_bar() {
  local pct="${1:-0}"
  local width=20
  local filled
  filled=$(python3 -c "print(min(int(round(${pct} * ${width} / 100)), ${width}))" 2>/dev/null || echo "0")
  local bar=""
  local i=1
  while [ "$i" -le "$width" ]; do
    if [ "$i" -le "$filled" ]; then
      bar="${bar}█"
    else
      bar="${bar}░"
    fi
    i=$((i + 1))
  done
  echo "$bar"
}

# === Helper: dynamic dual progress bar icon ===

make_icon() {
  local pct5h="${1:-0}" pct7d="${2:-0}"
  PCT5H="$pct5h" PCT7D="$pct7d" python3 -c "
import os, struct, zlib, base64

def make_png(w, h, rows_rgba):
    def chunk(tag, data):
        c = struct.pack('>I', len(data)) + tag + data
        return c + struct.pack('>I', zlib.crc32(c[4:]) & 0xffffffff)
    ihdr = struct.pack('>IIBBBBB', w, h, 8, 6, 0, 0, 0)
    raw = b''
    for row in rows_rgba:
        raw += b'\x00'
        for (r,g,b,a) in row:
            raw += bytes([r,g,b,a])
    return (b'\x89PNG\r\n\x1a\n'
            + chunk(b'IHDR', ihdr)
            + chunk(b'IDAT', zlib.compress(raw))
            + chunk(b'IEND', b''))

W, H = 18, 18
BAR_W = 18

p5 = min(max(int(round(float(os.environ['PCT5H']))), 0), 100)
p7 = min(max(int(round(float(os.environ['PCT7D']))), 0), 100)

fill5 = int(round(p5 * BAR_W / 100))
fill7 = int(round(p7 * BAR_W / 100))
FG    = (0, 0, 0, 255)
EMPTY = (0, 0, 0, 60)
CLEAR = (0, 0, 0, 0)

rows = []
for ri in range(H):
    row = []
    for ci in range(W):
        if 2 <= ri <= 7:
            row.append(FG if ci < fill5 else EMPTY)
        elif 10 <= ri <= 15:
            row.append(FG if ci < fill7 else EMPTY)
        else:
            row.append(CLEAR)
    rows.append(row)

print(base64.b64encode(make_png(W, H, rows)).decode())
" 2>/dev/null
}

# === Build menu bar title ===

COLOR_5H="$(color_for_pct "$PCT_5H")"
COLOR_7D="$(color_for_pct "$PCT_7D")"

# For title, use the "most urgent" color (critical > warning > none)
title_color() {
  local c1="$1" c2="$2"
  if [ "$c1" = "#CC0000" ] || [ "$c2" = "#CC0000" ]; then echo "#CC0000"; return; fi
  if [ "$c1" = "#CC8800" ] || [ "$c2" = "#CC8800" ]; then echo "#CC8800"; return; fi
  echo ""
}

if [ "$SHOW_7D" = "true" ]; then
  TITLE_COLOR="$(title_color "$COLOR_5H" "$COLOR_7D")"
  TITLE="${PCT_5H}%/${PCT_7D}%"
else
  TITLE_COLOR="$COLOR_5H"
  TITLE="${PCT_5H}%"
fi

render_text_title() {
  if [ -n "$TITLE_COLOR" ]; then
    echo "${TITLE} | color=${TITLE_COLOR}"
  else
    echo "${TITLE}"
  fi
}

# Emit menu bar line
if [ "$SHOW_BARS" = "true" ]; then
  BAR_ICON="$(make_icon "$PCT_5H" "$PCT_7D")"
  if [ -n "$BAR_ICON" ]; then
    echo " | templateImage=${BAR_ICON}"
  else
    render_text_title
  fi
else
  render_text_title
fi

# === Dropdown ===

echo "---"

# --- 5h window ---
BAR_5H="$(make_bar "$PCT_5H")"
if [ -n "$COLOR_5H" ]; then
  echo "5h remaining | color=#888888"
  echo "5h: ${PCT_5H}% ${BAR_5H} | color=${COLOR_5H}"
else
  echo "5h remaining | color=#888888"
  echo "5h: ${PCT_5H}% ${BAR_5H}"
fi

if [ "$SHOW_RESET" = "true" ] && [ -n "$RESET_5H" ]; then
  UNTIL_5H="$(time_until "$RESET_5H")"
  echo "Resets in: ${UNTIL_5H} | color=#888888"
fi

echo "---"

# --- 7d window ---
COLOR_7D_VAL="$(color_for_pct "$PCT_7D")"
BAR_7D="$(make_bar "$PCT_7D")"
echo "Weekly remaining | color=#888888"
if [ -n "$COLOR_7D_VAL" ]; then
  echo "7d: ${PCT_7D}% ${BAR_7D} | color=${COLOR_7D_VAL}"
else
  echo "7d: ${PCT_7D}% ${BAR_7D}"
fi

if [ "$SHOW_PACE" = "true" ] && [ -n "$RESET_7D" ]; then
  PCT_PACE_7D="$(pace_pct "$RESET_7D" 7)"
  BAR_PACE_7D="$(make_bar "$PCT_PACE_7D")"
  echo "Expected remaining: ${PCT_PACE_7D}% ${BAR_PACE_7D} | color=#888888"
fi

if [ "$SHOW_RESET" = "true" ] && [ -n "$RESET_7D" ]; then
  UNTIL_7D="$(time_until "$RESET_7D")"
  echo "Resets in: ${UNTIL_7D} | color=#888888"
fi

if [ "$IS_STALE" = "true" ]; then
  echo "---"
  echo "(showing cached data) | color=#888888"
fi

echo "---"

echo "View usage on Claude.ai | href=https://claude.ai/settings/usage"
echo "Anthropic status | href=https://status.anthropic.com/"
echo "Refresh | refresh=true"
