# encoding: utf-8
require 'spec_helper'

describe VatRates do
  it '#fetch' do
    values = VatRates.fetch

    france = {
      code: 'FR',
      name: 'France',
      rate: 20.0,
      regions: [
        {name: 'Corsica', rate: 20.0, reduced_rates: {category: 'Taux particulier', rate: 10.0}},
        {name: 'DOM', rate: 8.5, reduced_rates: {category: 'Taux réduit', rate: 1.05}},
        {name: 'Monaco', rate: 20.0, :reduced_rates=>{:category=>"Taux intermédiaire", :rate=>10.0}}
      ]
    }

    expect(values.find { |v| 'France' == v[:name] }).to eq(france)
    expect(values.count).to eq 28
  end

  it '#load' do
    expect(VatRates.load).to eq VatRates.fetch
  end
end