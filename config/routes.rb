ControlCredito::Application.routes.draw do

  resources :quotes

  resources :sales

  resources :people

  get '/json/sales', to: 'sales#index_json', as: 'index_json_sale'

  get '/json/sale/:id', to: 'sales#show_json', as: 'show_json_sale'
  
  post '/json/pay/:id', to: 'quotes#pay', as: 'pay_json_quote'

  post '/json/update_amount/:id', to: 'quotes#update_amount', as: 'update_amount_json_quote'

  get '/sales/quotes/:sale_id', to: 'quotes#quotes_sale', as: 'quotes_sale'

  post '/sales/quotes/pay/:id', to: 'quotes#pay', as: 'pay_quote'

  root 'static_pages#home'

  get '/login' => 'sessions#new'

  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

#  get '/signup' => 'users#new'
#  post '/users' => 'users#create'

end
