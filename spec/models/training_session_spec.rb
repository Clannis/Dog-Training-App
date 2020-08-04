require 'rails_helper'

RSpec.describe TrainingSession, type: :model do
  
  let(:course) {
    Course.create(
      name: "Puppy Beginner", 
      length: 8, 
      cost: 250
    )
  }

  let(:trainer) {
    Trainer.create(
      username: "WD_Train", 
      first_name: "Walt", 
      last_name: "Disney", 
      phone_number: "555-555-5556", 
      email: "Disney@test.com", 
      certification: "Top Dog Academy", 
      password: "password"
    )
  }
  
  let(:training_session) {
    TrainingSession.create(
      starts_at: Time.current, 
      location: "Fischer Park", 
      trainer_id: trainer.id, 
      course_id: course.id
    )
  }

  it "is valid with a starts_at, location, trainer, and course" do
    expect(training_session).to be_valid
  end

  it "has one trainer" do
    expect(training_session.trainer).to eq(trainer)
  end

  it "has one course" do
    expect(training_session.course).to eq(course)
  end

  it "has many dogs through training_session_dogs" do
    user = User.create(username: "Alex", first_name: "Alex", last_name: "Rodriguez", phone_number: "123-456-7890", email: "ARod@test.com", password: "password")
    dog = Dog.create(name: "Pitty", breed: "pitbull", age: 2, shots: true, last_shot_date: Time.current, user_id: user.id)
    training_session.dogs << dog
    expect(training_session.dogs.first).to eq(dog) 
  end

  it "has many users through dogs" do
    user = User.create(username: "Alex", first_name: "Alex", last_name: "Rodriguez", phone_number: "123-456-7890", email: "ARod@test.com", password: "password")
    dog = Dog.create(name: "Pitty", breed: "pitbull", age: 2, shots: true, last_shot_date: Time.current, user_id: user.id)
    training_session.dogs << dog
    expect(training_session.users.first).to eq(user)
  end
end
