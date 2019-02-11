class User < ApplicationRecord
	  after_create :welcome_send

	has_many :attandances, dependent: :destroy
	has_many :events, through: :attandances
	has_many :events, foreign_key: 'admin_id', dependent: :destroy
  
  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
end
