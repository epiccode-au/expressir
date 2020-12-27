module Expressir
  module Model
    class Procedure
      include Scope
      include Identifier

      attr_accessor :parameters
      attr_accessor :declarations
      attr_accessor :constants
      attr_accessor :variables
      attr_accessor :statements

      def initialize(options = {})
        @id = options[:id]

        @parameters = options[:parameters]
        @declarations = options[:declarations]
        @constants = options[:constants]
        @variables = options[:variables]
        @statements = options[:statements]
      end

      def types
        @declarations.select{|x| x.instance_of? Expressir::Model::Type}
      end

      def entities
        @declarations.select{|x| x.instance_of? Expressir::Model::Entity}
      end

      def subtype_constraints
        @declarations.select{|x| x.instance_of? Expressir::Model::SubtypeConstraint}
      end

      def functions
        @declarations.select{|x| x.instance_of? Expressir::Model::Function}
      end

      def procedures
        @declarations.select{|x| x.instance_of? Expressir::Model::Procedure}
      end

      def children
        items = []
        items.push(*@parameters) if @parameters
        items.push(*@declarations.flat_map do |x|
          [
            x,
            *if x.instance_of? Expressir::Model::Type and x.type.instance_of? Expressir::Model::Types::Enumeration
              x.type.items
            end
          ]
        end) if @declarations
        items.push(*@constants) if @constants
        items.push(*@variables) if @variables
        items
      end
    end
  end
end