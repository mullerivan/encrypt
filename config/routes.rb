Encrypt::Application.routes.draw do
  devise_for :users
  root :to => 'messages#index'

  resources :messages do
    member do
      get 'show_encrypted'
      get 'sent'
    end
  end

   match 'sent' => 'messages#sent', :as => 'sent'


end
