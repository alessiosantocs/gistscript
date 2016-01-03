class TestMailer < ActionMailer::Base
  def message
    mail(
      :subject => 'Hello from Postmark',
      :to  => 'alessio.santocs@gmail.com',
      :from => 'notification@gistscript.com',
      :html_body => '<strong>Hello</strong> dear Postmark user.')
  end
end
