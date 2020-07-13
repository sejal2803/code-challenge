require 'rails_helper'

RSpec.describe Company, type: :model do
  it 'has a valid Factory' do
    expect(build(:company)).to be_valid
  end

  describe 'validations' do
    it 'without zip_code' do
      expect(build(:company, zip_code: nil)).not_to be_valid
    end

    it 'email without domain @getmainstreet.com' do
      expect(build(:company, email: 'test@gmail.com')).not_to be_valid
    end

    it 'without email' do
      expect(build(:company, email: nil)).to be_valid
    end
  end

  context '#zip_cpde' do
    it 'auto fill state city on create' do
      company = create(:company, zip_code: '30301')

      expect(company.state).to match('Georgia')
      expect(company.city).to match('Atlanta')
    end

    it 'auto update state city on update' do
      company = create(:company)
      company.update(zip_code: '67410')

      expect(company.state).to match('Kansas')
      expect(company.city).to match('Abilene')
    end
  end
end
