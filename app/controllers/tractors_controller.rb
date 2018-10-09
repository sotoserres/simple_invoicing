class TractorsController < ApplicationController
  before_action :set_tractor, only: [:show, :edit, :update, :destroy]

  # GET /tractors
  # GET /tractors.json
  def index
    if params[:user_id]
      @tractors = Tractor.where(:user_id => params[:user_id])
    else
      @tractors = Tractor.all
    end
  end

  # GET /tractors/1
  # GET /tractors/1.json
  def show
  end

  # GET /tractors/new
  def new
    @tractor = Tractor.new
  end

  # GET /tractors/1/edit
  def edit
  end

  # POST /tractors
  # POST /tractors.json
  def create
    @tractor = Tractor.new(tractor_params)

    respond_to do |format|
      if @tractor.save
        format.html { redirect_to @tractor, notice: 'Tractor was successfully created.' }
        format.json { render :show, status: :created, location: @tractor }
      else
        format.html { render :new }
        format.json { render json: @tractor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tractors/1
  # PATCH/PUT /tractors/1.json
  def update
    respond_to do |format|
      if @tractor.update(tractor_params)
        format.html { redirect_to @tractor, notice: 'Tractor was successfully updated.' }
        format.json { render :show, status: :ok, location: @tractor }
      else
        format.html { render :edit }
        format.json { render json: @tractor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tractors/1
  # DELETE /tractors/1.json
  def destroy
    @tractor.destroy
    respond_to do |format|
      format.html { redirect_to tractors_url, notice: 'Tractor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tractor
      @tractor = Tractor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tractor_params
      params.require(:tractor).permit(:Name, :Plates, :dob, :lastservice, :filterhours, :oilhours, :twh)
    end
end
