require_relative 'submission'


class MoreappAPI
  class Form

    attr_accessor :id, :name, :raw_data


    def initialize(moreapp_api, customer_or_id, folder_or_id, form_id, form_name = "")
      @moreapp_api = moreapp_api

      if customer_or_id.is_a?(MoreappAPI::Customer)
        @customer = customer_or_id
        @customer_id = @customer.id
      else
        @customer_id = customer_or_id
      end
      if folder_or_id.is_a?(MoreappAPI::Folder)
        @folder = folder_or_id
        @folder_id = @folder.id
      else
        @folder_id = folder_or_id
      end
      @id = form_id
      @name = form_name
    end


    def self.create_in_folder(folder, long_id)
      customer = folder.customer
      MoreappAPI::Form.new(customer.moreapp_api, customer, folder, long_id[0..31], long_id[32..-1])
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


    def registrations(page=0, options={})
      submissions page, options
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
