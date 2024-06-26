class ActivitiesController < ApplicationController
  before_action :set_activity, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  # actions of admin and partner



  # GET /activities or /activities.json
  def index
    @activities = Activity.all
    @number_activities = Activity.count
  end

  def show_participations
    @activity = Activity.find(params[:id])
    @participations = @activity.participations
    @seniors = Senior.find(@participations.map(&:senior_id))
  end


  # GET /activities/1 or /activities/1.json
  def show
  end

  # GET /activities/new
  def new
    @activity = Activity.new
    @devices = Device.all
    @games = Game.all
  end

  # GET /activities/1/edit
  def edit
  end

  # POST /activities or /activities.json
  def create
    @activity = Activity.new(activity_params)

    respond_to do |format|
      if @activity.save
        senior_ids = params[:activity][:senior_ids] || []
        senior_ids.each do |senior_id|
          Participation.create(activity: @activity, senior_id: senior_id)
        end
        format.html { redirect_to activity_url(@activity), notice: "L'atelier a été ajouté avec succès." }
        format.json { render :show, status: :created, location: @activity }
      else
        format.html {
          @devices = Device.all
          @games = Game.all
          @structures = Structure.accessible_by(current_ability)
          render :new, status: :unprocessable_entity
          
        }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /activities/1 or /activities/1.json
  def update
    respond_to do |format|
      if @activity.update(activity_params)
        @activity.participations.destroy_all
        senior_ids = params[:activity][:senior_ids] || []
        senior_ids.each do |senior_id|
          Participation.create(activity: @activity, senior_id: senior_id)
        end
        format.html { redirect_to activity_url(@activity), notice: "L'atelier a été enregistrée avec succès." }
        format.json { render :show, status: :ok, location: @activity }
      else
        format.html {
          @devices = Device.all
          @games = Game.all
          @structures = Structure.accessible_by(current_ability)
          render :edit, status: :unprocessable_entity
        }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activities/1 or /activities/1.json
  def destroy
    @activity.destroy!

    respond_to do |format|
      format.html { redirect_to activities_url, notice: "L'atelier a été supprimée avec succès." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activity
      @activity = Activity.find(params[:id])
    end

    def set_participation
      @participation = Participation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def participation_params
      params.require(:participation).permit(:activity_id, :senior_id)
    end

    def activity_params
      params.require(:activity).permit(:name, :date, :description, :duration, :game_id, :device_id, :structure_id, :otherDevice)
    end



end