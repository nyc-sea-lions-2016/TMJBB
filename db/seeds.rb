3.times do
	User.create(username: Faker::Name.name, password: "a" )
  Deck.create(name: Faker::Beer.name)
  Card.create(question: Faker::Hacker.say_something_smart, correct_answer: 42, deck_id: 1)
  Card.create(question: Faker::Hipster.sentence, correct_answer: 42, deck_id: 2)
  Card.create(question: Faker::StarWars.quote, correct_answer: 42, deck_id: 3)
end