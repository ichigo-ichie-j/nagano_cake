Rails.application.routes.draw do

  #管理者ルーティング
  devise_for :admin,skip: [:registrations, :passwords], controllers: {
  sessions:      'admin/sessions'
  }

  namespace :admin do
    resources :members, only: [:index, :show, :edit, :update]
    resources :order_items, only: [:update]
    resources :genres, only: [:index, :edit, :create, :update]
    resources :items, only: [:index, :edit, :create, :update, :new, :show]
    resources :orders, only: [:update, :show]
    root to: 'homes#top'
  end

  # 顧客ルーティング
  devise_for :members,skip: [:passwords], controllers: {
  sessions:      'public/sessions',
  registrations: 'public/registrations'
  }



  scope module: :public do
   root to: "homes#top"
   get 'about' => 'homes#about'
    resource :members, only: [:show, :edit, :update] do
    collection do
      get 'unsubscribe'
      patch 'withdraw'
    end
   end
   resources :cart_items, only: [:index, :create, :update, :destroy] do
      collection do
        delete 'destroy_all'
      end
    end
   resources :shipping_addresses, only: [:index, :create, :destroy, :edit, :update ]
   resources :orders, only: [:new, :create, :index, :show] do
     collection do
       post 'confirm'
       get 'complete'
      end
    end
   resources :items, only: [:index, :show]
  end
end
