module CNB
  class TodayRates
    attr_reader :url, :currencies, :cached_date

    def initialize(url)
      @url = url
    end

    def exchange_rate_for(currency, date)
      @currencies = get_currencies(date)

      currencies[currency][:rate].to_f
    end

    def get_currencies(date)
      if @cached_date != date
        file = open(url + url_date_segment(date))

        @cached_date = Date.parse(file.first)
        build_currency_hash(parse(file.read))
      else
        currencies
      end
    end

    def url_date_segment(date)
      date.strftime('%d.%m.%Y')
    end

    def parse(file)
      file.split("\n").slice(1..-1).map do |line|
        line.split('|').values_at(3, 2, 4)
      end
    end

    def build_currency_hash(arrays)
      arrays.each_with_object({}) do |row, hash|
        hash[row.first] = {
          ammount: row[1],
          rate: compute_rate(row.last, row[1])
        }
      end
    end

    def compute_rate(rate, amount)
      BigDecimal.new(rate.sub(/,/, '.')) / amount.to_i
    end
  end
end
