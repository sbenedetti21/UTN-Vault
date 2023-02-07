# Release 1 

### Registracion y login
- Incorporar distintos paises, va a pasar a llamarse rut y se va a poder elegir el pais
- Disponible un servicio para enviar sms para el codigo de 6 digitos
- Ver si en el login saleforce necesita el pais, habria que sumar ese campo si es asi.

## Home
- Se agregan secciones al menu lateral
- Listado de notificaciones

## Agenda
- Ademas de las citas que se agendan, voy a tener la visualizacion historica de las videollamadas on-demand con x clinica
- Se va a poder ver la agenda de otras personas en mi grupo familiar
	- Puede ser todo junto, cambiaria el nombre asignado
	- Ademas va a haber un filtro para seleccionar la agenda/s que se desea/n visualizar
	- Apenas se entra a la agenda ver la propia, para luego poder filtrar
	- Ver _Grupo famliar_
- Se va a modificar el flujo de crear nueva cita
	- Si selecciono el primer turno, sale un pop up pregfuntando sie stoy seguro
- Tipo de cita puede ser videollamada o llamada 'normal'
- Variacion de color dependiendo si es una cita, una tarea o una videollamada ondemand

## Programas
- **CORE del release 1**
- La primera muestra un listado de *programas* (un medico le crea un programa en salesforce al usuario, ese programa tiene etapas y tareas). 
	- Una *etapa* tiene tareas adentro
	- Hay distintos tipos de *tarea*
		- Check
		- Video
		- Encuesta
	- Dentro de las tareas hay *elementos*, los cuales simbolizan pequeñas "tareas", que otorgan un puntaje y pueden llegar a tener comprobaciones como los de la tarea
- Un programa puede no tener etapas, pero siempre tiene tareas.
- No se puede tener mas de una etapa en curso, las demas figuran en espera

### Servicio programas
- Datos del programa
	- imagen
	- nombre
	- estado (EN PROCESO/COMPLETADO)
	- etapas
	- especialista (professional)
	- puntos
- Datos de la etapa
	- Total de puntos?
- Datos de la tarea
	- nombre
	- si tiene elementois
	- puntos a obtener
	- especialista
	- fecha de vencimiento
	- favorito -> boolean
	- estado -> porcentaje de la tarea.
		- Color basado en la fecha de vencimiento. Hay que terminar de decidir cuando se hace el cambio
	- Ver si se necesita un campo para saber a donde redireccionar (por si es una receta, examen, o material educativo)

## Recetas
El profesional va a cargarla como una tarea. La persona completa la tarea.
- Recetas que el profesional escribe por salesforce
- Compartir por email o por wpp
- Repetir, es enviar un pedido para que se repita la misma receta a salesforce

## Examenes medicos
Similar a recetas. Podria ser cargar una radiografia que se hizo.
- Queda un historial de estos.

## Material educativo
Careassistance sube materiales educativos para que el publico lea y los profesionales recomienden a sus pacientes que los vean, hay que mostrar esa enciclopedia.
Deberia haber un booleano indicando si se puede descargar o no.
La gran mayoria no estan vinculados a un programa pero puede haber que un profesional dentro del programa le carga una tarea que sea lee el articulo tal (en ese caso estaria el boton ir al programa).

## Grupo familiar
