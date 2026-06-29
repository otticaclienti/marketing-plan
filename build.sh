#!/usr/bin/env bash
# Genera il PDF della presentazione a partire da presentation.html
# Richiede Chromium (qualsiasi build headless recente).
set -euo pipefail

HERE="$(cd "$(dirname "$0")" && pwd)"
OUT="$HERE/OtticaClienti_Pitch_CentroOtticoFiorentino.pdf"

# Trova un binario Chromium/Chrome disponibile
CHROME="${CHROME:-}"
if [ -z "$CHROME" ]; then
  for c in chromium chromium-browser google-chrome google-chrome-stable \
           /opt/pw-browsers/chromium-*/chrome-linux/chrome; do
    if command -v "$c" >/dev/null 2>&1 || [ -x "$c" ]; then CHROME="$c"; break; fi
  done
fi
[ -n "$CHROME" ] || { echo "Chromium non trovato. Imposta CHROME=/percorso/chrome"; exit 1; }

"$CHROME" --headless --no-sandbox --disable-gpu --allow-file-access-from-files \
  --no-pdf-header-footer \
  --print-to-pdf="$OUT" \
  "file://$HERE/presentation.html"

echo "PDF generato: $OUT"
