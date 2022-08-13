class View
  def display(recipes)
    recipes.each_with_index do |recipe, index|

      done = recipe.done? ? "[X]" : "[ ]"

      puts "#{done} #{index + 1} - #{recipe.name}: #{recipe.description} - #{recipe.rating}/5 - Prep Time: #{recipe.prep_time}"
    end
  end

  def ask_recipe_name
    puts "Enter recipe name:"
    gets.chomp
  end

  def ask_recipe_description
    puts "Enter recipe description:"
    gets.chomp
  end

  def ask_recipe_rating
    puts "Enter recipe rating: (0-5)"
    gets.chomp.to_i
  end

  def ask_prep_time
    puts "Enter preparation time:"
    gets.chomp
  end

  def ask_ingredient
    puts "Enter ingredient to search:"
    gets.chomp
  end

  def ask_index
    puts "Enter recipe index:"
    gets.chomp.to_i - 1
  end
end
