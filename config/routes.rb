Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  root to: 'devise/registrations#new'
  get 'board/index'
  mount Sidekiq::Web => '/sidekiq'

  get 'comments/create'
  get 'comments/destroy'
  get 'comments/_form'
  get 'dashboard/index'
  
  

  get '/dashboard', to: 'dashboard#index', as: 'dashboard'
  resources :projects
  get '/project/new', to: 'projects#create'
  get '/project/all', to: 'projects#index'
  get '/projects/:id/overview', to: 'projects#show'
  get '/projects/:project_id/tasks/:id' ,to: 'tasks#show'
  post 'tasks/delete_selected', to: 'dashboard#delete_selected'
  get '/projects/:id/board',to: 'board#index'
  get '/projects/:id/tasks/search', to: 'tasks#search'
  get '/dashboard/search', to: 'dashboard#search'
  get '/projects/:id/mark_as_complete', to: 'projects#mark_as_complete'
  resources :invitations, only: [:index, :create, :destroy]
  resources :projects do
    resources :invitations, only: [:new, :create, :index, :destroy]
  end
  
  resources :projects do
    resources :tasks do
      resources :comments
    end
  end

  resources :projects do
    resources :board
  end
  resources :projects do
  resources :tasks do
    post 'delete_selected', on: :collection
  end
end

  resources :invitations, only: [] do
    member do
      post 'accept'
      delete 'reject'
    end
  end
  resources :projects do
    resources :todos  
  end

  resources :projects do
    resources :todos do
      member do
        patch 'move_to_in_progress'
        patch 'move_to_completed'
      end
    end
  end


  resources :projects do
    resources :todos do
      member do
        patch 'move_todo'
      end
    end
  end

  resources :projects do
    collection do
      get 'search'
    end
  end

  resources :projects do
    member do
      patch 'mark_as_complete'
    end
  end
  

  get '/projects/:id/calendar', to: 'projects#calendar'

 
  
end
