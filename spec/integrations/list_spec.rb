require 'spec_helper'

describe 'list' do

  it 'should display its name on the list index page' do
    list = List.create(name: "List Name")

    visit root_path
    page.should have_content list.name
  end

  it 'can be created via the new list page' do
    visit root_path
    click_link "New List"

    # to find the element name, in Chrome, you can right click on the field
    # and select "Inspect Element" where you'll see the rendered HTML
    fill_in "list_name", with: "Test List Name"
    click_button "Create List"

    page.should have_content "Test List Name"
  end

  it 'can be viewed by itself via the show list page' do
    list = List.create(name: "List Name")

    visit root_path
    click_link list.name
    page.should have_content list.name
  end

end
