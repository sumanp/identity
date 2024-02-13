namespace :import do
  desc "Import data from JSON file"
  # Run: rake "import:data[your_path/data.json]"
  task :data, [:file_path] => :environment do |_, args|
    json_file_path = args[:file_path]
    
    unless json_file_path && File.exist?(json_file_path)
      puts "Error: JSON file not found at the specified path."
      next
    end

    begin
      json_data = File.read(json_file_path)
      data = JSON.parse(json_data)

      ActiveRecord::Base.transaction do
        data.each do |item|
          person = Person.find_or_initialize_by(name: item['name'])
          person.save!

          details_params = item['info'].slice('title', 'age', 'phone', 'email')
          details_params['person_id'] = person.id
          Detail.create!(details_params)
        end
      end

      puts "Data imported successfully!"
    rescue JSON::ParserError => e
      puts "Error parsing JSON: #{e.message}"
    rescue StandardError => e
      puts "An error occurred: #{e.message}"
    end
  end
end