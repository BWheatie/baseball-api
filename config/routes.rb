Rails.application.routes.draw do
  resources :players do
    get :career
  end
end
