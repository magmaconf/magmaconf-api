Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users

  api vendor_string: 'magmaconf', default_version: 1, path: 'v1', defaults: { format: :json } do
    version 1 do
      cache as: 'v1' do
        resources :speakers, only: :index
        resources :events, only: :index
        resources :schedules, only: :index
        resources :rates
      end
    end
  end
end
