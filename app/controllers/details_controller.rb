class DetailsController < ApplicationController
  before_action :set_detail, only: %i[ show edit update destroy ]

  # GET /details or /details.json
  def index
    @details = Detail.all
    respond_to do |format|
      format.html
      format.json { render json: @details }
    end
  end

  # GET /details/1 or GET /details/1.json
  def show
    respond_to do |format|
      format.html { render turbo_stream: turbo_stream.replace('details_frame', partial: 'details/frame', locals: { person: @person }) }
      format.json { render json: @detail }
    end
  end

  # GET /details/new
  def new
    @detail = Detail.new
  end

  # GET /details/1/edit
  def edit
  end

  # POST /details or /details.json
  def create
    @detail = Detail.new(detail_params)

    respond_to do |format|
      if @detail.save
        format.html { redirect_to detail_url(@detail), notice: "Detail was successfully created." }
        format.json { render :show, status: :created, location: @detail }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /details/1
  def update
    respond_to do |format|
      if @detail.update(detail_params)
        format.html { redirect_to detail_url(@detail), notice: "Detail was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /details/1
  def destroy
    @detail.destroy!

    respond_to do |format|
      format.html { redirect_to details_url, notice: "Detail was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_detail
      @detail = Detail.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def detail_params
      params.require(:detail).permit(:title, :age, :phone, :email, :person_id)
    end
end
