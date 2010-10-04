roles = Role.create([{:title => 'admin'}, {:title => 'human_resources'}, {:title => 'employee'}])
salaries = Salary.create([{:amount => 1000000}, {:amount => 5}, {:amount => 10000}, {:amount => 500}, {:amount => 20000}])
users = User.create([
  {:email => 'admin@test.com', :password => '123admin123', :role => roles[0], :salary => salaries[0]}, 
  {:email => 'poor@test.com', :password => '123poor123', :role => roles[2], :salary => salaries[1]},
  {:email => 'average@test.com', :password => '123average123', :role => roles[2], :salary => salaries[2]},
  {:email => 'dumb@test.com', :password => '123dumb123', :role => roles[2], :salary => salaries[3]},
  {:email => 'employee@test.com', :password => '123employee123', :role => roles[2], :salary => salaries[4]}
])   
Raise.create([
  {:user => users[0], :approver => users[0], :request_amount => 1000000 , :is_approved => true},
  {:user => users[2], :approver => users[0], :request_amount => 15000, :is_approved => true},
  {:user => users[4], :approver => users[0], :request_amount => 55000, :is_approved => false}
])
