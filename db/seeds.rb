5.times do
	User.create(username: Faker::Name.name, password: "a" )
end

2.times do
	Deck.create(name: Faker::Beer.name, round_id: 1)
end

30.times do
	Card.create(question: Faker::Hacker.say_something_smart, correct_answer: 42, deck_id: rand(1..Deck.count))
end