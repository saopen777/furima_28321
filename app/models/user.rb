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
    VALID_EMAIL_REGEX = /\A[a-z0-9]+\z{6,}/i
    validates :password, format: { with: VALID_EMAIL_REGEX, message: "Include both letters and numbers"}
    validates :password_confirmation, format: { with: /\A[a-z0-9]+\z{6,}/i, message: "Include both letters and numbers"}
    VALID_EMAIL_REGEX = /\A[ぁ-んァ-ン一-龥]/
    validates :family_name, format: { with: VALID_EMAIL_REGEX, message: "Full-width characters"}
    VALID_EMAIL_REGEX = /\A[ぁ-んァ-ン一-龥]/
    validates :first_name, format: { with: VALID_EMAIL_REGEX, message: " Full-width characters"}
    VALID_EMAIL_REGEX = /\A[ァ-ヶー－]+\z/
    validates :family_name_kana, format: { with: VALID_EMAIL_REGEX, message: "Full-width katakana characters"}
    VALID_EMAIL_REGEX = /\A[ァ-ヶー－]+\z/
    validates :first_name_kana, format: { with: VALID_EMAIL_REGEX, message: "Full-width katakana characters"}
    validates :birth_day, format: { with://, message:""}
  end
end
