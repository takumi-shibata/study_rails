Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/' => 'homes#top'
  get '/about' => 'homes#about'

  # アカウント認証
  get "login" => "sessions#login_form" # link_toメソッドではデフォルトでgetのルーティングを探す
  post "login" => "sessions#login" # form_withメソッドではデフォルトでpostのルーティングを探す
  delete "logout" => "sessions#logout"

  # posts これからコメント機能やいいね機能など他にも機能を追加していく予定なのでその時にresourcesに変える
  get "posts/index" => "posts#index"
  get "posts/new" => "posts#new"
  post "posts/create" => "posts#create"
  get "posts/:id" => "posts#show"
  get "posts/:id/edit" => "posts#edit"
  patch "posts/:id/update" => "posts#update"
  delete "posts/:id/destroy" => "posts#destroy"

  # users
  get "signup" => "users#new" # サインアップ(ユーザー登録)時のフォーム画面を「/users/new」ではなく「signup」というURLで表示したかったためresourcesとは分けている。
  resources :users, only: [:index, :show, :create, :edit, :update] # onlyで特定のアクションのみを指定
end
