require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  item_to_find = String.new
  
  holiday_hash.each_pair { |season, holiday_list|
    holiday_list.each_pair { |holiday_name, items|
      return items[1] if items.length > 1 && holiday_name == :fourth_of_july
    } 
  }  
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays
  holiday_hash.each_pair { |season, holiday_list|
    holiday_list.each_pair { |holiday_name, items|
      items.push( supply ) if holiday_name == :christmas || holiday_name == :new_years
    } 
  }  
end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash.each_pair { |season, holiday_list|
    holiday_list.each_pair { |holiday_name, items|
      items.push( supply ) if holiday_name == :memorial_day
    } 
  }  
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
  holiday_hash[season] = { holiday_name => supply_array} 
  holiday_hash
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  holiday_hash[:winter].values.flatten
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
  holiday_hash.each_pair { |season, holiday_list|
    puts season.to_s.capitalize + ":"
    holiday_list.each_pair { |holiday_name, items|
      holiday_supplies = String.new
      items.each { |item| items.find_index( item ) == 0 ? holiday_supplies = item : holiday_supplies += ", #{item}" }
      puts "  " + format_holiday_name( holiday_name ) + ": " + holiday_supplies
    } 
  }  
end

def format_holiday_name ( holiday_name )
  formatted_name = holiday_name.to_s.capitalize
  count = 0
  while count < formatted_name.length do
    if formatted_name[count] == "_"
      formatted_name[count] = " "
      formatted_name[count + 1] = formatted_name[count + 1].upcase
    end
    count += 1
  end
  formatted_name
end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  names_to_return = Array.new
  holiday_hash.each_pair { |season, holiday_list|
    holiday_list.each_pair { |holiday_name, items|
      names_to_return.push( holiday_name ) if items.include?( "BBQ" )
    } 
  }  
  names_to_return
end







