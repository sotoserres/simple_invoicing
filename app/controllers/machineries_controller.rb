class MachineriesController < ApplicationController
  before_action :set_machinery, only: [:show, :edit, :update, :destroy]

  # GET /machineries
  # GET /machineries.json
  def index
    if params[:user_id]
      @machineries = Machinery.where(:user_id => params[:user_id])
    else
      @machineries = Machinery.all
    end
  end

  # GET /machineries/1
  # GET /machineries/1.json
  def show
  end

  # GET /machineries/new
  def new
    @machinery = Machinery.new
  end

  # GET /machineries/1/edit
  def edit
  end

  # POST /machineries
  # POST /machineries.json
  def create
    @machinery = Machinery.new(machinery_params)

    respond_to do |format|
      if @machinery.save
        format.html { redirect_to @machinery, notice: 'Machinery was successfully created.' }
        format.json { render :show, status: :created, location: @machinery }
      else
        format.html { render :new }
        format.json { render json: @machinery.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /machineries/1
  # PATCH/PUT /machineries/1.json
  def update
    respond_to do |format|
      if @machinery.update(machinery_params)
        format.html { redirect_to @machinery, notice: 'Machinery was successfully updated.' }
        format.json { render :show, status: :ok, location: @machinery }
      else
        format.html { render :edit }
        format.json { render json: @machinery.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /machineries/1
  # DELETE /machineries/1.json
  def destroy
    @machinery.destroy
    respond_to do |format|
      format.html { redirect_to machineries_url, notice: 'Machinery was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_machinery
      @machinery = Machinery.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def machinery_params
      params.require(:machinery).permit(:name, :dob, :condition, :warranty, :user)
    end
end
