Rails.application.routes.draw do
  devise_for :admins, controllers: { sessions: 'admins/sessions' }

  namespace :admins do
    root 'home#index'
  end

  get 'up' => 'rails/health#show', as: :rails_health_check
end
