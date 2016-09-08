require 'rails_helper'

RSpec.describe Post, type: :model do
  it { should belong_to(:author) }
  it { should validate_presence_of(:body) }
  it { should have_many(:comments).dependent(:destroy) }
  it { should have_many(:likes).dependent(:destroy) }
  it { should validate_presence_of(:body) }
end
