require_relative 'folder'

class MoreappAPI
  class Customer

    attr_accessor :id, :name, :raw_data, :moreapp_api

    def initialize(moreapp_api, data)
      @moreapp_api = moreapp_api
      @id = data["customerId"]
      @name = data["name"]

      @raw_data = data
    end

    def folders
      response = @moreapp_api.request(:get, "/api/v1.0/forms/customer/#{self.id}/folders?expand=forms")

      folders = JSON.parse(response.body)
      folders.map{|data| MoreappAPI::Folder.new(self, data)}
    end

  end
end
