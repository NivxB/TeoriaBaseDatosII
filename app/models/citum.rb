class Citum
  include Mongoid::Document
  field :Placa, type: String
  field :NombreCliente, type: String
  field :Estado, type: String
  field :TelefonoContacto, type: String
  field :FechaHoraEntrada, type: Time
  field :FechaEstimadaEntrega, type: Time
  
	has_and_belongs_to_many :Mecanico 
	has_many :Servicio, inverse_of: :Citum
	belongs_to :Auto
end
