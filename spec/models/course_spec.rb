require 'rails_helper'

RSpec.describe Course, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  let(:course) {
    Course.create(
      name: "Puppy Beginner",
      length: 8,
      cost: 250
    )
  }

  it "is valid with a name, length, and cost" do
    expect(course).to be_valid
  end

  it "has many tricks" do
    trick = Trick.create(name: "sit", description: "Dog sits down", difficulty_rating: 1)
    course.tricks << trick
    expect(course.tricks.first).to eq(trick)
  end
end
