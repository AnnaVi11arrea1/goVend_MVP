
  namespace :csv do
    desc "Import data from CSV into Users"
    task import: :environment do
      require 'csv'
      
      csv_file = File.read(Rails.root.join('lib', 'csvs', 'events.csv')) # Adjust the path
      csv = CSV.parse(csv_file, :headers => true, :encoding => 'ISO-8859-1')

      csv.each do |row|
        Event.find_or_create_by!(
          name: row['name'],
          application_due_at: row['application_due_at'],
          application_link: row['application_link'],
          information: row['information'],
          photo: row['photo'],
          started_at: row['started_at'],
          tags: row['tags'],
          address: row['address'],
          host_id: row['host_id']
        ) 
      end
  
      puts "Import completed!"
    end
  end
