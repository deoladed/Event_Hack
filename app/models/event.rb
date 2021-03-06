class Event < ApplicationRecord
	has_one_attached :event_picture

	has_many :attandances, dependent: :destroy
	has_many :user, through: :attandances
	belongs_to :admin, class_name: 'User'

	validates :start_date,
    presence: true,
	  if: :in_future
	validates :duration,
	  presence: true,
	  if: :duration_is_a_multiple_of_5
	validates :duration,
	 numericality: { greater_than: 0 }
	validates :title,
	  presence: true,
	  length: { in: 5..140 }
	validates :description, 
		presence: true, 
		length: { in: 20..1000 }
	validates :price, 
	  presence: true, 
	  numericality: { greater_than_or_equal_to: 0, less_than: 1001 }
	validates :location, presence: true
	validates :event_picture, presence: true

# SCOPE POUR AFFICHER PAR DATES DESC
scope :by_soon_date, -> { order(start_date: :asc)}

	def in_future
		errors.add(:start_date, "Event must be in the futur") unless self.start_date.present? && self.start_date > Date.today
	end

	def duration_is_a_multiple_of_5
		 errors.add(:duration, "Duration should be a mutiple of 5!") unless self.duration.present? && self.duration.multiple_of?(5)
	end

	def end_date
		self.start_date + self.duration * 60
	end

	def date
		self.start_date.to_s[0..-13]
	end

	def hour
		self.start_date.to_s[12..-8]
	end

	def end_date_hour
		self.end_date.to_s[12..-8]
	end

	def duration_in_hour
		if self.duration > 60
		elsif self.duration > 1440
		end
	end

	def is_free
		self.price == 0
	end
end
