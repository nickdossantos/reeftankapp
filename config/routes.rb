Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    get 'welcome/index'
    resources :sensor_values
    resources :users
    root 'welcome#index'
    post 'sensor_values/generate', to: "sensor_values#create_reading"
    get 'login', to: 'sessions#new'
    post 'login', to: 'sessions#create'
    delete 'logout', to: 'sessions#destroy'
end
