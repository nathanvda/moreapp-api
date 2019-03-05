class MoreappAPI
  class Form

    attr_accessor :id, :name, :raw_data

    def initialize(moreapp_api, long_id)
      @moreapp_api = moreapp_api
      @id = long_id[0..31]
      @name = long_id[32..-1]
    end

  end
end