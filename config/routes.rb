Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { :omniauth_callbacks => 'callbacks' }

  root to: 'checklists#index'
  get '/checklists/accept' => 'checklist_shares#accept', as: :accept_checklist
  resources :checklists do
    resources :checklist_items
  end
  resources :checklist_shares, only: [:create]
end
