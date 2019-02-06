class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable
  has_many :items
  has_many :bought_items, class_name: 'Item', foreign_key: 'buyer_id'
  has_many :sold_items, class_name: 'Item', foreign_key: 'seller_id'
  has_many :comments

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.nickname = auth.info.name
    end
  end

  validates :nickname, presence: true, length: { maximum: 20 }
  validates :email, presence: true, uniqueness: true
  #validates :password, presence: true, confirmation: true, length: { minimum: 6 }

end
