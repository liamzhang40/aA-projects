require 'rails_helper'

RSpec.describe User, type: :model do

  describe "validations" do
    it { should validate_presence_of(:username)}
    it { should validate_presence_of(:password_digest)}
    it { should validate_presence_of(:session_token)}
    it { should validate_length_of(:password).is_at_least(6) }

    before :each do
      create(:user)
    end

    it { should validate_uniqueness_of(:session_token)}
    it { should validate_uniqueness_of(:username)}
  end

  describe "#password=" do

    let(:user) { create(:user) }
    it "should set a new password_digest" do

      expect(user.password_digest).to be_present
    end
  end

  describe "#is_password?" do

    let(:user) { create(:user) }
    it "should check if a password matches password_digest" do

      expect(user.is_password?("starwars")).to be true
    end
  end

  describe "::find_by_credentials" do

    let(:user) { create(:user) }
    context "with valid credentials" do
      it "should return a user" do
        user.save!
        test_user = User.find_by_credentials(user.username, user.password)
        expect(test_user).to be_present
      end
    end

    context "with invalid credentials" do
      it "should return nil" do
        user.save!
        test_user = User.find_by_credentials(user.username, "123456")
        expect(test_user).to be(nil)
      end
    end

  end
end
