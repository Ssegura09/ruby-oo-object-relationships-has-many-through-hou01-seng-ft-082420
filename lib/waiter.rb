class Waiter

    attr_accessor :name, :years

    @@all = []

    def initialize(name, years)
        @name = name
        @years = 0
        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(customer, total=0, tip=0)
        Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.select do |meal|
            meal.waiter == self
        end
    end

    def best_tipper
        # returns the Customer instance associated
        # with the meal that received the largest tip 
        #<=> compares arrays
        highest_tip = meals.max do |meal_a, meal_b|
            meal_a.tip <=> meal_b.tip
        end
          highest_tip.customer
    end

end