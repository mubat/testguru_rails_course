Rails.application.routes.draw do
  root 'tests#index'

  get 'users/new'

  get :signup, to: 'users#new'

  resources :users, only: :create

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :tests do
    resources :questions, shallow: true do
      resources :answers, shallow: true, except: :index
    end

    member do
      post :start
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end
end
