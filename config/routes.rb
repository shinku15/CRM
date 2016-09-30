Rails.application.routes.draw do
  
  resources :companies do 
      resources :notes
      resources :tasks
    
   end



   root to: "staticpages#index"

   resources :feeds, only: :index
   get 'staticpages/index'
   get 'staticpages/show'



   devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations',
        invitations: 'users/invitations'
      }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
