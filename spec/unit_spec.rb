require 'rails_helper'

RSpec.describe User, type: :model do

  describe "password encryption" do
    it "does not save passwords to the database" do
      User.create!(email: "jgreen@aol.com", fname: "jeff", lname:"green", password:"password", password_confirmation:"password")
      user = User.find_by_email("jgreen@aol.com")
      expect(user.password).not_to be("password")
    end
  end

  describe "associations" do
    it { should have_many(:posts) }
    it { should have_many(:comments) }
  end

  describe "validations" do
    it { should validate_presence_of(:fname) }
    it { should validate_presence_of(:lname) }
    it { should validate_presence_of(:email) }
  end
end

RSpec.describe Post, type: :model do
  describe "associations" do
    it { should belong_to(:author) }
    it { should have_many(:comments) }
  end

  describe "validations" do
    it { should validate_presence_of(:body) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:author) }
  end
end

RSpec.describe Comment, type: :model do
  describe "associations" do
    it { should belong_to(:author) }
    it { should belong_to(:post) }
  end

  describe "validations" do
    it { should validate_presence_of(:body) }
    it { should validate_presence_of(:author) }
    it { should validate_presence_of(:post) }
  end
end
