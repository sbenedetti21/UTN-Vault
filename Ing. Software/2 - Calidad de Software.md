## Reflexión sobre paper Classic Mistakes

Para incluir gente en proyectos:
- Independencia de las tareas
- Grado de comunicación
- Experiencia en la ejecución

## Diagrama espina de pescado

1) Identificar como cabeza el problema que queremos resolver
2) Identificar que causas llevan a ese problema
3) Identificar nuevamente que causas llevaron a esas 2das causas
4) Seguir identificando causas hasta conseguir las situaciones que causaron el problema

![[DiagramaPez.png]]

# Calidad - Software Quality
## Que es la calidad?
#### Crosby
Cumplir con los requerimientos
#### Weinberg
Cumplir con los requerimientos de una persona
- Calidad es el valor para una persona
- Valor es aquello que está dispuesto a pagar para obtener sus requerimientos
#### Juran
Adecuación al uso
- Satisfacción de las necesidades del cliente
- Ausencia de deficiencias
#### ISO 8402 - 1986
La totalidad de aspectos y características...

## Visiones de la calidad
- **Trascendental**: es algo que se puede reconocer pero no se puede definir (como decir que racing es el mejor equipo de arg, es subjetivo)
- **Del usuario**: es adecuación al propósito (prevalece que el software cumpla con los requerimientos del usuario)
- **De la manufactura**: es conformidad con la especificación (tiene que ver con el proceso de construcción del producto, (NORMAS ISO))
- **Del producto**: está vinculada a las características inherentes del producto (si cumple en cierto grado con los atributos de calidad que yo considero, es de calidad. Hay mix de subjetivada y objetividad)
- **Basada en el valor**: depende de la cantidad de dinero que el usuario está dispuesto a pagar por el producto (maximizar la relacion costo/beneficio)

## Costos de la calidad
El costo de la calidad es el gasto que se hace para cumplir con los atributos que se considera que debe de superar el software para ser de calidad

![[costoCalidad.png]]

##### Costos ocultos de la "no-calidad"
- Baja motivación de los equipos de trabajo / Duplicación de esfuerzos
- Over-time constante / Re-trabajo constante
- Desgaste del equipo de trabajo
- Imagen negativa ante el cliente 

## Calidad del producto - ISO 25010

![[ISO25010.png]]
Atributos contribuyentes a la calidad del producto software segun: ***ISO 25010***

#### Adecuación funcional
Capacidad del producto para proporcionar funciones que satisfacen las necesidades declaradas e implícitas, cuando el producto se usa en las condiciones especificadas

- *Completitud funcional*: cuanto mas cobertura tenga el producto sobre las necesidades, la completitud es mas alta.
- *Corrección funcional*: capacidad del producto para proveer resultados correctos con el nivel de precisión requerido.
- *Pertinencia funcional*: cuan adecuado es el producto para cumplir con los objetivos (suitability)

#### Eficiencia de Desempeño
Representa el desempeño relativo a la cantidad de recursos utilizados bajo determinadas cantidades

- *Comportamiento temporal*: los tiempos de respuesta y procesamiento de un sistema
- *Utilización de recursos*: las cantidades y tipos de recursos que utiliza el software
- *Capacidad*: límites máximos que ese producto esta preparado para soportar

#### Compatibilidad
Capacidad de dos o mas sistemas o componentes para intercambiar información y/o llevar a cabo sus funciones requeridas cuando comparten el mismo entorno hw o sw

- *Coexistencia*: habilidad de convivir o coexistir con otro submundo de productos y no tenga un problema
- *Interoperabilidad*: capacidad de ese producto de "dialogar" con otros productos para intercambiar información

#### Usabilidad
Capacidad del producto para ser atendido, aprendido, usado y resultar atractivo para el usuario, cuando se usa bajo determinadas condiciones.

- *Capacidad para reconocer su adecuación*: que los usuarios sean capaces de reconocer para que sirve el producto, sin recurrir a info adicional.
- *Capacidad de aprendizaje*: capacidad del producto que permite al usuario aprender su aplicación.
- *Capacidad para ser usado*: facilidad a la hora de operarlo.
- *Protección contra errores de usuario*: que pueda dar un nivel de cobertura a los errores voluntarios tanto como involuntarios.
- *Estética de la interfaz de usuario*: capacidad de agradar y satisfacer la interacción con el usuario. 
- *Accesibilidad*: capacidad para ser utilizado por usuarios con determinadas características y discapacidades.

#### Fiabilidad
Capacidad de un sistema o componente para desempeñar las funciones especificadas, cuando se usa bajo determinadas condiciones.

- *Madurez*: haga el delivery de las funciones en forma permanente en el tiempo. Que envejesca bien. Tiempo entre fallas largo.
- *Disponibilidad*: capacidad de estar operativo y accesible para su uso cuando se requiere. "Cuanto tiempo esta caído?"
- *Tolerancia a fallos*: cuando ocurre algo que no estaba previsto, que capacidad tiene el producto de seguir funcionando a pesar de una falla sw o hw.
- *Capacidad de recuperación*: capacidad para recuperar los datos y restablecer el estado deseado en caso de interrupción o fallo. Tres aspectos:
	- Cuanta info esta dispuesto a perder con respecto a lo que se vino trabajando?
	- Cómo quiero volver al estado deseado?
	- Cuanto tiempo puedo estar fuera de línea?

#### Seguridad
Capacidad de protección de la info y los datos de manera que personas o sistemas no autorizados no puedan leerlos o modificarlos.

- *Confidencialidad*: capacidad de protección contra acceso a datos e info no autorizados, ya sea accidental o deliberadamente.
- *Integridad*:  capacidad de prevenir que haya gente que pueda alterar la información de manera no autorizada. Creación de perfiles.
- *No repudio*: capacidad de demostrar que las acciones sucedieron. (visto en wpp)
- *Responsabilidad*: capacidad de tener trazabilidad con respecto a las acciones que ejecuta un actor o una entidad. Que capacidad de loggeo tiene una app y con que detalle. Importante para el análisis forense.
- *Autenticidad*: capacidad de demostrar la identidad del sujeto que esta transaccionando.

#### Mantenibilidad
Esta característica representa la capacidad del producto software para ser modificado efectiva y eficientemente.

- *Modularidad*: capacidad que permite que un cambio en un componenete tenga un impacto mínimo en los demás.
- *Reusabilidad*: capacidad de ser reutilizado en mas de una ocasión.
- *Analizabilidad*: esfuerzo que demanda identificar donde hay que realizar una modificación.
- *Capacidad para ser modificado*: cuanto esfuerzo demanda realizar una modificación.
- *Capacidad para ser probado*: cuanto esfuerzo demanda testear lo que se modificó.

#### Portabilidad
Capacidad de ser transferido de forma efectiva y eficiente de un entorno a otro.

- *Adaptabilidad*: cuanto esfuerzo me demandaría cambiar de entorno.
- *Capacidad para ser instalado*: cuanto esfuerzo demanda instalar o desinstalar.
- *Capacidad para ser reemplazado*: cuanto esfuerzo demanda desenchufar un producto y que no haya dejado algún "vendor locking".