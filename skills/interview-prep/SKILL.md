---
name: interview-prep
description: Prepara al cliente para una entrevista específica en minutos. Lee ~/.coderhub/profile.md (datos del cliente) + un job posting que el cliente pega o linkea, y arma un coaching estructurado con roadmap de repaso, Q&A probables, match perfil↔rol, y tips. Tiene 3 modos de output: default (1h, completo), fast (15m, una oración por tema), y override (lo que el cliente pida — "solo conceptos de ciberseguridad", "system design en 5 min", etc). Respeta modo stealth + bloqueos diagnosticados + anti-distracciones del profile. Triggers on "preparame para esta entrevista", "interview prep", "/interview-prep", "tengo entrevista en X", "repasame Y antes de la entrevista", "/trainme". Inspirado en el CLI trainme de Braian Troncoso (mentee de CoderHub) — link en el README.
---

# Interview Prep

Coaching pre-entrevista en minutos. **No es para profundizar — es para refrescar.**

## Pre-requisitos

- `~/.coderhub/profile.md` lleno (corrió `coderhub-setup`).
- Un **job posting** (texto pegado, URL, o archivo).
- Si falta el profile → derivar a `coderhub-setup` y parar.

## Outcome

Un bloque de coaching estructurado adaptado al modo elegido:

- **default (~1h):** Roadmap de repaso · Q&A probables · Match perfil↔rol · Tips
- **fast (~15m):** Una oración por tema principal — el mínimo para refrescar antes de entrar
- **override:** lo que el cliente pidió textual ("solo conceptos de ciberseguridad", "preguntas conductuales en español", "system design para principiantes")

---

## Step 1 — Leer profile + parsear job posting

1. Leer `~/.coderhub/profile.md`. Extraer:
   - Stack técnico (principal + secundario + diferenciadores)
   - Logros con números
   - Rol target + banda salarial
   - **Modo stealth** (importante para tono)
   - **Bloqueos diagnosticados** (qué le pasa al cliente en entrevistas reales)
   - **Anti-distracciones** (qué NO mencionar)
   - Idiomas

2. Recibir el job posting del cliente. Acepta:
   - Texto pegado directo en el chat
   - URL (linkedin.com/jobs/, getonbrd, otro portal)
   - Archivo `.txt`, `.md`, `.pdf`

3. Si el cliente NO pasó posting, preguntar **una sola vez:**
   ```
   Pegame el job posting (texto, URL o archivo). O describime la entrevista en 2-3 líneas si no tenés posting (ej. "es un take-home de Laravel para Mercado Libre").
   ```

## Step 2 — Detectar idioma + modo de output

**Idioma:** matchear el idioma del posting (si está en inglés, output en inglés; en español, en español). Si el posting es bilingüe o ambiguo, usar el idioma del profile.

**Modo (3 opciones):**

| Trigger del cliente | Modo |
|---|---|
| "/interview-prep" sin más → preguntar | default |
| "fast", "rápido", "15 minutos", "estoy entrando ya" | **fast** |
| "solo X", "concentrate en Y", "repasame Z específico" | **override** |
| Default si no aclaró | preguntar antes de generar |

Si no está claro, preguntar **una sola vez:**
```
¿Qué modo querés?

1. **Completo (~1h):** roadmap de repaso + Q&A probables + match perfil↔rol + tips
2. **Rápido (~15m):** una oración por tema clave, lo mínimo para refrescar
3. **Custom:** decime qué querés ("solo conceptos de Spring", "preguntas conductuales", etc.)
```

## Step 3 — Aplicar reglas del coach

### Reglas universales (siempre)

1. **Conciso y directo.** Esto es para refrescar la mente, NO para profundizar.
2. **Apoyarse en el perfil real.** Hablar de las skills/experiencia REALES del cliente — no genérico.
3. **Si falta info clave o hay ambigüedad,** preguntar — no inventar.
4. **Idioma matchea posting + profile.**
5. **Logros con números del profile** se enchufan en las Q&A: "cuando te pregunten por liderazgo, mencioná X (logro real con número)".

### Reglas según stealth mode

- **Stealth = ON:** el coach agrega instrucción explícita: *"En la entrevista, NO menciones que estás buscando activamente. Posicioná esto como exploración inicial / interés en la empresa específica. Si te preguntan 'cuándo podrías arrancar', respondé '2-4 semanas' (no 'inmediato')."*
- **Stealth = OFF:** el cliente puede ser explícito sobre disponibilidad inmediata.

### Reglas según anti-distracciones del profile

Si el profile tiene anti-distracciones, el coach las respeta:

- Ejemplo Pablo Garay: anti-distracción `"no aprender Next.js u otra tech nueva"`. Si la entrevista es de Senior Backend Java pero el posting menciona "+ Next.js como bonus", el coach NO le dice "estudiá Next.js antes de la entrevista". Le dice "si te preguntan por Next.js, decí 'familiarizado, no es mi foco actual', y volvé a Java".

- Ejemplo Carlos Osvell: anti-distracción `"no desviarse a inglés conversacional ahora"`. Si la entrevista es en español, el coach NO sugiere "practicá inglés por las dudas". Mantiene el foco español.

### Reglas según bloqueos diagnosticados del profile

Si el profile tiene bloqueos identificados por CoderHub, el coach los aborda preventivamente:

- Ejemplo Sebastián Abramowski: bloqueo `"pasa HR pero rebote pre-técnica"`. El coach prioriza Q&A técnicas + STAR method intensivo. NO pierde tiempo en cultural fit.
- Ejemplo Yamil Szyrko: bloqueo `"LinkedIn anonimizado, CV no comunica seniority"`. El coach incluye un tip: "si te preguntan 'háblame de tu experiencia', enchufá 3-4 logros con números del primer minuto — no esperes a que te lo saquen".

## Step 4 — Generar el bloque según modo

Ver `${CLAUDE_SKILL_DIR}/references/coach-template.md` para los templates exactos.

### Modo default (~1h)

```
🎯 ENTREVISTA: {empresa_si_se_identifica} - {puesto}
📅 Modo: Completo (1h refresher)

═══════════════════════════════════════
1. ROADMAP 1H — qué repasar y en qué orden
═══════════════════════════════════════
{plan ordenado, 4-6 items, con tiempo estimado por item}

═══════════════════════════════════════
2. Q&A PROBABLES — las preguntas más probables con respuestas concisas
═══════════════════════════════════════
{5-8 preguntas con respuestas de 2-4 líneas cada una}
{cada respuesta usa logros REALES del profile, con números}

═══════════════════════════════════════
3. MATCH PERFIL ↔ ROL — qué de tu perfil pega y qué gaps repasar
═══════════════════════════════════════
✅ Pega: {3-5 puntos del profile que matchean la oferta}
⚠️ Gaps a repasar: {2-4 puntos donde la oferta pide algo que el profile no tiene fuerte}
🎯 Estrategia: {cómo posicionar los gaps sin mentir}

═══════════════════════════════════════
4. TIPS / INSIGHTS
═══════════════════════════════════════
{3-5 tips puntuales: cosas de la empresa, del stack, del proceso de entrevista}
{si stealth ON: agregar la regla de "no decir que estás buscando activamente"}
{si bloqueo identificado: agregar tip específico al bloqueo}
```

### Modo fast (~15m)

```
🎯 ENTREVISTA: {empresa} - {puesto}
📅 Modo: Rápido (15m)

═══════════════════════════════════════
TOPICS — una oración por tema clave
═══════════════════════════════════════
• {Tema 1}: {oración única que resume lo importante}
• {Tema 2}: {oración única}
• {Tema 3}: {oración única}
• {Tema 4}: {oración única}
• {Tema 5}: {oración única}

═══════════════════════════════════════
TU PALANCA
═══════════════════════════════════════
{1 logro REAL del profile con número que pega más con esta oferta — para enchufar en cualquier pregunta}
```

### Modo override

```
🎯 ENTREVISTA: {empresa} - {puesto}
📅 Modo: Custom — "{lo_que_pidió_el_cliente}"

═══════════════════════════════════════
{contenido pedido, sin estructura impuesta}
═══════════════════════════════════════
```

## Step 5 — Confirmar entrega

Al final del bloque, agregar:

```
─────────────────────────────────────
✅ Listo. Si querés:
- "más profundo en {tema X}" → te tiro detalle
- "Q&A en inglés" → traduzco
- "/interview-prep --review" → repaso post-entrevista (qué fue bien, qué ajustar)

Si la entrevista pasó: pegame qué pasó en 2-3 líneas y armamos retro.
```

## Reglas duras

1. **Conciso siempre.** El cliente está en la cocina antes de la entrevista — no hay tiempo para 20 páginas. Default = 1h max. Fast = 15m max. Override = lo que pidió.
2. **Logros con números primero.** Cada Q&A usa un logro REAL del profile, no genérico.
3. **Stealth-aware.** Si stealth ON, el coach instruye qué NO decir en la entrevista.
4. **Anti-distracciones-aware.** Si el profile dice "no aprendas X ahora", el coach respeta eso aunque el posting lo pida.
5. **Bloqueos-aware.** Si el profile tiene bloqueos diagnosticados, el coach prioriza esos en el roadmap.
6. **Idioma matchea posting.** No traducir a menos que el cliente lo pida.
7. **Sin invento.** Si falta info clave, preguntar — no rellenar.

## Anti-patterns

- ❌ Output genérico tipo "estudiá los conceptos de system design" — sin específicos del posting
- ❌ Q&A copy-paste de blogs ("¿cuál es tu mayor debilidad?") — sin tailoring al puesto
- ❌ Roadmap de 1h que tarda 4h en ejecutar — irreal para pre-entrevista
- ❌ Mencionar tech que el cliente NO sabe como si la supiera — mejor estrategia honesta
- ❌ Saltar el modo stealth → el cliente entra a la entrevista y dice "estoy buscando activamente" cuando su empresa actual no debe saber

## Inspiración

Esta skill está inspirada en el CLI [`trainme`](https://github.com/BraianTroncoso/trainme) hecho por **Braian Troncoso**, mentee de CoderHub. Braian construyó la versión Python para uso terminal; esta skill replica la lógica para uso adentro de Claude Code, leyendo el `profile.md` que ya configuraste con `coderhub-setup`.

Si preferís el flujo CLI puro (terminal-first, copy-paste a Claude.ai web), revisá su repo. Las 2 herramientas conviven.
