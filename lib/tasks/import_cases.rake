require 'csv'

desc 'Import cases based on diagrams'
task import_cases: :environment do
  puts 'WARNING: this will reset all cases'
  print 'Are you sure you want to continue? [y/N] '
  abort('Aborting...') unless $stdin.gets.downcase.chomp == 'y'

  Solution.delete_all
  Case.delete_all

  # Import from CSV...
  csv_text = File.read('data/cases.csv')
  csv = CSV.parse(csv_text, headers: true)
  csv.each do |row|
    row_hash = row.to_hash.symbolize_keys.except(:image)
    if row_hash[:solution]
      c = Case.create!(row_hash)
      Solution.create!(
        case: c,
        algorithm: row_hash[:solution],
        description: row_hash[:solution_notes],
        angle: '0'
      )
    end
  end

  puts "Imported: #{Case.count} cases"

  Case.group(:case_type).count.each do |case_type, count|
    puts "- #{case_type}: #{count}"
  end
end
