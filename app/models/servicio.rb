class Servicio
  include Mongoid::Document
  field :Tipo, type: Integer
  field :Descripcion, type: String

  belongs_to :Citum, inverse_of: :Servicio
end
