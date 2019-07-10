class VinylsController < ApplicationController
  before_action :set_vinyl, only: [:show, :edit, :update, :destroy]

  # GET /vinyls
  # GET /vinyls.json
  def index
    @vinyls = Vinyl.all
  end

  # GET /vinyls/1
  # GET /vinyls/1.json
  def show
  end

  # GET /vinyls/new
  def new
    if current_user
      if current_user.profile
        @vinyl = Vinyl.new
      else 
        redirect_to new_profile_path
      end
    else
      redirect_to new_user_session_path 
  
  end
end

  # GET /vinyls/1/edit
  def edit
  end

  # POST /vinyls
  # POST /vinyls.json
  def create
    @vinyl = Vinyl.new(vinyl_params)

      @seller = Seller.new
      @seller.profile_id = current_user.profile.id
      @seller.save

    # @car.seller_id = current_user.profile.seller.id
    respond_to do |format|
      if @vinyl.save
        format.html { redirect_to @vinyl, notice: 'Vinyl was successfully created.' }
        format.json { render :show, status: :created, location: @vinyl }
      else
        format.html { render :new }
        format.json { render json: @vinyl.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vinyls/1
  # PATCH/PUT /vinyls/1.json
  def update
    if @vinyl.pictures
        @vinyl.pictures.purge
    end
    respond_to do |format|
      if @vinyl.update(vinyl_params)
        format.html { redirect_to @vinyl, notice: 'Vinyl was successfully updated.' }
        format.json { render :show, status: :ok, location: @vinyl }
      else
        format.html { render :edit }
        format.json { render json: @vinyl.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vinyls/1
  # DELETE /vinyls/1.json
  def destroy
    @vinyl.destroy
    respond_to do |format|
      format.html { redirect_to vinyls_url, notice: 'Vinyl was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vinyl
      @vinyl = Vinyl.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vinyl_params
      params.require(:vinyl).permit(:artist, :genre, :name, :year, :price, :description, :seller_id)
    end
end

