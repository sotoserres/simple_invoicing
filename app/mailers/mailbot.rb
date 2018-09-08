class Mailbot < ActionMailer::Base
  helper :application

  def noreply
    ENV['sender_for_emails']
  end

  def contact_email(from, to, reply_to, subject, body)
    @email_body = body
    @reply_to_email = reply_to
    @customer = User.find_by(email: reply_to)

    mail(from: from,
         to: to,
         reply_to: reply_to,
         subject: subject)
  end

  def new_sign_up_email(user)
    @new_user = user
    subject = "New user signed up with email #{user.email}"

    mail(from: noreply,
         to: noreply,
         subject: subject)
  end

  def recommend_email(recommendation, current_user=nil)
    recommendation = JSON.parse(recommendation, object_class: OpenStruct)
    return unless recommendation.to

    @referral_email = recommendation.referral if recommendation.referral
    @recipient_email = recommendation.to
    reply_to = ENV['support_email']
    subject = 'Easy bootstrap of your Rails App with everything you need with Stella Rouzi'

    mail(from: noreply, to: recommendation.to, reply_to: reply_to, subject: subject)
  end
end
