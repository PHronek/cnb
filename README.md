# CNB

[![Gem Version](https://badge.fury.io/rb/cnb.png)](http://badge.fury.io/rb/cnb)
[![Build Status](https://travis-ci.org/ucetnictvi-on-line/cnb.png?branch=master)](https://travis-ci.org/ucetnictvi-on-line/cnb)
[![Dependency Status](https://gemnasium.com/ucetnictvi-on-line/cnb.svg)](https://gemnasium.com/ucetnictvi-on-line/cnb)
[![Code Climate](https://codeclimate.com/github/ucetnictvi-on-line/cnb/badges/gpa.svg)](https://codeclimate.com/github/ucetnictvi-on-line/cnb)
[![Test Coverage](https://codeclimate.com/github/ucetnictvi-on-line/cnb/badges/coverage.svg)](https://codeclimate.com/github/ucetnictvi-on-line/cnb)

CNB is a gem that will help you get daily and monthly currency rates for czech crown (CZK) from Czech National Bank. Besides the currency rate you can also get name of the currency, name of the country where it is used and date when the currency rates were published.


## Install

Add following into your Gemfile

    gem 'cnb'

Run

    $ bundle

Or install the gem by on your own

    $ gem install cnb

## Usage

```
app = CNB::Application.new
app.exchange_rate('JPY', Date.today)
```

input date defaults to Date.today so the above line can be also written like this

```
app.exchange_rate('JPY')
```


returns exchange rate from CZK to JPY. If exchange rates for the day
werent yet published, it returns *nil*.

## Exchange rate source

All exchange rates were taken from:
[http://www.cnb.cz/cs/financni_trhy/devizovy_trh/kurzy_devizoveho_trhu/denni_kurz.jsp]


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


## License
MIT License. Copyright (c) 2014
