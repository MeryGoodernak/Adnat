class OrganisationsController < ApplicationController
  def index
    @organisations = Organisation.all
    @organisation = Organisation.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
