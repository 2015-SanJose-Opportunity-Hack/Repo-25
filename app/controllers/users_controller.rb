class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to :back, :alert => "Access denied."
    end
  end

  def index_pls
    @pls = ProgramLeader.all
  end

  def search_pls
    data = []
    result = ProgramLeader.select(:id, :name).where(site_id: params[:site_id].to_i)
    result.each do |pl|
      data << [pl.id, pl.name]
    end
    render json: {data: data}
  end
private
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:schedule).permit(:site_id, :user_id, :start_date, :curriculum_id)
    end

end
