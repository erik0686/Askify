Rails.application.routes.draw do
  get 'home/index'

  get 'answer_ratings/new'

  get 'answer_ratings/create'

  get 'answer_ratings/index'

  devise_for :users

  resources :users, :only => [:show]

  resources :questions, :except => [:new]

  get 'questions/new' => 'questions#new', :as => :new_question

  resources :home, :only => [:index]

  root 'home#index' 

  resources :topics, :only => [:index]

  get 'categories/index'

end
