User.seed(:id,
  { id: 1,
    name: 'テスト太郎',
    email: 'user@example.com',
    crypted_password: User.encrypt('12345678')
  },
)
