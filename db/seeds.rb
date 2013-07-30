# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

5.times do |x|
  name=["Company A", "B Industries", "C Corp", "D Inc.", "E Enterprises"]
  Company.create!(name: name[x])
end

50.times do
  employee = Employee.new 
  employee.name=Faker::Name.first_name
  employee.email=Faker::Internet.email
  employee.password = "password"
  company = Company.all.sample
  company.employees << employee
  # Employee.create(name: name, email: email, password: "password", company_id: company_id)
end

my_comp = Company.create(name: "testing company")

test_user = Employee.new 
test_user.name = "tester"
test_user.email = "test@email.com"
test_user.password = "password"
my_comp.employees << test_user



2.times do |x|
  titles = ["Multiples of 3 and 5", "FizzBuzz"]
  descriptions = ["If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.  Find the sum of all the multiples of 3 or 5 below 1000.", "Create method called 'super_fizzbuzz' that takes an array as input, composed of integers. As output: For each value that is divisible by 3, print Fizz; print Buzz if it is divisible by 5, and FizzBuzz if divisible by 15. Otherwise, print the number itself."]
  codes = ["# type code here", "def super_fizzbuzz(array); #Your code goes here!; end"]
  test_codes = ["describe '#{titles[x]}' {it 'should equal 233168' {answer = gets.chomp; answer.should eq(233168)}}", "super_fizzbuzz([1,2,3]) == [1, 2, 'Fizz']; super_fizzbuzz([1,2,5])  == [1, 2, 'Buzz']; super_fizzbuzz([1,2,15]) == [1, 2, 'FizzBuzz']; super_fizzbuzz([30, 9, 20, 1]) == ['FizzBuzz', 'Fizz', 'Buzz', 1]"]
  challenge = Challenge.create!(title: titles[x], description: descriptions[x], code: codes[x], test_code: test_codes[x])
  company = Company.last
  company.challenges << challenge
  challenge.author_id = Employee.last.id
  challenge.save
end
