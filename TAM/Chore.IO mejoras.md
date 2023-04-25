# Chore.IO mejoras
## CHOR-268: As a parent, I'd like to have a repository of the most common Chores and Folders.

Opción 1: Front localmente almacena los templates en formato json para luego pegarle al endpoint `POST /v1/api/chores`.
ej: template de homework
```json
{
	'name': "Homework",
	'description': "do your week's homework"
}
```

Opción 2: Crear en el back una tabla de templates que tenga como datos el nombre, descripción e imagen. Crear endpoint para traer esos templates. El front pide esos templates y le pega al endpoint de creación de chores con el elegido.

## CHOR-267: As a parent, I'd like to have a repository of the most common daily limits.

Entiendo que es solo trabajo de back, el endpoint que trae los daily limits se mantendría igual.

### Tareas
- Almacenar estos defaults daily limits configurables según zona horaria del cliente
- Modificar la creación de un child para que en ese momento se creen los default daily limits y se le asignen. (Ver si crear uno por child, o usar los mismos para todos)

## CHOR-271: As a parent, I want to manage if a chore is active.

Se sumaría al `PATCH /v1/api/chores` el campo `active: boolean` para poder activar/desactivar una chore.
Se sumaría al `GET /v1/api/chores/folder/{folderId}` dentro de las chores el campo `active` 

### Tareas
- Sumar el campo `active` a la tabla de chores
- Verificar en la creación de choreOnChild que si la chore no esta activa no se debe crear. (Verificar si hace falta el chequeo en otro lado)

## CHOR-272: As a Parent, I want all options Under "Store and Content" & "System Setitings" to be locked by default

No hay trabajo del back

## CHOR-273: As a Child, I want submitted chores to be un-collapsed by default

No hay trabajo del back

## CHOR-274: As a Parent, I want to assing multiple chores at the same time.

Cambiarían los endpoint `POST y PATCH /v1/api/chores`?

Pendiente de validación con diseño...

Opciones:
1. crear 2 chores distintas y asignar cada una a una folder, lo cual haría que se puedan administrar por separado como pide la US (no se si de esta manera se puede mostrar en el front como está en el diseño que una chore tiene dos folders asignadas)
2. o en un paso intermedio crear una sola chore y crear 2 "choreOnFolder" (la abstracción que representa la relación entre una folder y una chore) que permitiría poder mostrarlas como una única chore pero no se podría borrar por separado, se tendría que eliminar de la carpeta

## CHOR-275: As a Parent, I want to be allowed interaction with the "My family" screen while it's loading

No hay trabajo del back

## CHOR-277: As a Parent, as soon as I add a child, I want it to be assigned with his/her folders.

No habría cambios en los endpoints.

### Tareas
- Crear los defaults de folders configurables para cada child
- Modificar la creación de un child, para que en ese momento se creen las carpetas con los defaults configurados previamente. Verificar si ya hay otro child en la familia para crear o no la carpeta "All kids".

## CHOR-278: As a parent or reviewer, I would like to use a discount code to get the premium subscription for free

No hay trabajo del back

## CHOR-279: As a parent, I want to see the screen time restrictions each child has configured on my Home Page Screen.

No hay trabajo del back

## CHOR-114: As a Parent, I want a Summary of each kid's daily limits.

Capaz se modifica el endpoint `POST /v1/api/limit-days` agregando el campo active, que si fuera el caso de que ya existe un daily limit con una frecuencia que se superponga, debería venir `active: false`

### Tareas
- Modificar comportamiento de daily limits para permitir la creación de limites con una frecuencia que se superponga, pero estando en off.