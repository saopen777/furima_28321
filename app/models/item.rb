class Item < ApplicationRecord

  belongs_to :user
  has_one :order
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :burden
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :days
  belongs_to_active_hash :prefecture

  #空の投稿を保存できないようにする
  validates :name, :description, :price, :burden, :category, :condition, :days, :prefecture, :image, presence: true

  #ジャンルの選択が「--」の時は保存できないようにする
  with_options numericality: { other_than: 1 } do
  validates :burden_id
  validates :category_id
  validates :condition_id
  validates :days_id
  validates :prefecture_id
  end

  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  validates :price, format: { with: /\A[0-9]+\z/ }

end
