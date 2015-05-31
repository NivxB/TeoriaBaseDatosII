class WelcomeController < ApplicationController
  skip_before_filter  :verify_authenticity_token
  def agregarMecanico
    @allAsesores=Asesor.all
  end

  def agregarAsesor
  end
  
  def modificarMecanico
    @selectMeca = Mecanico.find_by(:id=>params[:idMeca]) 
  end

  def actuaMecanico
    @selectMeca= Mecanico.find_by(:id=>params[:idMeca])
    @selectMeca.update(NombreMecanico: params[:nameMeca],ApellidoMecanico: params[:apellidoMeca],NumeroTelefono: params[:telefonoMeca])
    render plain: "Bien"
  end

  def actuaAsesor
    @selectAsesor = Asesor.find(params[:idAse])
    @selectAsesor.update(NombreAsesor: params[:nombreAse],ApellidoAsesor: params[:apellidoAse], NumeroTelefono: params[:telefonoAse])
    render plain: "Bien"
  end

  def modificarAsesor
    @selectAsesor = Asesor.find_by(:id=>params[:idAsesor])
  end

  def nuevoCliente
    @nuevoCliente = Cliente.new(NombreCliente: params[:nombreCliente], ApellidoCliente: params[:apellidoCliente], Email: params[:emailCliente], Direccion: params[:dirCliente])
    if @nuevoCliente.save
      render plain: "Cliente creado exitosamente recuerde iniciar sesion con su Email "
    else
      render plain: "Error"
    end  
  end

  def nuevoAsesor
    @nuevoAsesor= Asesor.new(:NombreAsesor=>params[:nombreAse],:ApellidoAsesor=>params[:apellidoAse],:NumeroTelefono=>params[:telefonoAse])
    if @nuevoAsesor.save
      render plain: "Asesor creado exitosamente con el Id de Asesor :  #{@nuevoAsesor.id} "
    else
      render plain: "Error"
    end  
  end

  def nuevoMecanico
    @AsesorDesignado = Asesor.find(params[:asesorid])
    @nuevoMecanico = Mecanico.new(NombreMecanico: params[:nombreMeca],ApellidoMecanico: params[:apellidoMeca],NumeroTelefono: params[:telefonoMeca])
    if @nuevoMecanico.save
      @AsesorDesignado.Mecanico.push(@nuevoMecanico)
      render plain: "Mecanico creado exitosamente con el Id de Mecanico :  #{@nuevoMecanico.id} "
    else
      render plain: "Error"
    end
  end

  def homepage
  end

  def seguimiento
  	@selectedCita = Citum.find_by(:id => params[:idCita])
  	@selectedAuto = Auto.find_by(:id => @selectedCita.auto_id)
  	@selectedAsesor = Asesor.find_by(:id => @selectedCita.asesor_id)
  end

  def newCitaRegis
  	@selectedCliente = Cliente.find_by(Email: params[:emailCliente])
    @autosCliente= @selectedCliente.Auto.all
  end

  def newCitaCliente

  end

  def nuevaCitaRegis
    @selectedCliente = Cliente.find(params[:idCliente])
    if params[:placaAuto] == "nil"
      @selectedCar = Auto.find(params[:idAuto])
      @newCita = Citum.new(Placa: @selectedCar.Placa, NombreCliente: @selectedCliente.NombreCliente, Estado: "NO_INGRESADO", TelefonoContacto: params[:telefonoContacto], FechaHoraEntrada: params[:fechaCita] + " " + params[:horaCita])
      if @newCita.save
          @selectedCar.Citum.push(@newCita)
          render plain: "Cita creada exitosamente con el id " + @newCita.id
        else
          render plain: "false"
        end
    else
      @newAuto = Auto.new(Placa: params[:placaAuto],Modelo: params[:modeloAuto],NumeroMotor: params[:numeroAuto])
      if @newAuto.save
        @newCliente.Auto.push(@newAuto)
        @newCita = Citum.new(Placa: @newAuto.Placa, NombreCliente: @selectedCliente.NombreCliente, Estado: "NO_INGRESADO", TelefonoContacto: params[:telefonoContacto], FechaHoraEntrada: params[:fechaCita] + " " + params[:horaCita])
        if @newCita.save
          @newAuto.Citum.push(@newCita)
          render plain: "Cita creada exitosamente con el id " + @newCita.id
        else
          render plain: "false"
        end
      end
    end
  end

 def nuevaCitaCliente
    @newCliente = Cliente.new(NombreCliente: params[:nombreCliente],ApellidoCliente: params[:apellidoCliente],Email: params[:emailCliente],Direccion: params[:dirCliente])
    if @newCliente.save
      @newAuto = Auto.new(Placa: params[:placaAuto],Modelo: params[:modeloAuto],NumeroMotor: params[:numeroAuto])
      if @newAuto.save
        @newCliente.Auto.push(@newAuto)
        @newCita = Citum.new(Placa: @newAuto.Placa, NombreCliente: @newCliente.NombreCliente, Estado: "NO_INGRESADO", TelefonoContacto: params[:telefonoContacto], FechaHoraEntrada: params[:fechaCita] + " " + params[:horaCita])
        if @newCita.save
          @newAuto.Citum.push(@newCita)
          render plain: "Cita creada exitosamente con el id " + @newCita.id
        else
          render plain: "false"
        end
      else
        render plain: "false"
      end
    else
      render plain: "false"
    end
 end

 def newVehiculo
  @Owner = Cliente.find_by(Email: params[:emailCliente])
 end

 def nuevoVehiculo
    @Owner = Cliente.find_by(Email: params[:emailCliente])
    @nuevoCarro = Auto.new(Placa: params[:placaAuto],NumeroMotor: params[:numeroAuto], Modelo: params[:modeloAuto])
    if @nuevoCarro.save
      @Owner.Auto.push(@nuevoCarro)
      render plain: "Vehiculo creado exitosamente con el Id de Vehiculo :  #{@nuevoCarro.id} "
    else
      render plain: "Error"
    end
 end

 def modAuto
  @selectedCliente = Cliente.find_by(Email: params[:emailCliente])
  @selectedAuto = Auto.find_by(:Placa => params[:placaVeh])
 end

 def modificarVehiculo
    @nuevoCarro = Auto.find_by(:Placa => params[:placaAuto])
    @nuevoCarro.update(Modelo: params[:modeloAuto] , NumeroMotor: params[:numeroAuto])
    render plain: "Vehiculo modificado exitosamente con el Id de Vehiculo :  #{@nuevoCarro.id} "
 end

  def checkCita
	if Citum.where(:id => params[:idCita]).blank?
		 render plain: "false"		 
	else
		 render plain: "true"
	end
  end

  def checkCliente
  	if Cliente.where(Email: params[:emailCliente]).blank?
		 render plain: "false"		 
	else
		 render plain: "true"
	end
  end

  def checkAuto
  if Cliente.where(Email: params[:emailCliente]).blank?
     render plain: "false"     
  else
     if Cliente.where(Email: params[:emailCliente]).first.Auto.where(Placa: params[:placaVeh]).blank?
        render plain: "false"
     else 
        render plain: "true"
     end
  end
  end

  def checkAsesorAuto
    if Asesor.where(:id => params[:asesorId]).blank?
       render plain: "false"     
    else
        if Asesor.find(params[:asesorId]).Citum.where(:Placa => params[:placaVeh]).blank?
          render plain: "false"
        else
          render plain: "true"
        end
       
    end
  end

  def cambiarEstado
    @selectedAsesor = Asesor.find(params[:asesorId])
    @Citas = @selectedAsesor.Citum.all
    @ListaEstados = Array.new(@Citas.count)

    for  i in 0..(@Citas.count - 1)
      @ListaEstados[i] = @Citas[i].Estado
    end

  end

  def updateEstado
    @selectedCita = Citum.find(params[:idCita])
    @selectedCita.update(:Estado => params[:Estado] , :FechaEstimadaEntrega => params[:PosibleDate])
    render plain: "Estado actualizado"
  end


def asigAsesor
  @Asesor = Asesor.find(params[:idAsesor])
  @Citas = Citum.where(Asesor_id: nil).all
  @Mecanicos = @Asesor.Mecanico.all
end

def setCita
  @Asesor = Asesor.find(params[:idAsesor])
  @Mecan = params[:idMecanicos]
  @Mecan = @Mecan.split("|")
  @Citas = params[:idCitas]
  @Citas = @Citas.split("|")

  for i in 0..(@Citas.count - 1)
    @currentCita = Citum.find(@Citas[i])
    @currentCita.update(Estado: "INGRESADO")
    @Asesor.Citum.push(@currentCita)
    for i in 0..(@Mecan.count - 1)
      @currentMeca = Mecanico.find(@Mecan[i])
      @currentCita.Mecanico.push(@currentMeca)
    end
  end
  render plain: "Cita asignada exitosamente"
end
end