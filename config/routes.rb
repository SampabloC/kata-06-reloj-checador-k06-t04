Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  get '/administrators/manageCompany', to: 'administrators#manageCompany'
  get '/administrators/reports', to: 'administrators#reports'
  get '/administrators/validation', to: 'administrators#validation'
  root "administrators#check"
  resources :employees, :administrators, :companies, :reports
end
