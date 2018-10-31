require 'rails_helper'

feature 'External request' do
  it 'checks email validity on mailboxlayer API' do
    uri = URI('https://apilayer.net/api/check')
    response = Faraday.get(uri)
    expect(response).to be_an_instance_of(Faraday::Response)
  end
end
