require 'rails_helper'

RSpec.describe Comment, type: :model do
  it { should have_many(:likes).dependent(:destroy) }
  it { should belong_to(:user) }
  it { should validate_presence_of(:body) }
end
