class StructuresController < ApplicationController
  before_action :set_structure, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /structures or /structures.json
  def index
    @term = params[:term]
    @structures = @term.blank? ? Structure.all
                               : Structure.where("name ILIKE (?)", "%#{@term}%")

  end

  # GET /structures/1 or /structures/1.json
  def show

  end

  # GET /structures/new
  def new
    @structure = Structure.new
  end

  # GET /structures/1/edit
  def edit
  end

  # POST /structures or /structures.json
  def create
    @structure = Structure.new(structure_params)

    respond_to do |format|
      if @structure.save
        format.html { redirect_to structure_url(@structure), notice: "Structure was successfully created." }
        format.json { render :show, status: :created, location: @structure }
      else
        format.html {
          @regions = Region.all
          @partners = Partner.all
          render :new, status: :unprocessable_entity
        }
        format.json { render json: @structure.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /structures/1 or /structures/1.json
  def update
    respond_to do |format|
      if @structure.update(structure_params)
        format.html { redirect_to structure_url(@structure), notice: "Structure was successfully updated." }
        format.json { render :show, status: :ok, location: @structure }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @structure.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /structures/1 or /structures/1.json
  def destroy

    @structure = Structure.find(params[:id])

    Senior.where(structure_id: @structure.id).destroy_all

    Activity.where(structure_id: @structure.id).destroy_all

    @structure.destroy!

    respond_to do |format|
      format.html { redirect_to structures_url, notice: "La structure a été supprimée avec succès." }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_structure
      @structure = Structure.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def structure_params
      params.require(:structure).permit(:adress, :zipCode, :city, :partner_id, :name)
    end
end
