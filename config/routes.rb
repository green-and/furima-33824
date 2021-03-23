Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :items, only: [:index, :new, :create, :show, :edit, :update]
  root to: "items#index"
end
