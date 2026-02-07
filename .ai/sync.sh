#!/usr/bin/env bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_FILE="$SCRIPT_DIR/sync.json"

if [[ ! -f "$CONFIG_FILE" ]]; then
  echo "Error: sync.json not found at $CONFIG_FILE"
  exit 1
fi

echo "Syncing AI tool configurations..."
echo

while IFS= read -r line; do
  source=$(echo "$line" | jq -r '.source')
  description=$(echo "$line" | jq -r '.description')

  [[ "$source" == "null" ]] && continue

  source_path="$SCRIPT_DIR/$source"

  if [[ ! -e "$source_path" ]]; then
    echo "⊘ Skip: $description"
    echo "  Source not found: $source_path"
    echo
    continue
  fi

  echo "→ $description ($source)"

  while IFS= read -r target; do
    [[ "$target" == "null" ]] && continue

    target_path="${target/#\~/$HOME}"
    target_dir=$(dirname "$target_path")
    mkdir -p "$target_dir"

    if [[ -d "$source_path" ]]; then
      rsync -a --delete "$source_path/" "$target_path/"
      echo "  ✓ Synced directory → $target_path/"
    else
      cp "$source_path" "$target_path"
      echo "  ✓ Copied file → $target_path"
    fi
  done < <(echo "$line" | jq -rc '.targets[]')

  echo
done < <(jq -c '.mappings[]' "$CONFIG_FILE")

echo "Sync complete!"
