class Admin::PartnersController < Admin::ApplicationController
  load_and_authorize_resource

  # GET /partners or /partners.json
  def index
    @term = params[:term]
    @partners = @term.blank? ? @partners
                             : @partners.where("name ILIKE (?)", "%#{@term}%")

  end

  # GET /partners/1 or /partners/1.json
  def show

  end

  def show_structures
    @partner = Partner.find(params[:id])
    @structures = @partner.structures
  end


  # GET /partners/new
  def new
    @regions = Region.all
  end

  # GET /partners/1/edit
  def edit
    @regions = Region.all
  end

  # POST /partners or /partners.json
  def create
    respond_to do |format|
      if @partner.save
        format.html { redirect_to admin_partner_url(@partner), notice: "Partner was successfully created." }
        format.json { render :show, status: :created, location: @partner }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @partner.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /partners/1 or /partners/1.json
  def update
    respond_to do |format|
      if @partner.update(partner_params)
        format.html { redirect_to admin_partner_url(@partner), notice: "Partner was successfully updated." }
        format.json { render :show, status: :ok, location: @partner }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @partner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /partners/1 or /partners/1.json
  def destroy
    @partner.destroy!

    respond_to do |format|
      format.html { redirect_to admin_partners_url, notice: "Partner was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    # Only allow a list of trusted parameters through.
    def partner_params
      params.require(:partner).permit(:name)
    end
end
