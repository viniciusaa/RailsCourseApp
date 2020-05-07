FactoryBot.define do
	factory :recipe do
		name { FFaker::Name.name }
		description { FFaker::Lorem.paragraph }
    user_id { 1 }
	end
end
