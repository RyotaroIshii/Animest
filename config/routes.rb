Rails.application.routes.draw do
  get 'titles/show'
  get 'animes/index'
  get 'animes/year'
  get 'quests/show'
  get 'quests/create'
  get 'quests/complete'
  get 'users/show'
  get 'users/edit'
  get 'users/update'
  get 'users/title'
  get 'users/index'
  get 'users/login'
  get 'users/logout'
  get 'homes/top'
  get 'homes/rank'
  get 'homes/top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
