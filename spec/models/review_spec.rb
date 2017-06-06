require 'rails_helper'

RSpec.describe Review, type: :model do
  context "review is valid with all attributes" do
    before do
      @user = create(:user)
      @property = create(:property)
    end
    it { should validate_presence_of(:rating) }
    it { should validate_presence_of(:comment) }
    it { should belong_to :user }
    it { should belong_to :property }
  end

  it "is invalid without rating" do
    review = build(:review, rating: nil, comment: "Great Home!", user: @user, property: @property)
    expect(review).to_not be_valid
  end

  it "is invalid without comment" do
    review = build(:review, rating: 5, comment: nil, user: @user, property: @property)
    expect(review).to_not be_valid
  end

  it "is invalid without owner" do
    review = build(:review, rating: 5, comment: "Great Home", user: nil, property: @property)
    expect(review).to_not be_valid
  end

  it "is invalid without property" do
    review = build(:review, rating: 5, comment: "Great Home", user: @user, property: nil)
    expect(review).to_not be_valid
  end

end