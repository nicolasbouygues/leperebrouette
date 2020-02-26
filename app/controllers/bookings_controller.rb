class BookingsController < ApplicationController
  before_action :set_barrow, only: [:show, :edit, :update, :destroy]

  # GET /bookings
  # GET /bookings.json
  def index
    @bookings = policy_scope(Barrow).order(created_at: :desc)
  end

  # GET /my_bookings
  def my_bookings
    @bookings = Barrow.where(user_id: current_user.id)
    @bookings = Booking.where(user_id: current_user.id)
    authorize @bookings
  end
  # GET /bookings/1
  # GET /bookings/1.json
  def show
  end

  # GET /bookings/new
  def new
    @booking = Booking.new
    authorize @booking
  end

  # GET /bookings/1/edit
  def edit
  end

  # POST /bookings
  # POST /bookings.json
  def create
    @booking = Booking.new(booking_date: Time.now)
    @booking.user = current_user
    @booking.barrow = Barrow.find(params[:barrow_id])
    authorize @booking

    respond_to do |format|
      if @booking.save!
        format.html { redirect_to my_barrows_path, notice: 'booking was successfully created.' }
        format.json { render :show, status: :created, location: @booking }
      else
        format.html { render :new }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bookings/1
  # PATCH/PUT /bookings/1.json
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

  # DELETE /bookings/1
  # DELETE /bookings/1.json
  def destroy
    @barrow.destroy
    respond_to do |format|
      format.html { redirect_to bookings_url, notice: 'Barrow was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_barrow
      @barrow = Barrow.find(params[:id])
      authorize @barrow
    end

    # Only allow a list of trusted parameters through.

    def booking_params
      params.require(:booking).permit(:booking_date, :user_id, :barrow_id)
    end
end
