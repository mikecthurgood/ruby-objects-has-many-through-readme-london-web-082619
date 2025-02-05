class Waiter

    attr_accessor :name, :years_of_service

    @@all

    def initialize(name, years_of_service)
        @name = name
        @years_of_service = years_of_service
        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(customer, total, tip)
        Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.select { |meal| meal.waiter == self }
    end

    def best_tipper
        best_tipped_meal = meals.max do |meal_a, meal_b|
          meal_a.tip <=> meal_b.tip
        end
       
        best_tipped_meal.customer
      end



    

end