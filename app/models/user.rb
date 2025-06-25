class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :posts, dependent: :destroy
  has_many :characters, dependent: :destroy

  has_one_attached :icon

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
end
