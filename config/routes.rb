# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api, constraints: { format: 'json' } do
    namespace :v1 do
      resource :rate, only: [:show, :create]
      get '/show_admin', action: :show_admin, controller: 'rates'
    end
  end

  root to: 'main#index'

  get '/*path', to: 'main#index', format: false
end
