class SafeBinding
  module Gistscript
    class Application
      class Script
      end
    end
  end

  class Script
  end

  def initialize
    @errors = []
    @results = []
  end

  def results
    @results
  end

  def errors
    @errors
  end

  def errors=(array)
    @errors = array
  end

  def params
    @params
  end

  def set_params(p)
    @params = p
  end

  # Sending emails (don't forget to .deliver)
  def mail(sender, to, message)
    DefaultMailer.notification(sender, to, message)
  end

  # Used to print stuff on debugger
  def print(m)
    @results << m
  end
  alias_method :puts, :print

  def get_binding
    return binding()
  end
end
