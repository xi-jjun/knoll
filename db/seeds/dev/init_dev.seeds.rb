Role.create!(name: 'admin')
Role.create!(name: 'staff')
Role.create!(name: 'club_member')
Role.create!(name: 'normal')

admin = Staff.first_or_create(email: 'admin@dongsan.pe', password: 'qwerqwer!', name: '김재준', display_name: '최고 관리자')
admin.add_role :admin

user = User.first_or_create(email: 'test@dongsan.pe', password: 'qwerqwer!', name: '테스트', display_name: '테스트 닉네임')
user.add_role :normal