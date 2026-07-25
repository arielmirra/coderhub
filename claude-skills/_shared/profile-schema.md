# Profile schema — qué tiene que tener `profile.md`

Esquema de los campos esperados en `my-profile/profile.md`. Cualquier skill que lee el profile asume estos campos.

## Bloques obligatorios

### Identidad
- nombre completo, email, teléfono/whatsapp (formato `+5491153190688`), linkedin URL

### Ubicación + legales
- país, ciudad, nacionalidad, modalidad preferida, restricciones legales

### Idiomas
- español, inglés (nivel — A1/A2/B1/B2/C1/C2 o "native"), otros

### Rol y experiencia
- rol actual (con empresa), años de experiencia, salario actual, lista de roles previos

### Stack técnico
- stack principal (lista), stack secundario (lista), diferenciadores técnicos (lista narrativa), educación, certificaciones

### Logros concretos
- lista de bullets con **número o porcentaje** medible

### Objetivo de búsqueda
- rol target, banda salarial (piso/realista/stretch), mercados target, empresas tipo, plazo

### Modo confidencialidad
- empleado actualmente (sí/no), empresa debe enterarse (sí/no), modo stealth (sí/no)

### Bloqueos diagnosticados
- lista de bullets — lo que CoderHub identificó en la call

### Anti-distracciones
- lista de bullets — trampas mentales a respetar

### Mentor asignado
- coach principal, mentor técnico, fecha de arranque

## Bloques opcionales

- portfolio, github, otros links
- conversational notes / preferencias de tono
- preferencias de stack que querría aprender (no es lo que vende, es a futuro)

## Formato

Markdown plano. Headers `##` para bloques, listas con `- ` (espacio después del guión). Campos clave con `**Bold:**` antes del valor.

## Validación

Si una skill detecta que falta un bloque obligatorio, **debe**:

1. Avisar al cliente qué falta.
2. Ofrecerle re-correr `/coderhub-setup` para completar.
3. NO continuar con la operación pidiendo datos uno por uno (eso rompe la UX).
