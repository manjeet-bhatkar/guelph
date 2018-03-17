Rails.application.routes.draw do
  devise_for :admins
  get 'reports/index'
  post 'reports/index'

  resources :donations
  get 'dashboard/index'

  resources :contacts
  get 'home/index'
  root 'donations#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
