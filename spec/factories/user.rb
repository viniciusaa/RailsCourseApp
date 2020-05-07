FactoryBot.define do
	factory :user do
		name { FFaker::Name.name }
		email { FFaker::Internet.safe_email }
    password { "123456" }
    admin { true }
	end
end
