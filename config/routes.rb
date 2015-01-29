Entrenasano::Application.routes.draw do
  devise_for :trainer
  root :to => 'entrenasano#index'

  resources :trainer, only: [:index] do
    resources :training_class, only: [:new, :create]
    collection do
      post :add_hour_in_pupil
      resources :pupil, only: [:new, :create]
    end

  end

end
