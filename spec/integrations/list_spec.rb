require 'spec_helper'

describe 'list' do

  it 'should display its name on the list index page' do
    list = List.create(name: "List Name")

    visit root_path
    page.should have_content list.name
  end

end
