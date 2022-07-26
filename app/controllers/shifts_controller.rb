class ShiftsController < ApplicationController
  before_action :set_organisation, only: %I[index create update destroy]
  before_action :set_shift, only: %I[update destroy]

  def index
    @shifts = @organisation.users.map(&:shifts).flatten
    @shift = Shift.new
  end

  def create
    @shift = Shift.new(shift_params)
    @shift.user = current_user
    @shift.organisation = @organisation
    if @shift.save
      redirect_back fallback_location: organisation_shifts_path(@organisation)
    else
      render organisation_shifts_path(@organisation), status: :unprocessable_entity
    end
  end

  def update

  end

  def destroy
    @shift.destroy
    redirect_to organisation_shifts_path(@organisation), status: :see_other, notice: "Shift was successfully deleted."
  end

  private

  def set_organisation
    @organisation = Organisation.find(params[:organisation_id])
  end

  def set_shift
    @shift = Shift.find(params[:id])
  end

  def shift_params
    params.require(:shift).permit(:shift_date, :start_time, :end_time, :break_length)
  end
end
