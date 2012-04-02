MemcachierGis::Application.routes.draw do
  get "lookup" => 'home#lookup'
  root :to => 'home#index'
end
