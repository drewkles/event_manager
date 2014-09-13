
# If the phone number is less than 10 digits assume that it is a bad number
# If the phone number is 10 digits assume that it is good
# If the phone number is 11 digits and the first number is 1, trim the 1 and use the first 10 digits
# If the phone number is 11 digits and the first number is not 1, then it is a bad number
# If the phone number is more than 11 digits assume that it is a bad number

def clean_phone_number(phone_number)
	digits = phone_number.to_s.gsub(/\W|^1/, '')
	if digits.length == 10
		puts "#{digits} is a good number"
	else
		puts "Bad number"
	end
end

def clean_phone_number(phone_number)
  digits = phone_number.to_s.gsub(/\W|^1/, '')
  digits.length == 10 ? digits : nil
end