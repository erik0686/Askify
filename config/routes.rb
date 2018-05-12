Rails.application.routes.draw do
  devise_for :users

  resources :answer_ratings
  resources :questions do
    resources :answers
  end
  resources :users
  resources :topics, only: [:index, :show, :destroy]
  resources :categories, only: [:index, :show]
  resources :posts, only: [:destroy]
  resources :answers, only: [:destroy]
  resources :comments, only: [:destroy]

  post 'set_new_question_category', to: "application#set_new_question_category", as: :set_new_question_category
  post 'create_new_question', to: "application#create_new_question", as: :create_new_question
  match "home" => "home#index", as: :home_index, via: [:get, :post]
  post "create_post", to: "home#create_post", as: :create_post
  post "categories/create_topic", to: "categories#create_topic", as: :create_topic


  get 'set_topic_options', to: "application#set_topic_options", as: :set_topic_options
  match "/categories/topics/questions" => "questions#byTopic" , :via => [:get]
  post "questions/create_comment", to: "questions#create_comment",  as: :create_comment

  patch "topics/approve/:id", to: "topics#approve", as: 'approve_topics'

  devise_scope :user do
    authenticated :user do
      root 'home#index', as: :authenticated_root
    end
    unauthenticated :user do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end
end
