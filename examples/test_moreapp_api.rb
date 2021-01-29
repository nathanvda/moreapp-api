
require_relative '../lib/moreapp_api'
require_relative 'config'

## use your own keys
consumer_key = MY_CONSUMER_KEY
consumer_secret = MY_CONSUMER_SECRET



moreapp = MoreappAPI.new(consumer_key, consumer_secret)

customers = moreapp.customers

customer = customers.first

puts "Customer = [#{customer.id} - #{customer.name}]"


folders = customer.folders

my_folder = folders.first

puts "My folder = #{my_folder.id} - #{my_folder.name}"
puts "My folder RAW = #{my_folder.raw_data.inspect}"
puts "My folder has forms = #{my_folder.forms.inspect}"

my_form = my_folder.forms.first

my_submissions = my_form.submissions

puts my_submissions.inspect


puts "Post an instruction!"

form_data = {
    barcode: "1234567",
    description: "You should visit this place and conduct our survey!",
}

response = my_form.post_instruction("some-person@someemaildomain.com", "RELAX! This is only a test!", form_data)

puts response.inspect

