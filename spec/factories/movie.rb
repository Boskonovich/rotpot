FactoryGirl.define do
  factory :movie, class: Movie do
    id 1
    title 'A Fake Title' # default values
    rating 'PG'
    release_date { 10.years.ago }
    director 'A director'
  end
end
