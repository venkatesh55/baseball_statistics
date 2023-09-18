class PlayersController < ApplicationController
  helper_method :sort_column, :sort_direction, :sort_year
  
  def index
    season = params[:year] ? Season.find_by(year: params[:year]) : Season.first
    @players = season.players.order(sort_column + " " + sort_direction).paginate(page: params[:page], per_page: 25) if season
    @years = Season.all.map(&:year)
  end

  private
  
  def sort_column
    Player.column_names.include?(params[:sort]) ? params[:sort] : "avg"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

  def sort_year
    Season.all.map(&:year).include?(params[:year]) ? params[:year] : Season.first.year
  end

  #git_training
end