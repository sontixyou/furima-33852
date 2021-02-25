class Item < ApplicationRecord
  has_many_attached :images
  has_one :order
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_day
  belongs_to :delivery_fee
  belongs_to :prefecture

  # validate :images_attached
  with_options presence: true do
    validates :title, length: { maximum: 40,
                                too_long: '最大%{count}文字まで使えます' }
    validates :detail, length: { maximum: 1000,
                                 too_long: '最大%{count}文字まで使えます' }
    validates :price, format: { with: /\A\d+\z/ },
                      numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :condition_id
      validates :delivery_day_id
      validates :delivery_fee_id
      validates :prefecture_id
    end
  end

  def images_attached
    errors.add(:images, :presence) if images.blank?
  end
end
