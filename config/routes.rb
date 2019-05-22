Rails.application.routes.draw do
  get '/', to: 'tasks#index'
  resources :tasks, except: :show
end
