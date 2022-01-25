feature 'Enter name' do
  scenario 'User enters name on homepage' do
    visit '/'
    fill_in 'name', with: 'Fred'
    click_button 'GO!'
    expect(page).to have_content 'Fred' 
  end
end
