require "application_system_test_case"

class ModalsTest < ApplicationSystemTestCase
  setup do
    @modal = modals(:one)
  end

  test "visiting the index" do
    visit modals_url
    assert_selector "h1", text: "Modals"
  end

  test "creating a Modal" do
    visit modals_url
    click_on "New Modal"

    fill_in "Title", with: @modal.title
    click_on "Create Modal"

    assert_text "Modal was successfully created"
    click_on "Back"
  end

  test "updating a Modal" do
    visit modals_url
    click_on "Edit", match: :first

    fill_in "Title", with: @modal.title
    click_on "Update Modal"

    assert_text "Modal was successfully updated"
    click_on "Back"
  end

  test "destroying a Modal" do
    visit modals_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Modal was successfully destroyed"
  end
end
