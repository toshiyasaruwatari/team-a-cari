json.array! @children.each do |child|
  json.id  child.id
  json.name  child.name
  json.ancestry  child.ancestry
end
