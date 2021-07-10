Rails.application.routes.draw do

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :tests do
    resources :questions, shallow: true do
      resources :answers, shallow: true, except: :index
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end
end
