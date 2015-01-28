json.entries @entries do |entry|
  json.id entry.id
  json.date entry.date
  json.note entry.note
  json.author entry.author
end
