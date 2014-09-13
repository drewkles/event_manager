require 'csv'
require 'date'

# Day of the week targeting
# "What days of the week did most people register?"

# Returns Hash of Each_day => Frequency

def days(date)
	Date::DAYNAMES[Date.strptime(date, '%m/%d/%Y').wday]
end

contents = CSV.open(ARGV[0], headers: true, header_converters: :symbol)

frequency_by_day = Hash.new(0)

contents.each do |row|
	reg_date = row[:regdate]
	day_of_week = days(reg_date)
	frequency_by_day[day_of_week] +=1 
end

puts frequency_by_day
