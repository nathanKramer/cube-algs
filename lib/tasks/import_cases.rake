require 'csv'

desc 'Import cases based on diagrams'
task import_cases: :environment do
  puts 'WARNING: this will reset all cases'
  print 'Are you sure you want to continue? [y/N] '
  abort('Aborting...') unless $stdin.gets.downcase.chomp == 'y'

  Algorithm.delete_all
  Case.delete_all

  # Import from CSV...
  csv_text = File.read('data/cases.csv')
  csv = CSV.parse(csv_text, headers: true)
  csv.each do |row|
    row_hash = row.to_hash.symbolize_keys.except(:image)
    if row_hash[:algorithm]
      c = Case.create!(row_hash.except([:algorithm, :algorithm_notes]))
      Algorithm.create!(
        case: c,
        algorithm: row_hash[:algorithm],
        description: row_hash[:algorithm_notes],
        angle: '0'
      )
    end
  end

  puts "Imported: #{Case.count} cases"

  Case.group(:case_type).count.each do |case_type, count|
    puts "- #{case_type}: #{count}"
  end
end
