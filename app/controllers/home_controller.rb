require 'csv'

class HomeController < ApplicationController
  def index
    @structures = Structure.all
    @partners = Partner.all
    @activities = Activity.all
    @seniors = Senior.all
    @participations = Participation.all
    @term = params[:term]
    @structures = @term.blank? ? Structure.all : Structure.where("name ILIKE (?)", "%#{@term}%")
    @partners = @term.blank? ? Partner.all : Partner.where("name ILIKE (?)", "%#{@term}%")
  end

  def export_data
    total_participations = Partner.all.count
    total_seniors = Senior.all.count

    average_participations_per_senior = total_seniors > 0 ? total_participations.to_f / total_seniors : 0

    data = [
      ["", "Nombre de ... cet année ", "Moyenne sur le mois"],
      ["Ateliers", Activity.all.count, ""],
      ["Partenaires", Partner.all.count, ""], 
      ["Seniors", Senior.all.count, average_participations_per_senior], 
      ["Participations", Partner.all.count, ""]
    ]

    respond_to do |format|
      format.csv do
        filename = ['data', Date.today].join(' ')
        csv_data = CSV.generate do |csv|
          data.each { |row| csv << row }
        end
        send_data csv_data, filename: filename, content_type: 'text/csv'
      end
    end
  end
end
