class Appointment < ActiveRecord::Base
	validate :correct_date_ranges, :not_overlapping
	def correct_date_ranges
		if start_time <= DateTime.now
			errors.add(:start_time, "Start Date must me in the future")
		end
		if end_time <= start_time
			errors.add(:end_time, "End Time must me after Start Time")
		end
	end
	def not_overlapping
		Appointment.where.not( id: id).each { |a| errors.add(:overlapping_appointment, "This appiontmetn conflicts with a current appointment") if is_overlapping?(a) }
	end
	private
		def is_overlapping?(a)
			return true if a.start_time >= start_time && a.start_time <= end_time 
			return true if a.end_time <= end_time && a.end_time >= start_time
		end
end
