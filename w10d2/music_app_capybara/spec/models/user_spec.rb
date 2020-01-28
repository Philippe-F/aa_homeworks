require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  user = User.new(email: "philippe@example.com", password: "valid_password")


  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_length_of(:password).is_at_least(6) } 
  

  it "creates a password digest when given a password" do
    expect(user.password_digest).to_not be_nil
  end

  it "creates a session token before validation" do
    user.valid?
    expect(user.session_token).to_not be_nil
  end

  describe "#reset_session_token!" do
    it "sets a new session token on user" do
      user.valid?
      old_session_token = user.session_token
      user.reset_session_token!

      expect(user.session_token).to_not eq(old_session_token)
    end

    it "returns a new session token" do
      expect(user.reset_session_token!).to eq(user.session_token)
    end
  end

  describe "#valid_password?" do
    it "verifies if a password is correct" do
      expect(user.valid_password?("valid_password")).to be true
    end

    it "verifies if a password is not correct" do
      expect(user.valid_password?("invalid_password")).to be false
    end
  end

  describe ".find_by_cred" do
    user.save! 

    it "returns a user given valid credentials" do
      expect(User.find_by_cred("philippe@example.com", 
      "valid_password")).to eq(user)
    end

    it "returns nil given bad credentials" do
      expect(User.find_by_cred("philippe@example.com", 
      "invalid_password")).to eq(nil)
    end
  end
end
