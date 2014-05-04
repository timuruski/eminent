# require 'eminent/models/registrar'

module Eminent
  module Registrars
    TABLE_NAME = 'registrars'

    class << self
      extend Forwardable

      def table
        Database.connection.from(TABLE_NAME)
      end

      def all
        table.all.map { |attrs|
          Registrar.with(attrs)
        }
      end

      def first
        Registrar.with(table.first)
      end

      def insert(registrar)
        table.insert(registrar.attrs)
      end

      def update(registrar)
        table.where(id: registrar.id).update(registrar.attrs)
      end
    end
  end

  Registrar = Value.new(:id, :hostname, :name) do
    include Persistent
  end
end
