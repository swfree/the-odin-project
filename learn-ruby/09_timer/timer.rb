#Timer converts seconds into 00:00:00 format

class Timer
	attr_accessor :seconds

	def initialize
		@seconds = 0
	end

	def time_string
		if (@seconds / 60.0) <= 1
		  "00:00:#{padded(@seconds)}"
		elsif (@seconds / 3600.0) <= 1
			"00:#{padded(@seconds/60)}:#{padded(@seconds%60)}"
		elsif (@seconds / 216000) <= 1
			"#{padded(@seconds/3600)}:#{padded((@seconds%3600)/60)}:#{padded((@seconds%3600)%60)}"
		else
			"That number exceeds the limit."
		end
	end

  def padded(n)
    n < 10 ? "0#{n}" : "#{n}"
  end
end