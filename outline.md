# Outline

## User
___
### Relationships
- has_many dogs
- has many training sessions
- has many courses, through training sessions
### Attributes
- username
- password
- name
- phone number
- email 

## Dog
___
### Relationships
- belongs to user
- has many training sessions, through user
- has many trainers, through training sessions
- has many courses, through training sessions
### Attributes
- name
- breed
- age
- shots
- date of last shot 
- image path

## Course
___
### Relationships
- has many training sessions
- has many users, through training session
- has many dogs, through user
### Attributes
- name
- length of course
- tricks
- cost 


## Training Session (Join Table)
___
### Relationships
- belongs to trainer
- belongs to user
- belongs to course
### Attributes
- date
- time
- location 

## Trainer
___
### Relationships
- has many courses, through training session
- has many dogs, through training session
- has many users, through dog
### Attributes
- username
- password
- name
- phone number
- email
- certifications
- image path