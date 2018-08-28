Rails.application.routes.draw do
  resources :users do
    post 'take_number', on: :member
  end
end
