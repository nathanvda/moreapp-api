require_relative 'registration'


class MoreappAPI
  class Form

    attr_accessor :id, :name, :raw_data

    def initialize(folder, long_id)
      @customer = folder.customer
      @folder = folder
      @moreapp_api = @customer.moreapp_api
      @id = long_id[0..31]
      @name = long_id[32..-1]
    end


    def registrations(page=0, options = {})
      options[:pageSize] ||= 100
      options[:sort] ||= []
      options[:query] ||= []
      response = @moreapp_api.request(:post, "/api/v1.0/customers/#{@customer.id}/folders/#{@folder.id}/forms/#{self.id}/registrations/filter/#{page}",
                                  { pageSize: options[:pageSize], sort: options[:sort], query: options[:query] }.to_json,
                                  { 'Content-Type' => 'application/json' } )

      registrations = JSON.parse(response.body)
      registrations.map{|data| MoreappAPI::Registration.new(self, data)}
    end

  end
end