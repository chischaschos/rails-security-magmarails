roles = Role.create([{:title => 'admin'}, {:title => 'human_resources'}, {:title => 'employee'}])
salaries = Salary.create([{:amount => 1000000}, {:amount => 1500}, {:amount => 123}])
User.create([
  {:email => 'admin@test.com', :password => '123admin123', :role => roles[0], :salary => salaries[0]}, 
  {:email => 'hr_first@test.com', :password => '123hr_first123', :role => roles[1], :salary => salaries[1]},
  {:email => 'employee@test.com', :password => '123employee123', :role => roles[2], :salary => salaries[2]}
])   
