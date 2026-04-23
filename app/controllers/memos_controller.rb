class MemosController < ApplicationController
  def create
    # ① 送られてきた「出席番号」から、どのお客様かを探し出す
    @customer = Customer.find(params[:customer_id])
    
    # ② そのお客様の帳簿に、新しく入力されたメモを書き込んで金庫に保存する
    @memo = @customer.memos.create(memo_params)
    
    # ③ 保存が終わったら、もう一度そのお客様の詳細画面（タイムライン）に戻る
    redirect_to customer_path(@customer)
  end

  private
  # 悪意のあるデータ弾き、純粋な「メモの文章（content）」だけを安全に受け取る設定
  def memo_params
    params.require(:memo).permit(:content)
  end
end