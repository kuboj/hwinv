require 'spec_helper'

describe HardwareType do
  let(:hwtype) { FactoryGirl.create(:hardware_type) }

  subject { hwtype }

  it { should respond_to(:name) }
  it { should be_valid }

  describe 'invalid attributes' do
    describe 'when name is not present' do
      before { hwtype.name = nil }
      it { should_not be_valid }
    end

    describe 'when name is too long' do
      before { hwtype.name = 'a' * 100 }
      it { should_not be_valid }
    end

    describe 'when type is already in db' do
      let(:hwtype_with_same_name) { hwtype.dup }
      before do
        hwtype_with_same_name.name.upcase!
      end

      subject { hwtype_with_same_name }
      it { should_not be_valid }
    end
  end
end
