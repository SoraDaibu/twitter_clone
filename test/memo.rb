sn = { one: "uno", two: "dos", three: "tres"}

sn.each do|key, value|
  puts "#{key}のスペイン語は#{value}"
end

p1 = {first: "1",last: "d"}
p2 = {first: "2", last: "d"}
p3 = {first: "3", last:  "d"}

params = {}
params[:father] = p1
params[:mother] = p2
params[:child] = p3

user = {name: "sora daibu", email: "sora@gmail.com", pw: ('a'..'z').to_a.shuffle[0..15].join}

class Word < String
  def palindrome?
    self === reverse
  end
end

class String
  def shuffle
    split('').shuffle.join
  end
end

require './example_user' 

user = User.new
user.first_name= "sora"
user.last_name = "daibu"
email = "soradaibu@spain.google.com"

user.full_name.split == user.alphabetical_name.split(',').reverse


