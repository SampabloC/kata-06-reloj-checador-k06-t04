Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'employees#index'
  get '/administrators', to: 'administrators#index'
  get '/administrators/manageEmployees', to: 'administrators#manageEmployees'
  get '/administrators/manageCompany', to: 'administrators#manageCompany'
  get '/administrators/reports', to: 'administrators#reports'
  resources :employees, :administrators
end
