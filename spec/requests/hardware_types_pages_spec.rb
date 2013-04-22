require 'spec_helper'

describe 'Hardware types pages' do

  subject { page }

  describe 'index' do
    let(:user) { FactoryGirl.create(:user) }

    before(:each) do
      sign_in user
      visit hardware_types_path
    end

    it { should have_selector('title', text: 'Hardware types') }
    it { should have_selector('h1',    text: 'Hardware types') }
    it { should have_link('Add new',   href: new_hardware_type_path) }

    describe "pagination" do
      before(:all) { 32.times { FactoryGirl.create(:hardware_type) } }
      after(:all)  { HardwareType.delete_all }

      it "should list each hardware type" do
        HardwareType.paginate(page: 1).each do |hwtype|
          page.should have_selector('li', text: hwtype.name)
        end
      end
    end

    describe 'delete links' do
      let!(:hardware_type) { FactoryGirl.create(:hardware_type) }
      it { should_not have_link('delete') }

      describe 'as an admin user' do
        let(:admin) { FactoryGirl.create(:admin) }
        before do
          sign_in admin
          visit hardware_types_path
        end

        it { should have_link('delete', href: hardware_type_path(HardwareType.first)) }
        it 'should be able to delete hardware type' do
          expect { click_link('delete') }.to change(HardwareType, :count).by(-1)
        end
      end
    end
  end

  describe 'new' do
    let(:admin) { FactoryGirl.create(:admin) }
    before do
      sign_in admin
      visit new_hardware_type_path
    end
    let(:submit) { "Create" }

    describe 'with invalid information' do
      it 'should not create a hardware type' do
        expect { click_button submit }.not_to change(HardwareType, :count)
      end
    end

    describe 'with valid information' do
      before { fill_in 'Name', with: 'server1' }

      it 'should create a hardware type' do
        expect { click_button submit }.to change(HardwareType, :count).by(1)
      end
    end
  end
end