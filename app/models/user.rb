class User < ApplicationRecord
  authenticates_with_sorcery!
  has_secure_password

  has_many :posts, dependent: :destroy
  has_many :characters, dependent: :destroy   # ← 🔧 これを追加！

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end
