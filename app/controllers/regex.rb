

def find_date(str)

	str = str.slice(str.index(/\d/)..-1)
	str = str.reverse
	str = str.slice(str.index(/\d/)..-1)
	str = str.reverse
end

def find_price(str)

	str = str.slice(str.index("$")..-1)
	str = str.reverse
	str = str.slice(str.index(/\d/)..-1)
	str = str.reverse

end

def find_num_spaces(str, max_length)

	tab = 5
	num_spaces = max_length - str.length + tab
	
	while num_spaces > 0 do
		str += "*"
		num_spaces -= 1
	end

	

	return str
end
find_num_spaces("TEST", 10)

