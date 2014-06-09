# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Example:
#
#   Person.create(first_name: 'Eric', last_name: 'Kelly')
Meetup.create(name: 'Rubyists', description: 'A group for rubyists.', location: 'Boston', user_id: 1)
Meetup.create(name: 'Dog People', description: 'A group for people with pet dogs.', location: 'Boston', user_id: 1)
Meetup.create(name: 'Cat People', description: 'A group for cat people.', location: 'New York City', user_id: 3)
Meetup.create(name: 'Dog Rubyists', description: 'Enjoy programming? Are you a dog? This group is for you!', location: 'California', user_id: 2)
Meetup.create(name: 'Cat C++', description: 'For cats programming in C++.', location: 'Alaska', user_id: 1)
Member.create(meetup_id: 1, user_id: 1)
Member.create(meetup_id: 1, user_id: 2)
Member.create(meetup_id: 2, user_id: 3)
Member.create(meetup_id: 3, user_id: 1)
User.create(provider: 'github', uid: '1234567', username: 'joe', email: 'joe@gma.com', avatar_url: 'http://placehold.it/408x408')
User.create(provider: 'github', uid: '7654321', username: 'joshua', email: 'joshua@gma.com', avatar_url: 'http://placehold.it/408x408')
