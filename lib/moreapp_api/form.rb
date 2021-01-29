require_relative 'submission'


class MoreappAPI
  class Form

    attr_accessor :id, :name, :raw_data


    def initialize(moreapp_api, customer_or_id, form_id, form_name = "", raw_data = nil)
      @moreapp_api = moreapp_api

      if customer_or_id.is_a?(MoreappAPI::Customer)
        @customer = customer_or_id
        @customer_id = @customer.id
      else
        @customer_id = customer_or_id
      end
      @id = form_id
      @name = form_name
      @raw_data = raw_data
    end


    def self.create_from_folder(folder, long_id_or_hash)
      customer = folder.customer
      if long_id_or_hash.is_a?(Hash)
        form_id = long_id_or_hash["id"]
        form_name = long_id_or_hash["meta"]["name"]
        raw_data = long_id_or_hash
      else
        form_id = long_id[0..31]
        form_name = long_id[32..-1]
        raw_data = nil
      end
      MoreappAPI::Form.new(customer.moreapp_api, customer, form_id, form_name, raw_data)
    end


    def self.create_from_id(customer, id)
      response = customer.moreapp_api.request(:get, "/api/v1.0/forms/customer/#{customer.id}/forms/#{id}")
      form_data = JSON.parse(response.body)
      MoreappAPI::Form.new(customer.moreapp_api, customer, nil, form_data["id"], form_data["meta"]["name"], form_data)
    end



    def submissions(page=0, options = {})
      options[:pageSize] ||= 100
      options[:sort] ||= []
      options[:query] ||= []
      response = @moreapp_api.request(:post, "/api/v1.0/customers/#{@customer_id}/forms/#{self.id}/submissions/filter/#{page}",
                                  { pageSize: options[:pageSize], sort: options[:sort], query: options[:query] }.to_json,
                                  { 'Content-Type' => 'application/json' } )

      registrations = JSON.parse(response.body)
      registrations.map{|data| MoreappAPI::Submission.new(self, data)}
    end



    def post_instruction(recipients, message, data, options={})
      recipients = recipients.is_a?(String) ? [recipients] : recipients
      
      response = @moreapp_api.request(:post, "/api/v1.0/customers/#{@customer_id}/#{self.id}/instructions",
                                  {
                                      publishInfo: {type: "IMMEDIATE"},
                                      recipients: recipients,
                                      data: data,
                                      message: message
                                  }.to_json,
                                  { 'Content-Type' => 'application/json' } )
      JSON.parse(response.body)
    end

  end
end
