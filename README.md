# 🚀 CoderHub Tooling

**Tu caja de herramientas para conseguir trabajo más rápido — corriendo en tu propia compu.**

Skool tiene el *qué* y el *por qué*. Este plugin tiene el **cómo automatizarlo**: skills de Claude Code que optimizan tu LinkedIn, arman tu CV, cazan ofertas y te preparan para entrevistas — usando *tu* perfil, una sola vez configurado.

---

## ⚡ Arranque rápido (5 minutos, una sola vez)

Abrí **Claude Code** en cualquier carpeta y corré adentro:

```
/plugin marketplace add arielmirra/coderhub
/plugin install coderhub@coderhub
/coderhub:coderhub-setup
```

1. **`marketplace add`** — registra el marketplace de CoderHub.
2. **`install`** — instala el plugin (elegí scope **user** para tenerlo en todos tus proyectos).
3. **`coderhub-setup`** — configura tu perfil una vez (desde tu CV, LinkedIn o la call). Lo demás lee de ahí.

> ¿Primera vez con Claude Code? Ver [`INSTALL.md`](./INSTALL.md) — incluye requisitos (Mac/Windows) y los MCPs opcionales.

---

## 🛠️ Qué podés hacer

Después del setup, hablale en lenguaje natural — Claude elige la skill:

| Querés… | Decile… | Skill |
|---|---|---|
| Que las skills te conozcan | *"configurá mi perfil"* | `coderhub:coderhub-setup` |
| Aparecer en búsquedas de recruiters | *"optimizá mi LinkedIn"* | `coderhub:linkedin-profile-optimizer` |
| Aplicar a ofertas de tu feed | *"buscá ofertas en mi feed y aplicá"* | `coderhub:linkedin-feed-job-hunter` |
| Prepararte para una entrevista | *"preparame para esta entrevista"* (+ pegás la oferta) | `coderhub:interview-prep` |
| Armar tu CV base en PDF | *"armame el CV"* | `coderhub:cv-builder` |
| Adaptar tu CV a una oferta puntual | *"ajustá mi CV a esta oferta"* (+ pegás la JD) | `coderhub:cv-tailor` |

Cada skill respeta tu **modo confidencialidad** (si estás trabajando, tu empresa actual no se entera) y **siempre confirmás antes de que salga algo**.

---

## 🔄 Actualizaciones

El plugin se actualiza seguido. Para traer lo último:

```
/plugin marketplace update coderhub
/reload-plugins
```

---

## 🔒 Tu info es tuya

Tu perfil vive en **`~/.coderhub/profile.md`**, local a tu máquina. Nunca se sube a ningún lado — ahí quedan tus datos (teléfono, salario) y los CVs que generás.

---

## 🧭 Filosofía

- **Configurás una vez, usás infinito.** El perfil se llena la primera vez y todas las skills lo reutilizan.
- **Modo stealth por default** si estás trabajando.
- **Vos siempre confirmás** antes de mandar cualquier email, DM o cambio.

---

## 🙌 Créditos

Algunas skills nacieron de herramientas que mentees de CoderHub construyeron para sí mismos (ej. `interview-prep`, inspirada en [trainme](https://github.com/BraianTroncoso/trainme) de Braian Troncoso). Si construís algo que puede servir a otros, decímelo y lo sumamos con tu crédito.

---

## 🆘 ¿Algo no funciona?

- Corré `/reload-plugins` o reiniciá `claude`.
- Para el CV: necesitás `typst` (`brew install typst` en Mac, `winget install Typst.Typst` en Windows).
- Cualquier otra cosa: **pegame un WhatsApp.**

— Ariel
