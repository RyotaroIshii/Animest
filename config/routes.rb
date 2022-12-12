Rails.application.routes.draw do

  root to: 'homes#top'
  get 'ranking' => 'homes#rank', as: 'ranking'

  get 'user/:uid' => 'users#show', as: 'user'
  get 'user/:uid/edit' => 'users#edit', as: 'edit_user'
  patch 'user/:uid' => 'users#update', as: 'update_user'
  get 'user/:uid/titles' => 'users#title', as: 'user_titles'
  get 'user/:uid/watched_anime' => 'users#index', as: 'watched_anime'
  get 'user/:uid/avatar_select' => 'users#avatar', as: 'avatar'
  post 'user/:uid/avatar_select' => 'users#create', as: 'create_avatar'
  get 'login_page' => 'users#login', as: 'login_page'
  get 'logout_page' => 'users#logout', as: 'logout_page'

  get 'quest' => 'quests#show', as: 'quest'
  patch 'quest' => 'quests#change', as: 'change_count'
  patch 'quest' => 'quests#update', as: 'update_point'
  get 'quest_cleared' => 'quests#complete', as: 'complete'

  get 'anime' => 'animes#index', as: 'index_animes'
  get 'anime/:year' => 'animes#year', as: 'year'

  get 'title/:uid' => 'titles#show', as: 'title'


  get '/auth/:provider/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'






  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
