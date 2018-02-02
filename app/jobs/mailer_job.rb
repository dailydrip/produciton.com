class MailerJob
  include Faktory::Job

  def perform(mailer, action, *args)
    mailer.constantize.send(action.to_sym, *args).deliver_now!
  end
end
