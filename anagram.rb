class Anagram
	def self.test?(s1, s2)
		return false if s1.length != s2.length
		h = s2.split(//)
		puts s1.split(//).inspect
		puts h.inspect
		s1.split(//).each do |l|
			puts l
			i = h.find_index(l)
			return false if i.nil?
			h.delete_at(i)
			puts h.inspect
		end
		h.empty?
	end
end

puts Anagram::test?("rear", "sear") ? "Yes" : "No"