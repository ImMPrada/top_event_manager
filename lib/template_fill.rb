require 'erb'

def fill_template(template, data)
  template_filled = template.gsub('FIRST_NAME', data[:name]).gsub('LEGISLATORS', data[:legislators].join(', '))

  File.open("output/#{data[:name]}.html", 'w+') { |file| file.write template_filled }
end

def fill_erb_template(template, data)
  name = data[:name]
  zipcode = data[:zipcode]
  legislators = data[:legislators]

  template_filled = ERB.new(template).result(binding)
  File.open("output/#{data[:name]} -- erb.html", 'w+') { |file| file.write template_filled }
end
