Rails.application.routes.draw do

  namespace :public do
    resource :members, only: [:show, :edit, :update] do
      collection do
        get 'unsubscribe'
        patch 'withdraw'
      end
    end
    # get 'members/show
    # get 'members/edit'
    # patch 'members/update'
    # get 'members/__END__bscribe'
    # patch 'members/withdraw'
  end
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
  end
  scope module: :public do
    resources :members
  end

  # devise_for :members
  # devise_for :admins
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
