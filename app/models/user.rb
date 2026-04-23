class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # ▼▼▼ この1行を追加 ▼▼▼
  has_many :customers, dependent: :destroy
end