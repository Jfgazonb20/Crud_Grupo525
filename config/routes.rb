Rails.application.routes.draw do
  resources :users do
    collection do
      get "export", to: "users#export", as: "export_users"
      get "list_json", to: "users#list_json", as: "list_json_users"
    end
  end

  # Otras rutas que puedas tener
end
