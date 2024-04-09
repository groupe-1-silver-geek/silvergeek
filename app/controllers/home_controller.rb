class HomeController < ApplicationController
  def index
    @structures = Structure.all
    @partners = Partner.all
    @activities = Activity.all
    @seniors = Senior.all
    @term = params[:term]
    @structures = @term.blank? ? Structure.all
                               : Structure.where("name ILIKE (?)", "%#{@term}%")
    @partners = @term.blank? ? Partner.all
                             : Partner.where("name ILIKE (?)", "%#{@term}%")
  end



end
