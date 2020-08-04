require 'rails_helper'

RSpec.describe Trick, type: :model do

  let(:trick) {
    Trick.create(
      name: "Sit",
      description: "The dog sits down.",
      difficulty_rating: 1
    )
  }

  it "is valid with a name, description, and difficulty_rating" do
    expect(trick).to be_valid
  end

  it "has many courses through trick_courses" do
    course = Course.create(name: "Puppy Beginner", length: 8, cost: 250)
    trick.courses << course
    expect(trick.courses.first).to eq(course)
  end
end
