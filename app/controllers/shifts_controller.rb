class ShiftsController < ApplicationController
  before_action :set_organisation, only: %I[index create]

  def index
    @shifts = @organisation.users.map(&:shifts).flatten
    @shift = Shift.new
  end

  def create
    @shift = Shift.new(shift_params)
    @shift.user = current_user
    @shift.organisation = @organisation
    if @shift.save
      redirect_to organisation_shifts_path(@organisation)
    else
      render organisation_shifts_path(@organisation), status: :unprocessable_entity
    end
  end

  def destroy
    @shift.destroy
    redirect_to organisations_path, status: :see_other, notice: "Organisation was successfully deleted."
  end

  private

  def set_organisation
    @organisation = Organisation.find(params[:organisation_id])
  end

  def shift_params
    params.require(:shift).permit(:started_at, :ended_at, :break_length)
  end
end
