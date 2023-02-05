# Patrones de Diseño

## Índice

- [Patrones de Comportamiento](#comportamiento)
    - [Strategy](#strategy)
    - [Template Method](#template)
- [Patrones Creacionales](#creacionales)
    - [Singleton](#singleton)
    - [Factory Method](#factory)

## Patrones de Comportamiento <a name="comportamiento"></a>

### Strategy <a name="strategy"></a>

El patrón strategy se utiliza para conseguir extraer del *contexto* las diferentes *estrategias* variables que existen, utilizando polimorfismo para poder ejecutarlas y manteniendo código mas limpio y mas facil de extender y mantener.
Al usar **composición** permite cambiar de *estrategia* en tiempo de ejecución.
Es muy útil para evitar los "Type Tests".

~~~java
class Maestro {
    Elemento elemento;

    setElemento(Elemento nuevoElemento) {
        elemento = nuevoElemento;
    }

    atacar() {
        elemento.atacar()
    }
}

class Agua implements Elemento {
    atacar() {
        return tormentaDeAgua;
    }
}

class Fuego implements Elemento {
    atacar() {
        return bolaDeFuego;
    }
}
~~~

### Template method <a name="template"></a>

La idea del patrón template, es justamente crear una plantilla en una clase abstracta principal para que luego sea compatible con las subclases que implementan sus métodos polimorficamente. Trabaja con herencia a diferencia de Strategy que lo hace con composición.
En general se trata de dividir el "algoritmo" que se quiere usar como plantilla en pasos e implementar esos pasos como métodos que luego serán sobreescritos.
Existen pasos abstractos que tienen que ser implementados si o si por las subclases y tambien pasos opcionales que ya tienen comportamiento por defecto que puede ser común a la mayoría de los casos (igualmente pueden sobrescribirse)
![DC Template][templateDC]

## Patrones Creacionales <a name="creacionales"></a>

### Singleton <a name="singleton"></a>

Singleton es un patrón que nos permite asegurarnos que solo exista **una y solo una** instancia de una determinada clase, la cual provee un acceso global.
Este patrón vulnera el *Principio de responsabilidad única*, ya que resuelve dos problemas al mismo tiempo. (Garantizar única instancia y proporcionar acceso global a la misma)
Complica las pruebas unitarias, si bien siempre se puede mockear.

Todas las implemtaciones del patrón tienen estos dos pasos:

* Hacer privado el constructor para que otros objetos no utilicen el operador ```new```
* Crear un método de creacipon estático que actúe como constructor que devuelva siempre la misma instancia

~~~java
class Recomendador {
    private static Recomendador INSTANCE;

    private Recomendador() {

    }

    public static Recomendador getInstance() {
        if (INSTANCE == null) {
            INSTANCE = new Recomendador();
        }
        return INSTANCE;
    }
}
~~~

### Factory Method <a name="factory"></a>

Con el patrón **Factory Method** se consigue una clase *fábrica* la cual implementa un ***Template Method***

![DC Template Method][templateDC]

[templateDC]:filesResumen\template.jpg 
[factoryDC]:filesResumen\factory.jpg