@customers = [
  {
    name: "Alice",
    pets: [],
    cash: 1000
  },
  {
    name: "Bob",
    pets: [],
    cash: 50
  }
]

@new_pet = {
  name: "Bors the Younger",
  pet_type: :cat,
  breed: "Cornish Rex",
  price: 100
}

@pet_shop = {
  pets: [
    {
      name: "Sir Percy",
      pet_type: :cat,
      breed: "British Shorthair",
      price: 500
    },
    {
      name: "King Bagdemagus",
      pet_type: :cat,
      breed: "British Shorthair",
      price: 500
    },
    {
      name: "Sir Lancelot",
      pet_type: :dog,
      breed: "Pomsky",
      price: 1000,
    },
    {
      name: "Arthur",
      pet_type: :dog,
      breed: "Husky",
      price: 900,
    },
    {
      name: "Tristan",
      pet_type: :dog,
      breed: "Basset Hound",
      price: 800,
    },
    {
      name: "Merlin",
      pet_type: :cat,
      breed: "Egyptian Mau",
      price: 1500,
    }
  ],
  admin: {
    total_cash: 1000,
    pets_sold: 0,
  },
  name: "Camelot of Pets"
}

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
  elsif find_pet_by_name(pet_shop, pet[:name]) == nil
    "Pet is not found in this pet shop. Either no valid pet defined or pet is in a different pet shop."
  elsif customer_can_afford_pet(customer, pet) == false
    "Customer cannot afford pet."
  else
    add_pet_to_customer(customer, pet)
    remove_pet_by_name(pet_shop, pet[:name])
    remove_customer_cash(customer, pet[:price])
    add_or_remove_cash(pet_shop, pet[:price])
    increase_pets_sold(pet_shop, 1)
  end
end

pet = find_pet_by_name(@pet_shop, "Dave")
customer = @customers[1]
result = sell_pet_to_customer(@pet_shop, @new_pet, customer)
p result
