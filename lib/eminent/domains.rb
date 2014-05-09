module Eminent
  Domain = Model.new(:hostname, :registrar, :created_on, :expires_on)
  Domains = Table.new(Domain, 'domains')
end
