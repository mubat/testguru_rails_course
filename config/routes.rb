# frozen_string_literal: true

Rails.application.routes.draw do

  devise_for :users,
             path_names: { sign_in: :login, sign_out: :logout },
             controllers: {
               registrations: 'registrations',
               sessions: 'sessions'
             }
  root 'tests#index'
  resources :feedbacks, only: %i[new create]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :tests, only: :index do
    member do
      post :start
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
      post :gist
    end
  end

  namespace :admin do
    resources :badges, only: %i[index new create show destroy]
    resources :gists, only: %i[index show destroy]
    resources :feedbacks, only: %i[index show destroy]

    resources :tests do
      patch :update_inline, on: :member

      resources :questions, shallow: true do
        resources :answers, shallow: true, except: :index
      end
    end
  end
end
