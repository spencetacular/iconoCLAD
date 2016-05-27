require_relative 'regex'
class View_items
	attr_accessor :item_number, :description, :date_in, :date_out, :price, :status, :combined

	def initialize(item_number, description, date_in, date_out, price, status)
		@item_number = item_number
		@description = description
		@date_in = date_in
		@date_out = date_out
		@price = price
		@status = status
		# @combined = combined
	end 

	def parse_strings
		@item_number = item_number[17..-7]
		@description = description[17..-7]
		@price = find_price(@price)
		@status = status[17..-6]
		@date_in = find_date(@date_in)
		@date_out = find_date(@date_out)

		# Item sold - 56560 - Locally Made / Wooden Bowl Air Plant / Brown / Medium
	end

	def create_row
		
		str = find_num_spaces(@item_number, 5)
		str += find_num_spaces(@description, 90)
		str += find_num_spaces(@date_in, 10)
		str += find_num_spaces(@date_out, 10)
		str += find_num_spaces(@price, 8)
		str += find_num_spaces(@status, 10)
		@combined = str
		# binding.pry
	end
end