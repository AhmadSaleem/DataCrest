Rails.application.routes.draw do
  devise_for :agents,      path: '', path_names: { sign_in: 'sign-in' },
                           controllers: { sessions: "agents/sessions",
                                          registrations: "agents/registrations",
                                          invitations: "agents/invitations" }
  devise_for :clients,     controllers: { invitations: "clients/invitations",
                                          registrations: "clients/registrations",
                                          sessions: "clients/sessions" }
  devise_for :salespeople, controllers: { registrations: "salespeople/registrations",
                                          invitations: "salespeople/invitations" }
  get "dashboard", to: "dashboard#index"

  namespace :dashboard do
    resources :salespeople_invitations, only: [:index, :create, :destroy] do
      get 'resend_invitation', on: :member
    end

    resources :agent_invitations, only: [:new, :create] do
      get 'search_agents', on: :collection
    end

    resources :wholesalers, only: [:edit, :update]
    resources :agencies, only: [:edit, :update]
    resources :client_invitations, only: [:new, :create]

    resources :agent_wholesaler_applications, only: [:index, :destroy], path: 'my-agents' do
      get "templates", on: :collection
      member do
        get 'agent_templates'
        get "assign_application"
      end


    end

    resources :insurance_applications, except: [:new], path: 'applications' do
      get 'global', on: :collection
    end

    namespace :insurance_applications, path: 'applications' do
      resources :jimcor_dwelling_applications
    end

    resources :agents, only: [:index, :show]
    resources :templates, only: [:show]

    namespace :agency do
      resources :agent_invitations, only: [:index, :create, :destroy] do
        get 'resend_invitation', on: :member
      end

      resources :clients, only: [:index]
    end
  end

  resources :pages do
    collection do
      get "copyright"
      get "privacy_policy"
      get "disclaimer"
    end
  end

  resources :wholesalers, only: [:index, :show]

  root to: "pages#index"
end
