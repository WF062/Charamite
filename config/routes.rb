Rails.application.routes.draw do
  # ヘルスチェック用ルート
  get "up" => "rails/health#show", as: :rails_health_check

  # トップページ
  root "home#top"

  # セッション関連
  get    "/login",  to: "sessions#new"
  post   "/login",  to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  # ユーザー登録関連
  get  "/signup", to: "users#new"
  post "/users",  to: "users#create"

  # マイページ
  get "/mypage", to: "users#show", as: :mypage

  # その他ページ例（任意）
  # get "/home", to: "home#index", as: :home_index

  resources :users, only: [:edit, :update]

  # フォロー関連
  get "/follows", to: "follows#index", as: :follows

  # いいね関連
  get "/likes", to: "likes#index", as: :likes

  # 検索ページ
  get "/search", to: "search#index", as: :search

  # キャラ作成
  resources :characters, only: [:new]
end