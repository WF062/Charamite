Rails.application.routes.draw do
  # ✅ 固定ページ（中身は後日実装）
  get "/contact", to: "pages#contact", as: :contact
  get "/terms",   to: "pages#terms",   as: :terms
  get "/privacy", to: "pages#privacy", as: :privacy

  # ✅ ヘルスチェック
  get "up" => "rails/health#show", as: :rails_health_check

  # ✅ トップページ
  root "home#top"

  # ✅ ログイン・ログアウト
  get    "/login",  to: "sessions#new"
  post   "/login",  to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  # ✅ ユーザー登録
  get  "/signup", to: "users#new"
  post "/users",  to: "users#create"

  # ✅ マイページ（ログイン中の自分）
  get "/mypage", to: "users#mypage", as: :mypage

  # ✅ ユーザー操作（他ユーザー含む）
  resources :users, only: [:show, :edit, :update]

  # ✅ フォロー・いいね・検索（中身は後日実装）
  get "/follows", to: "follows#index", as: :follows
  get "/likes",   to: "likes#index",   as: :likes
  get "/search",  to: "search#index",  as: :search

  # ✅ キャラクター投稿（show は /characters/:id）
  resources :characters, only: [:new, :create, :show, :edit, :update, :destroy]

  # ✅ 投稿（キャラ投稿）
  resources :posts, only: [:new, :create, :show, :edit, :update]
end