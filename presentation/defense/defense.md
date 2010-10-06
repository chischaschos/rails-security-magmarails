!SLIDE bullets incremental
## Fixing exploits ##
* Lets look for already built tools
 * [Ruby Toolbox](http://ruby-toolbox.com/)
* And we'll look at what Rails offers us


!SLIDE bullets incremental
### [Rails Authorization](Rails Authorization) ###
* I'll choose [cancan](http://github.com/ryanb/cancan)


!SLIDE bullets incremental
### Querying ###


!SLIDE
## **Discouraged** ##
    @@@ ruby
    whereClause = "user_id = #{current_user.id}" 
    whereClause << " and request_amount ="
    whereClause << " #{params[:search_raise]}"
    @raises = Raise.where([whereClause])


!SLIDE
## *Recommended* ##
    @@@ ruby
    whereClause = 'user_id = ? and request_amount = ?'
    @raises = Raise.where([whereClause, current_user, 
      params[:search_raise]])


!SLIDE bullets incremental
## *...* ##
    @@@ruby
    get '/search/:query', :to => 'raises#index', 
      :as => 'search', 
      :constraints => {:options => /\d{5}/}

* Also, we could've created a *constraint* for that *route*


!SLIDE bullets incremental
### Sanitize input ###
    @@@ruby
    validates_format_of :site, 
    :with => /(^$)|(^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$)/ix

* Use whitelists
* Rails adds XSS protection by default in Rails3
 * [SafeBuffers and Rails3.0](http://yehudakatz.com/2010/02/01/safebuffers-and-rails-3-0/)


!SLIDE bullets incremental
### RoR built-in filter for special SQL characters ###
* Default scape for ’ , " , NULL character and line breaks
* Using Model.find(id) or Model.find_by_some thing(something)


!SLIDE bullets incremental
### ... ###
* In SQL Fragments, specially in conditions fragments it has to be applied manually
    @@@ ruby
    (:conditions => "...")
    connection.execute() 
    Model.find_by_sql() methods


!SLIDE bullets incremental
### Encouraged finders ###
    @@@ruby
    Model.find(:first, :conditions => ["login = ? AND password = ?", entered_user_name, entered_password])
    Model.find(:first, :conditions => {:login => entered_user_name, :password => entered_password})

* This provides automatically sanitize tainted variables


!SLIDE bullets incremental smaller
#HTTPOnly#
    @@@ruby
    SalaryManager::Application.config.session_store 
      :cookie_store, :key => '_acl_test_session', 
      :httponly => false

* Rails3 enables HttpPOnly on cookies by default
* config/initializers/session_store.rb
