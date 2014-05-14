class UserMailer < ActionMailer::Base
  default from: "no-reply@snuchat.com"

  def activation_email(user)
    @user = user
    @email = @user.mysnu + "@snu.ac.kr"
    @activation_url = activate_path(activation_token: @user.activation_token)
    mail(to: @email, subject: "서울대학교 익명 채팅 커뮤니티")
  end

  def password_reset_email(user, password)
    @user = user
    @password = password
    @email = @user.mysnu + "@snu.ac.kr"
    mail(to: @email, subject: "[스누챗] 패스워드 초기화 안내")
  end
end
