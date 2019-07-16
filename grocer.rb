require "pry"
def consolidate_cart(cart)
  # code here
    new_hash = {}
  cart.each do |hash|
    hash.each do |key, val|
      hash[key][:count] = 1
        if new_hash.keys.include?(key)
        new_hash[key][:count] += 1
        else
          new_hash[key] = val
        end
    end
  end
  new_hash
  
end
 
 

def apply_coupons(cart, coupons)
  # code here
          i = 0
          count = 0
    while i < coupons.length 
    item = coupons[i]
    fruit_coup_name = coupons[i][:item]
      cart.each do |key, val|
        if key == fruit_coup_name && count == 0
              item.reject! {|x| x == :item}
              item[:price] = (item[:cost] / item[:num]).to_f
              item.reject! {|y| y == :cost}
              item[:clearance]= cart[key][:clearance]
              item[:count]= cart[key][:count]
                if cart[key][:count] >= item[:num]
                   cart[key][:count] -= item[:num]
               end
          count += 1
          
      else if key == fruit_coup_name && count >= 1 && item[:num] >= cart[key][:count]
          item[:count] += item[:num]
          count += 1
      
      end
    end
      
    end
    cart["#{fruit_coup_name} W/COUPON"] = item
i += 1

end
cart

end
  


def apply_clearance(cart)
  # code here
  cart.each do |fruit,val|
    if cart[fruit][:clearance] == true
      cart[fruit][:price] -= cart[fruit][:price]*(0.2)
      
    end 
  end
  cart
 
end

def checkout(cart, coupons)
  # code here
 i = 0
 total = 0
 while i < cart.length
    fruit_info = cart[i]
  fruit_info.each do |key, val|
    fruit_key = fruit_info[key] 
    total +=  fruit_key[:price]*fruit_key[:count]
    
    end
  end
 
 i += 1
 return total

end
