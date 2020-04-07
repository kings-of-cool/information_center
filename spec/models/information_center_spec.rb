require 'rails_helper'

RSpec.describe InformationCenter, type: :model do
  it "InformstionCenterは唯一であること" do
    FactoryBot.create(:information_center)
    expect{ FactoryBot.create(:information_center) }.to raise_error(I18n.t("errors.messages.exist_already"))
  end

  describe "validation" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:tel) }

    describe "tel" do
      using RSpec::Parameterized::TableSyntax
      let(:information_center) { FactoryBot.build(:information_center, tel: tel) }
      let(:tel) { '' }
      subject { information_center.valid? }
      context "ハイフンなし10桁or11桁のみを許可すること" do
        where(:tel, :valid?) do
          '1' | false
          '12' | false
          '123' | false
          '1234' | false
          '12345' | false
          '123456' | false
          '1234567' | false
          '12345678' | false
          '123456789' | false
          '1234567891' | true
          '090-9999-9999' | false
        end
        with_them do
          it { is_expected.to eq valid? }
        end
      end
    end
  end
end
