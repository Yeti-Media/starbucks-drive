namespace :import do
  desc "import all locations from csv"
  task :locations => :environment do
    Location.delete_all
    require 'csv'
    CSV.foreach(File.join(Rails.root, 'lib', 'assets', "locations.csv")) do |row|
      puts "Processing store number #{row[2]}: #{row[3]}"
      l = Location.create!(store_id: row[2],
                      name: row[3],
                      address: row[4],
                      city: row[5],
                      state: row[6],
                      zip_code: row[7],
                      phone_number: row[8])
      puts l.coords.to_s
    end
  end
end
