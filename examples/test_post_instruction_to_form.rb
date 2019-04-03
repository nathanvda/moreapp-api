
require_relative '../lib/moreapp_api'
require_relative 'config'

## use your own keys
consumer_key = MY_CONSUMER_KEY
consumer_secret = MY_CONSUMER_SECRET


moreapp = MoreappAPI.new(consumer_key, consumer_secret)

puts "Doing the post of instruction directly, instead of first collecting/exploring the API"


customer_id = '65194'
folder_id = 'c65194a3FB5D21E179A4206BFD0B902EF0BDD0D'
form_id = '6e3a2cc33368485ba1323b5c0462adef'

form = MoreappAPI::Form.new(moreapp, customer_id, folder_id, form_id )

form_data = {
    barcode: "1234567",
    description: "You should visit this place and conduct our survey!",
}

response = form.post_instruction("nathanvda@gmail.com", "RELAX! This is only a test AGAIN!", form_data)

puts response.inspect
