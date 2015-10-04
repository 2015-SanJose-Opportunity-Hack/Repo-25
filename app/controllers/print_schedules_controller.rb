class PrintSchedulesController < ApplicationController
  before_action :set_print_schedule, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /print_schedules
  # GET /print_schedules.json
  def index
    @print_schedules = PrintSchedule.all
  end

  # GET /print_schedules/1
  # GET /print_schedules/1.json
  def show
  end

  # GET /print_schedules/new
  def new
    @print_schedule = PrintSchedule.new
  end

  # GET /print_schedules/1/edit
  def edit
  end

  # POST /print_schedules
  # POST /print_schedules.json
  def create
    @print_schedule = PrintSchedule.new(print_schedule_params)

    respond_to do |format|
      if @print_schedule.save
        format.html { redirect_to @print_schedule, notice: 'Print schedule was successfully created.' }
        format.json { render :show, status: :created, location: @print_schedule }
      else
        format.html { render :new }
        format.json { render json: @print_schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /print_schedules/1
  # PATCH/PUT /print_schedules/1.json
  def update
    respond_to do |format|
      if @print_schedule.update(print_schedule_params)
        format.html { redirect_to @print_schedule, notice: 'Print schedule was successfully updated.' }
        format.json { render :show, status: :ok, location: @print_schedule }
      else
        format.html { render :edit }
        format.json { render json: @print_schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /print_schedules/1
  # DELETE /print_schedules/1.json
  def destroy
    @print_schedule.destroy
    respond_to do |format|
      format.html { redirect_to print_schedules_url, notice: 'Print schedule was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_print_schedule
      @print_schedule = PrintSchedule.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def print_schedule_params
      params[:print_schedule]
    end
end
