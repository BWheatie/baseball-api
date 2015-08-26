Rails.application.routes.draw do
  resources :players do
    get :report
  end
  resources :battings
end
