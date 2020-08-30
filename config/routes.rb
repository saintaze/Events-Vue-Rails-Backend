Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'events/index'
      get 'events/create'
      get 'events/update'
      get 'events/destroy'
    end
  end
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :events, only: [:index, :create, :update, :destroy]
    end
  end
end
