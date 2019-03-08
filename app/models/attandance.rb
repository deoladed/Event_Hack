class Attandance < ApplicationRecord
	after_create :new_attandant

  belongs_to :user #participants as clasname user
  belongs_to :event

	validates :stripe_customer_id, presence: true

  def new_attandant
    AttandantMailer.new_attandant(self.event).deliver_now
  end
end
