class MoreappAPI
  class RegistrationFile


    def initialize(customer)
      @customer = customer
    end

    def post(filename, content_type = 'image/png')
      # !!! Undocumented more-app API
      # !!! TODO verify this still works after API changes of 08/2020

      image_data = Base64.encode64(File.open(filename, "rb").read)

      response = @customer.moreapp_api.request(:post, "/api/v1.0/client/registrations/files/base64", nil, {},
                                  {
                                      customerNumber: customer.id,
                                      base64FileContent: "data:#{content_type};base64," + image_data,
                                      filename: File.basename(filename)
                                  }.to_json,
                                  { 'Content-Type' => 'application/json' } )

      # returns a body containing the location of the image. Looks something like "gridfs://registrationFiles/#{image_location_id}"
      # which can then be used as a value for a "photo" - field
      response.body
    end


  end
end
