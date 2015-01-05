SpreeSecondUnits
================

Spree extension that supports discounts that apply to the second unit of the same product, enabling a new promotion actions calculator.

SecondUnits calculator
----------------------

This calculator has one preference: `percent` and can be set like this:

```ruby
calculator.preferred_percent = 10
```

This calculator takes a `LineItem` and calculates an amount using this calculation:

```
[item price] x [percent] x [number of second units]
```

For example, if the calculator was configured to have 50 percent off and the product has a price of $15.0

Nº Items of same product | Formule | Discount
:----------------------: | ------- | -------:
1 | 15.0 x 0.5 x 0 | $0,0
2 | 15.0 x 0.5 x 1 | $7,5
3 | 15.0 x 0.5 x 1 | $7,5
4 | 15.0 x 0.5 x 2 | $15,0
5 | 15.0 x 0.5 x 2 | $15,0
6 | 15.0 x 0.5 x 3 | $22,5
17 | 15.0 x 0.5 x 8 | $60,0


Installation
------------

Add spree_second_units to your Gemfile:

```ruby
gem 'spree_second_units'
```

Bundle your dependencies and run the installation generator:

```shell
bundle
bundle exec rails g spree_second_units:install
```

Testing
-------

First bundle your dependencies, then run `rake`. `rake` will default to building the dummy app if it does not exist, then it will run specs. The dummy app can be regenerated by using `rake test_app`.

```shell
bundle
bundle exec rake
```

When testing your applications integration with this extension you may use it's factories.
Simply add this require statement to your spec_helper:

```ruby
require 'spree_second_units/factories'
```

Copyright (c) 2015 [Acid Labs](http://acid.cl), released under the New BSD License
