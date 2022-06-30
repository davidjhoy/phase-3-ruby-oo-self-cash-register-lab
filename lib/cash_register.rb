
require 'pry'

class CashRegister
    attr_accessor :discount, :total, :items, :prices, :transactions
    def initialize (discount = 0)
        self.total = 0 
        self.items = []
        self.prices = []
        self.discount = discount 
        self.transactions = {}
    end

    def total 
        @total 
    end

    def add_item (title, price, quantity = 1)
        self.total += price * quantity
        self.transactions[title] = {:quantity => quantity, :price => price}
        if quantity == 1
            self.items << title
            self.prices << price
            
        elsif quantity >= 1
           
            quantity.times do 
                self.items << title
                self.prices << price
            end

        elsif quantity <1
            return nil
        end
        
      
        

    end 

    def apply_discount 
        if self.discount != 0
            self.total = self.total * (100-self.discount)/100
            return "After the discount, the total comes to $#{@total}."
        else
            return "There is no discount to apply."
        end
    end

    def items
        @items
    end

    def void_last_transaction
        if self.transactions.keys.length > 1

            self.total = self.total - (self.transactions["#{transactions.keys[-1]}"][:quantity] * self.transactions["#{transactions.keys[-1]}"][:price])
            
        elsif self.transactions.keys.length == 1
            self.total = 0.0
        end
        transactions.delete("#{transactions.keys[-1]}")
   
    end
end


