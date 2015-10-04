class AvailableSchedulesController < ApplicationController
  before_action :set_available_schedule, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /available_schedules
  # GET /available_schedules.json
  def index
    @available_schedules = AvailableSchedule.where(program_leader_id: current_user.id).all
  end

  # GET /available_schedules/1
  # GET /available_schedules/1.json
  def show
  end

  # GET /available_schedules/new
  def new
    @available_schedule = AvailableSchedule.new
  end

  # GET /available_schedules/1/edit
  def edit
  end

  # POST /available_schedules
  # POST /available_schedules.json
  def create
    @available_schedule = AvailableSchedule.new(available_schedule_params)
    @available_schedule.program_leader_id = current_user.id

    respond_to do |format|
      if @available_schedule.save
        format.html { redirect_to @available_schedule, notice: 'Available schedule was successfully created.' }
        format.json { render :show, status: :created, location: @available_schedule }
      else
        format.html { render :new }
        format.json { render json: @available_schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /available_schedules/1
  # PATCH/PUT /available_schedules/1.json
  def update
    respond_to do |format|
      if @available_schedule.update(available_schedule_params)
        format.html { redirect_to @available_schedule, notice: 'Available schedule was successfully updated.' }
        format.json { render :show, status: :ok, location: @available_schedule }
      else
        format.html { render :edit }
        format.json { render json: @available_schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /available_schedules/1
  # DELETE /available_schedules/1.json
  def destroy
    @available_schedule.destroy
    respond_to do |format|
      format.html { redirect_to available_schedules_url, notice: 'Available schedule was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_available_schedule
      @available_schedule = AvailableSchedule.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def available_schedule_params
      params.require(:available_schedule).permit(:site_id, :program_leader_id, :start_date, :end_date)
    end
end
