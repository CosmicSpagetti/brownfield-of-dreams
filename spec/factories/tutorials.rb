# frozen_string_literal: true

FactoryBot.define do
  factory :tutorial do
    title { Faker::Name.unique.name }
    description { Faker::HitchhikersGuideToTheGalaxy.marvin_quote }
    thumbnail do
      'http://cdn3-www.dogtime.com/assets/uploads/2011/03/
              puppy-development-460x306.jpg'
    end
    playlist_id { Faker::Crypto.md5 }
    classroom { false }
  end
end
