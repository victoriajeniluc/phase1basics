class Potluck < ActiveRecord::Base
  has_many :contributions
  belongs_to :host, class_name: "User"

  validates :location, :name, presence: true
end
