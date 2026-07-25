# Profile template

**Plantilla en blanco** del perfil. Este archivo NO se modifica — es la base reutilizable.

Tu perfil real (con tus datos) vive en `my-profile/profile.md`, a nivel root del repo. Esa carpeta está gitignoreada, así que tus datos personales (teléfono, salario) nunca se commitean. La crea `install.sh` copiando este template, y la llena `coderhub-setup`.

## Archivos

- **`profile.md`** — la plantilla en blanco. `install.sh` la copia a `my-profile/profile.md`; ahí es donde van tus datos.

## Cómo se llena

1. Corré `claude` desde la raíz del repo.
2. Adentro de Claude: `/coderhub-setup`
3. La skill te va a guiar — podés pasarle:
   - **Transcripción de tu call con CoderHub** (la mejor opción — extrae bloqueos, anti-distracciones, banda salarial, etc.)
   - **Tu CV + URL de LinkedIn** (para datos técnicos y experiencia)
   - **Respuestas manuales** (te hace preguntas si falta algo)
4. La skill llena `my-profile/profile.md` y vos confirmás antes de guardar.

## Cómo actualizarlo después

- **Cambio chico** (sumaste skill, cambió tu rol actual): editá `my-profile/profile.md` directo a mano.
- **Cambio grande** (cambiaste de empresa, mudanza, nuevo objetivo): re-corré `/coderhub-setup`.

## ¿Por qué un solo archivo md?

- Es legible por humanos (lo abrís y lo entendés).
- Es legible por Claude (no necesita parser especial).
- Es editable rápido sin tooling.

Si en el futuro lo migramos a YAML/JSON, vamos a tener una skill de migración que respete tu data.
