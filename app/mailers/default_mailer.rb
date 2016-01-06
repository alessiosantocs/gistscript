class DefaultMailer < ActionMailer::Base
  default from: 'notification@gistscript.com'

  def notification(sender, to, message)
    @message = message

    mail(
      :subject => "GistScript Notification - Sender: #{sender}",
      :to  => to)
  end
end
