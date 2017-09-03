FactoryGirl.define do

  factory :message do
    id                   Faker::Number.digit
    body                 Faker::Lorem.sentence
    image                Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/0000inu.jpeg'))
    user
    group
  end

end
