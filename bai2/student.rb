class Student
  attr_accessor :maSV, :name, :address, :phone, :toan, :van, :anh, :avg

  def initialize(maSV, name, address, phone, toan, van, anh, avg)
    @maSV = maSV
    @name = name
    @address = address
    @phone = phone
    @toan = toan
    @van = van
    @anh = anh
    @avg = avg
  end

  def to_h
    subjects = [:toan, :van, :anh, :avg]
    values = subjects.map{|subject| send subject }
    hash = {}
    subjects.zip(values){|subject, value| hash[subject] = value}
    hash
  end
end

class ClassRoom
  def initialize 
    @students = []

  end

  def get_scores
    hash = {}
    @students.map do |student|

      hash[student.name] = student.to_h
    end
    puts "information student: \n #{hash}"
  end

  def max_avg
    max_avg = @students.max_by {|x| x.avg }
    puts "student with the highest avg: \n"
    puts "maSV student: #{max_avg.maSV}"
    puts "name student: #{max_avg.name}"
    puts "address student: #{max_avg.address}"
    puts "phone number student: #{max_avg.phone}"
    puts "avg student: #{max_avg.avg}"
  end
  
  def input_student
    puts "Enter number student:"
    number =  gets.chomp.to_i
    while number > 0
      puts "Enter information student:"
      puts "maSV: "
      maSV = gets.chomp
      puts "name: "
      name = gets.chomp
      puts "address: "
      address = gets.chomp
      puts "phone: "
      phone = gets.chomp
      puts "toan: "
      toan = gets.chomp
      puts "van: "
      van = gets.chomp
      puts "anh: "
      anh = gets.chomp
      avg = (toan.to_f + van.to_f + anh.to_f) / 3
      student = Student.new(maSV, name, address, phone, toan ,van, anh, avg)
      number -= 1
      @students << student

    end
  end
end

rs = ClassRoom.new
rs.input_student
rs.get_scores
rs.max_avg
