Entrenasano::Application.routes.draw do
  devise_for :trainer
  root :to => 'entrenasano#index'

  resources :trainer, only: [:index] do

    collection do
      post :add_hour_in_class
      resources :pupil, only: [:new, :create]
      resources :training_class
      resources :pupil_hour, only: [:show, :update, :destroy]
    end

  end

end
