Rails.application.routes.draw do
  devise_for :users
  root "stories#index"

  resources :stories do
    member do
      put :like, to: "stories#upvote"
      put :dislike, to: "stories#downvote"
    end

    resources :comments
  end
end
