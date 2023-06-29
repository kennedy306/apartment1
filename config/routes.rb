Rails.application.routes.draw do
  resources :apartments, except: [:new, :edit]
  resources :tenants, except: [:new, :edit]
  resources :leases, only: [:create, :destroy]
end
