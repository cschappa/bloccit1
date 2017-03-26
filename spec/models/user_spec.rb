require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create!(name: "Blocit User", email: "user@blocit.com", password: "password") }

  #shoulda tests for name
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_length_of(:name).is_at_least(1) }

  #shoulda tests for email
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_uniqueness_of(:email) }
  it { is_expected.to validate_length_of(:email).is_at_least(3) }
  it { is_expected.to allow_value("user@blocit.com").for(:email) }

  #shoulda tests for password
  it { is_expected.to validate_presence_of(:password) }
  it { is_expected.to have_secure_password }
  it { is_expected.to validate_length_of(:password).is_at_least(6) }

  describe "attributes" do
    it "should have name and email attributes" do
      expect(user).to have_attributes(name: "Blocit User", email: "user@blocit.com")
    end
  end

  describe "invalid user" do
    let(:user_with_invalid_name) { User.new(name: "", email: "user@blocit.com")}
    let(:user_with_invalid_email) { User.new(name: "Blocit User", email: "")}

    it "should be an invalid user due to blank name" do
      expect(user_with_invalid_name).to_not be_valid
    end

    it "should be an invalid user due to blank email" do
      expect(user_with_invalid_email).to_not be_valid
    end
  end

  describe "with lower case name" do
    let(:user_with_lowcase_name) { User.create!(name: "my name", email: "user@blocit.com", password: "password")}

    it "should capitalize name" do
      expect(user_with_lowcase_name).to have_attributes(name: "My Name")
    end

    it "should work with properly formated name" do
      expect(user).to have_attributes(name: "Blocit User")
    end

  end
end
