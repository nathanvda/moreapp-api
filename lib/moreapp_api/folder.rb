require_relative 'form'

class MoreappAPI
  class Folder

    attr_accessor :id, :name, :raw_data, :customer

    def initialize(customer, data)
      @moreapp_api = customer.moreapp_api
      @customer = customer
      @id = data["applicationId"]
      @name = data["name"]
      @form_ids = data["forms"]
      @raw_data = data
    end

    def forms
      @form_ids.map do |long_form_id|
        MoreappAPI::Form.create_in_folder(self, long_form_id)
      end
    end

  end
end