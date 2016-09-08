require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with default attributes" do
    user = build(:user)
    expect{user.save!}.not_to raise_error
  end
  it { should have_many(:posts).dependent(:destroy) }
  it { should have_many(:likes).dependent(:destroy) }
  it { should have_many(:comments).dependent(:destroy) }
  # username
  it do
    should validate_length_of(:username).
      is_at_least(4).is_at_most(15)
  end
  it { should validate_uniqueness_of(:username).on(:create).case_insensitive }
  # password
  it do
    should validate_length_of(:password).
      is_at_least(6).on(:create)
  end
  # email
  it { should validate_uniqueness_of(:email).on(:create).case_insensitive }

end
