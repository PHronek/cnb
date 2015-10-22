require 'spec_helper'

RSpec.describe CNB::TodayRates do
  let(:today_rates) { CNB::TodayRates.new(CNB::TODAY_RATES_URL) }

  describe '#exchange_rate_for' do
    before do
      stub_request(:get, (CNB::TODAY_RATES_URL + "19.10.2015")).
        to_return(status: 200, body: load_today_fixture)

      Timecop.freeze('2015-10-19')
    end

    context 'without amount property' do
      it 'returns exchange rate' do
        expect(today_rates.exchange_rate_for('AUD', Date.today)).to eq(17.385)
      end
    end

    context 'with amount property' do
      it 'returns exchange rate' do
        expect(today_rates.exchange_rate_for('JPY', Date.today)).to eq(0.20019)
      end
    end
  end

  def load_today_fixture
    File.open('spec/fixtures/denni_kurz.txt')
  end
end
