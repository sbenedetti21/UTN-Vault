# La criptografía

Se parte de la base de que un *emisor* y un *receptor* se quieren comunicar. Para eso el emisor envía un *mensaje*. Se asume que el *canal* por donde viaja ese mensaje es **inseguro**.

## CIA
- Confidencialidad
- Integridad
- Disponibilidad (availability): la única que la criptografía no hace.

La criptografía ofrece 
- Confidencialidad: La info solo puede ser leida por las entidades autorizadas
- Integridad: La info solo puede ser modificada por las entidades autorizadas
- Autenticación: mecanismo que permite comprobar la entidad de una entidad
- No repudio: si se usan mecanismos de autenticación criptográficos, se asuma la imposibilidad práctiva de suplantación  de la identidad.

## Criptología
> **Criptología** = Criptografía + Criptoanálisis

**Criptografía**: estudia el diseño y propiedades de algoritmos y mecanismos que ofrecen confidencialidad e intergridad.
**Criptoanálisis**: busca vulnerabilidades y desarrolla ataques a los mecanismos criptográficos.

## Manera de cumplir
Para cada mensaje solo debe haber un y solo un cifrado y lo mismo para el cifrado. Se cifra con una clave *k*. Si eva no conoce la clave no va a poder leer el mensaje. Se asegura la **CONFIDENCIALIDAD**

![[zz_confidencialidad.png]]

Existen mecanismos para garantizar la **INTEGRIDAD** de los mensajes. 

Al igual que para garantizar **AUTENTICACION**.

Y lo mismo con el **NO REPUDIO**

## Modelo matemático de un CriptoSistema
$$(M, K, C, Ee, Dd)$$

- M: Conjunto de textos a cifrar
- K: Conjunto de todas las claves
- C: Conjunto de textos cifrados
- Ee: Función de cifrado
- Dd: Función de descifrado

Si e = d, entonces es un sistema simétrico (misma clave para cifrar y descifrar), sino es asimétrico.

## Historia y clasificación
![[historiayclasif.png]]

### Criptografía clásica
**Clave privada**: la misma clave se usa para cifrar y descrifrar, cada interlocutor tiene que tener una copia de la clave, si se compromete la seguridad de la clave el sistema es inseguro. Cada usuario debe tener una clave diferente, el sistema debe permitir esto. Problema de *distribución* de la clave.

- Texto claro - Texto Cifrado: Napoleón y la Rosetta
- Transposición: Escítala
- Sustitución: mover las letras n caracteres hacia adelante (Ceasar)
- Cifrado "indescifrable": conjunto de césar

## Link importante
[CryptoTool](https://www.cryptool.org/en/)