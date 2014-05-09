require 'yaml/store'

module Eminent
  module Datastore
    DEFAULT_PATH = 'data/eminent.yml'

    module Interface
      def self.extended(base)
        base.instance_exec do
          alias_method :from, :[]
        end
      end
    end

    def self.connection(path = DEFAULT_PATH)
      Thread.current[:eminent_db_connection] ||=
        YAML::Store.new(path).extend(Interface)
    end
  end
end
