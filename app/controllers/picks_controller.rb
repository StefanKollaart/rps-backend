class PicksController < ApplicationController
  def create
    @pick = Pick.set_or_edit(params[:pick][:player_id], params[:pick][:turn_id], params[:pick][:picked])
  end

  private
  def pick_params
    params.require(:pick).permit(:player_id, :turn_id, :picked)
  end
end
