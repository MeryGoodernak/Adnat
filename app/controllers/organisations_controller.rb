class OrganisationsController < ApplicationController
  before_action :set_organisation, only: %i[show edit update destroy join leave]

  def index
    @organisations = Organisation.all
    @organisation = Organisation.new
  end

  def show
  end

  def create
    @organisation = Organisation.new(organisation_params)
    if @organisation.save
      redirect_to organisations_path, notice: "Organisation was successfully added."
    else
      render organisations_path, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @organisation.update(organisation_params)
      redirect_to @organisation, notice: 'Organisation was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @organisation.destroy
    redirect_to organisations_path, status: :see_other, notice: "Organisation was successfully deleted."
  end

  def leave
    @organisation.users.delete(current_user)
    redirect_to organisations_path
  end

  def join
    current_user.update!(organisation: @organisation)
    redirect_to organisation_path(@organisation)
  end

  private

  def organisation_params
    params.require(:organisation).permit(:name, :hourly_rate)
  end

  def set_organisation
    @organisation = Organisation.find(params[:id])
  end
end
