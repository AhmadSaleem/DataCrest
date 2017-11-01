Rails.application.routes.draw do
  devise_for :clients
  devise_for :agents,      controllers: { invitations: "agents/invitations",
                                          registrations: "agents/registrations" }
  devise_for :salespeople, controllers: { registrations: "salespeople/registrations",
                                          invitations: "salespeople/invitations" }
  namespace :dashboard do
    resources :salespeople_invitations, only: [:index, :create, :destroy] do
      get 'resend_invitation', on: :member
    end
    resources :agent_invitations, only: [:new, :create]
    resources :wholesalers, only: [:edit, :update]
    resources :agencies, only: [:edit, :update]
    resources :jimcor_dwelling_applications, only: [:index, :edit, :update, :show]
  end
  root to: "dashboard/pages#index"
end
