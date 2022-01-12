require "application_system_test_case"

class BaseballCardsTest < ApplicationSystemTestCase
  setup do
    @baseball_card = baseball_cards(:one)
  end

  test "visiting the index" do
    visit baseball_cards_url
    assert_selector "h1", text: "Baseball cards"
  end

  test "should create baseball card" do
    visit baseball_cards_url
    click_on "New baseball card"

    fill_in "Name", with: @baseball_card.name
    fill_in "Position", with: @baseball_card.position
    fill_in "Team", with: @baseball_card.team
    click_on "Create Baseball card"

    assert_text "Baseball card was successfully created"
    click_on "Back"
  end

  test "should update Baseball card" do
    visit baseball_card_url(@baseball_card)
    click_on "Edit this baseball card", match: :first

    fill_in "Name", with: @baseball_card.name
    fill_in "Position", with: @baseball_card.position
    fill_in "Team", with: @baseball_card.team
    click_on "Update Baseball card"

    assert_text "Baseball card was successfully updated"
    click_on "Back"
  end

  test "should destroy Baseball card" do
    visit baseball_card_url(@baseball_card)
    click_on "Destroy this baseball card", match: :first

    assert_text "Baseball card was successfully destroyed"
  end
end
