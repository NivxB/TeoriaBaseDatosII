json.array!(@mecanicos) do |mecanico|
  json.extract! mecanico, :id, :NombreMecanico, :ApellidoMecanico, :NumeroTelefono
  json.url mecanico_url(mecanico, format: :json)
end
