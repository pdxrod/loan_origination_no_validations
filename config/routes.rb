Rails.application.routes.draw do
  root to: 'loans#index'
  post '/' => 'loans#index'
end
