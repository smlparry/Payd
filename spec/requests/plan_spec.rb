require 'rails_helper'

RSpec.describe 'Plans', type: :request do
  before do
    sign_in_as_a_valid_user
  end

  describe 'GET /dash/plans' do
    it 'display some plans' do
      @plans = Plan.all
      visit dash_plans_path
      expect(page).to have_content(@plans.name)
    end

    it 'displays add plan button' do
      visit dash_plans_path
      expect(page).to have_content('Add Plan')
    end

    it 'clicks add plan (when no plans) and returns correct page' do
      visit dash_plans_path
      click_on('Add Plan')
      expect(current_path).to eq '/dash/plans/new'
    end

    it 'clicks on add new plan button when user has plans' do
      @plans = Fabricate(:plan, user_id: @user.id)
      visit dash_plans_path
      click_on('Add Another Plan')
      expect(current_path).to eq '/dash/plans/new'
    end
  end

  describe 'GET /dash/plan/new' do
    before do
      visit new_dash_plan_path
    end

    it 'shows a new plan form' do
      expect(page).to have_field('plan_name')
      expect(page).to have_field('plan_amount')
      expect(page).to have_field('plan_period_amount')
      expect(page).to have_field('plan_period_type')
      expect(page).to have_selector('input[type=submit]')
    end

    # it 'tries to submit wihtout entering data' do
    #   click_on('Add Plan')
    #   expect(current_path).to_not equals '/dash/plans'
    # end
  end

  describe 'GET /dash/plans/:id/edit' do
    before do
      @plan = Fabricate(:plan, user_id: @user.id)
      visit edit_dash_plan_path(@plan)
    end

    it 'checks plans values are being shown in form' do
      expect(page).to have_field('plan_name', with: @plan.name)
      expect(page).to have_field('plan_amount', with: @plan.amount)
      expect(page).to have_field('plan_period_amount', with: @plan.period_amount)
      expect(page).to have_field('plan_period_type', with: @plan.period_type)
    end

    it 'redirects to show page after edit' do
      click_on('Update Plan')
      expect(current_path).to eq dash_plan_path(@plan)
    end
  end
end
