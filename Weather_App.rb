require "http"

puts "Welcome to the Weather App!"

puts

puts "Which city would you like to forecast?"

loop do
  user_city = gets.chomp
  break if user_city.upcase == "DONE"

  puts "Would you like to view in Celsius or Fahrenheit?"

  user_unit = gets.chomp

  if user_unit.downcase == "fahrenheit"
    response = HTTP.get("https://api.openweathermap.org/data/2.5/weather?q=#{user_city}&units=imperial&appid=908fa3e12ebbaf46f3a5865079b5f141&units=imperial")
  elsif user_unit.downcase == "celsius"
    response = HTTP.get("https://api.openweathermap.org/data/2.5/weather?q=#{user_city}&units=metric&appid=908fa3e12ebbaf46f3a5865079b5f141&units=metric")
  else
    puts "Invalid Entry"
  end

  weather_data = JSON.parse(response.body)

  puts "Temperature"
  pp weather_data["main"]["temp"]

  puts "Descriptions"
  puts weather_data["weather"][0]["description"].capitalize

  puts "Feels Like:"
  pp weather_data["main"]["feels_like"]

  puts "Temperature Low"
  pp weather_data["main"]["temp_min"]

  puts "Temperature High"
  pp weather_data["main"]["temp_max"]

  puts "Visibility"
  pp weather_data["visibility"]

  puts "Select another city you would like to forecast? If you are done please enter 'DONE'."
end
