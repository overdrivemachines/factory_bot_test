FactoryBot.define do
  factory :post do
    title { Faker::Lorem.sentence(word_count: 3) }
    content { Faker::Lorem.paragraph(sentence_count: 3) }
    user { FactoryBot.create(:user) }

    after(:build) do |post|
      post.image.attach(
        io: File.open(Rails.root.join('spec', 'assets', 'images', 'test.jpg')),
        filename: 'test.jpg',
        content_type: 'image/jpeg'
      )
    end
  end
end
