#!/usr/bin/env bash
#<xbar.title>Codex Usage</xbar.title>
#<xbar.version>1.1</xbar.version>
#<xbar.author>Rodrigo Nemmen da Silva</xbar.author>
#<xbar.abouturl>https://github.com/rsnemmen/codex-usage-swiftbar/</xbar.abouturl>
#<xbar.desc>Display remaining Codex/OpenAI rate limit capacity</xbar.desc>
#<xbar.dependencies>curl,python3,codex(optional)</xbar.dependencies>

# Local changes from upstream:
# - Show remaining capacity instead of used utilization.
# - Invert progress bars, pace, and warning thresholds to match.
# - Use a compact 18x18 dual-bar icon without the provider logo.

#<xbar.var>boolean(VAR_SHOW_7D="false"): Also show weekly window in title.</xbar.var>
#<xbar.var>boolean(VAR_COLORS="true"): Color-code title at warning/critical levels.</xbar.var>
#<xbar.var>boolean(VAR_SHOW_RESET="true"): Show time-until-reset in dropdown.</xbar.var>
#<xbar.var>boolean(VAR_SHOW_BARS="true"): Show dual progress bar icon in title.</xbar.var>
#<xbar.var>boolean(VAR_SHOW_PACE="false"): Show expected pace for weekly window.</xbar.var>
#<xbar.var>string(VAR_SOURCE="auto"): Source mode: auto|oauth|cli</xbar.var>

SHOW_7D="${VAR_SHOW_7D:-false}"
COLORS="${VAR_COLORS:-true}"
SHOW_RESET="${VAR_SHOW_RESET:-true}"
SHOW_BARS="${VAR_SHOW_BARS:-true}"
SHOW_PACE="${VAR_SHOW_PACE:-false}"
SOURCE_MODE="${VAR_SOURCE:-auto}"

OPENAI_ICON="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"

USAGE_CACHE="/tmp/.codex_swiftbar_cache_v3"
TOKEN_CACHE="/tmp/.codex_swiftbar_token"
CACHE_TTL=300
TOKEN_TTL=900

show_error() {
  local message="$1"
  echo "!"
  echo "---"
  echo "$message"
  echo "---"
  echo "Refresh | refresh=true"
  exit 0
}

normalize_source() {
  case "$1" in
    auto|oauth|cli) echo "$1" ;;
    *) echo "auto" ;;
  esac
}

SOURCE_MODE="$(normalize_source "$SOURCE_MODE")"

python_eval() {
  python3 - "$@"
}

load_oauth_token() {
  if [ -f "$TOKEN_CACHE" ]; then
    local age
    age=$(( $(date -u +%s) - $(stat -f %m "$TOKEN_CACHE" 2>/dev/null || echo 0) ))
    if [ "$age" -lt "$TOKEN_TTL" ]; then
      cat "$TOKEN_CACHE"
      return 0
    fi
  fi

  local auth_path
  auth_path="$(python_eval <<'PY'
import json, os, pathlib
home = pathlib.Path(os.environ.get("CODEX_HOME", str(pathlib.Path.home() / ".codex")))
print(str(home / "auth.json"))
PY
)"
  [ -f "$auth_path" ] || return 1

  local parsed
  parsed="$(python_eval "$auth_path" <<'PY'
import json, os, pathlib, sys, urllib.request, urllib.error
from datetime import datetime, timezone

path = pathlib.Path(sys.argv[1])
raw = json.loads(path.read_text())
tokens = raw.get("tokens", {})

api_key = (raw.get("OPENAI_API_KEY") or "").strip()
if api_key:
    print(api_key)
    sys.exit(0)

def val(d, a, b):
    v = d.get(a) or d.get(b) or ""
    return v.strip() if isinstance(v, str) else ""

access = val(tokens, "access_token", "accessToken")
refresh = val(tokens, "refresh_token", "refreshToken")
id_token = val(tokens, "id_token", "idToken")
acct = val(tokens, "account_id", "accountId")
last_refresh = raw.get("last_refresh")

needs_refresh = True
if isinstance(last_refresh, str) and last_refresh:
    try:
        dt = datetime.fromisoformat(last_refresh.replace("Z", "+00:00"))
        needs_refresh = (datetime.now(timezone.utc) - dt).total_seconds() > 8 * 24 * 60 * 60
    except Exception:
        needs_refresh = True

if access and refresh and needs_refresh:
    req = urllib.request.Request(
        "https://auth.openai.com/oauth/token",
        method="POST",
        headers={"Content-Type": "application/json"},
        data=json.dumps({
            "client_id": "app_EMoamEEZ73f0CkXaXp7hrann",
            "grant_type": "refresh_token",
            "refresh_token": refresh,
            "scope": "openid profile email"
        }).encode("utf-8")
    )
    try:
        with urllib.request.urlopen(req, timeout=20) as r:
            payload = json.loads(r.read().decode("utf-8"))
        access = payload.get("access_token", access) or access
        refresh = payload.get("refresh_token", refresh) or refresh
        id_token = payload.get("id_token", id_token) or id_token
        raw["tokens"] = {
            "access_token": access,
            "refresh_token": refresh,
            "id_token": id_token,
            "account_id": acct
        }
        raw["last_refresh"] = datetime.now(timezone.utc).isoformat().replace("+00:00", "Z")
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(json.dumps(raw, indent=2, sort_keys=True))
    except Exception:
        pass

if not access:
    sys.exit(1)

print(access)
print(acct)
PY
)"
  [ -n "$parsed" ] || return 1
  printf '%s\n' "$parsed" > "$TOKEN_CACHE"
  printf '%s\n' "$parsed"
}

fetch_oauth_usage() {
  local token_and_acct token account_id config_url base_url usage_url response http_code body
  token_and_acct="$(load_oauth_token)" || return 1
  token="$(printf '%s\n' "$token_and_acct" | sed -n '1p')"
  account_id="$(printf '%s\n' "$token_and_acct" | sed -n '2p')"
  [ -n "$token" ] || return 1

  config_url="$(python_eval <<'PY'
import os, pathlib
root = pathlib.Path(os.environ.get("CODEX_HOME", str(pathlib.Path.home() / ".codex")))
cfg = root / "config.toml"
if cfg.exists():
    print(str(cfg))
PY
)"
  base_url=""
  if [ -n "$config_url" ] && [ -f "$config_url" ]; then
    base_url="$(python_eval "$config_url" <<'PY'
import pathlib, re, sys
s = pathlib.Path(sys.argv[1]).read_text()
for line in s.splitlines():
    line = line.split("#", 1)[0].strip()
    if not line or "=" not in line:
        continue
    k, v = [x.strip() for x in line.split("=", 1)]
    if k != "chatgpt_base_url":
        continue
    if (v.startswith('"') and v.endswith('"')) or (v.startswith("'") and v.endswith("'")):
        v = v[1:-1]
    print(v.strip())
    break
PY
)"
  fi
  [ -n "$base_url" ] || base_url="https://chatgpt.com/backend-api/"
  usage_url="$(python_eval "$base_url" <<'PY'
import sys
u = sys.argv[1].strip() or "https://chatgpt.com/backend-api/"
while u.endswith("/"):
    u = u[:-1]
if (u.startswith("https://chatgpt.com") or u.startswith("https://chat.openai.com")) and "/backend-api" not in u:
    u += "/backend-api"
path = "/wham/usage" if "/backend-api" in u else "/api/codex/usage"
print(u + path)
PY
)"

  if [ -n "$account_id" ]; then
    response="$(curl -s --connect-timeout 7 --max-time 15 -w "\n%{http_code}" \
      -H "Authorization: Bearer ${token}" \
      -H "Accept: application/json" \
      -H "User-Agent: Codex SwiftBar" \
      -H "ChatGPT-Account-Id: ${account_id}" \
      "$usage_url")"
  else
    response="$(curl -s --connect-timeout 7 --max-time 15 -w "\n%{http_code}" \
      -H "Authorization: Bearer ${token}" \
      -H "Accept: application/json" \
      -H "User-Agent: Codex SwiftBar" \
      "$usage_url")"
  fi

  http_code="$(printf '%s\n' "$response" | tail -n 1)"
  body="$(printf '%s\n' "$response" | sed '$d')"
  if [ -z "$http_code" ] || [ "$http_code" = "000" ]; then
    return 2
  fi
  if [ "$http_code" = "401" ] || [ "$http_code" = "403" ]; then
    rm -f "$TOKEN_CACHE"
    return 3
  fi
  if [ "$http_code" -lt 200 ] || [ "$http_code" -ge 300 ]; then
    return 4
  fi

  python_eval <<PY
import json, sys, datetime
d = json.loads("""$body""")
rl = d.get("rate_limit") or {}
p = rl.get("primary_window")
s = rl.get("secondary_window")

def mk(w):
    if not isinstance(w, dict):
        return None
    try:
        remaining = 100 - int(w.get("used_percent"))
        reset = int(w.get("reset_at"))
        mins = int(w.get("limit_window_seconds")) // 60
        return {"remaining": max(0, min(100, remaining)), "reset": reset, "mins": mins}
    except Exception:
        return None

pw = mk(p)
sw = mk(s)

def role(w):
    if not w:
        return "none"
    if w["mins"] == 300:
        return "session"
    if w["mins"] == 10080:
        return "weekly"
    return "unknown"

session = None
weekly = None
r1, r2 = role(pw), role(sw)
if pw and sw:
    if (r1 == "session" and r2 in ("weekly", "unknown")) or (r1 == "unknown" and r2 == "weekly"):
        session, weekly = pw, sw
    elif r1 == "weekly" and r2 in ("session", "unknown"):
        session, weekly = sw, pw
    else:
        session, weekly = pw, sw
elif pw:
    if r1 == "weekly":
        weekly = pw
    else:
        session = pw
elif sw:
    if r2 == "weekly":
        weekly = sw
    else:
        session = sw

def out(w):
    if not w:
        return ("NA", "")
    iso = datetime.datetime.fromtimestamp(w["reset"], tz=datetime.timezone.utc).isoformat().replace("+00:00", "Z")
    return (str(w["remaining"]), iso)

u5, r5 = out(session)
u7, r7 = out(weekly)
print(u5); print(u7); print(r5); print(r7)
PY
}

fetch_cli_usage() {
  command -v codex >/dev/null 2>&1 || return 1
  local raw parsed
  raw="$( { printf '/status\n'; sleep 1; } | codex -s read-only -a untrusted 2>/dev/null )"
  [ -n "$raw" ] || return 1
  parsed="$(printf '%s' "$raw" | python_eval <<'PY'
import re, sys
t = sys.stdin.read()
t = re.sub(r'\x1b\[[0-9;?]*[A-Za-z]', '', t)
t = re.sub(r'\r', '\n', t)
lines = [ln.strip() for ln in t.splitlines() if ln.strip()]
five = next((ln for ln in lines if re.search(r'5h limit', ln, re.I)), "")
week = next((ln for ln in lines if re.search(r'weekly limit', ln, re.I)), "")

def remaining(line):
    if not line:
        return "NA"
    m = re.search(r'(\d+)\s*%\s*left', line, re.I)
    if m:
        return m.group(1)
    m = re.search(r'(\d+)\s*%', line)
    if m:
        return str(max(0, min(100, 100 - int(m.group(1)))))
    return "NA"

def reset(line):
    if not line:
        return ""
    m = re.search(r'\(([^()]*)\)', line)
    return m.group(1).strip() if m else ""

print(remaining(five))
print(remaining(week))
print("")
print("")
print(reset(five))
print(reset(week))
PY
)"
  [ -n "$parsed" ] || return 1
  printf '%s\n' "$parsed"
}

time_until() {
  local ts="$1"
  [ -z "$ts" ] && echo "?" && return
  python_eval "$ts" <<'PY'
from datetime import datetime, timezone
import sys
ts = sys.argv[1]
try:
    if ts.endswith('Z'):
        ts = ts[:-1] + '+00:00'
    reset = datetime.fromisoformat(ts)
    now = datetime.now(timezone.utc)
    secs = (reset - now).total_seconds()
    if secs <= 0:
        print("now")
    else:
        d = int(secs // 86400)
        h = int((secs % 86400) // 3600)
        m = int((secs % 3600) // 60)
        if d > 0: print(f"{d}d {h}h")
        elif h > 0: print(f"{h}h {m}m")
        else: print(f"{m}m")
except Exception:
    print("?")
PY
}

pace_pct() {
  local ts="$1"
  local days="$2"
  [ -z "$ts" ] && echo "0" && return
  python_eval "$ts" "$days" <<'PY'
from datetime import datetime, timezone, timedelta
import sys
ts = sys.argv[1]
days = int(sys.argv[2])
try:
    if ts.endswith('Z'):
        ts = ts[:-1] + '+00:00'
    reset = datetime.fromisoformat(ts)
    window = timedelta(days=days)
    start = reset - window
    now = datetime.now(timezone.utc)
    pct = max(0.0, min(100.0, (reset - now).total_seconds() / window.total_seconds() * 100))
    print(round(pct))
except Exception:
    print(0)
PY
}

color_for_pct() {
  local pct=$1
  if [ "$COLORS" = "true" ]; then
    [ "$pct" -le 10 ] 2>/dev/null && echo "#FF0000" && return
    [ "$pct" -le 30 ] 2>/dev/null && echo "#FFD700" && return
  fi
  echo ""
}

make_bar() {
  local pct="${1:-0}" width=20
  local filled
  filled=$(python_eval "$pct" "$width" <<'PY'
import sys
p = float(sys.argv[1]); w = int(sys.argv[2])
print(max(0, min(w, int(round(p*w/100)))))
PY
)
  local bar="" i=1
  while [ "$i" -le "$width" ]; do
    if [ "$i" -le "$filled" ]; then bar="${bar}█"; else bar="${bar}░"; fi
    i=$((i + 1))
  done
  echo "$bar"
}

make_icon() {
  local pct5="${1:-0}" pct7="${2:-0}"
  python_eval "$pct5" "$pct7" <<'PY'
import base64, struct, zlib, sys
p5 = max(0, min(100, int(round(float(sys.argv[1])))))
p7 = max(0, min(100, int(round(float(sys.argv[2])))))
W,H=18,18; BAR_W=18
def png(w,h,rows):
    def ck(tag,data):
        c=struct.pack(">I",len(data))+tag+data
        return c+struct.pack(">I",zlib.crc32(c[4:])&0xffffffff)
    ih=struct.pack(">IIBBBBB",w,h,8,6,0,0,0); raw=b""
    for row in rows:
        raw+=b"\x00"+b"".join(bytes(px) for px in row)
    return b"\x89PNG\r\n\x1a\n"+ck(b'IHDR',ih)+ck(b'IDAT',zlib.compress(raw))+ck(b'IEND',b"")
f5=int(round(p5*BAR_W/100)); f7=int(round(p7*BAR_W/100))
FG=(0,0,0,255); EMPTY=(0,0,0,60); CLEAR=(0,0,0,0)
rows=[]
for y in range(H):
    row=[]
    for x in range(W):
        if 2<=y<=7: row.append(FG if x<f5 else EMPTY)
        elif 10<=y<=15: row.append(FG if x<f7 else EMPTY)
        else: row.append(CLEAR)
    rows.append(row)
print(base64.b64encode(png(W,H,rows)).decode())
PY
}

parsed=""
if [ -f "$USAGE_CACHE" ]; then
  age=$(( $(date -u +%s) - $(stat -f %m "$USAGE_CACHE" 2>/dev/null || echo 0) ))
  if [ "$age" -lt "$CACHE_TTL" ]; then
    parsed="$(cat "$USAGE_CACHE" 2>/dev/null)"
  fi
fi

if [ -z "$parsed" ]; then
  if [ "$SOURCE_MODE" = "oauth" ] || [ "$SOURCE_MODE" = "auto" ]; then
    parsed="$(fetch_oauth_usage 2>/dev/null)"
    rc=$?
    if [ "$rc" -eq 2 ]; then show_error "No internet connection."; fi
    if [ "$rc" -eq 3 ]; then show_error "Token expired. Run codex to sign in again."; fi
  fi
  if [ -z "$parsed" ] && { [ "$SOURCE_MODE" = "cli" ] || [ "$SOURCE_MODE" = "auto" ]; }; then
    parsed="$(fetch_cli_usage 2>/dev/null)" || true
  fi
  [ -n "$parsed" ] || show_error "No Codex usage data found. Run codex and try Refresh."
  printf '%s\n' "$parsed" > "$USAGE_CACHE"
fi

PCT_5H="$(printf '%s\n' "$parsed" | sed -n '1p')"
PCT_7D="$(printf '%s\n' "$parsed" | sed -n '2p')"
RESET_5H="$(printf '%s\n' "$parsed" | sed -n '3p')"
RESET_7D="$(printf '%s\n' "$parsed" | sed -n '4p')"
RESET_5H_TXT="$(printf '%s\n' "$parsed" | sed -n '5p')"
RESET_7D_TXT="$(printf '%s\n' "$parsed" | sed -n '6p')"

is_pct() {
  case "$1" in
    [0-9]|[1-9][0-9]|100) return 0 ;;
    *) return 1 ;;
  esac
}

HAS_5H=false
HAS_7D=false
if is_pct "$PCT_5H"; then
  HAS_5H=true
else
  PCT_5H=0
fi
if is_pct "$PCT_7D"; then
  HAS_7D=true
else
  PCT_7D=0
fi

if [ "$HAS_5H" != "true" ] && [ "$HAS_7D" != "true" ]; then
  show_error "No Codex usage windows reported."
fi

COLOR_5H=""
COLOR_7D=""
[ "$HAS_5H" = "true" ] && COLOR_5H="$(color_for_pct "$PCT_5H")"
[ "$HAS_7D" = "true" ] && COLOR_7D="$(color_for_pct "$PCT_7D")"
title_color() {
  local c1="$1" c2="$2"
  [ "$c1" = "#FF0000" ] || [ "$c2" = "#FF0000" ] && echo "#FF0000" && return
  [ "$c1" = "#FFD700" ] || [ "$c2" = "#FFD700" ] && echo "#FFD700" && return
  echo ""
}

if [ "$HAS_5H" = "true" ] && [ "$HAS_7D" = "true" ] && [ "$SHOW_7D" = "true" ]; then
  TITLE_COLOR="$(title_color "$COLOR_5H" "$COLOR_7D")"
  TITLE="${PCT_5H}%/${PCT_7D}%"
elif [ "$HAS_5H" = "true" ]; then
  TITLE_COLOR="$COLOR_5H"
  TITLE="${PCT_5H}%"
else
  TITLE_COLOR="$COLOR_7D"
  TITLE="${PCT_7D}%"
fi

render_text_title() {
  if [ -n "$TITLE_COLOR" ]; then
    echo "${TITLE} | color=${TITLE_COLOR}"
  else
    echo "${TITLE}"
  fi
}

if [ "$SHOW_BARS" = "true" ] && [ "$HAS_5H" = "true" ] && [ "$HAS_7D" = "true" ]; then
  BAR_ICON="$(make_icon "$PCT_5H" "$PCT_7D" 2>/dev/null)"
  if [ -n "$BAR_ICON" ]; then
    echo " | templateImage=${BAR_ICON}"
  else
    render_text_title
  fi
else
  render_text_title
fi

echo "---"
if [ "$HAS_5H" = "true" ]; then
  BAR_5H="$(make_bar "$PCT_5H")"
  echo "5h remaining | color=#888888"
  [ -n "$COLOR_5H" ] && echo "5h: ${PCT_5H}% ${BAR_5H} | color=${COLOR_5H}" || echo "5h: ${PCT_5H}% ${BAR_5H}"
  if [ "$SHOW_RESET" = "true" ]; then
    if [ -n "$RESET_5H" ]; then
      echo "Resets in: $(time_until "$RESET_5H") | color=#888888"
    elif [ -n "$RESET_5H_TXT" ]; then
      echo "Resets: ${RESET_5H_TXT} | color=#888888"
    fi
  fi
else
  echo "5h window: Not currently reported | color=#888888"
fi

echo "---"
if [ "$HAS_7D" = "true" ]; then
  BAR_7D="$(make_bar "$PCT_7D")"
  echo "Weekly remaining | color=#888888"
  [ -n "$COLOR_7D" ] && echo "7d: ${PCT_7D}% ${BAR_7D} | color=${COLOR_7D}" || echo "7d: ${PCT_7D}% ${BAR_7D}"
  if [ "$SHOW_PACE" = "true" ] && [ -n "$RESET_7D" ]; then
    PACE_7D="$(pace_pct "$RESET_7D" 7)"
    echo "Expected remaining: ${PACE_7D}% $(make_bar "$PACE_7D") | color=#888888"
  fi
  if [ "$SHOW_RESET" = "true" ]; then
    if [ -n "$RESET_7D" ]; then
      echo "Resets in: $(time_until "$RESET_7D") | color=#888888"
    elif [ -n "$RESET_7D_TXT" ]; then
      echo "Resets: ${RESET_7D_TXT} | color=#888888"
    fi
  fi
else
  echo "Weekly window: Not currently reported | color=#888888"
fi

echo "---"
echo "View usage on ChatGPT | href=https://chatgpt.com/codex/settings/usage"
echo "OpenAI status | href=https://status.openai.com/"
echo "Refresh | refresh=true"
