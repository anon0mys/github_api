Rails.application.routes.draw do
  root to: 'welcome#index'

  get '/auth/github', as: :github_login

  get '/auth/github/callback', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/:username', to: 'users#show'
end
