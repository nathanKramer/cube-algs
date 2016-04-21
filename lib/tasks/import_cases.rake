require 'csv'

desc 'Import cases based on diagrams'
task import_cases: :environment do
  puts 'WARNING: this will reset all cases'
  print 'Are you sure you want to continue? [y/N] '
  abort('Aborting...') unless $stdin.gets.downcase.chomp == 'y'

  Case.delete_all

  # Import based off of pngs...
  # %w( oll pll ).each do |case_type|
  #   Dir[Rails.root.join("app/assets/images/#{case_type.pluralize}/*")].each do |image|
  #     diagram_url = case_type.pluralize + "/" + File.basename(image)
  #     Case.create(case_type: case_type, diagram: diagram_url, order_of_rotational_symmetry: 4)
  #   end
  # end

  # Import from CSV...
  csv_text = File.read('data/import_cases.csv')
  csv = CSV.parse(csv_text, headers: true)
  csv.each do |row|
    Case.create!(row.to_hash)
  end

  puts "Imported: #{Case.count} cases"

  Case.group(:case_type).count.each do |case_type, count|
    puts "- #{case_type}: #{count}"
  end
end
