class ApplicationMailer < ActionMailer::Base
  default from: %('TestGuru' <no-reply@testguru.com>)
  layout 'mailer'
end
