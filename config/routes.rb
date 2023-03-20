Rails.application.routes.draw do

  #customers側
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  #customers側
  scope module: :public do

    #homes
    root to: 'homes#top'
    get '/about' => 'homes#about'

    #items
    resources :items,only: [:index,:show]

    #customers
    resource :customer,only: [:edit, :show, :update]
    get '/customer/quitcheck' => 'customers#quit_check'
    patch '/customer/quit' => 'customers#quit'

    #cart_items
    resources :cart_items,only: [:index,:update,:create]
    delete '/cart_items/:id' => 'cart_items#destroy',as:'cart_item_destroy'
    delete '/cart_items' => 'cart_items#all_destroy',as:'cart_items_destroy'

    #orders
    resources :orders,only: [:new,:index,:create,:show] do
      post :info, on: :collection
      get :complete, on: :collection
    end

    #deliveries
    resources :deliveries,only: [:index,:edit,:update,:create,:destroy]

  end

  #admins側
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do

    #homes
    root to: 'homes#top'

    #items
    resources :items,only: [:new,:index,:edit,:show,:update,:create]

    #genres
    resources :genres,only: [:index,:edit,:update,:create]

    #customers
    resources :customers,only: [:index,:edit,:show,:update]

    #orders
    resources :orders,only: [:index,:show,:update]

    #order_details
    resources :order_details,only: [:update]

  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
