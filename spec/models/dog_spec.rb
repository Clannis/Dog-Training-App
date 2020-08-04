require 'rails_helper'

RSpec.describe Dog, type: :model do

  let(:user) {
    User.create(
      username: "Alex", 
      first_name: "Alex", 
      last_name: "Rodriguez", 
      phone_number: "123-456-7890", 
      email: "ARod@test.com", 
      password: "password")
  }

  let(:dog) {
    Dog.create(
      name: "Pitty", 
      breed: "pitbull", 
      age: 2, 
      shots: true, 
      last_shot_date: Time.current, 
      user_id: user.id)
  }

  it "is valid with a name, breed, age, shots boolean, last_shot_date, and user" do
    expect(dog).to be_valid
  end
  
  it "has a user" do
    expect(dog.user).to eq(user)
  end

  it "has many training sessions through training session dog" do
    course = Course.create(name: "Puppy Beginner", length: 8, cost: 250)
    trainer = Trainer.create(username: "WD_Train", first_name: "Walt", last_name: "Disney", phone_number: "555-555-5556", email: "Disney@test.com", certification: "Top Dog Academy", password: "password")
    training_session = TrainingSession.create(starts_at: Time.current, location: "Fischer Park", trainer_id: trainer.id, course_id: course.id)
    dog.training_sessions << training_session
    expect(dog.training_sessions.first).to eq(training_session)
  end
  
  it "has many courses through training sessions" do
    course = Course.create(name: "Puppy Beginner", length: 8, cost: 250)
    trainer = Trainer.create(username: "WD_Train", first_name: "Walt", last_name: "Disney", phone_number: "555-555-5556", email: "Disney@test.com", certification: "Top Dog Academy", password: "password")
    training_session = TrainingSession.create(starts_at: Time.current, location: "Fischer Park", trainer_id: trainer.id, course_id: course.id)
    dog.training_sessions << training_session
    expect(dog.courses.first).to eq(course)
  end
end
