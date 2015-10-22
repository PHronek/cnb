module CNB
  class Application
    class CurrencyNotSupported < StandardError; end

    attr_reader :today

    def initialize
      @today  = CNB::TodayRates.new(CNB::TODAY_RATES_URL)
    end

    def exchange_rate(currency, date = Date.today)
      fail CurrencyNotSupported unless CNB::VALID_CURRENCIES.include?(currency.to_sym)

      @today.exchange_rate_for(currency, date)
    end
  end
end
