class CitaMailer < ApplicationMailer
	default from: 'nivx14@gmail.com'
	
	
	def confirmarCita(cliente,cita)
		@Cliente = cliente
		@Cita = cita
		mail(to: @Cliente.Email, subject: 'Confirmacion Cita')
	end
end
