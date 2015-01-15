Entrenasano::Application.routes.draw do
  devise_for :trainer
  root :to => 'entrenasano#index'

  resources :trainer, only: [:index] do
    collection do
      post :add_pupil
      post :add_hour_in_pupil
    end
  end

end
