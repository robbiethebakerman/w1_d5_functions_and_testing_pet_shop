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
  return pet_shop[:pets].count
end

# can also use .length on an array

##############

# ALTERNATIVE METHOD
# From scratch,
# rather than using built-in Ruby function .count

# def stock_count(pet_shop)
#   count = 0
#   for pet in pet_shop[:pets]
#     count += 1
#   end
#   return count
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

##############

# REFACTORED

# def find_pet_by_name(pet_shop, name)
#   for pet in pet_shop[:pets]
#     return pet if pet[:name] == name
#   end
#   return nil
# end

##############

def remove_pet_by_name(pet_shop, name)
  pet_to_remove = find_pet_by_name(pet_shop, name)
  pet_shop[:pets].delete(pet_to_remove)
end

##############

# ALTERNATIVE METHOD
# NOT using previously defined find_pet_by_name function
#
# def remove_pet_by_name(pet_shop, name)
#   for pet in pet_shop[:pets]
#     if pet[:name] == name
#       pet_shop[:pets].delete(pet)
#     end
#   end
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

def customer_can_afford_pet(customer, pet)
  if customer_cash(customer) >= pet[:price]
    true
  else
    false
  end
end

###############

# ALTERNATIVE METHOD

# def customer_can_afford_pet(customer, pet)
#   return true if customer_cash(customer) >= pet[:price]
#   return false
# end

###############

# SELL_PET_TO_CUSTOMER - STEPS NEEDED

# find pet
# check customer funds
# if sufficient funds
  # remove pet from shop - remove_pet_by_name
  # add pet to customer - add_pet_to_customer
  # remove funds from customer - remove_customer_cash
  # add funds to shop - add_or_remove_cash
  # increment_pets_sold value - increase_pets_sold
# if insufficient funds
  # return error - insufficient funds
# if pet not found
  # return error - pet not found

################

def sell_pet_to_customer(pet_shop, pet, customer)
  if pet == nil
    "No pet found. Please define a valid pet."
    # E.g., user tries to find_pet_by_name and it returns nil, then tries to run sell_pet_to_customer
  elsif find_pet_by_name(pet_shop, pet[:name]) == nil
    "Pet is not found in this pet shop. Either no valid pet defined or pet is in a different pet shop."
    # E.g., user tries to use a pet not in the pet_shop hash (e.g., @new_pet)
  elsif customer_can_afford_pet(customer, pet) == false
    "Customer cannot afford pet."
  else
    add_pet_to_customer(customer, pet)
    remove_pet_by_name(pet_shop, pet[:name])
    # Not used in test, but if pet is sold it should no longer be in the shop
    remove_customer_cash(customer, pet[:price])
    add_or_remove_cash(pet_shop, pet[:price])
    increase_pets_sold(pet_shop, 1)
  end
end

##############

# REFACTORED

# def sell_pet_to_customer(pet_shop, pet, customer)
#   return "No pet found. Please define a valid pet." if pet == nil
#     # E.g., user tries to find_pet_by_name and it returns nil, then tries to run sell_pet_to_customer
#   return  "Pet is not found in this pet shop. Either no valid pet defined or pet is in a different pet shop." if find_pet_by_name(pet_shop, pet[:name]) == nil
#     # E.g., user tries to use a pet not in the pet_shop hash (e.g., @new_pet)
#   return "Customer cannot afford pet." if !customer_can_afford_pet(customer, pet)
#   add_pet_to_customer(customer, pet)
#   remove_pet_by_name(pet_shop, pet[:name])
#     # Not used in test, but if pet is sold it should no longer be in the shop
#   remove_customer_cash(customer, pet[:price])
#   add_or_remove_cash(pet_shop, pet[:price])
#   increase_pets_sold(pet_shop, 1)
# end

###############
