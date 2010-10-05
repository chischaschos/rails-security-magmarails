!SLIDE bullets incremental
## Default rules  ##


!SLIDE bullets incremental
### Defense layers ###
* Multiple *defense layers* deal with different *attack types*


!SLIDE bullets incremental
### Defense layers ###
* *Network*, *Operating system*, *Web server*, *Web application* and *Database*


!SLIDE bullets incremental
### Your system is as **secure** as ... ###
* The *wekest link*


!SLIDE bullets incremental
### You **better** ... ###
* Follow a *Fail close* approach


!SLIDE
##**Discouraged**##
	@@@ ruby
	def show_invoice
	  @invoice = User.invoices.find(params[:id])
	  unless @invoice
	    redirect :action => 'not_authorized'
	  end
	end


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
### Whitelisting ###


!SLIDE
## **Discouraged** ##
	@@@ ruby
	@non_valid_chars = %w{%<>'"/\}


!SLIDE
## **Recommended** ##
	@@@ ruby
	@valid_users = %w{pepe marco raul}


!SLIDE bullets incremental
### Least privilege ###
* A user should be able to do as *little as possible* according domain requirements, **nothing else**


!SLIDE bullets incremental
### DRY ###
* *Do not repeat yourself*
* Focus on not **cutting pasting code**


!SLIDE bullets incremental
### Avoid complexity ###
* *Complexity* is **bad**
* As complexity grows, security risks too

!SLIDE bullets incremental
## Tamper data ##
* Firefox plugin
* [Download](https://addons.mozilla.org/en-US/firefox/addon/966/)
