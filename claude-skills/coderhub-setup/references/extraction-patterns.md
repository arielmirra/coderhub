# Patterns para extraer datos de transcripciones de Fathom

Heurísticas para sacar datos del profile a partir de calls de discovery con CoderHub.

## Estructura típica de una call de discovery

1. **Apertura** (1-3 min): saludos, status check.
2. **Discovery** (10-20 min): el cliente cuenta su situación.
3. **Diagnóstico** (5-10 min): Ariel/Cami arman el frame del problema.
4. **Pitch + reframe** (10-15 min): cómo CoderHub resuelve eso.
5. **Modalidad de pago** (5 min): A vs B.
6. **Cierre + próximos pasos** (3 min).

Los datos del profile salen de las fases 2, 3 y 5 principalmente.

## Frases trigger por bloque

### Salario actual
- "actualmente cobro X"
- "estoy en X mil"
- "mi sueldo es X"
- "$XK", "X USD/mes", "X mil pesos"

### Banda salarial objetivo
- "banda Ariel", "te ancló X-Y", "arranquemos apuntando a Z"
- "piso", "stretch", "conservador", "realista"
- "doblar a", "duplicar a", "triplicar a"

### Stack técnico
- "trabajo con X", "uso Y", "stack es Z"
- frases en inglés cortas: "PHP, Laravel, Vue"
- listas: "PHP, Laravel, Vue.js, Python, Django"

### Logros con números
- buscar % o $ adyacentes a verbos de acción
- "reduje X%", "aumenté Y%", "migré en Z semanas/meses/días"
- "X usuarios", "Y queries por día", "Z millones de transacciones"

### Bloqueo diagnosticado (la frase de oro)
- "el problema NO es X, es Y"
- "tu skill ya alcanza, falta Z"
- "el bottleneck es..."
- "tu LinkedIn / CV / método te está vendiendo como X cuando sos Y"

### Anti-distracción (la otra frase de oro)
- "no te vamos a poner a aprender X"
- "no te distraigas con Y"
- "el inglés / framework / certificación NO es el bloqueo"
- "X es trampa"

### Modalidad de pago elegida
- "modalidad A" / "modalidad B" / "Plan A" / "Plan B"
- "$500 upfront + 1 sueldo" → Modalidad A
- "$0 upfront + 2 sueldos" → Modalidad B
- "Jotform" + ID del form

### Coach asignado
- "Cami" → coach principal default
- "Ariel" → System Design técnico

### Estado de empleo
- "estoy empleado" / "renuncié" / "tuve layoff" / "estoy desempleado hace X meses"
- "mi empresa actual" → empleado, probablemente stealth ON
- "estoy buscando hace X" → desempleado, stealth OFF

## Idiomas

Buscar:
- "B1", "B2", "C1", "C2", "A2"
- "conversational", "fluent", "native"
- "intermediate", "advanced"
- "puedo conversar", "lectura", "escritura"

Si la transcripción menciona explícitamente que **no puede sostener una conversación en inglés** → marcar B1 o A2 según contexto. Si dice "entiendo pero no hablo" → B1 receptivo.

## Anti-patterns (no hacer)

- ❌ Resumir antes de extraer. Extraé textual primero, resumí al guardar.
- ❌ Asumir nivel de inglés alto si el cliente dijo "más o menos".
- ❌ Inventar logros si no hay número concreto.
- ❌ Usar el `Onboarding HTML` como fuente — ese ya es output de otra skill, no es input de este.
