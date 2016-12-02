ControlCredito::Application.routes.draw do

  resources :quotes

  resources :sales

  resources :people

  get '/sales/quotes/:sale_id', to: 'quotes#quotes_sale', as: 'quotes_sale'

  post '/sales/quotes/pay/:id', to: 'quotes#pay', as: 'pay_quote'

  root 'static_pages#home'

  get '/login' => 'sessions#new'

  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  #get '/signup' => 'users#new'
  #post '/users' => 'users#create'

end
