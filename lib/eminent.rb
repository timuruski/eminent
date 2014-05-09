module Eminent
  VERSION = '1.0.0'

  module Model
    def self.new(*attrs, &block)
      model_class = Struct.new(*attrs).extend(self)
      model_class.class_exec(&block) if block
      model_class
    end

    def with(attrs)
      self.new.tap do |model|
        attrs.each do |key, value|
          model[key] = value
        end
      end
    end
  end

  module Table
    def self.new(model_class, table_name, &block)
      table = Module.new
      table.instance_exec do
        instance_var_set(:@model_class, model_class)
        instance_var_set(:@table_name, table_name)
      end
      table.extend(self)
      table.class_exec(&block) if block
    end

    def all
      Datastore.connection[@table_name].map { |attrs|
        @model_class.with(attrs)
      }
    end
  end

  module Persistent
    def attrs
      Hash[self.class::VALUE_ATTRS.zip(values)]
    end

    def update(new_attrs)
      new_attrs = attrs.merge(new_attrs)
      self.class.with(new_attrs)
    end
  end
end

require 'eminent/datastore'
require 'eminent/domains'
require 'eminent/registrars'
