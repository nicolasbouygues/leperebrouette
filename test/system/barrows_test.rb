require "application_system_test_case"

class BarrowsTest < ApplicationSystemTestCase
  setup do
    @barrow = barrows(:one)
  end

  test "visiting the index" do
    visit barrows_url
    assert_selector "h1", text: "Barrows"
  end

  test "creating a Barrow" do
    visit barrows_url
    click_on "New Barrow"

    fill_in "Category", with: @barrow.category
    fill_in "Description", with: @barrow.description
    fill_in "Name", with: @barrow.name
    fill_in "Price", with: @barrow.price
    fill_in "Town", with: @barrow.town
    fill_in "User", with: @barrow.user_id
    click_on "Create Barrow"

    assert_text "Barrow was successfully created"
    click_on "Back"
  end

  test "updating a Barrow" do
    visit barrows_url
    click_on "Edit", match: :first

    fill_in "Category", with: @barrow.category
    fill_in "Description", with: @barrow.description
    fill_in "Name", with: @barrow.name
    fill_in "Price", with: @barrow.price
    fill_in "Town", with: @barrow.town
    fill_in "User", with: @barrow.user_id
    click_on "Update Barrow"

    assert_text "Barrow was successfully updated"
    click_on "Back"
  end

  test "destroying a Barrow" do
    visit barrows_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Barrow was successfully destroyed"
  end
end
