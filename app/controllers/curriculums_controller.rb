class CurriculumsController < ApplicationController
  before_action :set_curriculum, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # Upload the file
  def curriculum_upload
    duration = params['text']
    name =  params['file'].original_filename
    directory = "./"
    # create the file path
    path = File.join(directory, name)
    # write the file
    File.open(path, "wb") { |f| f.write(params['file'].read) }
    puts name
    Curriculum.create_curriculum({duration: params[:duration], name: name, file_url: path})
    puts path
    @curriculums = Curriculum.all
    redirect_to action:"index"
  end

  # GET /curriculums
  # GET /curriculums.json
  def index
    @curriculums = Curriculum.all
  end

  # GET /curriculums/1
  # GET /curriculums/1.json
  def show
    @curriculum = Curriculum.find(params[:id])
  end

  # GET /curriculums/new
  def new
    @curriculum = Curriculum.new
  end

  # GET /curriculums/1/edit
  def edit
  end

  # POST /curriculums
  # POST /curriculums.json
  def create
    @curriculum = Curriculum.new(curriculum_params)

    respond_to do |format|
      if @curriculum.save
        format.html { redirect_to @curriculum, notice: 'Curriculum was successfully created.' }
        format.json { render :show, status: :created, location: @curriculum }
      else
        format.html { render :new }
        format.json { render json: @curriculum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /curriculums/1
  # PATCH/PUT /curriculums/1.json
  def update
    respond_to do |format|
      if @curriculum.update(curriculum_params)
        format.html { redirect_to @curriculum, notice: 'Curriculum was successfully updated.' }
        format.json { render :show, status: :ok, location: @curriculum }
      else
        format.html { render :edit }
        format.json { render json: @curriculum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /curriculums/1
  # DELETE /curriculums/1.json
  def destroy
    @curriculum.destroy
    respond_to do |format|
      format.html { redirect_to curriculums_url, notice: 'Curriculum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_curriculum
      @curriculum = Curriculum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def curriculum_params
      params[:curriculum]
    end

end
