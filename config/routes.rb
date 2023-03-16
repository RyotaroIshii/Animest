Rails.application.routes.draw do

  root to: 'homes#top'
  get 'login_page' => 'homes#login', as: 'login_page'
  get 'logout_page' => 'homes#logout', as: 'logout_page'

  get 'user/:uid' => 'users#show', as: 'user'
  get 'user/:uid/edit' => 'users#edit', as: 'edit_user'
  patch 'user/:uid' => 'users#update', as: 'update_user'
  get 'user/:uid/avatar_select' => 'users#avatar', as: 'avatar'
  post 'user/:uid/avatar_select' => 'users#create', as: 'create_avatar'
  get 'users/ranking' => 'users#rank', as: 'ranking'

  get 'quest' => 'quests#show', as: 'quest'
  post 'change_title' => 'quests#change_title', as: 'change_title'
  # patch 'quest' => 'quests#change', as: 'change_count'
  patch 'quest' => 'quests#update', as: 'update_point'
  get 'quest_cleared' => 'quests#complete', as: 'complete'

  get 'anime' => 'animes#index', as: 'index_animes'
  # get 'anime/:year' => 'animes#year', as: 'year'


  get '/auth/:provider/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'






  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
