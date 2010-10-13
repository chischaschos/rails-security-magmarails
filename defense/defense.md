!SLIDE bullets incremental
## Fixing that real application ##
* [Ruby Toolbox](http://ruby-toolbox.com/)
* [Rails Guides Security](http://guides.rubyonrails.org/security.html)
* And we'll look at what Rails offers us


!SLIDE bullets incremental
## FX - Rails Authorization ##
* I'll choose [cancan](http://github.com/ryanb/cancan)
* > CanCan is an *authorization library* for *Ruby on Rails* which *restricts* what *resources* a given *user* is *allowed to access*. All permissions are defined in a single location (the Ability class) and not duplicated across controllers, views, and database queries. 


!SLIDE bullets incremental
## ... ""
    @@@ruby 
    class UsersController < ApplicationController
      load_and_authorize_resource

* > *load_and_authorize_resource* method is provided to *automatically* authorize all actions in a *RESTful* style resource controller. It will use a before filter to load the resource into an instance variable and authorize it for each action.


!SLIDE 
## ... ##
    @@@ruby 
    class Ability
      include CanCan::Ability

      def initialize(user)
        if user.role.title == :admin
          can :manage, :all
        else
          can :create, Raise
          can :read, Salary, :user_id => user.id
          can [:read, :update], User, :id => user.id
        end
      end
    end


!SLIDE
## ... ##
    @@@ruby
    @users = User.accessible_by(current_ability)


!SLIDE bullets incremental
## FX - XSS and Injection ##
* Rails adds XSS protection by default in Rails3
 * [SafeBuffers and Rails3.0](http://yehudakatz.com/2010/02/01/safebuffers-and-rails-3-0/)


!SLIDE bullets incremental
## ... ##
* RoR has a *built-in filter* for *special SQL characters*
 * You get default scaping for *’* , *"* , *NULL* character and *line breaks*
 * By using *Model.find(id)* or *Model.find_by_something(something)*


!SLIDE bullets incremental
## ... ##
    @@@ ruby
    (:conditions => "...")        #conditions
    connection.execute()          #manual statements
    Model.find_by_sql() methods   #sql fragments
* Be careful with **SQL Fragments** and conditions
 * Specially condition fragments, where scaping has to be manually applied


!SLIDE bullets incremental
## FX - Encouraged finders ##
    @@@ruby
    Model.find(:first, 
      :conditions => ["login = ? AND password = ?", 
      entered_user_name, entered_password])

    Model.find(:first, 
      :conditions => {:login => entered_user_name, 
      :password => entered_password})

* This provides *automatically* sanitized variables


!SLIDE
### **Discouraged** ###
    @@@ ruby
    whereClause = "user_id = #{current_user.id}" 
    whereClause << " and request_amount ="
    whereClause << " #{params[:search_raise]}"
    @raises = Raise.where([whereClause])


!SLIDE
### *Recommended* ###
    @@@ ruby
    whereClause = 'user_id = ? and request_amount = ?'
    @raises = Raise.where([whereClause, current_user, 
      params[:search_raise]])


!SLIDE bullets incremental
### Sanitize input ###
    @@@ruby
    validates_format_of :site, 
    :with => /(^$)|(^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$)/ix
* *Whitelists* example with *regular expressions*


!SLIDE bullets incremental
### ... ###
    @@@ruby
    get '/search/:query', :to => 'raises#index', 
      :as => 'search', 
      :constraints => {:options => /\d{5}/}
* Also, we could've created a *constraint* for that *route*


!SLIDE bullets incremental
## FX - HTTPOnly ##
    @@@ruby
    SalaryManager::Application.config.session_store 
      :cookie_store, :key => '_acl_test_session', 
      :httponly => false

* Rails3 *enables HttpPOnly* on cookies by *default*
* config/initializers/session_store.rb
