class MemosController < ApplicationController
  def create
    # ① 送られてきた「出席番号」から、どのお客様かを探し出す
    @customer = Customer.find(params[:customer_id])
    
    # ② そのお客様の帳簿に、新しく入力されたメモを書き込んで金庫に保存する
    @memo = @customer.memos.create(memo_params)
    
    # ③ 保存が終わったら、もう一度そのお客様の詳細画面（タイムライン）に戻る
    redirect_to customer_path(@customer)
  end

  # 👇👇👇 ここから追加 👇👇👇
  def destroy
    # ① どのお客様のページから来たのかを探し出す
    @customer = Customer.find(params[:customer_id])
    
    # ② そのお客様の帳簿の中から、消したい「特定のメモ」を探し出す
    @memo = @customer.memos.find(params[:id])
    
    # ③ 見つけたメモをゴミ箱に捨てる（削除する）
    @memo.destroy
    
    # ④ 削除が終わったら、もう一度そのお客様の詳細画面に戻る
    redirect_to customer_path(@customer), status: :see_other
  end
  # 👆👆👆 ここまで追加 👆👆👆

  private
  # 悪意のあるデータ弾き、純粋な「メモの文章（content）」だけを安全に受け取る設定
  def memo_params
    params.require(:memo).permit(:content)
  end
end