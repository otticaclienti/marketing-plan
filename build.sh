#!/usr/bin/env bash
# Genera i PDF delle presentazioni a partire dai file .html.
# Uso: ./build.sh [file.html ...]  (default: presentation.html + pitch-occhioxocchio.html)
# Richiede Chromium (qualsiasi build headless recente).
set -euo pipefail

HERE="$(cd "$(dirname "$0")" && pwd)"

CHROME="${CHROME:-}"
if [ -z "$CHROME" ]; then
  for c in chromium chromium-browser google-chrome google-chrome-stable \
           /opt/pw-browsers/chromium-*/chrome-linux/chrome; do
    if command -v "$c" >/dev/null 2>&1 || [ -x "$c" ]; then CHROME="$c"; break; fi
  done
fi
[ -n "$CHROME" ] || { echo "Chromium non trovato. Imposta CHROME=/percorso/chrome"; exit 1; }

declare -A OUT=(
  [presentation.html]="OtticaClienti_Pitch_CentroOtticoFiorentino.pdf"
  [pitch-occhioxocchio.html]="OtticaClienti_Pitch_OcchioXOcchio.pdf"
)

FILES=("$@")
[ ${#FILES[@]} -gt 0 ] || FILES=(presentation.html pitch-occhioxocchio.html)

for f in "${FILES[@]}"; do
  out="${OUT[$f]:-${f%.html}.pdf}"
  "$CHROME" --headless --no-sandbox --disable-gpu --allow-file-access-from-files \
    --no-pdf-header-footer \
    --print-to-pdf="$HERE/$out" \
    "file://$HERE/$f" 2>/dev/null
  echo "PDF generato: $HERE/$out"
done
