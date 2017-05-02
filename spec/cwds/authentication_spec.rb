require "spec_helper"
require 'active_support/core_ext/object/blank'

RSpec.describe Cwds::Authentication do
  it "has a version number" do
    expect(Cwds::Authentication::VERSION).not_to be nil
  end

  it "Empty token returns false" do
    expect(Cwds::Authentication.token_validation(nil,'')).to eq(false)
  end

  it "correct token is validated successfully" do
    pending 'Need to check'
  end

  it "token validation url is generated correctly" do

    api_base_url = 'https://cwds.ca.gov'
    token = '123456'
    expected_url = 'https://cwds.ca.gov/authn/validate?token=123456'
    expect(Cwds::Authentication.token_validation_url(token, api_base_url)).to eq(expected_url)
  end

end
