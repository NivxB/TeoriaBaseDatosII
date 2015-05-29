class WelcomeController < ApplicationController
  skip_before_filter  :verify_authenticity_token
  def agregarMecanico
    @allAsesores=Asesor.all
  end

  def agregarAsesor
  end
  
  def modificarMecanico
    @allAsesores = Asesor.all
    @selectMeca = Mecanico.find_by(:id=>params[:idMeca]) 
  end

  def actuaMecanico
    @selectMeca= Mecanico.find_by(:id=>params[:idMeca])
    render plain: "Bien"
  end

  def actuaAsesor
    @selectAsesor = Asesor.find(params[:idAse])
    render plain: "Bien"
  end

  def modificarAsesor
    @selectAsesor = Asesor.find_by(:id=>params[:idAsesor])
  end

  def nuevoAsesor
    @nuevoAsesor= Asesor.new(:NombreAsesor=>params[:nombreAse],:ApellidoAsesor=>params[:apellidoAse],:NumeroTelefono=>params[:telefonoAse], :created_at=>Time.new.inspect)
    if @nuevoAsesor.save
      render plain: "Asesor creado exitosamente con el Id de Asesor :  #{@nuevoAsesor.id} "
    else
      render plain: "Error"
    end  
  end

  def nuevoMecanico
    if @nuevoMecanico.save
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

  def newCita
  	@selectedCliente = Cliente.find_by(:id => params[:idCliente])
  	@autosCliente = @selectedCliente.Auto
  	@allAsesores = Asesor.all
    @allMecanicos = Mecanico.all
  end

 def nuevaCita
  
 end

 def newVehiculo
  @allClientes = Cliente.all;
 end

 def nuevoVehiculo
    if @nuevoCarro.save
      render plain: "Vehiculo creado exitosamente con el Id de Vehiculo :  #{@nuevoCarro.id} "
    else
      render plain: "Error"
    end
 end

 def modAuto
  @allClientes = Cliente.all
  @selectedAuto = Auto.find_by(:Placa => params[:placaVeh])
 end

 def modificarVehiculo
    @nuevoCarro = Auto.find_by(:Placa => params[:placaAuto])
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
  	if Cliente.where(:id => params[:idCliente]).blank?
		 render plain: "false"		 
	else
		 render plain: "true"
	end
  end

  def checkAuto
  if Auto.where(:Placa => params[:placaVeh]).blank?
     render plain: "false"     
  else
     render plain: "true"
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
    @selectedCita = @selectedAsesor.Citum.where(:Placa => params[:placaVeh]).first
  end

  def updateEstado
    @selectedCita = Citum.find(params[:idCita])
    @selectedCita.update(:Estado => params[:Estado] , :FechaEstimadaEntrega => params[:PosibleDate])
    render plain: "Estado actualizado"
  end
end
