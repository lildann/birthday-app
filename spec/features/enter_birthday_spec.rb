require 'timecop'

feature 'Enter birthday' do
  scenario 'User enters their birthday on the hompage' do
    Timecop.freeze(Time.local(2022, 1, 25))
    visit '/'
    fill_in 'birthday', with: '1989-01-25'
    click_button 'GO!'
    expect(page).to have_content "Happy Birthday, you are 33 today"
  end
end
