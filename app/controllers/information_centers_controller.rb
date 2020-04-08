class InformationCentersController < ApplicationController
  before_action :authenticate_user!

  def index
    @information_center = InformationCenter.find_or_initialize_by(id: 1)
  end

  def new
  end

  def create
  end

  def edit
  end
end
