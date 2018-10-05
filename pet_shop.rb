def pet_shop_name(pet_shop)
  return pet_shop[:name]
end

def total_cash(pet_shop)
  return pet_shop[:admin][:total_cash]
end

def add_or_remove_cash(pet_shop, amount)
  pet_shop[:admin][:total_cash] += amount
end

def pets_sold(pet_shop)
  return pet_shop[:admin][:pets_sold]
end

def increase_pets_sold(pet_shop, no_of_pets)
  pet_shop[:admin][:pets_sold] += no_of_pets
end

def stock_count(pet_shop)
  count = 0
  for pet in pet_shop[:pets]
    count += 1
  end
  return count
end

##############

# ALTERNATIVE METHOD
# Using built-in Ruby function .count

# def stock_count(pet_shop)
#   return pet_shop[:pets].count
# end

##############

def pets_by_breed(pet_shop, breed)
  pets = []
    for pet in pet_shop[:pets]
      pets.push(pet) if pet[:breed] == breed
    end
  return pets
end

def find_pet_by_name(pet_shop, name)
  pet_by_name = nil
  for pet in pet_shop[:pets]
    pet_by_name = pet if pet[:name] == name
  end
  return pet_by_name
end

def remove_pet_by_name(pet_shop, name)
  for pet in pet_shop[:pets]
    if pet[:name] == name
      pet_shop[:pets].delete(pet)
    end
  end
end

##############

# ALTERNATIVE METHOD
# Using previously defined find_pet_by_name function

# def remove_pet_by_name(pet_shop, name)
#   pet_to_remove = find_pet_by_name(pet_shop, name)
#   pet_shop[:pets].delete(pet_to_remove)
# end

##############

def add_pet_to_stock(pet_shop, new_pet)
  pet_shop[:pets].push(new_pet)
end

def customer_cash(customer)
  return customer[:cash]
end

def remove_customer_cash(customer, amount)
  customer[:cash] -= amount
end

def customer_pet_count(customer)
  return customer[:pets].count
end

def add_pet_to_customer(customer, new_pet)
  customer[:pets].push(new_pet)
end
