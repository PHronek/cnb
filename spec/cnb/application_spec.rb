require 'spec_helper'

RSpec.describe CNB::Application do
  let(:app)      { CNB::Application.new }

  describe '#exchange_rate' do
    before do
      Timecop.freeze('2015-10-19')
    end

    after do
      Timecop.return
    end

    context 'date missing' do
      it 'calls exchange_rate_for with default date value(Date.today)' do
        expect(app.today).to receive(:exchange_rate_for).with('AUD', Date.today)
        app.exchange_rate('AUD')
      end
    end

    context 'currency is not supported' do
      it 'raises CurrencyNotSupported exception' do
        expect { app.exchange_rate('IMAGINARY') }.
          to raise_error CNB::Application::CurrencyNotSupported
      end
    end
  end
end
