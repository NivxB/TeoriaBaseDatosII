json.array!(@cita) do |citum|
  json.extract! citum, :id, :Placa, :NombreCliente, :Estado, :TelefonoContacto, :FechaHoraEntrada, :FechaEstimadaEntrega
  json.url citum_url(citum, format: :json)
end
