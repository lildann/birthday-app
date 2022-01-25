require 'birthday'
require 'timecop'

describe Birthday do
  let(:birthday) { Birthday.new("1989-01-25") }

  it 'should be initialised with a date' do
    expect(birthday.date).to eq("1989-01-25")
  end

  it 'should check if a birthday is today' do
    Timecop.freeze(Time.local(2022, 1, 25))
    expect(birthday.today?).to eq(true)
  end

  it 'should return a message if it is your birthday' do
    Timecop.freeze(Time.local(2022, 1, 25))
    expect(birthday.message).to eq("Happy Birthday, you are 33 today")
  end

  it 'should return another message if it is not your birthday' do
    Timecop.freeze(Time.local(2022, 1, 24))
    expect(birthday.message).to eq("It's not your birthday yet")
  end
end
