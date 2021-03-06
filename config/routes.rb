Rails.application.routes.draw do
    root to: 'agm#index'

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
  get  '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get  'logout', to: 'sessions#destroy'

match '*path', to: redirect{|params| "/#{I18n.default_locale}/#{params[:path]}"}, via: :all
match '', to: redirect("/#{I18n.default_locale}"), via: :all


end

