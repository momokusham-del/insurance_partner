Rails.application.routes.draw do
  devise_for :users
  
  # 顧客の中にメモを入れ込む道案内
  resources :customers do
    resources :memos, only: [:create]
  end
  
  # アプリを開いた時の最初の画面を「顧客リスト」にする
  root "customers#index"
end