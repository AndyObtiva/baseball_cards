require "test_helper"

class BaseballCardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @baseball_card = baseball_cards(:one)
  end

  test "should get index" do
    get baseball_cards_url
    assert_response :success
  end

  test "should get new" do
    get new_baseball_card_url
    assert_response :success
  end

  test "should create baseball_card" do
    assert_difference("BaseballCard.count") do
      post baseball_cards_url, params: { baseball_card: { name: @baseball_card.name, position: @baseball_card.position, team: @baseball_card.team } }
    end

    assert_redirected_to baseball_card_url(BaseballCard.last)
  end

  test "should show baseball_card" do
    get baseball_card_url(@baseball_card)
    assert_response :success
  end

  test "should get edit" do
    get edit_baseball_card_url(@baseball_card)
    assert_response :success
  end

  test "should update baseball_card" do
    patch baseball_card_url(@baseball_card), params: { baseball_card: { name: @baseball_card.name, position: @baseball_card.position, team: @baseball_card.team } }
    assert_redirected_to baseball_card_url(@baseball_card)
  end

  test "should destroy baseball_card" do
    assert_difference("BaseballCard.count", -1) do
      delete baseball_card_url(@baseball_card)
    end

    assert_redirected_to baseball_cards_url
  end
end
