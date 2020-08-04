require 'rails_helper'

RSpec.describe TrickCourse, type: :model do

  let(:trick) {
    Trick.create(
      name: "Sit",
      description: "The dog sits down.",
      difficulty_rating: 1
    )
  }

  let(:course) {
    Course.create(
      name: "Puppy Beginner", 
      length: 8, 
      cost: 250
    )
  }

  let(:trick_course) {
    TrickCourse.create(
      trick_id: trick.id,
      course_id: course.id
    )
  }

  it "is valid with a trick_id and a course_id" do
    expect(trick_course). to be_valid
  end
  
  it "belongs to one trick" do
    expect(trick_course.trick).to eq(trick)
  end

  it "belongs to one course" do
    expect(trick_course.course).to eq(course)
  end
end
