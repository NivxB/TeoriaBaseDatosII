class Asesor
  include Mongoid::Document
  field :NombreAsesor, type: String
  field :ApellidoAsesor, type: String
  field :NumeroTelefono, type: String

  has_many :Mecanico , inverse_of: :Asesor
  has_many :Citum , inverse_of: :Asesor
end
