Rails.application.routes.draw do
  resources :players do
    get :report
  end
  resources :battings
  root to: redirect("http://docs.stats12.apiary.io/#")
end
