require 'oauth'
require 'json'
require_relative 'moreapp_api/customer'

class MoreappAPI


  DEFAULT_MORE_APP_API_BASE = 'https://api.moreapp.com'


  def initialize(consumer_key, consumer_secret)
    @consumer = OAuth::Consumer.new(consumer_key, consumer_secret, {site: MoreappAPI.api_base })
  end


  def customers
    response = @consumer.request(:get, '/api/v1.0/customers', nil, {}, {})

    customers_raw = JSON.parse(response.body)
    customers_raw.map{|x| MoreappAPI::Customer.new(self, x )}

  end


  def request(method, url, data={}, options={})
    @consumer.request(method, url, nil, {}, data, options)
  end


  def self.api_base=(other_api_base)
    @@api_base = other_api_base
  end

  def self.api_base
    @@api_base ||= DEFAULT_MORE_APP_API_BASE
  end

end