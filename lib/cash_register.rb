require 'pry'

class CashRegister

    attr_accessor :total, :discount, :add_item, :prev_transaction, :items

    # initialize cash_register with total set to 0 and discount optional (defaults to 0)
    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
    end

    # accepts title and price with optional quantity (defaults to 1)
    # does not forget the previous total price and increases the total
    # adds the new items by title to the items list based on the quantity of items if added
    def add_item(title, price, quantity = 1)
        self.prev_transaction = price * quantity
        self.total += self.prev_transaction
        quantity.times do
            self.items << title
        end
    end

    # apply the discount to total price
    # subtract the discount from 100 and convert to a float to get percentage
    # multiple the percentage by the total price and convert to an integer
    # if there is no discount, display message
    def apply_discount
        if self.discount != 0
            discount_total = (100 - self.discount.to_f) / 100.0
            self.total = (self.total * discount_total).to_i
            return "After the discount, the total comes to $#{self.total}."
            # can Also do this:
            # discount_percentage = (self.discount.to_f / 100.0)
            # discount_total = discount_percentage. * self.total
            # self.total = self.total - discount_total.to_i
            # return "After the discount, the total comes to $#{self.total}."
        else
            return "There is no discount to apply."
        end
    end

    # subtract the previous transaction
    # the total from add_item will be subtracted from the
    def void_last_transaction(title, price)
        self.total -= self.prev_transaction
    end

end
