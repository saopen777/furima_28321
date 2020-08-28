class Item < ApplicationRecord

  belongs_to :user
  has_one :order
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :burden
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :day
  belongs_to_active_hash :prefecture

  #空の投稿を保存できないようにする
  validates :burden, :category, :condition, :day, :prefecture, presence: true

  #ジャンルの選択が「--」の時は保存できないようにする
  with_options numericality: { other_than: 1 } do
  validates :burden,
  validates :category,
  validates :condition,
  validates :days,
  validates :prefecture,

end
