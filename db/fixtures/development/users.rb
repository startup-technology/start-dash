User.seed(:id,
  { id: 1,
    email: 'user@example.com',
    crypted_password: User.encrypt('12345678')
  },
)
