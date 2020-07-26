# Outline

## User
___
### Relationships
- has_many dogs
- has many training sessions, through dogs
- has many courses, through training sessions
### Attributes
- username
- password
- first name
- last name
- phone number
- email 
### methods
- name
    - returns first and last name

## Dog
___
### Relationships
- belongs to user
- has many training sessions
- has many trainers, through training sessions
- has many courses, through training sessions
### Attributes
- name
- breed
- age
- shots
- date of last shot 
- image path
- user id

## Course
___
### Relationships
- has many tricks
- has many training sessions
- has many dogs, through training session
- has many users, through dog
### Attributes
- name
- length of course
- cost 


## Training Session (Join Table)
___
### Relationships
- belongs to trainer
- belongs to dog
- belongs to course
### Attributes
- datetime
- location 
- trainer id
- dog id
- course id
### methods
- date
    - returns readable date
- time
    - returns readable time

## Trainer
___
### Relationships
- has many courses, through training session
- has many dogs, through training session
- has many users, through dog
### Attributes
- username
- password
- first name
- last name
- phone number
- email
- certification
- image path
### methods
- name
    - returns first and last name

## Trick
___
### Relationships
- has many courses
### Attributes
- name
- difficulty_rating

## Trick_Course (Join Table)
___
### Relationships
- belongs to course
- belongs to trick
### Attributes
- course id
- trick id
