class UserMailer < ApplicationMailer

    default from: "admin@example.com"

    def welcome(user)
        @user = user
        @url = "http://localhost:3000/users/new"
        mail(to: user.username, subject: "Welcome to the 99 Cats Community")
    end 
end
