Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :events, only: [:index, :create, :update, :destroy]
    end
  end

  match "*path", to: redirect('/'), via: :all
end
