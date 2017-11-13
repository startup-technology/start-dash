Rails.application.routes.draw do
  if Rails.env.development?
    get '/login_as/:user_id', to: 'development/sessions#login_as'
    mount LetterOpenerWeb::Engine, at: '/letter_opener'
  end

  resource :users do
    resource :sign_up, controller: 'users/sign_up', only: %i[show create]
    resource :sign_in, controller: 'users/sign_in', only: %i[show create]
    resource :sign_out, controller: 'users/sign_out', only: %i[destroy]
    resources :authentications, path: 'auth', param: :provider, controller: 'users/authentications', only: %i[show destroy] do
      member do
        get :callback
      end
    end
  end

  root 'home#index'
end
