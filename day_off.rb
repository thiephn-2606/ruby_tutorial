require 'date'

class Day_off
  def input_date
    begin
      puts "Input date in format mm/dd/yyyy: "
      get_date_in = gets.chomp
      @date_checkin = DateTime.parse(get_date_in).to_date
    rescue ArgumentError => e
      puts e.message
    end
  end

  def check_date 
    if @date_checkin >= DateTime.now
      puts "Input date in fail "
    else
      case DateTime.now.year
    
      when @date_checkin.year
        if @date_checkin.day >= 10
          puts "Total day off: #{(12 - @date_checkin.month).to_i + 0.5}"
        else
          puts "Total day off: #{(12 - @date_checkin.month).to_i + 1}"
        end
      else
        case (DateTime.now - @date_checkin).to_i

        when 4*365..5*365
          puts "Total day off: 13"
        when 0..4*365
          puts "Total day off: 12"
        else
          puts "Total day off: 14"
        end
      end
    end
  end
end

day = Day_off.new
day.input_date
day.check_date
