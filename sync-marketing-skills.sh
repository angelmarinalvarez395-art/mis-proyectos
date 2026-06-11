#!/bin/bash
# Sincroniza las skills de .claude/marketing-source/skills/ a .claude/commands/marketing/
# Uso: bash sync-marketing-skills.sh
# Para actualizar: cd .claude/marketing-source && git pull && cd ../.. && bash sync-marketing-skills.sh

DEST=".claude/commands/marketing"
mkdir -p "$DEST"

count=0
for skill in .claude/marketing-source/skills/*/; do
  name=$(basename "$skill")
  if [ -f "$skill/SKILL.md" ]; then
    cp "$skill/SKILL.md" "$DEST/$name.md"
    count=$((count + 1))
  fi
done

echo "✓ $count skills sincronizadas en $DEST/"
