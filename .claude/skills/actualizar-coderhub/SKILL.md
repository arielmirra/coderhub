---
name: actualizar-coderhub
description: >
  Trae las últimas mejoras de las skills y del método de CoderHub al repo del
  cliente, sin tocar `archivos-generados/` (perfil + outputs). Usar cuando la persona
  diga "actualizá CoderHub", "traé las últimas mejoras", "actualizá las
  skills", "hay algo nuevo de CoderHub", o al inicio de sesión si quiere
  chequear updates. Trae solo `.claude/skills/`, `AGENTS.md` del
  template upstream.
---

# Actualizar CoderHub

Trae la última versión de las skills y el método desde el template de CoderHub, sin pisar `archivos-generados/`.

## Outcome

- `.claude/skills/`, `AGENTS.md` actualizados al template.
- `archivos-generados/` intacto (nunca se toca).
- Resumen de qué cambió, o "ya estabas al día".

## Cómo funciona

El repo se creó desde un template (sin link upstream de git): traemos los cambios de un remote del template, haciendo checkout **solo de las carpetas de CoderHub**. Nunca puede pisar tu trabajo porque nunca toca `archivos-generados/`.

## Step 0 — Guard de migración (estructura vieja)

Si el repo todavía tiene `perfil/profile.md` o una carpeta `trabajo/` (estructura previa a la unificación en `archivos-generados/`), migrá antes de traer updates:

```bash
mkdir -p archivos-generados
[ -f perfil/profile.md ] && git mv perfil/profile.md archivos-generados/perfil.md
[ -d trabajo ] && git mv trabajo/* archivos-generados/ 2>/dev/null
rm -rf perfil trabajo
git add -A && git commit -m "Migrar a archivos-generados/"
```

Avisá a la persona: "Actualicé la estructura de carpetas — tu perfil y tus outputs ahora viven juntos en `archivos-generados/`." Después seguí con los pasos normales.

## Pasos

1. **Remote del template.** Si no existe `coderhub`, agregalo:
   ```bash
   git remote get-url coderhub 2>/dev/null || git remote add coderhub https://github.com/arielmirra/coderhub.git
   ```
   (El provisioning ya lo deja seteado — este comando es el fallback.)

2. **Traé la última versión:**
   ```bash
   git fetch coderhub
   ```

3. **Chequeá si hay cambios:**
   ```bash
   git diff --stat HEAD coderhub/main -- .claude/skills AGENTS.md
   ```
   Sin diff → "ya estabas al día" y terminá.

4. **Traé SOLO las carpetas de CoderHub** (nunca `archivos-generados/`):
   ```bash
   git checkout coderhub/main -- .claude/skills AGENTS.md
   ```

5. **Commiteá:**
   ```bash
   git add .claude/skills AGENTS.md && git commit -m "Actualizar skills + método de CoderHub"
   ```

6. **Resumí** qué cambió (skills nuevas, cambios en el método) en 2-3 líneas.

## Rules

- **NUNCA** `git merge`/`git pull` completo del template — las historias son unrelated, pisaría cosas. Solo `git checkout coderhub/main -- <paths>`.
- **NUNCA** incluir `archivos-generados/` en el checkout. Si entra por error: `git checkout HEAD -- archivos-generados`.
- Si el remote `coderhub` no se puede agregar/alcanzar, avisá que falta configurarlo (o que no hay acceso) y no sigas.

## Troubleshooting

- **`fetch` falla por auth:** el template es público, no debería pedir auth. Si falla, es red o credenciales — avisar que revise conexión o corra `gh auth login`.
- **`git checkout` dice "pathspec did not match":** el template no tiene esa carpeta o cambió de nombre — avisar, no forzar.
