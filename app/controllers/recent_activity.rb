require_relative 'regex'
class Recent_activity
	attr_accessor :date, :description, :price

	def initialize(date, description, price)
		@date = date
		@description = description
		@price = price
	end

	def parse_strings()
		@price = find_price(@price)
		@description = @description[17...-6]
		@date = find_date(@date)
	end
end