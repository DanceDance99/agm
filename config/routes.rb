Rails.application.routes.draw do

    root to: 'shuttles#show'

    get '/agm', to:'agm#index'
    get '/agm/admin', to: 'agm#show'

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


  match '*path', to: redirect{|params| "/#{I18n.default_locale}/#{params[:path]}"}, via: :all
  match '', to: redirect("/#{I18n.default_locale}"), via: :all

  get  '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get  'logout', to: 'sessions#destroy'
end

