json.array!(@servicios) do |servicio|
  json.extract! servicio, :id, :Tipo, :Descripcion
  json.url servicio_url(servicio, format: :json)
end
