class PlayersController < ApplicationController
  helper_method :sort_column, :sort_direction
  
  def index
    @players = Player.order(sort_column + " " + sort_direction).paginate(page: params[:page], per_page: 25)
  end

  private
  
  def sort_column
    Player.column_names.include?(params[:sort]) ? params[:sort] : "avg"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end