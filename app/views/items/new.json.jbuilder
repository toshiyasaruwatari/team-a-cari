json.array! @childrens.each do |children|
  json.id  children.id
  json.name  children.name
  json.ancestry  children.ancestry
end
