Entrenasano::Application.routes.draw do
  devise_for :trainer
  root :to => 'entrenasano#index'
end
