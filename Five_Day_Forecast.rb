require "http"

puts "Welcome to the Five Day Forecast App!"
puts

puts "Enter the city you would like to forecast:"
puts
user_input = gets.chomp

response = HTTP.get("https://api.openweathermap.org/data/2.5/forecast?q=#{user_input}&appid=a55c389b1693b0697240d7290c19021b&units=imperial")

five_day_forecast = JSON.parse(response.body)
puts
puts "Five Day Forecast"

puts

index = 0
day = 1

#40 day forecast  five_day_forecast["list"].length
while index < 5
  puts
  puts "Day #{day}"
  puts "Temperature"
  pp five_day_forecast["list"][index]["main"]["temp"]

  puts "Feels Like:"
  pp five_day_forecast["list"][index]["main"]["feels_like"]

  puts "Max Tempurature:"
  pp five_day_forecast["list"][index]["main"]["temp_max"]

  puts "Min Tempurature:"
  pp five_day_forecast["list"][index]["main"]["temp_min"]

  puts "Description"
  puts five_day_forecast["list"][index]["weather"][0]["description"].capitalize
  puts

  day += 1
  index += 1
end
