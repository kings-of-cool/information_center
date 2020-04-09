class InformationCentersController < ApplicationController
  before_action :authenticate_user!

  def index
    # InformationCenterは唯一のためid: 1を指定
    # @information_center = InformationCenter.find_or_initialize_by(id: 1)

    # これは開発用。開発するとid: 1じゃないやつもできるから
    @information_center = InformationCenter.first || InformationCenter.new
  end

  def new
    @information_center = InformationCenter.new
  end

  def create
    @information_center = InformationCenter.new(information_center_params)
    if @information_center.save
      redirect_to information_centers_url
    else
      render 'new'
    end
  end

  def edit
  end

  private

  def information_center_params
    params.require(:information_center).permit(:name, :tel)
  end
end
