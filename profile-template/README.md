# Profile template

Tu perfil personal. **Lo llena la skill `coderhub-setup` automáticamente** la primera vez que la corrés — vos solo le tirás la transcripción de tu call con el equipo de CoderHub, o tu CV + perfil de LinkedIn, y ella extrae todo.

## Archivos

- **`profile.md`** — todos tus datos. Las demás skills lo leen para personalizar lo que hacen.

## Cómo se llena

1. Corré `claude` desde la raíz del repo.
2. Adentro de Claude: `/coderhub-setup`
3. La skill te va a guiar — podés pasarle:
   - **Transcripción de tu call con CoderHub** (la mejor opción — extrae bloqueos, anti-distracciones, banda salarial, etc.)
   - **Tu CV + URL de LinkedIn** (para datos técnicos y experiencia)
   - **Respuestas manuales** (te hace preguntas si falta algo)
4. La skill llena `profile.md` y vos confirmás antes de guardar.

## Cómo actualizarlo después

- **Cambio chico** (sumaste skill, cambió tu rol actual): editá `profile.md` directo a mano.
- **Cambio grande** (cambiaste de empresa, mudanza, nuevo objetivo): re-corré `/coderhub-setup`.

## ¿Por qué un solo archivo md?

- Es legible por humanos (lo abrís y lo entendés).
- Es legible por Claude (no necesita parser especial).
- Es editable rápido sin tooling.

Si en el futuro lo migramos a YAML/JSON, vamos a tener una skill de migración que respete tu data.
