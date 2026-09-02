# Matching rules — qué oferta aplica y cuál se salta

## Cómo evaluar match en 30 segundos

Por cada publicación detectada en el feed:

```
1. ¿Es oferta? (señales sí / señales no)        → 5s
2. ¿Match técnico mínimo? (2+ tecnologías)      → 10s
3. ¿Modalidad compatible?                        → 5s
4. ¿Restricciones legales OK?                    → 5s
5. ¿Banda salarial razonable?                    → 5s
```

Si pasa los 5 → procesar (Step 4 de la skill).
Si falla algún check → saltar y registrar el motivo.

## Match obligatorio (al menos 2)

Tecnologías del **stack principal** del cliente (campo `stack_principal` en `profile.md`).

Ejemplo (cliente con Laravel/Vue/Python/Django/PHP/Filament):

- Oferta pide PHP + Laravel + Vue + AWS → **3 matches** ✅
- Oferta pide Node.js + React + AWS → **0 matches** ❌
- Oferta pide Laravel + AWS → **1 match** → revisar match secundario
- Oferta pide Laravel + Docker + Python → **2 matches** ✅ (Docker está en secundario, Python en principal)

## Match complementario (suma)

Tecnologías del **stack secundario** o **diferenciadores técnicos**.

Cada match secundario suma 0.5. Cada diferenciador suma 1.

## Score y prioridad

| Score total | Acción |
|---|---|
| 5+ | Aplicar primero — alta prioridad |
| 3-4 | Aplicar segundo — relevante |
| 2 | Borderline — aplicar si la empresa es de producto destacada |
| 1 | Saltar (a menos que sea remoto excepcional o producto excelente) |
| 0 | Saltar |

## Modalidad (filtro hard)

Leer `modalidad_preferida` del profile. Si la oferta es:

- **Presencial obligatorio** y cliente quiere remoto → saltar
- **Remoto + zona compatible** → aplicar
- **Híbrido** → solo si cliente acepta híbrido (ver profile)

## Restricciones legales (filtro hard)

| Cliente | Oferta | Resultado |
|---|---|---|
| AR sin visa EU | Empresa EU acepta contractor | ✅ Aplicar |
| AR sin visa EU | Empresa EU contrato dependencia | ❌ Saltar (mencionar al cliente como notable) |
| AR | Empresa US acepta remoto contractor | ✅ Aplicar |
| AR | Empresa US H1B requerido | ❌ Saltar |
| Cualquiera | "Solo locales {ciudad_X}" cliente no es local | ❌ Saltar |

## Salario (filtro suave)

Si la oferta menciona salario y está **por debajo del piso** del cliente (`banda_salarial.piso`):

- Diferencia <20%: aplicar igual, el cliente puede negociar.
- Diferencia 20-40%: aplicar pero **flag al cliente** ("mencioná que apuntás a más").
- Diferencia >40%: saltar (no es realista llegar a target desde ahí).

## Red flags (saltar siempre)

- Pide dinero, datos bancarios, datos de tarjeta
- "Trabajo desde casa" + sueldo absurdo ($5K/día, $10K/semana)
- "No experience needed" + dev senior advertised — incoherente
- Inglés/español roto en publicación de empresa "global"
- Recruiter sin foto de perfil + sin actividad reciente + sin compañía verificable
- Pide CV con info personal sensible (DNI, dirección completa) ANTES de cualquier entrevista

## Reglas anti-spam

1. **Misma empresa, varias ofertas en una semana**: aplicar solo a la más relevante.
2. **Mismo recruiter posteando 5+ ofertas/semana**: aplicar solo a 1 — el resto son las mismas que se repostan.
3. **Empresa que ya rechazó al cliente** (si está en el log de aplicaciones): saltar 90 días. Después, OK reintentar si hay nuevo rol.
4. **Cliente ya aplicó a esta oferta** (mismo título + misma empresa): saltar.

## Match con el "Foco si cierra" del profile

Algunas ofertas pueden ser técnicamente válidas pero **violan los anti-distracciones del cliente**.

Ejemplo:
- Cliente Pablo Garay, anti-distracción "no aprender Next.js u otra tech nueva ahora".
- Oferta pide Senior Backend Java/Spring → ✅ aplicar (matchea sin pedirle aprender nada nuevo)
- Oferta pide Senior Frontend Next.js → ❌ saltar (le pide tech nueva al cliente, lo distrae del target)

Esto es lo que diferencia esta skill de un job-board genérico: **respeta el plan estratégico** que CoderHub diseñó con el cliente.
