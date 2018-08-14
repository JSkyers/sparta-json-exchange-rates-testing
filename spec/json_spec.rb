require_relative 'spec_helper'
require_relative '../parse_json.rb'

describe 'Create tests for json file' do
before(:each) do
  @currency = ParseJSON.new("json_exchange_rates.json")
end

  it 'should have a base key with the value of EUR' do
    expect(@currency.json_file["base"]).to eq("EUR")
  end

  it 'should have a date with the value of 2017-07-26' do
    expect(@currency.json_file["date"]).to eq("2017-07-26")
  end

  it 'should have 31 keys in rates' do
    expect(@currency.json_file["rates"].keys.length).to eq(31)
  end

  it 'should be so that the first rate is AUD' do
    expect(@currency.json_file["rates"].keys.first).to eq("AUD")
  end

  it 'should be so that the last rate is ZAR' do
    expect(@currency.json_file["rates"].keys.last).to eq("ZAR")
  end

  it 'should be so that rates is a hash' do
    expect(@currency.json_file["rates"]).to be_a(Hash)
  end

  it 'should be that GBP rate are floats' do
    expect(@currency.json_file["rates"]["GBP"]).to be_a (Float)
  end

  it 'should be that all rates are floats' do
    expect(@currency.json_file["rates"].values).to all(be_an(Float))
  end

end
