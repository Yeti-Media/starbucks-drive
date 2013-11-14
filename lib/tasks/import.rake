namespace :import do
  desc "import all locations from csv"
  task :locations => :environment do
    Location.delete_all
    require 'csv'
    CSV.foreach(File.join(Rails.root, 'lib', 'assets', "locations.csv")) do |row|
      puts "Processing store number #{row[1]}: #{row[2]}"
      l = Location.create!(store_id: row[0],
                      name: row[1],
                      address: row[2],
                      city: row[3],
                      state: row[4],
                      zip_code: row[5],
                      phone_number: row[6])
      puts l.coords.to_s
      sleep 1.seconds
    end
  end
end
