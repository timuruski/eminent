# require 'eminent/models/domain'

module Eminent
  module Domains
    TABLE_NAME = 'domains'

    def self.all
      Database.connection.from(TABLE_NAME).all
    end
  end
end
