class Contribution < ActiveRecord::Base
  belongs_to :attendee, class_name: "User"
  belongs_to :potluck

  validates :food_item, presence: true
  validates :food_item, uniqueness: { scope: :potluck_id, message: "is already taken!"}
end
