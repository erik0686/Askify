Rails.application.routes.draw do
  devise_for :users

  resources :answer_ratings
  resources :questions do
    resources :answers
  end
  resources :users
  resources :home, only: [:index]
  resources :topics, only: [:index]
  resources :categories, only: [:index, :show]

  post 'set_new_question_category', to: "application#set_new_question_category", as: :set_new_question_category
  post 'create_new_question', to: "application#create_new_question", as: :create_new_question
  
  get 'set_topic_options', to: "application#set_topic_options", as: :set_topic_options
  match "/categories/topics/questions" => "questions#byTopic" , :via => [:get]

  resources :questions do
    get :autocomplete_topic_id, on: :collection
  end

  devise_scope :user do
    authenticated :user do
      root 'home#index', as: :authenticated_root
    end
    unauthenticated :user do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end
end
