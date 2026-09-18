#!/usr/bin/env bash
# Controlla che i link relativi e le immagini dei capitoli risolvano.
# Segnala anche le immagini presenti ma non usate da nessuna pagina.
#
# Uso: scripts/check-links.sh

set -uo pipefail

cd "$(dirname "$0")/.." || exit 1

broken=$(mktemp)
orphans=$(mktemp)
trap 'rm -f "$broken" "$orphans"' EXIT

# I blocchi recintati restano fuori: contengono esempi (l'`agents.md` del percorso sull'AI)
# che non sono link di questo repo.
# Anche _template resta fuori: i suoi segnaposto non esistono per definizione.
extract_links() {
  awk '
    /^[[:space:]]*(```|~~~)/ { inblock = !inblock; next }
    inblock { next }
    {
      line = $0
      while (match(line, /\]\([^)]+\)/)) {
        print NR "\t" substr(line, RSTART + 2, RLENGTH - 3)
        line = substr(line, RSTART + RLENGTH)
      }
    }
  ' "$1"
}

while IFS= read -r file; do
  dir=$(dirname "$file")
  while IFS=$'\t' read -r line target; do
    case "$target" in
      http://* | https://* | mailto:* | '#'*) continue ;;
    esac
    target=${target%%#*}
    [ -z "$target" ] && continue
    [ -e "$dir/$target" ] || printf '%s:%s → %s\n' "$file" "$line" "$target" >>"$broken"
  done < <(extract_links "$file")
done < <(find . -name '*.md' -not -path './.git/*' -not -path './_template/*' | sort)

while IFS= read -r img; do
  grep -Rq --include='*.md' -F "$(basename "$img")" . || echo "$img" >>"$orphans"
done < <(find . -name '*.png' -not -path './.git/*' | sort)

status=0

if [ -s "$broken" ]; then
  echo "Link rotti ($(wc -l <"$broken" | tr -d ' ')):"
  cat "$broken"
  status=1
else
  echo "Link relativi: tutti risolti."
fi

if [ -s "$orphans" ]; then
  echo
  echo "Immagini non usate ($(wc -l <"$orphans" | tr -d ' ')):"
  cat "$orphans"
fi

exit "$status"
