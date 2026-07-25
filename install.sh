#!/usr/bin/env bash
#
# CoderHub — inicialización del repo.
# Idempotente: podés correrlo las veces que quieras.
#
#   1. Instala las skills en ~/.claude/skills (symlink → apuntan a este repo)
#   2. Crea my-profile/ con tu instancia de perfil (copiada del template en blanco)
#
# La existencia de my-profile/profile.md es la señal de "repo inicializado".

set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILLS_SRC="$REPO_DIR/claude-skills"
SKILLS_DST="$HOME/.claude/skills"
PROFILE_TEMPLATE="$REPO_DIR/profile-template/profile.md"
PROFILE_DIR="$REPO_DIR/my-profile"
PROFILE_INSTANCE="$PROFILE_DIR/profile.md"

echo "==> CoderHub init"

# 1. Instalar skills (symlink cada carpeta que tenga un SKILL.md; _shared no es skill)
mkdir -p "$SKILLS_DST"
for skill_dir in "$SKILLS_SRC"/*/; do
  [ -f "${skill_dir}SKILL.md" ] || continue
  name="$(basename "$skill_dir")"
  link="$SKILLS_DST/$name"
  if [ -L "$link" ] || [ -e "$link" ]; then
    echo "    skill '$name' ya instalada — skip"
  else
    ln -s "${skill_dir%/}" "$link"
    echo "    skill '$name' instalada"
  fi
done

# 2. Crear my-profile/ (instancia) desde el template en blanco
mkdir -p "$PROFILE_DIR"
if [ -f "$PROFILE_INSTANCE" ]; then
  echo "==> my-profile/profile.md ya existe — repo YA inicializado"
else
  cp "$PROFILE_TEMPLATE" "$PROFILE_INSTANCE"
  echo "==> my-profile/profile.md creado desde el template"
  echo "    Corré /coderhub-setup adentro de Claude para llenarlo."
fi

echo "==> Listo. Reiniciá 'claude' para que tome las skills."
