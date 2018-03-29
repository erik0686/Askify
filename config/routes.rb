Rails.application.routes.draw do
  devise_for :users

  resources :answer_ratings
  resources :questions
  resources :users
  resources :home, only: [:index]
  resources :topics, only: [:index]
  resources :categories, only: [:index]

  post 'set_new_question_category', to: "application#set_new_question_category", as: :set_question_category

  devise_scope :user do
    authenticated :user do
      root 'home#index', as: :authenticated_root
    end
    unauthenticated :user do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end
end
