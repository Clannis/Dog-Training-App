require 'rails_helper'

RSpec.describe TrainingSessionDog, type: :model do

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

  let(:training_session_dog) {
    TrainingSessionDog.create(
      training_session_id: training_session.id,
      dog_id: dog.id
    )
  }

  it "is valid with a training_session_id and a dog_id" do
    expect(training_session_dog). to be_valid
  end
  
  it "belongs to one training session" do
    expect(training_session_dog.training_session).to eq(training_session)
  end

  it "belongs to one dog" do
    expect(training_session_dog.dog).to eq(dog)
  end

end
