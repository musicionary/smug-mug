require 'spec_helper'

describe User do
  it 'lists all the users' do
    test_user = User.create(name: "Bob", email: "bob@gmail.com", password: "Bob123")
    expect(User.all).to(eq([test_user]))
  end

  it 'is invalid without a name' do
    test_user = User.new(email: "bob@gmail.com", password: "Bob123")
    expect(test_user.save).to(eq(false))
  end

  it 'is invalid without an email' do
    test_user = User.new(name: "Bob", password: "Bob123")
    expect(test_user.save).to(eq(false))
  end

  it 'is invalid without a password' do
    test_user = User.new(name: "Bob", email: "bob@gmail.com")
    expect(test_user.save).to(eq(false))
  end
end
