---
name: linkedin-profile-optimizer
description: Optimiza el perfil de LinkedIn del cliente para maximizar visibilidad en búsquedas de recruiters (LinkedIn Recruiter). Lee ~/.coderhub/profile.md (creado previamente por coderhub-setup) y propone cambios concretos en cada sección — Headline, About, Experience, Skills, Featured, Projects, Education, URL, settings de visibilidad. Genera 3 variantes de Headline (keyword-heavy / narrativo / máximo SEO) y deja al cliente elegir. Respeta modo stealth si está activado. NO toca LinkedIn directamente — devuelve los textos para que el cliente los pegue, sección por sección, con confirmación. Triggers on "optimizá mi LinkedIn", "mejorar perfil LinkedIn", "/linkedin-profile-optimizer", "linkedin SEO", "aparecer en búsquedas de recruiters", "headline LinkedIn".
---

# LinkedIn Profile Optimizer

Optimiza el perfil de LinkedIn del cliente para que aparezca en las búsquedas que hacen los recruiters en LinkedIn Recruiter.

## Pre-requisitos

- `~/.coderhub/profile.md` lleno (corrió `coderhub-setup` antes).
- Si no existe, esta skill **no avanza** — devuelve: *"No encuentro tu profile.md. Corré primero `/coderhub-setup`."*

## Outcome

- 9 secciones de LinkedIn optimizadas con texto listo para pegar:
  1. Headline (3 variantes — el cliente elige)
  2. About / Acerca de
  3. Experience (cada rol)
  4. Skills (lista de las 50 más relevantes para su stack)
  5. Featured (qué destacar y cómo)
  6. Projects
  7. Education
  8. URL personalizada
  9. Settings de visibilidad y "Open to Work" (configurado según modo stealth)
- Estrategia de keywords explicada (qué keywords priorizar, por qué, cómo distribuirlas).
- **Si modo stealth = ON** → toda la estrategia es "discreto pero visible para LinkedIn Recruiter".

---

## Step 1 — Leer el profile y validar

1. Leer `~/.coderhub/profile.md`.
2. Verificar que tenga estos bloques mínimos:
   - Identidad (nombre, LinkedIn URL)
   - Stack técnico (principal + secundario)
   - Rol actual + roles previos
   - Logros con números
   - Objetivo de búsqueda
   - Modo confidencialidad
3. Si falta algo, listar al cliente qué falta y derivar a `coderhub-setup`.

## Step 2 — Detectar modo stealth

Leer `${CLAUDE_PLUGIN_ROOT}/shared/stealth-mode.md` y aplicar reglas según el campo del profile.

- **Stealth ON** → settings recomiendan "Signal interest to recruiters" pero NO frame verde público; engagement strategy evita posts de hiring.
- **Stealth OFF** → settings activan frame verde público; estrategia incluye comentar/postear sobre búsqueda activa.

## Step 3 — Construir las 9 secciones

Usar las plantillas en `${CLAUDE_SKILL_DIR}/references/section-templates.md`. Cada sección sale parametrizada con los datos del profile, no inventada.

### 3.1 Headline (3 variantes)

Generar 3 opciones siguiendo `${CLAUDE_SKILL_DIR}/references/section-templates.md`:

- **A — Keyword-heavy:** roles + tecnologías separadas por `·` + diferenciador + 🌍 si es remoto. Máximo SEO.
- **B — Narrativo:** rol + stack agrupado + "Building/Specialized in..." + Open to Remote.
- **C — Máximo SEO:** todo el stack apilado, separadores `·`, sin texto narrativo.

Mostrar las 3, recomendar la que mejor balancea SEO + lectura humana según el perfil:

```
HEADLINE — 3 opciones:

Opción A (keyword-heavy):
  {texto A}

Opción B (narrativo):
  {texto B}

Opción C (máximo SEO):
  {texto C}

Recomiendo la **{X}** porque {razón basada en perfil — ej. "tu stack es muy específico,
la C captura todas las keywords sin sacrificar legibilidad"}.

¿Cuál elegís? (A / B / C / mixar)
```

### 3.2 About

Estructura:

1. **Línea 1 (lo único visible sin expandir):** rol + años de experiencia + stack core + 1 diferenciador.
2. **Línea 2-3:** rol actual + 1 logro con número del profile.
3. **"What I bring to the table:"** lista de 4-6 bullets agrupando capabilities.
4. **🌍 disponibilidad + 🗣️ idiomas** del profile.
5. **Tech Stack:** dump de todas las skills separadas por `·` (LinkedIn indexa este bloque).
6. **CTA + links** del profile.

Si stealth = ON, el CTA es **"Open to new opportunities — let's connect!"** (genérico, no grita "busco trabajo").
Si stealth = OFF, el CTA puede ser más explícito: **"Actively seeking new opportunities — DM me!"**.

### 3.3 Experience (por cada rol)

Para cada rol en el profile:
1. Título sugerido con keywords (no solo el cargo "Software Engineer", sino "Senior Backend Engineer (PHP/Laravel, AWS, Microservices)").
2. Descripción con:
   - 1 línea de contexto
   - "Key achievements:" con 4-6 bullets
   - Cada bullet: verbo de acción + qué hizo + tecnologías + métrica si la hay
   - Última línea: "Tech stack: X · Y · Z" (dump de keywords del rol)

### 3.4 Skills (50 máximo)

Leer stack del profile y armar 3 grupos:

- **Obligatorias (~15):** las skills más buscadas del stack principal.
- **Importantes (~25):** stack secundario + soft skills (Project Management, Team Leadership, etc.).
- **Tendencia/IA (~10):** keywords calientes 2026 — AI Agents, Claude AI, MCP, Prompt Engineering, LLM Integration.

Recomendar:
- Top 3 visibles del perfil deben ser las 3 más buscadas para el rol target.
- Eliminar skills irrelevantes que diluyan el perfil.
- Pedir endorsements activamente.

### 3.5 Featured

Recomendar qué destacar (según los links del profile):
- Portfolio
- Certificaciones
- Posts técnicos del cliente (si tiene)
- Demo / screenshot de un proyecto destacado

### 3.6 Projects

Para cada logro con número del profile, armar un Project entry:
- Nombre del proyecto (con métrica si aplica)
- Descripción de 2-3 líneas
- Lista de tecnologías

### 3.7 Education

Volcar lo que está en el profile. Sugerir agregar 1 línea de descripción en cada entrada con materias relevantes para el stack target.

### 3.8 URL personalizada

Recomendar `linkedin.com/in/{nombre-apellido}` si está disponible, o mantener la actual.

### 3.9 Settings de visibilidad y Open to Work

Configurar según `${CLAUDE_PLUGIN_ROOT}/shared/stealth-mode.md`:

| Setting | Stealth ON | Stealth OFF |
|---|---|---|
| Open to Work — visible para todos (frame verde) | ❌ NO | ✅ SÍ |
| Open to Work — visible solo para recruiters | ✅ SÍ | ✅ SÍ |
| Signal interest to recruiters | ✅ SÍ | ✅ SÍ |
| Profile viewing options | "Your name and headline" | "Your name and headline" |
| Share profile updates with network | Discrecional (depende de qué cambió) | ✅ SÍ |

Configurar Open to Work con:
- Títulos: armar lista basada en rol target del profile + variantes (ej. "Senior Backend Engineer", "Backend Developer", "Full Stack Engineer", "Tech Lead")
- Tipos: armar según objetivo (Full-time, Contract, Freelance)
- Ubicaciones: del profile (Remote, país, "Worldwide")
- Fecha de inicio: "Immediately" o "Flexible" según urgencia del cliente

## Step 4 — Estrategia de keywords (la teoría)

Después de mostrar los textos, explicar al cliente cómo funciona LinkedIn Recruiter (peso por campo). Ver `${CLAUDE_SKILL_DIR}/references/linkedin-seo-strategy.md` para la tabla completa.

Mostrar al final cuáles son las 10-15 keywords prioritarias para su rol target y en qué campos deberían aparecer (cuántas veces).

## Step 5 — Engagement strategy (consciente del modo stealth)

Recomendar acciones diarias/semanales para amplificar visibilidad orgánica. Las acciones cambian según stealth.

Ver `${CLAUDE_SKILL_DIR}/references/engagement-strategy.md`.

## Step 6 — Output final

Entregar al cliente un documento estructurado con:

1. ✅ Cambios sección por sección (textos listos para pegar)
2. 🎯 Keywords prioritarias y dónde van
3. 📅 Plan de engagement (qué hacer esta semana)
4. ⚙️ Settings a verificar
5. 📊 Una métrica esperada (ej. "deberías ver 30-50% más profile views en 14 días si aplicás todo")

## Reglas

1. **Modo stealth es no-negociable.** Si está ON, NUNCA recomendar acciones públicas que delaten búsqueda.
2. **Confirmar antes de cada sección.** El cliente aprueba o ajusta cada bloque antes de pasar al siguiente.
3. **Nunca tocar LinkedIn directo.** La skill devuelve textos. El cliente los pega. Esto es deliberado: queremos que el cliente revise una vez más y se sienta dueño del cambio.
4. **No inventar logros.** Solo usar los que están en `profile.md`. Si necesitamos más, derivar a `/coderhub-setup` para sumarlos al profile.
5. **Idioma:** la copy del LinkedIn va a estar en español o inglés según el target del cliente. Si target = US o Global, **inglés**. Si es LATAM hispano puro, **español**. Si es ambos, **bilingüe** (inglés primero, español como segunda parte del About).
