def fill_template(template, data)
  template_filled = template.gsub('FIRST_NAME', data[:name])
          .gsub('LEGISLATORS', data[:legislators].join(', '))

  puts template_filled
end
