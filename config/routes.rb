Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'login', to: 'sessions#validation'
  post 'login', to: 'sessions#create'

  get 'logout', to: 'sessions#destroy'
  get '/administrators/manageCompany', to: 'administrators#manageCompany'
  get '/administrators/reports', to: 'administrators#reports'
  

  get 'check_out', to: 'reports#checkout'
  
  root "administrators#check"
  resources :employees, :administrators, :companies, :reports
end
