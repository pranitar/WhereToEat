class RestaurantReviewsController < ApplicationController
  before_action :set_restaurant_review, only: [:show, :edit, :update, :destroy]

  # GET /restaurant_reviews
  # GET /restaurant_reviews.json
  def index
    @restaurant_reviews = RestaurantReview.all
  end

  # GET /restaurant_reviews/1
  # GET /restaurant_reviews/1.json
  def show
  end

  # GET /restaurant_reviews/new
  def new
    @restaurant_review = RestaurantReview.new
    @restaurant_review.restaurant = Restaurant.find_by_id(params[:restaurant_id])
    @restaurant_review.user = current_user
  end

  # GET /restaurant_reviews/1/edit
  def edit
  end

  # POST /restaurant_reviews
  # POST /restaurant_reviews.json
  def create
    @restaurant_review = RestaurantReview.new(restaurant_review_params)
    respond_to do |format|
      if @restaurant_review.save
        format.html { redirect_to @restaurant_review, notice: 'Restaurant review was successfully created.' }
        format.json { render action: 'show', status: :created, location: @restaurant_review }
      else
        format.html { render action: 'new' }
        format.json { render json: @restaurant_review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /restaurant_reviews/1
  # PATCH/PUT /restaurant_reviews/1.json
  def update
    respond_to do |format|
      if @restaurant_review.update(restaurant_review_params)
        format.html { redirect_to @restaurant_review, notice: 'Restaurant review was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @restaurant_review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /restaurant_reviews/1
  # DELETE /restaurant_reviews/1.json
  def destroy
    @restaurant_review.destroy
    respond_to do |format|
      format.html { redirect_to restaurant_reviews_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurant_review
      @restaurant_review = RestaurantReview.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def restaurant_review_params
      params.require(:restaurant_review).permit(:restaurant_id, :user_id, :review, :rating, :date)
    end
end
