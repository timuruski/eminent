require 'sequel'
require 'values'

module Eminent
  module Database
    DEFAULT_URL = 'sqlite://data/eminent.db'

    def self.connection(url = DEFAULT_URL)
      Thread.current[:eminent_db_connection] ||=
        Sequel.connect(url)
    end

    def self.setup
      connection.create_table :registrars do
        primary_key :id
        String :hostname
        String :name
      end

      connection.create_table :prices do
        primary_key :id
        String  :tld
        Integer :registrar_id
        Integer :price
      end

      connection.create_table :domains do
        primary_key :id
        String   :hostname
        Integer  :registrar_id
        DateTime :created_at
        DateTime :expires_at
      end
    end
  end
end
