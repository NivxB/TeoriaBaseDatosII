class Auto
  include Mongoid::Document
  field :Placa, type: String
  field :Modelo, type: String
  field :NumeroMotor, type: String

  	belongs_to :Cliente ,inverse_of: :Auto 
	has_many :Citum ,inverse_of: :Auto
end
