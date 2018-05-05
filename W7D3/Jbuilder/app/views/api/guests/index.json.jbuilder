json.array! @guests.each do |guest|
  json.partial! 'guest', guest: guest
end
