module Eminent
  VERSION = '1.0.0'

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

require 'eminent/database'
require 'eminent/domains'
require 'eminent/registrars'
