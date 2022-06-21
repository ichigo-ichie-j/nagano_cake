Rails.application.routes.draw do
  
  # 管理者ルーティング
  devise_for :admin,skip: [:registrations, :passwords], controllers: {
  sessions:      'admin/sessions',
  }
  
  # 顧客ルーティング
  devise_for :members,skip: [:passwords], controllers: {
  sessions:      'public/sessions',
  registrations: 'public/registrations'
  }

  
  namespace :admin do
    resources :members
  end
  scope module: :public do
    root to: "homes#top"
    get 'about' => 'homes#about'
    resources :members
    resources :items, only: [:index, :show]
  end  
  
  # devise_for :members
  # devise_for :admins
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
