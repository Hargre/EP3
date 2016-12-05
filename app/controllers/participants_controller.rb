class ParticipantsController < ApplicationController
  def create
    @participant = Participant.new(participant_params)
    flash[:success] = 'Participante criado!' if @participant.save
    redirect_to group_path(@participant.group)
  end

  private
    def participant_params
      params.require(:participant).permit(:name, :email, :group_id)
    end
end
