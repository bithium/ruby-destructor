module Destructor::CoreExt::Class

  def new(*args,&block)

    object = super

    if object.respond_to?(:finalize)
      ::ObjectSpace.define_finalizer( object, proc { object.__send__(:finalize) } )
    end

    return object

  end

end
