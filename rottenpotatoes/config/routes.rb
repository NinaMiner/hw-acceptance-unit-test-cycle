Rottenpotatoes::Application.routes.draw do
  resources :movies do
    member do
  # map '/' to be a redirect to '/movies'
      get 'search', to:'movies#search'
    end
  end
  root :to => redirect('/movies')
end