def fill_template(template, data)
  template_filled = template.gsub('FIRST_NAME', data[:name])
          .gsub('LEGISLATORS', data[:legislators].join(', '))

  File.open("output/#{data[:name]}.html", 'w+') { |file| file.write template_filled }
  puts template_filled
end
