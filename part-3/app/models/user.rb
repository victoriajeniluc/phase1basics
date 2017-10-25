class User < ActiveRecord::Base
  has_many :potlucks, foreign_key: :host_id
  has_many :contributions, foreign_key: :attendee_id

  validates :username, :email, presence: true
  validates :email, :username, uniqueness: true
  validate :check_password

  def password
    @password ||= BCrypt::Password.new(hashed_password)
  end

  def password=(input_password)
    @raw_password = input_password
    @password = BCrypt::Password.create(input_password)
    self.hashed_password = @password
  end

  def authenticate(input_password)
    self.password == input_password
  end

  def check_password
    if @raw_password.nil?
      errors.add(:password, "is required!")
    elsif @raw_password.length < 6
      errors.add(:password, "needs to be 6 characters long!")
    end
  end
end
