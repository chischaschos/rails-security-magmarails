!SLIDE bullets incremental
## Default rules  ##
  

!SLIDE bullets incremental
### Know your application layers ###
* Multiple *defense layers* deal with different *attack types*
 * *Network*, *Operating system*, *Web server*, *Web application* and *Database*


!SLIDE bullets incremental
### Your system is as **secure** as the *weakest link* ... ###
* What if you provide:
 * *client side* input validation
 * *server side* input validation
 * Strong password encryptation


!SLIDE bullets incremental
### ... ###
* But your DB:
 * Accepts *remote connections* and ...
 * Admin user is *root*
 * And has **no password**


!SLIDE full-page
![plop](plop.jpg)


!SLIDE bullets incremental
### Follow a *Fail close* approach ###
* *Secure* system *post-failure*
* Double checking that your application *flow* is exactly *as want to*
* Improves *code readability*


!SLIDE bullets incremental
##**Discouraged**##
    @@@ ruby
    def show_invoice
      @invoice = User.invoices.find(params[:id])
      unless @invoice
        redirect :action => 'not_authorized'
      end
  end
* > If *unless* block fails by some unknown conditions the flow will continue as if the user were authorized



!SLIDE
##*Recommended*##
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
### Prefer whitelists ###
* There are *positive* and *negative* input validations
* A *positive* input validates implies creating a *whitelist*
* A **negative** input validates implies creating a *blacklist*


!SLIDE bullets incremental
## **Discouraged** ##
    @@@ ruby
    @non_valid_chars = %w{%<>'"/\}

* Think about an *input* field that will accept a *user name*
*  What *other* characters should we add to this list?


!SLIDE bullets incremental
## **Recommended** ##
    @@@ ruby
    @valid_users = %w{pepe marco raul}

* Think about a *list* of valid admin *user names*
* What *other* names should we add to this list?

!SLIDE bullets incremental
### Least privilege ###
* A user should be able to do as *little as possible* according domain requirements, **nothing else**


!SLIDE bullets incremental
### DRY ###
* *Do not Repeat Yourself*
* Focus on not **cutting pasting code**
* Centralized security API


!SLIDE bullets incremental
### Avoid complexity ###
* *Complexity* is **bad**
* As complexity grows, security risks too

!SLIDE bullets incremental
## Some useful tools ##
* [Tamper Data](https://addons.mozilla.org/en-US/firefox/addon/966/)
* [Firebug](https://addons.mozilla.org/en-US/firefox/addon/1843/?src=collection&collection_id=23d14a2d-b396-c08f-e9ba-b4d34691d5a9/)
