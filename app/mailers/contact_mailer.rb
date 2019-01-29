class ContactMailer < ApplicationMailer
  def contact_mail(contact)
    @contact = contact
    mail to: 'tjdgmll2@naver.com', subject: "toiawasenomail"
  end
  
  def blog_mail(current_user)
    @user = User.find_by(id: current_user.id)
    @content = "blogの作成が完了しました。"
    mail to: @user.email, subject: "create blog success"
  end
end
