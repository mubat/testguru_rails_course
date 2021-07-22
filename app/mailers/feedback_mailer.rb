class FeedbackMailer < ApplicationMailer

  def new_feedback(feedback)
    @feedback = feedback
    mail to: User.where(type: 'Admin').pluck(:email),
         subject: "Новая запись 'Обратная связь'!",
         from: @feedback.user.email
  end
end
