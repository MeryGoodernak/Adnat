class OrganisationsController < ApplicationController
  before_action :set_organisation, only: %i[show edit update destroy]

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
  end

  def destroy
  end

  private

  def organisation_params
    params.require(:organisation).permit(:name, :hourly_rate)
  end

  def set_organisation
    @organisation = Organisation.find(params[:id])
  end
end
