class User < ApplicationRecord

  has_secure_password

  validates :email, presence: true, uniqueness: true,
            format:  /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  has_many :likes, dependent: :destroy
  has_many :liked_ideas, through: :likes, source: :idea

  has_many :joins, dependent: :destroy
  has_many :joined_ideas, through: :joins, source: :idea

  has_many :ideas, dependent: :destroy

  def full_name
   "#{first_name} #{last_name}"
  end

end
