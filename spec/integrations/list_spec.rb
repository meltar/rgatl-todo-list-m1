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

  it 'shows its tasks on the show list page' do
    list = List.create(name: "List Name")    
    grocery_store_task = Task.create(description: "Buy groceries")
    laundry_task = Task.create(description: "Do laundry")
    ironing_task = Task.create(description: "Iron cape")
    save_world_task = Task.create(description: "Save the world")
    list.add_task(grocery_store_task)
    list.add_task(laundry_task)
    list.add_task(ironing_task)
    list.add_task(save_world_task)

    visit root_path
    click_link list.name
    page.should have_content grocery_store_task.description
    page.should have_content laundry_task.description
    page.should have_content ironing_task.description
    page.should have_content save_world_task.description
  end

  it 'displays tasks that are marked complete with the description scratched off' do
    list = List.create(name: "List Name")    
    excited_task = Task.create(description: "Get excited")
    make_task = Task.create(description: "Make things")    
    list.add_task(excited_task)
    list.add_task(make_task)    
    excited_task.mark_complete

    visit list_path(list)

    page.should_not have_css("del", text: make_task.description)
    page.should have_css("del", text: excited_task.description)
  end

  it 'displays how many tasks completed out the the total number of tasks on the list' do
    list = List.create(name: "Good List")    
    excited_task = Task.create(description: "Get excited")
    make_task = Task.create(description: "Make things")    
    list.add_task(excited_task)
    list.add_task(make_task)    
    excited_task.mark_complete

    list = List.create(name: "Bad List")    
    grumpy_task = Task.create(description: "Be grumpy")
    throw_task = Task.create(description: "Throw things")
    lose_friends_task = Task.create(description: "Lose friends") 
    list.add_task(grumpy_task)
    list.add_task(throw_task)
    list.add_task(lose_friends_task)

    visit root_path
    page.should have_content "Good List (1/2 tasks completed)"
    page.should have_content "Bad List (0/3 tasks completed)" 
  end

end
