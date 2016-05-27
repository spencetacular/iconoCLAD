require_relative 'regex'
class Recent_activity
	attr_accessor :date, :description, :price, :combined


	def initialize(date, description, price)
		@date = date
		@description = description
		@price = price
		# @combined = combined
		# @table_header = find_num_spaces("Date", 10) + find_num_spaces("Transaction", 90) + find_num_spaces("Amount",8)
	end

	def parse_strings()
		@price = find_price(@price)
		@description = @description[17...-6]
		@date = find_date(@date)
	end

	def create_row
		
		str = find_num_spaces(@date, 10)
		str += find_num_spaces(@description, 90)
		str += find_num_spaces(@price, 8)
		@combined = str
		# binding.pry
	end

	

end