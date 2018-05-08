Rails.application.routes.draw do
  get '/auth/github', as: :github_login
end
