class Contribution < ActiveRecord::Base
  belongs_to :attendee, class_name: "User"
  belongs_to :potluck

  validates :food_item, presence: true
end
