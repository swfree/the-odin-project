#Methods convert between Fahrenheit and Celsius

def ftoc(temperature)
  (temperature - 32) * 5 / 9
end

def ctof(temperature) #Includes special case for body temperature
  temperature == 37 ? (temperature * 9.0 / 5.0 + 32.0) : (temperature * 9 / 5 + 32)
end