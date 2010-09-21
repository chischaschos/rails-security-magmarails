SalaryManager::Application.routes.draw do

  resources :users

  scope '/raises' do
    get '/search/:query', :to => 'raises#index', :as => 'search'
    get 'new', :to => 'raises#new', :as => 'new_raise'
    post '/', :to => 'raises#create', :as => 'raises'
    get '/(:options)', :to => 'raises#index', :as => 'raises'
    delete '/:id', :to => 'raises#destroy', :as => 'raise'
    put '/:id', :to => 'raises#update', :as => 'raise'
  end

  scope '/auth' do
    devise_for :users
  end

  root :to => "home#index"

end
