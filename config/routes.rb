Rails.application.routes.draw do

  root to: 'tests#index'
  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout }

  resources :badges, only: :index

  resources :tests, only: :index do
    post :start, on: :member
  end

  resources :test_passages, only: %i[show update] do
  	member do
  		get :result
      post :gist
  	end
  end

  namespace :admin do
    resources :badges, shallow: true
    resources :gists, only: %i[index]
    resources :tests do
      patch :update_inline, on: :member
      resources :questions, except: :index, shallow: true do
        resources :answers, except: :index, shallow: true
      end
    end
  end


end
