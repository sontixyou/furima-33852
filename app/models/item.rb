class Item < ApplicationRecord
  has_one_attached :image
  has_one :purchase_record
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :Deliveryday
  belongs_to :Deliveryfee
  belongs_to :prefecture

  validate :image_attached
  with_options presence: true do
    validates :title, length: { maximum: 40,
      too_long: "最大%{count}文字まで使えます" }
    validates :detail, length: { maximum: 1000,
      too_long: "最大%{count}文字まで使えます" }
    validates :price, format: { with: /\A[\d]+\z/}, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}

    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :condition_id
      validates :delivery_day_id
      validates :delivery_fee_id
      validates :prefecture_id  
    end

  end
  
  def image_attached
    errors.add(:image, :presence) if image.blank?
  end
end
