class Customer < ApplicationRecord
  # ▼▼▼ この1行があるか確認（なければ追加） ▼▼▼
  belongs_to :user
  
  has_many :memos, dependent: :destroy
end