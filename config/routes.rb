Rails.application.routes.draw do

  #shelters
  get '/shelters', to: 'shelters#index'
end
