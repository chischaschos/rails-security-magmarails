SalaryManager::Application.routes.draw do

  resources :users

  scope '/raises' do
    get 'new', :to => 'raises#new', :as => 'new_raise'
    post '/', :to => 'raises#create', :as => 'raises'
    get '/', :to => 'raises#index', :as => 'raises'
    delete '/:id', :to => 'raises#destroy', :as => 'raise'
  end

  scope '/auth' do
    devise_for :users
  end

  root :to => "home#index"

end
