Rails.application.routes.draw do
  devise_for :users
  devise_for :admins, controllers: { sessions: 'admins/sessions' }

  root 'users/training_exercises#index'

  namespace :admins do
    root 'training_exercises#index'
    resources :workout_schedules, only: %i[index show edit update destroy]
    resources :training_exercises, only: %i[index show new create edit update destroy]
    resources :muscle_groups, only: %i[index show new create edit update destroy]
    resources :exercise_tags, only: %i[index show new create edit update destroy]
  end

  namespace :users do
    root 'training_exercises#index'
    resources :workout_schedules, only: %i[index show new create edit update destroy]
    resources :training_exercises, only: %i[index show new create edit update destroy]
    resources :muscle_groups, only: %i[index show new create edit update destroy]
    resources :exercise_tags, only: %i[index show new create edit update destroy]
  end

  get 'up' => 'rails/health#show', as: :rails_health_check
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
