Rails.application.routes.draw do
  get 'answer_ratings/new'

  get 'answer_ratings/create'

  get 'answer_ratings/index'

  devise_for :users

  resources :users, :only => [:show]

end
