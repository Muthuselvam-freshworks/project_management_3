Rails.application.routes.draw do
  get 'comments/create'
  get 'comments/destroy'
  get 'comments/_form'
  get 'dashboard/index'
  devise_for :users
  get '/dashboard', to: 'dashboard#index', as: 'dashboard'
  resources :projects
  get '/project/new', to: 'projects#create'
  get '/project/all', to: 'projects#index'
  get '/projects/:id/overview', to: 'projects#show'
  get '/projects/:project_id/tasks/:id' ,to: 'tasks#show'
  
  resources :invitations, only: [:index, :create, :destroy]
  resources :projects do
    resources :invitations, only: [:new, :create, :index, :destroy]
  end
  
  resources :projects do
    resources :tasks do
      resources :comments
    end
  end

  resources :invitations, only: [] do
    member do
      post 'accept'
      delete 'reject'
    end
  end


  resources :projects do
    resources :tasks
  end

  get '/projects/:id/calendar', to: 'projects#calendar'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
