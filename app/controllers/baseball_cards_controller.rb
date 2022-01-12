class BaseballCardsController < ApplicationController
  before_action :set_baseball_card, only: %i[ show edit update destroy ]

  # GET /baseball_cards or /baseball_cards.json
  def index
    @baseball_cards = BaseballCard.all
  end

  # GET /baseball_cards/1 or /baseball_cards/1.json
  def show
  end

  # GET /baseball_cards/new
  def new
    @baseball_card = BaseballCard.new
  end

  # GET /baseball_cards/1/edit
  def edit
  end

  # POST /baseball_cards or /baseball_cards.json
  def create
    @baseball_card = BaseballCard.new(baseball_card_params)

    respond_to do |format|
      if @baseball_card.save
        format.html { redirect_to baseball_card_url(@baseball_card), notice: "Baseball card was successfully created." }
        format.json { render :show, status: :created, location: @baseball_card }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @baseball_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /baseball_cards/1 or /baseball_cards/1.json
  def update
    respond_to do |format|
      if @baseball_card.update(baseball_card_params)
        format.html { redirect_to baseball_card_url(@baseball_card), notice: "Baseball card was successfully updated." }
        format.json { render :show, status: :ok, location: @baseball_card }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @baseball_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /baseball_cards/1 or /baseball_cards/1.json
  def destroy
    @baseball_card.destroy

    respond_to do |format|
      format.html { redirect_to baseball_cards_url, notice: "Baseball card was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_baseball_card
      @baseball_card = BaseballCard.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def baseball_card_params
      params.require(:baseball_card).permit(:name, :team, :position, :image_url)
    end
end
