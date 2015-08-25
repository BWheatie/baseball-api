Rails.application.routes.draw do
  resources :players do
    get :career
    get :batting
    get :fielding
    get :pitching
    get :appearance
  end
end
