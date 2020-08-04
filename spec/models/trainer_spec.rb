require 'rails_helper'

RSpec.describe Trainer, type: :model do

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

  it "is valid with a username, first and last name, phone number, email, certification, and password" do
    expect(trainer).to be_valid
  end

  it "has many training sessions" do
    course = Course.create(name: "Puppy Beginner", length: 8, cost: 250)
    trainer = Trainer.create(username: "WD_Train", first_name: "Walt", last_name: "Disney", phone_number: "555-555-5556", email: "Disney@test.com", certification: "Top Dog Academy", password: "password")
    training_session = TrainingSession.create(starts_at: Time.current, location: "Fischer Park", trainer_id: trainer.id, course_id: course.id)
    trainer.training_sessions << training_session
    expect(trainer.training_sessions.first).to eq(training_session)
  end

  it "has many courses through training sessions" do
    course = Course.create(name: "Puppy Beginner", length: 8, cost: 250)
    trainer = Trainer.create(username: "WD_Train", first_name: "Walt", last_name: "Disney", phone_number: "555-555-5556", email: "Disney@test.com", certification: "Top Dog Academy", password: "password")
    training_session = TrainingSession.create(starts_at: Time.current, location: "Fischer Park", trainer_id: trainer.id, course_id: course.id)
    trainer.training_sessions << training_session
    expect(trainer.courses.first).to eq(course)
  end

  it "has many dogs through training session dogs" do
    course = Course.create(name: "Puppy Beginner", length: 8, cost: 250)
    trainer = Trainer.create(username: "WD_Train", first_name: "Walt", last_name: "Disney", phone_number: "555-555-5556", email: "Disney@test.com", certification: "Top Dog Academy", password: "password")
    training_session = TrainingSession.create(starts_at: Time.current, location: "Fischer Park", trainer_id: trainer.id, course_id: course.id)
    user = User.create(username: "Alex", first_name: "Alex", last_name: "Rodriguez", phone_number: "123-456-7890", email: "ARod@test.com", password: "password")
    dog = Dog.create(name: "Pitty", breed: "pitbull", age: 2, shots: true, last_shot_date: Time.current, user_id: user.id)
    training_session.dogs << dog
    trainer.training_sessions << training_session
    expect(trainer.dogs.first).to eq(dog)
  end

  it "has many users through dogs" do
    course = Course.create(name: "Puppy Beginner", length: 8, cost: 250)
    trainer = Trainer.create(username: "WD_Train", first_name: "Walt", last_name: "Disney", phone_number: "555-555-5556", email: "Disney@test.com", certification: "Top Dog Academy", password: "password")
    training_session = TrainingSession.create(starts_at: Time.current, location: "Fischer Park", trainer_id: trainer.id, course_id: course.id)
    user = User.create(username: "Alex", first_name: "Alex", last_name: "Rodriguez", phone_number: "123-456-7890", email: "ARod@test.com", password: "password")
    dog = Dog.create(name: "Pitty", breed: "pitbull", age: 2, shots: true, last_shot_date: Time.current, user_id: user.id)
    training_session.dogs << dog
    trainer.training_sessions << training_session
    expect(trainer.users.first).to eq(user)
  end
end
