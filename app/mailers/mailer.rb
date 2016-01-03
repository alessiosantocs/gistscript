class Mailer < ActionMailer::Base
  def message(options={})
    options[:subject] ||= 'New notification from Gistscript'
    options[:to] ||= 'alessio.santocs@gmail.com'
    options[:body] || = 'Gist script notification mail.'

    mail(
      :subject => options[:subject],
      :to  => options[:to],
      :from => 'notification@gistscript.com',
      :html_body => options[:body],
      :track_opens => 'true')
  end
end
