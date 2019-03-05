require_relative 'form'

class MoreappAPI
  class Folder

    attr_accessor :id, :name, :raw_data

    def initialize(moreapp_api, data)
      @moreapp_api = moreapp_api
      @id = data["applicationId"]
      @name = data["name"]
      @form_ids = data["forms"]
      @raw_data = data
    end

    def forms
      @form_ids.map do |long_form_id|
        MoreappAPI::Form.new(@moreapp_api, long_form_id)
      end
    end

  end
end