if Rails.env.development?
  ActionMailer::Base.smtp_settings = {
      :address              => "smtp.gmail.com",
      :port                 => 587,
      :domain               => "localhost",
      :user_name            => "sergpump",
      :password             => "vjhj;tyre,s",
      :authentication       => "plain",
      :enable_starttls_auto => true
  }
end