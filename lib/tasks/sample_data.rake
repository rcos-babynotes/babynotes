namespace :db do
	desc "fill database w/ sample data"
	task populate: :environment do
		babies = Baby.all(limit: 6)
		50.times do
			description = Faker::Lorem.sentence(5)
			babies.each { |baby| baby.events.create!(description: description)}
		end
	end
end