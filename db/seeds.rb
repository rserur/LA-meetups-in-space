# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Example:
#
#   Person.create(first_name: 'Eric', last_name: 'Kelly')
Meetup.create(name: 'Rubyists', description: 'A group for rubyists.', location: 'Boston', user_id: 1)
Meetup.create(name: 'Dog People', description: 'A group for people with pet dogs.', location: 'Boston', user_id: 1)
Member.create(meetup_id: 1, user_id: 1)
