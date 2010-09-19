SalaryManager::Application.routes.draw do

  resources :users

  scope 'auth' do
    devise_for :users
  end

  root :to => "home#index"

end
