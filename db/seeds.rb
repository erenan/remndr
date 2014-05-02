# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts 'Adding seed links'
link = Link.create title: "Facebook Page",
             url: 'http://Facebook.com',
             hits: 3,
             user_id: 2

link = Link.create title: "Google",
             url: 'http://google.com',
             hits: 3,
             user_id: 1

link = Link.create title: "Ed's Page",
             url: 'http://edgarrivera.com',
             hits: 3,
             user_id: 3

link = Link.create title: "The Chive",
             url: 'http://chive.com',
             hits: 3,
             user_id: 1

remind = Reminder.create title: "Do BEWD Homework",
             body: 'This homework is very cool!',
             remind_date: '2014-05-02',
             expire_date: '2014-05-03',
             created_at: '2014-05-01',
             user_id: 3

remind = Reminder.create title: "Another Reminder",
             body: 'Bla Bla Bla Vla Vla Vla Vla Bla',
             remind_date: '2014-06-02',
             expire_date: '2014-06-03',
             created_at: '2014-05-01',
             user_id: 1

remind = Reminder.create title: "More Reminders",
             body: 'sakjdnadkjladaskdnas,d sadasdsadasdads',
             remind_date: '2014-07-02',
             expire_date: '2014-07-03',
             created_at: '2014-05-01',
             user_id: 2


puts 'Done adding stories'