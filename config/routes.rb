Rails.application.routes.draw do

  #shelters
  get '/shelters', to: 'shelters#index'
  get '/shelters/:id', to: 'shelters#show'
end
