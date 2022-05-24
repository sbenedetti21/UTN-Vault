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