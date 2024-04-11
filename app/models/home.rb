class Home < ApplicationRecord
    def self.to_csv
      CSV.generate(headers: true) do |csv|
        csv << ["Structure Name", "Partner Name", "Activity Name", "Senior Name"] # Ajoutez les en-têtes CSV nécessaires
  
        all.each do |home|
          csv << [home.structure.name, home.partner.name, home.activity.name, home.senior.name] # Ajoutez les données que vous souhaitez exporter
        end
      end
    end
  end
  