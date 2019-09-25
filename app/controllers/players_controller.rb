class PlayersController < ApplicationController
  def create
    @player = Player.new(player_params)

    if @player.save
      render json: @player
    end
  end

  private
  def player_params
    params.require(:player).permit(:name)
  end
end
