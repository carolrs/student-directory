array_names = [
  "array_names = [",
  "Carolina,John,Doug,Anne",
  "]",
  "",
  "array_names.each do |name|",
  "  if name == 'Carolina,John,Doug,Anne'",
  "    array_names.each { |name| puts '  ' << name.inspect << ',' }",
  "  else",
  "    puts name",
  "  end",
  "end",
]

array_names.each do |name|
  if name == 'Carolina,John,Doug,Anne'
    array_names.each { |name| puts '  ' << name.inspect << ',' }
  else
    puts name
  end
end
