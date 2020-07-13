require 'rails_helper'

RSpec.feature 'Company feature', type: :feature, js: true do
  before :each do
    @company = create(:company)
  end

  scenario 'delete company' do
    visit  company_path(@company)
    delete_link = find_link 'Delete', href: company_path(@company)

    expect(delete_link['data-confirm']).to eq 'Are you sure you want to delete this?'
    expect do
      accept_alert do
        delete_link.click
      end

      sleep 1
    end.to change(Company, :count).by(-1)
  end
end
