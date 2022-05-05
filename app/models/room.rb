class Room < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :destroy
  has_one_attached :image
  validates :name, presence: true, length: { maximum: 20 }
  validates :content, presence: true, length: { maximum: 200 }
  validates :image, presence: true
  validates :price, presence: true
  validates :address, presence: true

  def self.search(search_area, search_keyword)
    if search_area != '' && search_keyword != ''
      Room.where(['address LIKE ? AND content LIKE ?', "%#{search_area}%", "%#{search_keyword}%"])
    elsif search_area != '' && search_keyword == ''
      Room.where(['address LIKE ?', "%#{search_area}%"])
    elsif search_area == '' && search_keyword != ''
      Room.where(['content LIKE ?', "%#{search_keyword}%"])
    else
      Room.all
    end
  end

  def display_image
    image.variant(resize_to_limit: [100, 100])
  end

  def ditail_image
    image.variant(resize_to_limit: [500, 500])
  end

  def customize_image(height, width)
    image.variant(resize_to_limit: [height, width])
  end
end
