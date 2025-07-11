#!/usr/bin/env bash

# Example speedtest output
# {
#   "type": "result",
#   "timestamp": "2024-05-16T08:02:55Z",
#   "ping": {
#     "jitter": 0.124,
#     "latency": 1.199,
#     "low": 1.065,
#     "high": 1.244
#   },
#   "download": {
#     "bandwidth": 116953549,
#     "bytes": 667688039,
#     "elapsed": 5709,
#     "latency": {
#       "iqm": 23.426,
#       "low": 1.313,
#       "high": 231.619,
#       "jitter": 4.739
#     }
#   },
#   "upload": {
#     "bandwidth": 107900348,
#     "bytes": 990831464,
#     "elapsed": 9120,
#     "latency": {
#       "iqm": 1.387,
#       "low": 1.072,
#       "high": 4.336,
#       "jitter": 0.212
#     }
#   },
#   "isp": "Globe Telecom",
#   "interface": {
#     "internalIp": "REMOVED",
#     "name": "REMOVED",
#     "macAddr": "REMOVED",
#     "isVpn": false,
#     "externalIp": "REMOVED"
#   },
#   "server": {
#     "id": 1169,
#     "host": "speedtest.globe.com.ph",
#     "port": 8080,
#     "name": "Globe Telecom",
#     "location": "Makati",
#     "country": "Philippines",
#     "ip": "203.177.54.138"
#   },
#   "result": {
#     "id": "REMOVED",
#     "url": "REMOVED",
#     "persisted": true
#   }
# }
#
# echo '{"type":"result","timestamp":"2024-05-16T08:02:55Z","ping":{"jitter":0.124,"latency":1.199,"low":1.065,"high":1.244},"download":{"bandwidth":116953549,"bytes":667688039,"elapsed":5709,"latency":{"iqm":23.426,"low":1.313,"high":231.619,"jitter":4.739}},"upload":{"bandwidth":107900348,"bytes":990831464,"elapsed":9120,"latency":{"iqm":1.387,"low":1.072,"high":4.336,"jitter":0.212}},"isp":"Globe Telecom","interface":{"internalIp":"REMOVED","name":"REMOVED","macAddr":"REMOVED","isVpn":false,"externalIp":"REMOVED"},"server":{"id":1169,"host":"speedtest.globe.com.ph","port":8080,"name":"Globe Telecom","location":"Makati","country":"Philippines","ip":"203.177.54.138"},"result":{"id":"REMOVED","url":"REMOVED","persisted":true}}' | jq

PATH="/opt/homebrew/bin:$PATH"

speedtest_output="$(speedtest --format=json)"
download_bandwidth_bytes="$(echo "$speedtest_output" | jq -r '.download.bandwidth')"
download_bandwidth_megabits="$(echo "scale=2; $download_bandwidth_bytes / 125000" | bc)"
download_bandwidth_megabytes="$(echo "scale=2; $download_bandwidth_bytes / 1000000" | bc)"
upload_bandwidth_bytes="$(echo "$speedtest_output" | jq -r '.upload.bandwidth')"
upload_bandwidth_megabits="$(echo "scale=2; $upload_bandwidth_bytes / 125000" | bc)"
upload_bandwidth_megabytes="$(echo "scale=2; $upload_bandwidth_bytes / 1000000" | bc)"
isp="$(echo "$speedtest_output" | jq -r '.isp')"

echo "${download_bandwidth_megabits} Mbps ↓ ${upload_bandwidth_megabits} Mbps ↑"

echo "---"

echo "Download: ${download_bandwidth_megabytes} MB/s"
echo "Upload: ${upload_bandwidth_megabytes} MB/s"
echo "ISP: ${isp}"
