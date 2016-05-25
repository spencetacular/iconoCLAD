require_relative 'recent_activity'

class HomeController < ApplicationController
  def index

  	# test users
  	# pearson 1525
  	# mordue 221
  	# mardesich-smith 10
  	
		agent = Mechanize.new
		page = agent.get('http://www.myresaleweb.com/')

		# store_form['consignorid'] = '131'
		# store_form['consignorlastname'] = 'awesome'
		@store_form = page.forms[1]
		@page
		@recent_activity_link
		@recent_activity_page
		@recent_activity_raw
		@view_items_link
		@view_items_page
		@view_items_raw

		@recent_activity = []
		@view_items = []

		def recent_activity(raw)
			
			date = []
			description = []
			price = []
			des_index = 4
			price_idex = 5

			raw.each_with_index do |r, index|
				if index % 3 == 0 && index != 0
					str = r.to_s
					date.push(str)
				end
				
				if index == des_index
					str = r.to_s
					description.push(str)
					des_index += 3
				end

				if index == price_idex
					str = r.to_s
					price.push(str)
					price_idex +=3
				end
			end
			
			date.each_with_index do |d, index|

				recent = Recent_activity.new(date[index], description[index], price[index])
				recent.parse_strings
				@recent_activity.push(recent) 
			end
		end

		def view_items(raw)

			item_num = [], description = [], date_in = [], date_out = []
			price = [], status = [], count = []


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
				recent_activity(@recent_activity_raw)

				@view_items_link = @page.link_with(text: 'View Items')
				@view_items_page = @view_items_link.click
				@view_items_raw = @view_items_page.search("td.main")
				
				# binding.pry
				view_items(@view_items_raw)




			end
		end

	populate_forms

  end
end
