module Expressir
  module Model
    module Literals
      class Binary
        attr_accessor :value

        def initialize(options = {})
          @value = options[:value]
        end
      end
    end
  end
end