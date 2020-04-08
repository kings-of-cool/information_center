Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }

  resources :information_centers, only: %i[index new create edit]
end
