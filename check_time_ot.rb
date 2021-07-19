require 'date'
require 'time'

class CheckTimeOt
	def input_time
		begin
			puts "Please enter dob in hh:mm format;"
			puts "Time check in "
			time_checkin = gets.chomp
			puts "Time check out"
			time_checkout = gets.chomp
			@time_checkin = DateTime.strptime(time_checkin, '%H:%M').to_time
			@time_checkout = DateTime.strptime(time_checkout, '%H:%M').to_time
		
		rescue Exception => e
			puts e.message
		end
	end

	def time_OT
		(@time_checkout - @time_checkin) /3600
	end

	def check_time_OT
		ot_time = @time_checkin - @time_checkout
		case time_OT

		when 0..4
			if @time_checkout > DateTime.strptime("21:00", '%H:%M').to_time
				puts "OT: #{time_OT}, Lunch: N, Dinner: Y"
			else 
				puts "OT: #{time_OT}, Lunch: N, Dinner: N"
			end
		when 4..12
			if(@time_checkin.hour..@time_checkout.hour).to_a.include?(12) && (@time_checkin.hour..@time_checkout.hour).to_a.include?(13) 
				puts "OT: #{(time_OT) -1 }, Lunch: y, Dinner: N"  
			else
				puts "OT: #{(time_OT)}, Lunch: N, Dinner: N" 
			end
		else
			puts "OT: #{time_OT}, Lunch: N, Dinner: N"
		end
  end
end

rs = CheckTimeOt.new
rs.input_time
rs.check_time_OT
