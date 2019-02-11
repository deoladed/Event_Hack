class Event < ApplicationRecord
	has_many :attandances
	has_many :user, through: :attandances
	belongs_to :admin, class_name: 'User'

	validates :start_date,
    presence: true,
	  if: :in_future
	validates :duration,
	  presence: true,
    if: :duration_is_a_multiple_of_5
	validates :title,
	  presence: true,
	  length: { in: 5..140 }
	validates :description, 
		presence: true, 
		length: { in: 20..1000 }
	validates :price, 
	  presence: true, 
	  numericality: { greater_than: 0, less_than: 1001 }
	validates :location, presence: true
		
	def in_future
		return if start_date.present? && start_date > Date.today
		errors.add(:start_date, "Event must be in the futur") if start_date.present? && start_date < Date.today
	end

	def duration_is_a_multiple_of_5
		 return if duration.present? && !duration.multiple_of?(5) && duration < 1
	      self.errors[:duration] << 'Duration should be a mutiple of 5!' if duration.present? && !duration.multiple_of?(5)
	end
end
