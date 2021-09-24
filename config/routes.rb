Rails.application.routes.draw do
  namespace :api do
    resources :articles, only: [:index, :create]
  end
  # get '/api/articles', controller: :articles, action: :index
end
