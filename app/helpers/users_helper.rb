module UsersHelper
    def dog_link(user)
        if user.dogs.count == 0
            link_to 'Add Your First Dog', new_user_dog_path(user)
        else
            link_to "View Dogs", user_dogs_path(user)
        end
    end
end
