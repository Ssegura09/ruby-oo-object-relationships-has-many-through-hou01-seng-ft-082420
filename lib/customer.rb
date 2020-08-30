require 'pry'
class Customer

    attr_accessor :name, :age
    
    @@all = []

    def initialize (name, age)
        @name = name
        @age = age
        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(waiter, total, tip=0)
        # initializes a meal using the current
        # Customer instance, provided Waiter instance and a total and tip
        Meal.new(waiter, self, total, tip)
    end
    
    def meals
        #returns an Array of Meal instances associated with this customer
        Meal.all.select do |meal|
            meal.customer == self
        end
    end
    
    def waiters
        # returns an Array of Waiter instances associated with
        # this customer's meals
        meals.map do |meal|
            meal.waiter
        end
    end
  
end