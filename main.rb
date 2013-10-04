require_relative 'app/models/legislator'

## 1

# Senator.where(state:'CA') ? how do i use the senators/reps tables??

california_senators = Legislator.where(state: 'CA', title: 'Sen')
california_senators_output = []
california_senators.each do |sen|
  california_senators_output << "#{sen.last_name}, #{sen.first_name} (#{sen.party})"
end

california_reps = Legislator.where(state: 'CA', title: 'Rep')
california_reps_output = []
california_reps.each do |rep|
  california_reps_output << "#{rep.last_name}, #{rep.first_name} (#{rep.party})"
end

puts "Senators:"
puts california_senators_output.sort!
puts "Represenatives:"
puts california_reps_output.sort!

## 2
