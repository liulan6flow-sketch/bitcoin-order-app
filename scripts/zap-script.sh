#!/bin/bash
set -euo pipefail

report_dir="$(mktemp -d "$RUNNER_TEMP/zap-report.XXXXXX")"
chmod 777 "$report_dir"

docker run --rm \
  -v "$report_dir:/zap/wrk:rw" \
  ghcr.io/zaproxy/zaproxy:stable \
  zap-baseline.py \
  -t 'https://liulan6flow-sketch.github.io/bitcoin-order-app/' \
  -r zap_baseline_report.html \
  -I

cp "$report_dir/zap_baseline_report.html" ./zap_baseline_report.html