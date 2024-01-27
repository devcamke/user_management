Rails.application.routes.draw do
  resources :employees do
    get 'export_csv', on: :collection
  end
  
  root "home#index"
  get "up" => "rails/health#show", as: :rails_health_check

end
