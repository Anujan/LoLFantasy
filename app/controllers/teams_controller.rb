class TeamsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_team, only: [:show, :edit, :update, :destroy, :buy, :sell, :manage]
  before_action :check_user_priviledges, only: [:edit, :destroy, :update, :buy, :sell, :manage]

  # GET /teams
  # GET /teams.json
  def index
    @teams = Team.all
  end

  # GET /teams/1
  # GET /teams/1.json
  def show
  end

  # GET /teams/new
  def new
    @team = Team.new
  end

  # POST /teams
  # POST /teams.json
  def create
    league = League.find(params[:league])
    if (league.blank?)
      flash[:notice] = "The league you're trying to join doesn't exist."
      redirect_to :back
    else
      @team = league.teams.find_by_user_id(current_user.id)
      if (@team.nil?)
        @team = league.teams.new(team_params)
        @team.user_id = current_user.id
        respond_to do |format|
          if @team.save
            format.html { redirect_to @team, notice: 'Team was successfully created.' }
            format.json { render action: 'show', status: :created, location: @team }
          else
            format.html { render action: 'new' }
            format.json { render json: @team.errors, status: :unprocessable_entity }
          end
        end
      else
        redirect_to @team, error: 'You already have a team in this league'
      end
    end
  end

  def buy
    @player = Player.find_by_name(params[:player])
    if (@team.budget >= @player.price)
      success = @team.buy(@player)
      status = {success: success, message: success ? "#{@player.name} has been added to your roster!" : "You already have someone else playing #{@player.role} for you. Sell him, and try again!"}
    else
      status = {success: false, message: "You can't afford to buy this player!"}
    end
    respond_to do |format|
      format.html { 
        if (status[:success])
          flash[:notice] = status[:message]
        else
          flash[:error] = status[:message]
        end
          redirect_to manage_team_path(@team)
      }
      format.json { render json: status.to_json }    
    end
  end

  def sell
    @player = Player.find_by_name(params[:player])
    success = @team.sell(@player)
    status = {success: success, message: success ? "#{@player.name} has been sold!" : "You don't own #{@player.role}."}
    respond_to do |format|
      format.html { 
        if (status[:success])
          flash[:notice] = status[:message]
        else
          flash[:error] = status[:message]
        end
        redirect_to manage_team_path(@team)
      }
      format.json { render json: status.to_json }    
    end
  end

  def manage
  end

  # DELETE /teams/1
  # DELETE /teams/1.json
  def destroy
    @team.destroy
    respond_to do |format|
      format.html { redirect_to teams_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params[:id])
    end

    def check_user_priviledges
      if (@team.user != current_user)
        flash[:error] = "You do not have permission to perform this action!"
        redirect_to :back
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def team_params
      params.require(:team).permit(:user_id, :name)
    end
end
