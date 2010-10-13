!SLIDE bullets incremental
## Default rules  ##
  

!SLIDE bullets incremental
## DR- Know your application layers ##
* Multiple *defense layers* deal with different *attack types*
 * *Network*, *Operating system*, *Web server*, *Web application* and *Database*


!SLIDE bullets incremental
## DR - Your system is as **secure** as the *weakest link* ... ##
* What if you provide:
 * *client side* input validation
 * *server side* input validation
 * Strong password encryptation


!SLIDE bullets incremental
## ... ##
* But your DB:
 * Accepts *remote connections* and ...
 * Admin user is *root*
 * And has **no password**


!SLIDE full-page
![plop](plop.jpg)


!SLIDE bullets incremental
## DR - Follow a *Fail close* approach ##
* > system has to be *secure post-failure*
* *Think as*, *double checking* that your application *flow* is exactly *as you want to*
* Improves *code readability*


!SLIDE bullets incremental
### **Discouraged** ###
    @@@ ruby
    def show_invoice
      @invoice = User.invoices.find(params[:id])
      unless @invoice
        redirect :action => 'not_authorized'
      end
    end
* > If *unless* block fails by some *unknown conditions* the *flow* will *continue* as if the user were *authorized*


!SLIDE
### *Recommended* ###
    @@@ ruby
    def show_invoice
      @invoice = User.invoices.find(params[:id])
      if @invoice
        redirect :action => 'authorized'
      else
        redirect :action => 'not_authorized'
      end
    end


!SLIDE bullets incremental
## DR - Prefer whitelists ##
* There are *positive* and *negative* input validations
 * A *positive* input validation implies creating a *whitelist*
 * A **negative** input validation implies creating a *blacklist*


!SLIDE bullets incremental
### **Discouraged** ###
    @@@ ruby
    @non_valid_chars = %w{%<>'"/\}

* Think about an *input* field that will accept a *user name*
* What *other* characters should we add to this list?


!SLIDE bullets incremental
### **Recommended** ###
    @@@ ruby
    @valid_chars = %w{[\w\s]*}


!SLIDE bullets incremental
## DR - Least privilege ##
* A user should be able to do as *little as possible* according domain requirements, **nothing else**


!SLIDE bullets incremental
## DR - DRY ##
* *Do not Repeat Yourself*
* *Avoid* **cutting/pasting code**
* Instead, strive for a *centralized security API*


!SLIDE bullets incremental
## DR - Avoid complexity ##
* *Complexity* is **bad**
* As complexity grows, security risks too

!SLIDE bullets incremental
## DR - Some useful tools ##
* [Tamper Data](https://addons.mozilla.org/en-US/firefox/addon/966/)
* [Firebug](https://addons.mozilla.org/en-US/firefox/addon/1843/?src=collection&collection_id=23d14a2d-b396-c08f-e9ba-b4d34691d5a9/)
