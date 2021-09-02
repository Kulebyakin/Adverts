class Admin::AdvertsController < Admin::BaseController
  before_action :set_advert, except: %i[ index moderate ]

  def accept
    @advert.accept

    if @advert.save
      redirect_to admin_adverts_path, notice: "Advert was successfully sent to moderate."
    else
      render :index, status: :unprocessable_entity
    end
  end

  def reject
    @advert.reject

    if @advert.save
      redirect_to admin_adverts_path, notice: "Advert was successfully sent to moderate."
    else
      render :index, status: :unprocessable_entity
    end
  end

  def index
    @adverts = Advert.page(params[:page])
  end

  def moderate
    @adverts = Advert.where(status: :new).page(params[:page])
    render "index"
  end

  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_advert
      @advert = Advert.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def advert_params
      params.require(:advert).permit(:title, :description, :status, :user_id, images: [])
    end
end
