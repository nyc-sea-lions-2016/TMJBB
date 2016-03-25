

sweet_users = {'tim' =>'t', 'mike' => 'm', 'brian' => 'b', 'john' => 'j','brett' => 'b' }
sweet_users.each do |name, pw|
  User.create(username: name, password: pw)
end
