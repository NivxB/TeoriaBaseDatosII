class Mecanico
  include Mongoid::Document
  field :NombreMecanico, type: String
  field :ApellidoMecanico, type: String
  field :NumeroTelefono, type: String

  	belongs_to :Asesor, inverse_of: :Mecanico
	has_and_belongs_to_many :Citum
end
