class PrototypeObject

  def initialize()
    properties = {}
  end

  def set_property(property_name, value)
    @properties[property_name] = value
  end

  def get_property(property_name)
    @properties.fetch(property_name) { raise PropertyNotFound.new }
  end

  # Ahora podemos llamar con guerrero.energia
  def method_missing(symbol, *args, &block)
    if @properties.has_key?(symbol)
      get_property(symbol)
    else
      super
    end
  end

  # Debemos redefinir este para que el metamodelo sea estable
  def respond_to_missing?(symbol, include_all_private_methods = false)
    @properties.has_key?(symbol) || super
  end

end

class PropertyNotFound < StandarError
end

# --------------------------------------------------------------------
# Otra manera de hacer esto es agregar metodos nuevos en vez de usar el method missing
# Esto estaría mal porque cualquier instancia de PrototypeObject entendería los mensajes

class PrototypeObject

  # ...

  def set_property(symbol, value)
    @properties[symbol] = value
    self.class.send(:define_method, symbol) {get_property(symbol)}
  end

end

# la manera de resolver es usando define_singleton_method, esto es mas simple que el method missing
# no siempre se puede hacer, solo si en algun momento se conoce lo que se va a necesitar.
# en el tp no sabemos que mensajes nos van a mandar por lo cual necesitamos del method missing

class PrototypeObject

  # ...

  def set_property(symbol, value)
    @properties[symbol] = value
    define_singleton_method(symbol) { get_property(symbol) }
  end

end

# --------------------------------------------------------------------------
# property con proc

class PrototypeObject

  # ...

  def set_property(symbol, value)
    @properties[symbol] = value
    define_singleton_method(symbol) do
      property = get_property(symbol)
      case property
      when Proc
        property.call
      else
        property
      end
    end
  end

end

guerrero = PrototypeObject.new
guerrero.set_property(:un_proc, proc { puts 'hola!' })

# Si queremos que los procs entiendan el contexto del objeto

guerrero.set_property(:nombre, 'carlos')
guerrero.set_property(:saludar, {"hola, soy #{self.nombre}"})

class PrototypeObject

  # ...

  def set_property(symbol, value)
    @properties[symbol] = value
    define_singleton_method(symbol) do # |*params|
      property = get_property(symbol)
      case property
      when Proc
        # !!!!!!!!!!!
        self.instance_eval(&property)
        # PAra que entiendan parametros podemos hacer
        # self.instance_exec(*params, &property)
      else
        property
      end
    end
  end

end


# Todo esto quedaría mas simple escrito de la siguiente manera, ya que el define_singleton_method
# toma los paramtetros del bloque

class PrototypeObject

  # ...

  def set_property(symbol, value)
    @properties[symbol] = value
    case value
    when Proc 
      define_singleton_method(symbol, &value) 
    else
      define_singleton_method(symbol) { get_property(symbol) }
    end
  end

end

# ------------------------------------------------------------------------
# Ahora queremos copiar proptotypeObjects
# todo el comportamiento de guerrero es heredado por otro_guerrero

otro_guerrero = guerrero.copy

class PrototypeObject

  #...

  def initialize(properties = {})
    @properties = properties
  end

  def set_property(symbol, value)
    # esto es para que ambos objetos no compartan diccionarios, pisamos con uno nuevo
    @properties = @properties.merge(symbol => value)
    case value
    when Proc 
      define_singleton_method(symbol, &value) 
    else
      define_singleton_method(symbol) { get_property(symbol) }
    end
  end

  def copy
    self.class.new(@properties)
  end

end

# haciendolo de esta manera los metodos no se comparten porque se definen cuando se definen las propiedades
# aca el method missing podría ser una buena opcion pero tambien se podria hacer lo siguiente

class PrototypeObject

  #...

  def initialize(properties = {})
    @properties = properties
    @properties.each do |symbol, value|
      set_property(symbol, value)
    end
  end

end