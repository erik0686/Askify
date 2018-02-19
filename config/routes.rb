Rails.application.routes.draw do
  get 'answer_ratings/new'

  get 'answer_ratings/create'

  get 'answer_ratings/index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
