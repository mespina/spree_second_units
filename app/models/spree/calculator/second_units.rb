module Spree
  class Calculator
    class SecondUnits < Calculator
      preference :percent, :decimal, default: 0

      def self.description
        Spree.t(:second_units)
      end

      # object is an Spree::LineItem instance
      def compute(object=nil)
        second_units = object.quantity / 2

        (object.price * second_units * preferred_percent) / 100
      end
    end
  end
end
