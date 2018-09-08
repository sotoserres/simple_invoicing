class HomeController < ApplicationController
  skip_authorization_check

  def index
  end

  def contact
    return unless params[:contact]

    @contact = Contact.new(contact_params)

    to_email = 'stella.rouzi@gmail.com'

    body = contact_params[:body]

    customer_email = current_user ? current_user.email : contact_params[:email]
    reply_to = customer_email
    puts "email: #{customer_email}"

    if @contact.valid?
      if Mailbot.contact_email("contact_form@#{ENV['HOSTNAME']}", to_email, reply_to, contact_params[:subject], body).deliver_later
        flash[:notice] = 'Your message has been successfully sent. We will get back to you as soon as possible.'
      else
        flash[:error] = 'There was an error. Please try again.'
      end
      redirect_to contact_path
    else
      flash[:alert] = 'Could not send e-mail: ' + @contact.errors.full_messages.to_sentence
      render 'contact'
    end
  end

  def recommend
    @referral_email = current_user.email if current_user
    return unless params[:recommendation]

    @recommendation = Recommendation.new(recommendation_params)

    if @recommendation.valid?
      Mailbot.recommend_email(@recommendation.to_json, current_user).deliver_later
      flash[:notice] = "Email successfully sent to #{@recommendation.to}"
    else
      flash[:alert] = @recommendation.errors.full_messages.to_sentence
    end
    redirect_to recommend_path
  end

  private

  def recommendation_params
    params.require(:recommendation).permit(:to, :referral)
  end

  def contact_params
    params.require(:contact).permit(:subject, :body, :email)
  end
end
