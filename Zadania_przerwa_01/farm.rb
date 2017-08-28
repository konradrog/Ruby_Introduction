class Animal
  def give_sound
  end
end

class Dog < Animal
  def give_sound
    puts "woof! woof!"
  end
end

class Cat < Animal
  def give_sound
    puts "miau! miau!"
  end
end

class Duck < Animal
  def give_sound
    puts "quack! quack!"
  end
end

class Goose < Animal
  def give_sound
    puts "meee! meee!"
  end
end

class Farm
  attr_accessor :animals

  def initialize(animals)
    @animals = animals
  end

  def give_sounds
    animals.each do |animal|
      animal.give_sound
    end
  end
end

farm =  Farm.new([Dog.new, Cat.new, Duck.new, Goose.new])
farm.give_sounds
