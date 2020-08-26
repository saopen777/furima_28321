class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders

  with_options presence: true do
    validates :nickname, format: { with://, message:""}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, format: { with: VALID_EMAIL_REGEX}
    validates :email, uniqueness: true
    validates :password, format: { with: /\A[a-z0-9]+\z/i, message: "Include both letters and numbers"}
    validates :password_confirmation, format: { with: /\A[a-z0-9]+\z/i, message: "Include both letters and numbers"}
    validates :family_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "Full-width characters"}
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: " Full-width characters"}
    validates :family_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "Full-width katakana characters"}
    validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "Full-width katakana characters"}
    validates :birth_day, format: { with://, message:""}
  end
end
