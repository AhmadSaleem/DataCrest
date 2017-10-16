Rails.application.routes.draw do
  devise_for :salespeople, controllers: { registrations: "salespeople/registrations" }
end
