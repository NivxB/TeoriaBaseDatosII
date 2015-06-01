Rails.application.routes.draw do
  resources :servicios

  resources :asesors

  resources :mecanicos

  resources :cita

  resources :autos

  resources :clientes
 get 'welcome/homepage'
 root 'welcome#homepage'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
   get '/agregarCliente' => 'welcome#agregarCliente'
   get '/agregarMecanico' => 'welcome#agregarMecanico'
   get '/Seguimiento' => 'welcome#seguimiento'
   get '/homepage'=>'welcome#homepage'
   get '/asigAsesor' => 'welcome#asigAsesor'

   get '/newVehiculo' => 'welcome#newVehiculo'
   get '/agregarAsesor' => 'welcome#agregarAsesor'
   get '/modAuto' => 'welcome#modAuto'
   get '/cambiarEstado' => 'welcome#cambiarEstado'
   get '/newCitaRegis' => 'welcome#newCitaRegis'
   get '/newCitaCliente' => 'welcome#newCitaCliente'
   get '/seguimientoCita' => 'welcome#seguimientoCita'

   post '/checkCita' => 'welcome#checkCita'
   post '/checkCliente' => 'welcome#checkCliente'
   post '/checkAsesor' => 'welcome#checkAsesor'
   post '/checkAuto' => 'welcome#checkAuto'
   post '/checkAsesorAuto' => 'welcome#checkAsesorAuto'

   
   post '/nuevaCitaCliente' => 'welcome#nuevaCitaCliente'
   post '/nuevaCitaRegis' => 'welcome#nuevaCitaRegis'
  
   post '/nuevoCliente' => 'welcome#nuevoCliente'
   post '/nuevoMecanico' =>'welcome#nuevoMecanico'
   post '/nuevoAsesor' => 'welcome#nuevoAsesor'
   post '/nuevoVehiculo' => 'welcome#nuevoVehiculo'
   post '/updateEstado' => 'welcome#updateEstado'
   post '/setCita' => 'welcome#setCita'

   post '/modificarVehiculo' => 'welcome#modificarVehiculo'
   get '/modificarAsesor' => 'welcome#modificarAsesor'
   post '/actuaAsesor' => 'welcome#actuaAsesor'
   get '/modificarMecanico'=> 'welcome#modificarMecanico'
   post '/actuaMecanico'=>'welcome#actuaMecanico'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
