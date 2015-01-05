module SpreeSecondUnits
  class Engine < Rails::Engine
    require 'spree/core'
    isolate_namespace Spree
    engine_name 'spree_second_units'

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), '../../app/**/*_decorator*.rb')) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end
    end

    initializer 'spree.register.calculators.second_units', after: 'spree.register.calculators' do |app|
      app.config.spree.calculators.promotion_actions_create_item_adjustments << Spree::Calculator::SecondUnits
    end

    config.to_prepare &method(:activate).to_proc
  end
end
