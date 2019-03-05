
require_relative '../lib/moreapp_api'

## use your own keys
consumer_key = 'nathanvda@gmail.com'
consumer_secret = 'af3ddd0e74464743a72008ce64739605df2e5e7e'




moreapp = MoreappAPI.new(consumer_key, consumer_secret)

customers = moreapp.customers

customer = customers.first

puts "Customer = [#{customer.id} - #{customer.name}]"


folders = customer.folders

my_folder = folders.first

puts "My folder = #{my_folder.id} - #{my_folder.name}"
puts "My folder RAW = #{my_folder.raw_data.inspect}"
puts "My folder has forms = #{my_folder.forms.inspect}"



exit 








response = consumer.request(:get, "/api/v1.0/customers/#{customer_id}/folders")

folders = JSON.parse(response.body)

puts folders.inspect
folder_id = folders[0]["applicationId"]
form_id = folders[0]["forms"][0]


response = consumer.request(:post, "/api/v1.0/customers/#{customer_id}/folders/#{folder_id}/forms/#{form_id}/registrations/filter/0",
                            nil, {},
                            { pageSize: 100, sort: [], query: [] }.to_json, { 'Content-Type' => 'application/json' } )

registrations = JSON.parse(response.body)

puts JSON.pretty_generate(registrations)


# create an instruction
#
# !!! form-id as received from API also contains the form name?? and no way to safely extract this?
form_id = form_id[0..31]

puts form_id.inspect

response = consumer.request(:post, "/api/v1.0/customers/#{customer_id}/#{folder_id}/#{form_id}/instructions",
                            nil, {},
                            {
                                publishInfo: {type: "IMMEDIATE"},
                                recipients: ["nathanvda@gmail.com"],
                                data: {
                                    barcode: "PG2019-00025",
                                    locationImage: "http://www.dixis.com/wp-content/themes/dixis0.2/dixis-logo-70.jpg",
                                    photo1: "https://cdn3.vectorstock.com/i/1000x1000/97/67/line-topographic-contour-map-background-seamless-vector-14939767.jpg",
                                    description: "Bezoek _deze_ plaats en vertel wat je ziet! Ringlaan 88/1, 2610 Wilrijk. Go!!",
                                },
                                message: "Do your thing ASAP with images !!"
                            }.to_json,
                            { 'Content-Type' => 'application/json' } )

puts response.body.inspect

