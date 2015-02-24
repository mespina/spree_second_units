module Spree
  class Calculator
    class SecondUnits < Calculator
      preference :percent, :decimal, default: 0
      preference :units,   :integer, default: 2

      validates :preferred_units, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 2 }

      def self.description
        Spree.t(:second_units)
      end

      # object is an Spree::LineItem instance
      def compute(object=nil)
        if preferred_units.nil? or preferred_units <= 0
          units = 2
        else
          units = preferred_units
        end

        promotional_units = object.quantity / units

        (object.price * promotional_units * preferred_percent) / 100
      end
    end
  end
end
