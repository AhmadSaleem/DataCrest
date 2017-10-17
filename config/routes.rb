Rails.application.routes.draw do
  devise_for :salespeople, controllers: { registrations: "salespeople/registrations",
                                          invitations: "salespeople/invitations" }
  namespace :dashboard do
    resources :salespeople_invitations, only: [:index, :create, :destroy] do
      get 'resend_invitation', on: :member
    end
  end
end
