class AppMailer < ActionMailer::Base
  def notify_on_new_account
    mail from: 'info@sigmagroup@solutions', to: "loganrice72@gmail.com", subject: "You created your first email"
  end

  def receive(email)
    page = Page.find_by(address: email.to.first)
    page.emails.create(
      subject: email.subject,
      body: email.body
      )
    if email.has_attachements?
      email.attachements.each do |attachment|
        page.attachements.create({
          file: attachement,
          description: email.subject
          })
      end
    end
  end
end