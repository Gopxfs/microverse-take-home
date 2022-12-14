class User < ApplicationRecord
  validates :first_name, presence: true, length: {minimum: 1, maximum: 50 }
  validates :last_name, presence: true, length: { minimum: 1, maximum: 100 }
  validates :status, presence: true
  validates :email, presence: true, length: { minimum: 1, maximum: 100 }
  validates :created_at, presence:true

  def self.check_id(id)
    User.where(index: id).empty?
  end
end
