Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :categories, shallow: true do
    resources :tests, shallow: true do
      resources :questions, shallow: true
    end
  end
end
