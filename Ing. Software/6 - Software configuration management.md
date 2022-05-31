# Software Configuration Management

## Problemas en el desarrollo de software
- En mi maquina funciona
- Armar el entregable toma unos días
- ...


## Qué es el software
Por un lado el software es el código, pero con estándares que tiene que cumplir, con funcionalidades que garantiza, etc. Es un conjunto de cosas. Solución a un problema específico.

![[queessoftware.png]]

> EL SOFTWARE NO ES SOLO EL CÓDIGO QUE ESTOY CODEANDO

### Item de configuracion
Cualquier elemento que este involucrado en la construcción de software y que nosotros querramos gestionar o tenga que estar gestionado, que ayude a construir y mantener el software. Cada software está compuesto por 1 o mas items de config. Yo selecciono cuales son los importantes para mi software. (en el tp de S.O. eran el código, el enunciado, las bibliotecas, el makefile, algún script de pruebas)
Para cada item se conoce información sobre su configuración (nombre, versión, fecha de creación, autor, etc)

### Configuración
Conjunto de todos los items de configuración que para mí componen al producto software y generan una configuración de software. Generan un binario e info adicional sobre ese binario.

# SCM
Es una disciplina orientada a administrar la evolución de:
- productos
- procesos
- ambientes

Va a administrar todos los cambios sobre estos elementos para que el software mantenga la integridad a lo largo de su ciclo de vida. (integridad garantiza que tenes los elementos necesarios y suf para que el software funcione, una falla indica que hubo un comportamiento inesperado pero nada que ver con que el programa funcione)

Involucra para una configuración:
- identificarla en un momento dado
- controlar cambios sistemáticamente
- mantener su integridad y origen

Acompaña la actividad de cambio con actividades de control

# SWEBOK
![[swebok.png]]

## Administración del proceso de SCM
Etapa previa al arranque del proyecto, donde se debe comprender el contexto organizacional.
- Identificación de la configuración
- Procesos de control de cambios
- Auditorías de software
- Release management, entre otras
- Políticas de manejo de branches para que no crezcan

## Auditoría de la configuración
Control de que algo se este haciendo como lo esperado.
El objetivo es realizar una verificación del estado de la configuración a fin de determinar si se están cumpliendo los requerimientos especificados.
Puede ser ejecutada con diferentes niveles de formalidad:
- Revisiones informales basadas en checklists
- Pruebas exhaustivas de la configuración que son planificadas

### Tipos de auditoría
- **Funcional**: verifica el cumplimiento de requerimientos del producto software. (empieza un sprint para realizar 3 funcionalidades, pero al finalizar la semana se tienen 4 funcionalidades completas, por lo cual no cumple con la auditoría funcional, no cumple con lo esperado) Si detecto una falla en la auditoría funcional, puedo ver en que proceso se generó, quien aprobó los cambios, etc.
- **Física**: que verifica la configuración del producto en cuanto a la estructura especificada. Controlar que el software hace lo que dice que hace (que ningún gracioso incorpore reglas de negocio a su gusto). Una manera es testear? fundamentalmente, leer el código.
- **De Proceso**: que verifica que se haya cumplido el proceso de SCM

## Administración de la Distribución y despliegue
![[releaseManagement.png]]

El objetivo es que yo construya de manera exitosa el software, aplicando las reglas, para despues liberarlo en forma controlada a otros entornos ya sea de pruebas, producción, usuario final, etc.

### Tipos de build
- Local build:
- Integration build:
- Nightly build: build que toma los cambios que se hayan generado en el día
- Release build:

Los builds deben ser automáticos, deben permitir generar reportes. Traen beneficios al negocio.

### Deploy
*completar con ppt*

#### Build and Deployement Pipelines
Automatizacion del proceso para llevar el software desde la aprobación del cambio de SCM hasta que llega a manos de los usuarios.

![[deploy.png]]

Por ejemplo Jenkins, como herramienta.

# SCM en la vida real (complementar ppt)
La **linea base** de una configuración es una foto del conjunto de items de config que a mi me generaron un software funcional, que luego son utilizados como punto base para realizar configuraciones a futuro. (puede no haber código, con lo cual no es un release)

A partir de ahi voy avanzando comparando la foto del momento con la línea base.

La clasificación de los Items de Config se dividen en *proceso* (genera el software, luego no son importantes), o de *producto* (que son útiles a la larga, viven por mas tiempo). Clasificar sirve para decidir que esfuerzo pongo en mantener cada ítem.

Hay que tener un proceso de gestión de cambio, donde alguien pueda aprobar o rechazar un cambio. (en scrum es el product backlog y su construcción)

> Gestiono todo aquello que yo necesite para ser exitoso en mis tareas de desarrollo y mantenimiento, nada mas y nada menos.

> *Lo único constante es el cambio*, Heráclito

La *última versión* es un consenso del equipo, depende del contexto que estemos mirando, puede ser la del ambiente de desarrollo o la que ya está en producción.

Leer "but i've only changed one line of code"
Fecha del segundo parcial 27/06