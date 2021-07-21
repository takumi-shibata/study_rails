Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/' => 'homes#top'
  get '/about' => 'homes#about'

  # posts これからコメント機能やいいね機能など他にも機能を追加していく予定なのでその時にresourcesに変える
  get "posts/index" => "posts#index"
  get "posts/new" => "posts#new"
  post "posts/create" => "posts#create"
  get "posts/:id" => "posts#show"
  get "posts/:id/edit" => "posts#edit"
  patch "posts/:id/update" => "posts#update"
  delete "posts/:id/destroy" => "posts#destroy"

  # users
  resources :users, only: [:index, :show, :edit, :update] # onlyで特定のアクションのみを指定
end
