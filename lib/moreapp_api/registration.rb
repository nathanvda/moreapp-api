class MoreappAPI
  class Registration

    attr_accessor :id, :name, :raw_data

    def initialize(moreapp_api, data)
      @moreapp_api = moreapp_api
      # @id = long_id[0..31]
      # @form_data =
      @raw_data = data
    end

  end
end