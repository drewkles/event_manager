require 'csv'
require 'date'

# Time Targeting
# Using the registration date and time we want 
# to find out what are the peak registration hours.

# Returns a csv with time of day, frequency and total Occurrence instances
# Set the file name as parameter 
# Use flag '-wo' to have the csv sorted but without Occurrence field

def group_times(times)
	times.group_by{|t| DateTime.strptime(t, '%m/%d/%Y %H:%M').strftime('%I %P')}
end

# Creates an array with frequency of occurrences, times and occurrences
def format_with_occurrences(grouped_hash)
	grouped_hash.map{|k,v| [v.size, k,[v].flatten!] }
end
# Creates an array with only frequencies and times
def format_without_occurrences(grouped_hash)
	grouped_hash.map{|k,v| [v.size, k]}
end

contents = CSV.open(ARGV[0], headers: true, header_converters: :symbol)
reg_times = contents.map{|row| row[:regdate]}
grouped_times = group_times(reg_times)

# If marked with flag "-wo" the wil give sorted results without the occurrences, will only contain
# frequency and times
 if ARGV[1] == "-wo" 
 	result = format_without_occurrences(grouped_times).sort_by{|r| r[0]}
 else
	result = format_with_occurrences(grouped_times)
 end

CSV.open("peak_hours.csv", "wb", headers: %w{Frequency Time-of-day Occurrences}, write_headers: true) do |csv|
	result.each{|elem| csv << elem }
end