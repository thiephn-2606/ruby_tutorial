require 'date'
require 'time'

class CheckTimeOt
	def input_time
		puts "Please enter dob in hh:mm format;"
		puts "Time check in"
		time_in = gets.chomp
		puts "Time check out"
		time_out = gets.chomp
		@time_in = DateTime.strptime(time_in, '%H:%M').to_time
		@time_out = DateTime.strptime(time_out, '%H:%M').to_time


	end

	def time_OT
		@tiem_ot = 	(@time_out - @time_in) /3600
	end

	def check_time_OT
		time_current = DateTime.now 
		puts "tiem #{time_current}"
		if @time_in <= DateTime.strptime('08:00', '%H:%M').to_time &&  @time_out <= DateTime.strptime('12:30', '%H:%M').to_time
			puts "OT = #{time_OT}, Lunch: N, Dinner: N" 
		elsif @time_in <= DateTime.strptime('12:00', '%H:%M').to_time &&  @time_out <= DateTime.strptime('16:30', '%H:%M').to_time
			puts "OT = #{time_OT - 1}, Lunch: Y, Dinner: N" 
		elsif @time_in <= DateTime.strptime('18:00', '%H:%M').to_time &&  @time_out > DateTime.strptime('21:00', '%H:%M').to_time
			puts "OT = #{time_OT}, Lunch: N, Dinner: Y" 
		end
	end
end

rs = CheckTimeOt.new
rs.input_time
rs.check_time_OT
