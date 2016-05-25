require_relative 'recent_activity'

class HomeController < ApplicationController
  def index

  	# test users
  	# pearson 1525
  	# mordue 221
  	# mardesich-smith 10
  	

		agent = Mechanize.new
		page = agent.get('http://www.myresaleweb.com/')

		# store_form = page.forms[1]

		# store_form['consignorid'] = '131'
		# store_form['consignorlastname'] = 'awesome'
		@store_form = page.forms[1]
		@page
		@recent_activity_link
		@recent_activity_page
		@recent_activity_raw

		@recent_activity = []
		# @recent_activity_date = []
		# @recent_activity_description = []
		# @recent_activity_price = []


		def parse_date(str)
			
			date = /.+([0-9]{2}\/[0-9]{2}\/[0-9]{4}).+/ =~ str && $1

			if date == nil
				date = /.+([0-9]{1}\/[0-9]{2}\/[0-9]{4}).+/ =~ str && $1
			end
			if date == nil
				date = /.+([0-9]{2}\/[0-9]{1}\/[0-9]{4}).+/ =~ str && $1
			end
			if date == nil
				date = /.+([0-9]{1}\/[0-9]{1}\/[0-9]{4}).+/ =~ str && $1
			end
			return date	
		end

		def parse_description(str)
			
			str = str[17...-6]
			return str
		end

		def parse_price(str)
			str = str[18...-6]
			return str
		end

		def recent_activity(raw)
			
			date = []
			description = []
			price = []

			des_index = 4
			price_idex = 5

			raw.each_with_index do |r, index|
				if index % 3 == 0 && index != 0
					str = r.to_s
					date.push(parse_date(str))
					# @recent_activity_date.push(date)
				end
				
				if index == des_index
					str = r.to_s
					description.push(parse_description(str))
					# @recent_activity_description.push(description)
					des_index += 3
				end

				if index == price_idex
					str = r.to_s
					price.push(parse_price(str))
					# @recent_activity_price.push(price)
					price_idex +=3
					# binding.pry
				end

				
				# binding.pry
			end
			
			date.each_with_index do |d, index|
				
				@recent_activity.push(Recent_activity.new(date[index], description[index], price[index])) 

			end
			 binding.pry

		end


		def populate_forms

			@store_form['state'] = 'UT'
			@store_form['storeid'] = 'BK1652'
			@store_form['consignorid'] = current_user.my_id
			@store_form['consignorlastname'] = current_user.my_last_name

			checkforms
		
		end

		def checkforms 
			
			if @store_form['state'] != 'UT' || 	@store_form['storeid'] != 'BK1652' || @store_form['consignorid'] != current_user.my_id || @store_form['consignorlastname'] != current_user.my_last_name
				populate_forms
			else
				@page = @store_form.submit
				@recent_activity_link = @page.link_with(text: 'Recent Activity')
				@recent_activity_page = @recent_activity_link.click

				@recent_activity_raw = @recent_activity_page.search("td.main")
				# items.each 
				# str = @recent_activity[3].to_s
				# str = /.+([0-9]{1}\/[0-9]{2}\/[0-9]{4}).+/ =~ str && $1
				 # date = parse_date(str)

				recent_activity(@recent_activity_raw)
				

				# binding.pry
			end



			


		end


		
		
		
		
		
		

		# page = store_form.submit

		# recent_activity_link = page.link_with(text: 'Recent Activity')
		# recent_activity_page = recent_activity_link.click


	populate_forms


		page
  	# binding.pry
  end
end
