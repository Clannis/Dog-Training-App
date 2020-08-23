# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project: created project with rails g
- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes): user has many dogs 
- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User): dogs belong to a user
- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients): course has many tricks, through trick_courses and trick has many courses, through tick_courses
- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients): trainer has many courses through training_sessions, course has many trainers, through training_sessions
- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity): training_session has a starts_at and location editable by trainers
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item): require uniqueness of usernames and that phone numbers are only integer
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes): collects all users dogs and sorts them ASC
- [x] Include signup (how e.g. Devise): user and trainer sign up with credentials
- [x] Include login (how e.g. Devise): user and trainer login with credentials
- [x] Include logout (how e.g. Devise): users and trainers logout with same link
- [x] Include third party signup/login (how e.g. Devise/OmniAuth): github login
- [x] Include nested resource show or index (URL e.g. users/2/recipes): course nests training sessions and tricks
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new): course nests new tricks and training session routes
- [x] Include form display of validation errors (form URL e.g. /recipes/new): all forms re-render form with errors displayed

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate: all forms are partials
