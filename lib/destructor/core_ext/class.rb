#
module Destructor
  #
  module CoreExt
    #
    module Class

      def new(*args, &block)
        object = super

        if object.respond_to?(:finalize)
          ::ObjectSpace.define_finalizer(object, proc { object.__send__(:finalize) })
        end

        object
      end

    end
  end
end
