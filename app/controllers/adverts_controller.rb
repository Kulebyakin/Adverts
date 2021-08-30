class AdvertsController < ApplicationController
  before_action :authenticate_user!, except: %i[ index show ]
  before_action :set_advert, only: %i[ show edit update destroy moderate publish ]

  after_action :verify_authorized, except: %i[index my_adverts]
  after_action :verify_policy_scoped, only: %i[index my_adverts]


  def my_adverts
    @adverts = policy_scope(Advert.where(user_id: current_user.id))
  end

  def moderate
    @advert.moderate
    authorize @advert

    if @advert.save
      redirect_to my_adverts_path, notice: "Advert was successfully sent to moderate."
    else
      render :my_adverts, status: :unprocessable_entity
    end
  end

  def publish
    @advert.publish
    authorize @advert

    if @advert.save
      redirect_to my_adverts_path, notice: "Advert was successfully publish."
    else
      render :my_adverts, status: :unprocessable_entity
    end
  end

  # GET /adverts or /adverts.json
  def index
    @adverts = policy_scope(Advert.where(status: :published))
    @parent_categories = Category.where(parent_category: nil)
  end

  # GET /adverts/1 or /adverts/1.json
  def show
  end

  # GET /adverts/new
  def new
    @advert = Advert.new
    authorize @advert
  end

  # GET /adverts/1/edit
  def edit
  end

  # POST /adverts or /adverts.json
  def create
    @advert = Advert.new(advert_params)
    authorize @advert

    respond_to do |format|
      if @advert.save
        format.html { redirect_to @advert, notice: "Advert was successfully created." }
        format.json { render :show, status: :created, location: @advert }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @advert.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /adverts/1 or /adverts/1.json
  def update
    if @advert.published? || @advert.accepted? || @advert.rejected?
      @advert.moderate
    end
    respond_to do |format|
      if @advert.update(advert_params)
        format.html { redirect_to @advert, notice: "Advert was successfully updated." }
        format.json { render :show, status: :ok, location: @advert }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @advert.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /adverts/1 or /adverts/1.json
  def destroy
    @advert.destroy
    respond_to do |format|
      format.html { redirect_to adverts_url, notice: "Advert was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_advert
      @advert = Advert.find(params[:id])
      authorize @advert
    end

    # Only allow a list of trusted parameters through.
    def advert_params
      params.require(:advert).permit(:title, :description, :status, :user_id, images: [])
    end
end
