require 'rails_helper'

RSpec.describe Project, type: :model do
  subject { Project.new(name: 'vinyard', desc: '18+company', date_begining: '14/05/2020') }

  before { subject.save }

  it 'name to be present' do 
    subject.name = nil 
    expect(subject).to_not be_valid 
  end 

  it 'desc should be present' do
    subject.desc = nil 
    expect(subject).to_not be_valid  
  end 

  it 'date_begining be present' do
    subject.date_begining = nil 
    expect(subject).to_not be_valid 
  end 
end
