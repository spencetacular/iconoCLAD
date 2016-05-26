require_relative 'regex'
class View_items
	attr_accessor :item_number, :description, :date_in, :date_out, :price, :status

	def initialize(item_number, description, date_in, date_out, price, status)
		@item_number = item_number
		@description = description
		@date_in = date_in
		@date_out = date_out
		@price = price
		@status = status
	end 

	def parse_strings
		@item_number = item_number[17..-7]
		@description = description[17..-7]
		@price = find_price(@price)
		@status = status[17..-6]
		@date_in = find_date(@date_in)
		@date_out = find_date(@date_out)
	end
end