Rails.application.routes.draw do
  devise_for :clients,     controllers: { registrations: "clients/registrations",
                                          invitations: "clients/invitations" }
  devise_for :agents,      controllers: { invitations: "agents/invitations",
                                          registrations: "agents/registrations",
                                          sessions: "agents/sessions" }
  devise_for :salespeople, controllers: { registrations: "salespeople/registrations",
                                          invitations: "salespeople/invitations" }
  get "dashboard", to: "dashboard/pages#index"

  namespace :dashboard do
    resources :salespeople_invitations, only: [:index, :create, :destroy] do
      get 'resend_invitation', on: :member
    end
    resources :agent_invitations, only: [:new, :create]
    resources :wholesalers, only: [:edit, :update]
    resources :agencies, only: [:edit, :update]
    resources :client_invitations, only: [:new, :create]
    resources :agent_wholesaler_applications, only: [:index, :destroy] do
      get 'agent_templates', on: :member
    end
    resources :pages, only: [:index] do
      get "account_setting",  on: :collection
    end
    resources :jimcor_dwelling_applications, only: [:index, :edit, :update, :show]
    resources :insurance_applications, only: [:index, :edit, :update, :show]
    resources :agents, only: [:index, :show]
    resources :templates, only: [:show]
  end
  resources :pages do
    collection do
      get "copyright"
      get "privacy_policy"
      get "disclaimer"
    end
  end

  root to: "pages#index"
end
