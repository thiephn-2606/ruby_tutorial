class Bai1
  def input_array
    @arr = Array.new
    i = 0
    num = 5

    while i < num  do
      puts "Enter sô:"
      a = gets.chomp.to_i
      @arr.push a

      i +=1
    end

    puts "#{@arr}"
  end
  
  def sum_array
    sum = @arr.sum
    puts "Tong phan tu array la: #{sum}"
  end

  def square_array
    # square = Proc.new { |n| n == 6 || n == 7 ? n : n*n }
    square = Proc.new { |n| [6, 7].include?(n) ? n : n*n }
    square_arr = @arr.map(&square)
    puts "luy thua cua array #{@arr} là: \n #{square_arr}"
  end
end

a = Bai1.new
input_arr = a.input_array
sum_array = a.sum_array
square_array = a.square_array
