def fake_start_time(earliest_date = Date.current.beginning_of_day, latest_date = earliest_date.advance(days: 14).end_of_day)
  local_date = Faker::Time.between(earliest_date, latest_date)
  utc_date = local_date.utc
  utc_date.change(hour: [11, 12, 13, 14].sample, min: [0, 15, 30, 45].sample, sec: 0)
end

user1 = User.create(username: "Vikky", email: "vikky@gmail.com", password: "bubbles1")
user2 = User.create(username: "Brian", email: "brian@gmail.com", password: "123456")
user3 = User.create(username: "Melissa", email: "m@gmail.com", password: "runrunrun")
user4 = User.create(username: "Graham", email: "g@gmail.com", password: "0000000")
user5 = User.create(username: "Alyssa", email: "a@gmail.com", password: "password")

potluck1 = Potluck.create(name: "Picnic", location: "1033 W Van Buren", starts_at: fake_start_time(Date.current.beginning_of_day, Date.current.end_of_day), host: user2)

potluck2 = Potluck.create(name: "TacoHawk Reunion", location: "Melissa's Place", starts_at: fake_start_time(2.days.from_now.beginning_of_day), host: user3)


potluck3 = Potluck.create(name: "DBC Instructors' Mimosa Night", location: "Paris", starts_at: fake_start_time(4.days.from_now.beginning_of_day), host: user5)

contributions1 = Contribution.create(food_item: "Tacos", attendee: user3)
contributions2 = Contribution.create(food_item: "Waffles", attendee: user1)
contributions3 = Contribution.create(food_item: "Rosé", attendee: user4)
contributions4 = Contribution.create(food_item: "Sloppy Joes", attendee: user2)

potluck1.contributions << contributions4
potluck2.contributions << contributions1
potluck3.contributions << contributions3
potluck2.contributions << contributions2






