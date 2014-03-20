require 'test_helper'

class RestaurantReviewsControllerTest < ActionController::TestCase
  setup do
    @restaurant_review = restaurant_reviews(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:restaurant_reviews)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create restaurant_review" do
    assert_difference('RestaurantReview.count') do
      post :create, restaurant_review: { date: @restaurant_review.date, rating: @restaurant_review.rating, restaurant_id: @restaurant_review.restaurant_id, review: @restaurant_review.review, user_id: @restaurant_review.user_id }
    end

    assert_redirected_to restaurant_review_path(assigns(:restaurant_review))
  end

  test "should show restaurant_review" do
    get :show, id: @restaurant_review
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @restaurant_review
    assert_response :success
  end

  test "should update restaurant_review" do
    patch :update, id: @restaurant_review, restaurant_review: { date: @restaurant_review.date, rating: @restaurant_review.rating, restaurant_id: @restaurant_review.restaurant_id, review: @restaurant_review.review, user_id: @restaurant_review.user_id }
    assert_redirected_to restaurant_review_path(assigns(:restaurant_review))
  end

  test "should destroy restaurant_review" do
    assert_difference('RestaurantReview.count', -1) do
      delete :destroy, id: @restaurant_review
    end

    assert_redirected_to restaurant_reviews_path
  end
end
