class Bai1
  def input_array
    @arr = Array.new
    i = 0
    num = 5

    while i < num  do
      puts "Enter sô:"
      a = gets.chomp

      if a.empty?
        a = 0
      end
      @arr.push a.to_i

      i +=1
    end

    puts "#{@arr}"
  end
  
  def sum_array
    sum = @arr.inject{|sum,e| sum + e}
    puts "Tong phan tu array la: #{sum}"
  end

  def square_array
    square = Proc.new do |n| 
      if n == 6 || n == 7 
        n
      else
        n*n
      end
    end

    square_arr = @arr.map(&square)
    puts "luy thua cua array #{@arr} là: \n #{square_arr}"
  end
end

a = Bai1.new
input_arr = a.input_array
sum_array = a.sum_array
square_array = a.square_array
