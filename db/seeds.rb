# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

# Admin Users
admin_users = [ { name: "dobestan", mysnu: "dobestan", admin: true, active: true, password: "foobar", password_confirmation: "foobar" } ]
admin_users.each do |admin_user|
  User.create(admin_user)
end

demo_users = [ { name: "demo1", mysnu: "demo1", active: true, password: "foobar", password_confirmation: "foobar" },
               { name: "demo2", mysnu: "demo2", active: true, password: "foobar", password_confirmation: "foobar" } ]
demo_users.each do |demo_user|
  User.create(demo_user)
end

faqs = [ { title: "왜 마이스누 이메일을 통해서 서울대학교 동문 인증을 하나요? 학부생, 대학원생, 졸업생 뿐만 아니라 교직원이나 공익들도 사용할 수 있나요?",
           content: "가장 현실적으로 서울대학교 동문 인증을 할 수 있는 방법이며, 서울대학교 학부생, 대학원생, 졸업생뿐만 아니라, 동문 여러분들을 위해 고생하시는 직원분들과 공익분들을 배척하지 않는 조금은 더 나은 커뮤니티를 지향합니다. "},

         { title: "제 개인정보는 어떻게 저장되고 있나요?",
           content: "현재 채팅에서 사용할 닉네임, 마이스누 웹메일 주소, 비밀번호를 받고 있습니다. 닉네임 같은 경우는 평문으로 그대로 저장되며 채팅시에 상대방에게 공개됩니다. 마이스누 웹메일 주소는 인증을 위해서만 사용되며 어떠한 경우에도 공개되지 않습니다. 비밀번호는 암호화되어 DB에 저장됩니다. 암호를 잊어버리셨다면 암호초기화를 통해서 다시 서비스를 이용하실 수 있습니다." },

         { title: "차단 유저와 일간베스트 차단 유저는 무엇인가요?",
           content: "일베 차단 유저는 향후 서비스를 이용할 수 없으며, 로그인 시에 벌레가 기어다는 영상이 재생됩니다." }]
faqs.each do |faq|
  Faq.create(faq)
end

