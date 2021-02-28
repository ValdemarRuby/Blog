user_1 = User.create(nickname: 'Vasya', email: 'vasya.pupkin@gmail.com', password: '123456', password_confirmation: '123456')
admin = User.create(nickname: 'Admin', role: 0, email: 'admin@gmail.com', password: '888888', password_confirmation: '888888')
user_2 = User.create(nickname: 'Petya', email: 'petya@gmail.com', password: '123456', password_confirmation: '123456')
user_3 = User.create(nickname: 'Vova', email: 'vova@gmail.com', password: '123456', password_confirmation: '123456')

Post.create(title: 'My trip to Kiev', content: 'I’ll always remember my first trip to Kiev. I was in the eleventh grade, on a school trip to experience the Ukraine culture I’d been learning about and romanticizing in my mind for so long.', user_id: user_1.id)