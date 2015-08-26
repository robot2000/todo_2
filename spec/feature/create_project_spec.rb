describe "Create Project", :type => :feature, :js => true do

  it 'Create project' do
    visit '/'
    click_on 'Add project'
    within("div.new-project") do
      fill_in 'project_title', :with=>'Home'
    end
    click_on 'Create project'
    expect(page).to have_content 'Home'
  end
end