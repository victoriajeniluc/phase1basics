class Potluck < ActiveRecord::Base
  has_many :contributions
  belongs_to :host, class_name: "User"

  validates :location, :name, :starts_at, presence: true

  def self.current_potlucks
    self.select do |potluck|
      potluck.starts_at > DateTime.now
    end
  end
end
