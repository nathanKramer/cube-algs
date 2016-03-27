desc 'Import cases based on diagrams'
task :import_cases => :environment do
  puts "WARNING: this will reset all cases"
  print "Are you sure you want to continue? [y/N] "
  abort("Aborting...") unless $stdin.gets.downcase.chomp == 'y'

  Case.delete_all

  %w( oll pll ).each do |case_type|
    Dir[Rails.root.join("app/assets/images/#{case_type.pluralize}/*")].each do |image|
      diagram_url = case_type.pluralize + "/" + File.basename(image)
      Case.create(case_type: case_type, diagram: diagram_url, order_of_rotational_symmetry: 4)
    end
  end

  puts "Imported: #{Case.count} cases"

  Case.group(:case_type).count.each do |case_type, count|
    puts "- #{case_type}: #{count}"
  end
end