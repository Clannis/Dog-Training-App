require 'rails_helper'

RSpec.describe Course, type: :model do

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

  it "has many tricks through trick_course" do
    trick = Trick.create(name: "sit", description: "Dog sits down", difficulty_rating: 1)
    course.tricks << trick
    expect(course.tricks.first).to eq(trick)
  end

  it "has many training_sessions" do
    trainer = Trainer.create(username: "WD_Train", first_name: "Walt", last_name: "Disney", phone_number: "555-555-5556", email: "Disney@test.com", certification: "Top Dog Academy", password: "password")
    training_session = TrainingSession.create(starts_at: Time.current, location: "Fischer Park", trainer_id: trainer.id, course_id: course.id)
    expect(course.training_sessions.first).to eq(training_session)
  end

  it "has many dogs through training sessions" do
    trainer = Trainer.create(username: "WD_Train", first_name: "Walt", last_name: "Disney", phone_number: "555-555-5556", email: "Disney@test.com", certification: "Top Dog Academy", password: "password")
    training_session = TrainingSession.create(starts_at: Time.current, location: "Fischer Park", trainer_id: trainer.id, course_id: course.id)
    user = User.create(username: "Alex", first_name: "Alex", last_name: "Rodriguez", phone_number: "123-456-7890", email: "ARod@test.com", password: "password")
    dog = Dog.create(name: "Pitty", breed: "pitbull", age: 2, shots: true, last_shot_date: Time.current, user_id: user.id)
    training_session.dogs << dog
    expect(course.dogs.first).to eq(dog)
  end

  it "has many users through dogs" do
    trainer = Trainer.create(username: "WD_Train", first_name: "Walt", last_name: "Disney", phone_number: "555-555-5556", email: "Disney@test.com", certification: "Top Dog Academy", password: "password")
    training_session = TrainingSession.create(starts_at: Time.current, location: "Fischer Park", trainer_id: trainer.id, course_id: course.id)
    user = User.create(username: "Alex", first_name: "Alex", last_name: "Rodriguez", phone_number: "123-456-7890", email: "ARod@test.com", password: "password")
    dog = Dog.create(name: "Pitty", breed: "pitbull", age: 2, shots: true, last_shot_date: Time.current, user_id: user.id)
    training_session.dogs << dog
    expect(course.dogs.first.user).to eq(user)
  end
end
