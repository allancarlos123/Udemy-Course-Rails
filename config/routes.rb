Rails.application.routes.draw do

  get 'backoffice', to: 'backoffice/dashboard#index'

  namespace :backoffice do
    resources :send_mail, only: [:edit, :create]
    resources :categories, except: [:show, :destroy]
    resources :admins, except: [:show]
    get 'dashboard', to: 'dashboard#index'
  end

  namespace :site do
    get 'home', to: 'home#index'
    get 'search', to: 'search#ads'

    namespace :profile do
      resources :dashboard, only: [:index]
      resources :ads, only: [:index, :edit, :update, :new, :create]
    end

    resources :ad_detail, only: [:show]
    resources :categories, only: [:show]
  end

  devise_for :admins, :skip => [:registration]
  devise_for :members, controllers: { sessions: 'members/sessions' }

  root 'site/home#index'
end
