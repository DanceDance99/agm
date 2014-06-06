Rails.application.routes.draw do

  root to: 'shuttles#show'

  resources :tours do
    resources :reservations
  end

  resources :shuttles do
    
    resources :bookings do
      collection do
        get '/date/:date', :action => :index, :as => :date
        post 'dates'
      end
    end
  end
  get  '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get  'logout', to: 'sessions#destroy'
end

