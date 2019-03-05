require 'spec_helper'
require 'moreapp_api'

describe MoreappAPI  do

  context "api_base" do
    context "the default version (without setting it)" do
      before do
        MoreappAPI.api_base = nil
      end
      it "returns the default value" do
        expect(MoreappAPI.api_base).to eq("https://api.moreapp.com")
      end
    end
    context "overriding api-base" do
      before do
        MoreappAPI.api_base = "https://developer.api.moreapp.com"
      end
      it "returns the default value" do
        expect(MoreappAPI.api_base).to eq("https://developer.api.moreapp.com")
      end
    end
  end



end
