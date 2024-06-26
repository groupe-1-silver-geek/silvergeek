require 'csv'

class HomeController < ApplicationController
  def index
    @structures = Structure.accessible_by(current_ability)
    @partners = Partner.all
    @activities = Activity.accessible_by(current_ability)
    @seniors = Senior.accessible_by(current_ability)
    @participations = Participation.accessible_by(current_ability)
    @term = params[:term]
    @structures = @term.blank? ? @structures : @structures.where("name ILIKE (?)", "%#{@term}%")
    @partners = @term.blank? ? @partners : @partners.where("name ILIKE (?)", "%#{@term}%")
  end

  def export_data
    total_participations = Participation.all.count
    total_seniors = Senior.all.count

    average_participations_per_senior = total_seniors > 0 ? total_participations.to_f / total_seniors : 0

    data = [
      ["", "Nombre de ... cet année ", "Moyenne sur le mois"],
      ["Ateliers", Activity.all.count, ""],
      ["Partenaires", Partner.all.count, ""], 
      ["Seniors", Senior.all.count, average_participations_per_senior], 
      ["Participations", Participation.all.count, ""]
    ]

    respond_to do |format|
      format.csv do
        filename = "data_#{Date.today.strftime('%Y-%m-%d')}.csv"
        csv_data = CSV.generate do |csv|
          data.each { |row| csv << row }
        end
        send_data csv_data, filename: filename, content_type: 'text/csv'
      end
    end
  end
end
