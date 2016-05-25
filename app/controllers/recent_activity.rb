class Recent_activity
	attr_accessor :date, :description, :price

	def initialize(date, description, price)
		@date = date
		@description = description
		@price = price
	end

	def parse_strings()

		@price = @price[18...-6]
		@description = @description[17...-6]
		
		date_test = /.+([0-9]{2}\/[0-9]{2}\/[0-9]{4}).+/ =~ @date && $1

		if date_test == nil
			date_test = /.+([0-9]{1}\/[0-9]{2}\/[0-9]{4}).+/ =~ @date && $1
		end
		if date_test == nil
			date_test = /.+([0-9]{2}\/[0-9]{1}\/[0-9]{4}).+/ =~ @date && $1
		end
		if date_test == nil
			date_test = /.+([0-9]{1}\/[0-9]{1}\/[0-9]{4}).+/ =~ @date && $1
		end
		@date = date_test
		

	end
end