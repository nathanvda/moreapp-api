require_relative 'form'

class MoreappAPI
  class Folder

    attr_accessor :id, :name, :raw_data, :customer

    def initialize(customer, data)
      @moreapp_api = customer.moreapp_api
      @customer = customer
      @id = data["meta"]["applicationId"]
      @name = data["meta"]["name"]
      @form_ids = data["forms"]
      @raw_data = data
    end

    def forms
      @form_ids.map do |form_data|
        MoreappAPI::Form.create_from_folder(self, form_data)
      end
    end

  end
end
