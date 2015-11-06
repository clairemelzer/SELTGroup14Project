FactoryGirl.define do
  factory :user do
    email  "test-email@test.com"
    password  "test12345"
    name "Bob"
    password_confirmation "test12345"
  end
  
  factory :non_logged_user, parent: :user do
    self.session_token = nil
  end

end
