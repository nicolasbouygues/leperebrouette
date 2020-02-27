class BarrowsController < ApplicationController
  before_action :set_barrow, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def town
  [town, city, state, country].compact.join(', ')
  end

  # GET /barrows
  # GET /barrows.json
  def index
    if params[:search].present?
      if params[:search][:category].present?
      @barrows = Barrow.where("town ILIKE ?", "%#{params[:search][:town]}%").where("category ILIKE ?", "%#{params[:search][:category]}%")
      else
      @barrows = Barrow.where("town ILIKE ?", "%#{params[:search][:town]}%")
      end
    else
      @barrows = Barrow.all
    end

    @Barrows_coordinates = Barrow.geocoded

      @markers = @Barrows_coordinates.map do |barrow|
        {
          lat: barrow.latitude,
          lng: barrow.longitude
        }
      end

    # authorize @barrows
    # @barrows = Barrow.where(town: param[:town] AND category: params[:category])
    # @barrows = policy_scope(Barrow).order(created_at: :desc)
  end

  # GET /my_barrows
  def my_barrows
    @barrows = Barrow.where(user_id: current_user.id)
    @bookings = Booking.where(user_id: current_user.id)
    @Barrows_coordinates = Barrow.geocoded.where(user_id: current_user.id)
    @markers = @Barrows_coordinates.map do |barrow|
        {
          lat: barrow.latitude,
          lng: barrow.longitude
        }
      end
    # authorize @barrows
    # authorize @bookings
  end
  # GET /barrows/1
  # GET /barrows/1.json
  def show
    @booking = Booking.new

    @Barrows_coordinates = Barrow.geocoded.where(user_id: current_user.id)
    @markers = @Barrows_coordinates.map do |barrow|
        {
          lat: barrow.latitude,
          lng: barrow.longitude
        }
      end
  end

  # GET /barrows/new
  def new
    @barrow = Barrow.new
    # authorize @barrow
  end

  # GET /barrows/1/edit
  def edit
  end

  # POST /barrows
  # POST /barrows.json
  def create
    @barrow = Barrow.new(barrow_params)
    @barrow.user = current_user
    # authorize @barrow

    respond_to do |format|
      if @barrow.save
        format.html { redirect_to barrow_path(@barrow), notice: 'Barrow was successfully created.' }
        format.json { render :show, status: :created, location: @barrow }
      else
        format.html { render :new }
        format.json { render json: @barrow.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /barrows/1
  # PATCH/PUT /barrows/1.json
  def update
    respond_to do |format|
      if @barrow.update(barrow_params)
        format.html { redirect_to @barrow, notice: 'Barrow was successfully updated.' }
        format.json { render :show, status: :ok, location: @barrow }
      else
        format.html { render :edit }
        format.json { render json: @barrow.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /barrows/1
  # DELETE /barrows/1.json
  def destroy
    @barrow.destroy
    respond_to do |format|
      format.html { redirect_to my_barrows_path, notice: 'Barrow was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_barrow
      @barrow = Barrow.find(params[:id])
      # authorize @barrow
    end

    # Only allow a list of trusted parameters through.
    def barrow_params
      params.require(:barrow).permit(:name, :description, :town, :category, :price, :user_id, :photo)
    end

    def booking_params
      params.require(:booking).permit(:booking_date, :user_id, :barrow_id)
    end
end
