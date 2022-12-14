require 'rails_helper'

RSpec.describe "Users actions", type: :feature do
  describe "/users" do
    before do
      visit '/users'
    end

    it 'contains a button to load the content' do
      expect(page).to have_button('Load users data')
    end

    it 'displays a table with data, after database is populated' do
      User.create(
        index: 1,
        first_name: 'Gabriel',
        last_name: 'Fonseca',
        status: 'Active',
        email: 'gabriel@email.com',
        created_at: '2018-04-08'
      )
      User.create(
        index: 2,
        first_name: 'Another',
        last_name: 'Person',
        status: 'Active',
        email: 'another@email.com',
        created_at: '2021-06-01'
      )
      User.create(
        index: 3,
        first_name: 'Other',
        last_name: 'One',
        status: 'Inactive',
        email: 'other@email.com',
        created_at: '2015-10-11'
      )
      visit '/users'
      expect(page).to have_content(/First name/i)
      expect(page).to have_content(/Last name/i)
      expect(page).to have_content(/Status/i)
      expect(page).to have_content(/Email/i)
      expect(page).to have_content(/Created at/i)
      expect(page).to have_content(/Gabriel/i)
      expect(page).to have_content(/another@email.com/i)
      expect(page).to have_content(/Inactive/i)
    end
  end
end
