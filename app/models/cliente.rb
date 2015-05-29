class Cliente
  include Mongoid::Document
  field :NombreCliente, type: String
  field :ApellidoCliente, type: String
  field :Email, type: String
  field :Direccion, type: String

	has_many :Auto, inverse_of: :Cliente
end
