require 'open-uri'

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :avatar
  before_save :grab_image

  
	after_create :welcome_send

	has_many :attandances, dependent: :destroy
	has_many :events, through: :attandances
	has_many :events, foreign_key: 'admin_id', dependent: :destroy
  
  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

  def full_name
    self.first_name + ' ' + self.last_name
  end

  def grab_image
    downloaded_image = (open('http://loremflickr.com/300/300/'))
    self.avatar.attach(io: downloaded_image, filename: 'image.png')
  end
end
