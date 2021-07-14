Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  get '/administrators/manageEmployees', to: 'administrators#manageEmployees'
  get '/administrators/manageCompany', to: 'administrators#manageCompany'
  get '/administrators/reports', to: 'administrators#reports'
  resources :employees, :administrators
  #root 'employees#index'
end
