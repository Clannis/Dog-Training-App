# Models Outline

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
### Features
- show user /home page
    - user info
    - up comming training sessions (link training session show)
    - dogs owned (link nested? dog show)
    - edit dogs owned button
    - edit info button
- edit user info
    - edit name
    - edit dogs owned
    - edit email
    - edit password
    - edit phone number
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
### Features
- show dog
    - dog info
    - classes
        - enrolled (link class show)
            - trainer
            - unenroll button
        - completed
            - trainer
    - enroll in new class button
    - edit info button
- edit dog
    - edit name
    - edit date of last shots
    - change image path

## Course
___
### Relationships
- has many trick_courses
- has many tricks, through trick_courses
- has many training sessions
- has many dogs, through training session
- has many users, through dog
### Attributes
- name
- length of course
- cost 
### Features
- index course
    - courses
        - cost
- show course
    - info 
    - tricks taught.each (link trick show)

## Training Session (Join Table)
___
### Relationships
- belongs to trainer
- has many dogs
- belongs to course
### Attributes
- starts at
- location 
- trainer id
- dog id
- course id
### methods
- date
    - returns readable date
- time
    - returns readable time
### Features
- show training session
    - show info


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
### Features
- show trainer
    - show info
- index trainer
    - trainer.each (link trainer show)
    - picture
    - name

## Trick
___
### Relationships
- has many courses
### Attributes
- name
- description
- difficulty_rating

## Trick_Course (Join Table)
___
### Relationships
- belongs to course
- belongs to trick
### Attributes
- course id
- trick id
### Features
- index trick
    - trick name
    - trick.each (link trick show)
- show trick
    - info
    - link to or embedded video

## Training_session_Dog (Join Table)
---
### Relationships
- belongs to Training Session
- belongs to Dog
### Attributes
- training_session id
- dog id
