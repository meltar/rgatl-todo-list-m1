require 'spec_helper'

describe 'list' do
  it 'can add tasks from the show list page' do
    list = List.create(name: "List Name")
    visit root_path
    click_link list.name
    click_link "Add Task"
    fill_in "task_description", with: "Get excited and make things"
    click_button "Create Task"

    page.should have_content "List Name"
    page.should have_content "Get excited and make things"
  end

  it 'can be edited from the edit task page' do
    list = List.create(name: "List Name")    
    grocery_store_task = Task.create(description: "Buy groceries")
    laundry_task = Task.create(description: "Do laundry")
    list.add_task(grocery_store_task)
    list.add_task(laundry_task)

    visit root_path
    click_link list.name
    click_link grocery_store_task.description

    fill_in "task_description", with: "Helicopter lesson"
    click_button "Update Task"
    page.should have_content "List Name"
    page.should have_content "Helicopter lesson"
  end
end
