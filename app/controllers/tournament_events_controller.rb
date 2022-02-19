class TournamentEventsController < ApplicationController
  before_action :set_tournament_event, only: %i[ show edit update destroy ]



  # GET /tournament_events or /tournament_events.json
  def index
    @tournament_events = TournamentEvent.all
  end

  # GET /tournament_events/1 or /tournament_events/1.json
  def show
    #@fight_list = Fighter.find(:ids_for_fights).order(:fighter_score).reverse
    #@fight_list = Fighter.where({id: [@tournament_event.fighter_list]}).order(:fighter_score).reverse

    @dundonald_list = []
    @bryansford_list = [] 

    @tournament_entrants = []

    @tournament_event.fighter_list.each do |fighter| 
      x = Fighter.find(fighter) 
      @dundonald_list << x if x.club == "Dundonald" 
      @bryansford_list << x if x.club == "Bryansford"
    end

   @dundonald_list.sort_by!(&:fighter_score)
   @bryansford_list.sort_by!(&:fighter_score)


  end

  # GET /tournament_events/new
  def new
    @tournament_event = TournamentEvent.new
    @figher_ids = params[:selected_fighters]
    @fighters = Fighter.where("fighter_age > ?", 14).order(:fighter_name)
    @junior_fighters = Fighter.where("fighter_age < ?", 14).order(:fighter_name)

    
   
  end

  # GET /tournament_events/1/edit
  def edit
    @fight_list = Fighter.where({id: [@tournament_event.fighter_list]}).order(:fighter_score).reverse
  end



  # POST /tournament_events or /tournament_events.json
  def create
    
  
    @tournament_event = TournamentEvent.new(tournament_event_params)

    @tournament_event.fighter_list = params[:fighter_ids].map(&:to_i)

    respond_to do |format|
      if @tournament_event.save
        format.html { redirect_to @tournament_event, notice: "Tournament event was successfully created." }
        format.json { render :show, status: :created, location: @tournament_event }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tournament_event.errors, status: :unprocessable_entity }
      end
    end
   
  end

  # PATCH/PUT /tournament_events/1 or /tournament_events/1.json
  def update
    respond_to do |format|
      if @tournament_event.update(tournament_event_params)
        format.html { redirect_to @tournament_event, notice: "Tournament event was successfully updated." }
        format.json { render :show, status: :ok, location: @tournament_event }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tournament_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tournament_events/1 or /tournament_events/1.json
  def destroy
    @tournament_event.destroy
    respond_to do |format|
      format.html { redirect_to tournament_events_url, notice: "Tournament event was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tournament_event
      @tournament_event = TournamentEvent.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tournament_event_params
      params.require(:tournament_event).permit(:total_contestants, :tournament_date, :event_name, :fighters, :fighter_ids, :fighter_list)
    end
end
