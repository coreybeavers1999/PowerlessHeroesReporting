class ProgressesController < ApplicationController
  before_action :set_progress, only: %i[ show edit update destroy ]

  # GET /progresses or /progresses.json
  def index
    @maps = Progress.all.where(category: 'maps').order(:description)
    @models = Progress.all.where(category: 'models').order(:description)
    @audio = Progress.all.where(category: 'audio').order(:description)
    @cutscenes = Progress.all.where(category: 'cutscenes').order(:description)
    @enemies = Progress.all.where(category: 'enemies').order(:description)
    @features = Progress.all.where(category: 'features').order(:description)
    @heroes = Progress.all.where(category: 'heroes').order(:description)
    @ui = Progress.all.where(category: 'ui').order(:description)
    
    # Percent Variables
    maps_complete_days = 0.0
    models_complete_days = 0.0
    audio_complete_days = 0.0
    cutscenes_complete_days = 0.0
    enemies_complete_days = 0.0
    features_complete_days = 0.0
    heroes_complete_days = 0.0
    ui_complete_days = 0.0

    maps_total_days = 0.0
    models_total_days = 0.0
    audio_total_days = 0.0
    cutscenes_total_days = 0.0
    enemies_total_days = 0.0
    features_total_days = 0.0
    heroes_total_days = 0.0
    ui_total_days = 0.0
    
    # Get Info From Records
    @maps.each do |m|
      maps_total_days += m.expected_days
      maps_complete_days += m.expected_days if(m.complete)
    end

    @models.each do |m|
      models_total_days += m.expected_days
      models_complete_days += m.expected_days if(m.complete)
    end

    @audio.each do |m|
      audio_total_days += m.expected_days
      audio_complete_days += m.expected_days if(m.complete)
    end

    @cutscenes.each do |m|
      cutscenes_total_days += m.expected_days
      cutscenes_complete_days += m.expected_days if(m.complete)
    end

    @enemies.each do |m|
      enemies_total_days += m.expected_days
      enemies_complete_days += m.expected_days if(m.complete)
    end

    @features.each do |m|
      features_total_days += m.expected_days
      features_complete_days += m.expected_days if(m.complete)
    end

    @heroes.each do |m|
      heroes_total_days += m.expected_days
      heroes_complete_days += m.expected_days if(m.complete)
    end

    @ui.each do |m|
      ui_total_days += m.expected_days
      ui_complete_days += m.expected_days if(m.complete)
    end

    # Calculate Percent
    maps_percent = (maps_complete_days / maps_total_days * 100).ceil
    models_percent = (models_complete_days / models_total_days * 100).ceil
    audio_percent = (audio_complete_days / audio_total_days * 100).ceil
    cutscenes_percent = (cutscenes_complete_days / cutscenes_total_days * 100).ceil
    enemies_percent = (enemies_complete_days / enemies_total_days * 100).ceil
    features_percent = (features_complete_days / features_total_days * 100).ceil
    heroes_percent = (heroes_complete_days / heroes_total_days * 100).ceil
    ui_percent = (ui_complete_days / ui_total_days * 100).ceil
    
    # Formatted
    @maps_progress = "#{maps_percent}% (#{(maps_total_days - maps_complete_days).ceil} Days Remaining)"
    @models_progress = "#{models_percent}% (#{(models_total_days - models_complete_days).ceil} Days Remaining)"
    @audio_progress = "#{audio_percent}% (#{(audio_total_days - audio_complete_days).ceil} Days Remaining)"
    @cutscenes_progress = "#{cutscenes_percent}% (#{(cutscenes_total_days - cutscenes_complete_days).ceil} Days Remaining)"
    @enemies_progress = "#{enemies_percent}% (#{(enemies_total_days - enemies_complete_days).ceil} Days Remaining)"
    @features_progress = "#{features_percent}% (#{(features_total_days - features_complete_days).ceil} Days Remaining)"
    @heroes_progress = "#{heroes_percent}% (#{(heroes_total_days - heroes_complete_days).ceil} Days Remaining)"
    @ui_progress = "#{ui_percent}% (#{(ui_total_days - ui_complete_days).ceil} Days Remaining)"
  end

  # GET /progresses/1 or /progresses/1.json
  def show
  end

  # GET /progresses/new
  def new
    @progress = Progress.new
  end

  # GET /progresses/1/edit
  def edit
  end

  # POST /progresses or /progresses.json
  def create
    @progress = Progress.new(progress_params)

    respond_to do |format|
      if @progress.save
        format.html { redirect_to progresses_url }
        format.json { render :show, status: :created, location: @progress }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @progress.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /progresses/1 or /progresses/1.json
  def update
    respond_to do |format|
      if @progress.update(progress_params)
        format.html { redirect_to progresses_path }
        format.json { render :show, status: :ok, location: @progress }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @progress.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /progresses/1 or /progresses/1.json
  def destroy
    @progress.destroy

    respond_to do |format|
      format.html { redirect_to progresses_path }
      format.json { head :no_content }
    end
  end

  def mark_complete
    process = Progress.find(params[:id])
    process.complete = !process.complete
    process.save
    redirect_to progresses_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_progress
      @progress = Progress.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def progress_params
      params.require(:progress).permit(:category, :description, :expected_days, :complete)
    end
end
