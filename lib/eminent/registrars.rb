module Eminent
  Registrar = Model.new(:name, :hostname) do
    # TODO Pricing per TLD goes here.
  end

  Registrars = Table.new(Registrar, 'registrars')
end
