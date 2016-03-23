class User < ActiveRecord::Base
	validates :birthday, presence:true
	validate :atleast18
	validates_presence_of :name
	validate :check_full_name
	validates :password, length: { minimum: 8 }

	def atleast18
		if self.birthday && !(self.birthday.to_date < 18.years.ago)
			errors.add(:birthday, "should be 18!")
		end
	end

	def get_pretty_birthday
		self.birthday.strftime("%m-%d-%Y")
	end

	def check_full_name
		if self.name && !(self.name.match(/\s/))
			errors.add(:name, "Include your full name")
		end
	end
end
