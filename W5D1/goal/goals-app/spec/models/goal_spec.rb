require 'rails_helper'

RSpec.describe Goal, type: :model do

  describe "validation" do
    it { should validate_presence_of(:body) }
    it { should validate_presence_of(:user) }
  end

  describe "association" do
    it { should belong_to(:user)}
  end
end
