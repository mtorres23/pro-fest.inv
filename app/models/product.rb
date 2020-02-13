class Product < ApplicationRecord
    belongs_to :account

    # attr_accessor
    before_save do
        if self.highest_recorded_price and self.units_per_item
            self.cost_per_unit = highest_recorded_price / units_per_item
        end
    end
end
