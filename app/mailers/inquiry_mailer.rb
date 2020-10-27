class InquiryMailer < ActionMailer::Base
  default from: "example@example.com"

    def received_email(inquiry)
        @inquiry = inquiry
        mail(to: inquiry.email, bcc: ENV['USER_NAME'], subjext: 'お問い合わせを承りました')
    end
end