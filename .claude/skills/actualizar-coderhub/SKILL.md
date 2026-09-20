---
name: actualizar-coderhub
description: >
  Trae las últimas mejoras de las skills y del método de CoderHub al repo del
  cliente, SIN tocar su perfil ni su trabajo. Usar cuando la persona diga
  "actualizá CoderHub", "traé las últimas mejoras", "actualizá las skills",
  "hay algo nuevo de CoderHub", o al inicio de sesión si se quiere chequear si
  hay updates. Trae solo `.claude/skills/`, `AGENTS.md` y `voz.md` del template
  upstream; nunca modifica `perfil/` ni `trabajo/`.
---

# Actualizar CoderHub

Trae la última versión de las herramientas (skills + método) desde el template de CoderHub, sin pisar el trabajo de la persona.

## Outcome

- `.claude/skills/`, `AGENTS.md` y `voz.md` actualizados a la última versión del template.
- `perfil/` y `trabajo/` **intactos** (nunca se tocan).
- Un resumen de qué cambió (o "ya estabas al día").

## Cómo funciona

El repo se creó desde un template (sin link upstream de git), así que traemos los cambios apuntando a un remote del template y haciendo checkout **solo de las carpetas que son de CoderHub**. Esto no puede generar conflictos con tu trabajo porque nunca toca `perfil/` ni `trabajo/`.

## Pasos

1. **Verificá el remote del template.** Si no existe el remote `coderhub`, agregalo:
   ```bash
   git remote get-url coderhub 2>/dev/null || git remote add coderhub https://github.com/arielmirra/coderhub.git
   ```
   (El provisioning ya deja seteado este remote al crear el repo; el comando de arriba lo agrega si faltara.)

2. **Traé la última versión del template:**
   ```bash
   git fetch coderhub
   ```

3. **Chequeá si hay cambios** en las carpetas de CoderHub:
   ```bash
   git diff --stat HEAD coderhub/main -- .claude/skills AGENTS.md voz.md
   ```
   Si no hay diff → avisá "ya estabas al día" y terminá.

4. **Traé SOLO las carpetas de CoderHub** (nunca perfil/ ni trabajo/):
   ```bash
   git checkout coderhub/main -- .claude/skills AGENTS.md voz.md
   ```

5. **Commiteá el update** en el repo del cliente:
   ```bash
   git add .claude/skills AGENTS.md voz.md && git commit -m "Actualizar skills + método de CoderHub"
   ```

6. **Resumí** qué cambió (skills nuevas, cambios en el método) en 2-3 líneas.

## Rules

- **NUNCA** hacer `git merge`/`git pull` completo del template — las historias son unrelated y pisaría cosas. Solo `git checkout coderhub/main -- <paths de CoderHub>`.
- **NUNCA** incluir `perfil/` ni `trabajo/` en el checkout. Si por error entran, descartá esos cambios (`git checkout HEAD -- perfil trabajo`).
- Si el remote `coderhub` no se puede agregar/alcanzar, avisá a la persona que falta configurar el remote del template (o que no tiene acceso) y no sigas.

## Troubleshooting

- **`fetch` falla por auth:** el template (`arielmirra/coderhub`) es **público**, así que normalmente no necesita auth. Si aun así falla, es un tema de red o de credenciales de git — avisar que verifique conexión o corra `gh auth login`.
- **`git checkout` dice "pathspec did not match":** el template todavía no tiene esa carpeta o cambió de nombre — avisar, no forzar.
