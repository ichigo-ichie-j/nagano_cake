Rails.application.routes.draw do

  devise_for :admin, controllers: {
  sessions:      'admin/sessions',
  }


  devise_for :members, controllers: {
  sessions:      'public/sessions',
  passwords:     'public/passwords',
  registrations: 'public/registrations'
  }


  namespace :admin do
    resources :members
    resources :genres, only: [:index, :edit, :create, :update]
    root to: 'homes#top'
  end
  scope module: :public do
    resources :members
  end

  # devise_for :members
  # devise_for :admins
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
