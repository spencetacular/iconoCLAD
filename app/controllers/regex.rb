

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

