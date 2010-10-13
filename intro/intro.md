!SLIDE 
#Security in **Ruby on Rails**#


!SLIDE bullets incremental
## Content  ##
* A general introduction (GI)
* Default rules (DR)
* Attacking a real application (AT)
* Fixing that real application (FX)


!SLIDE bullets incremental
## GI - Why security? The Twitter case ##
* ![Twitter](twitter.jpeg)
* &lt;a href="http://x.xx/@"**[MALICIOUS_CODE]**/">http://x.xx/@"**[MALICIOUS_CODE]**/&lt;/a&gt;


!SLIDE bullets incremental
## GI - Why security? The Facebook case ##
* ![Facebook](facebook_logo.jpeg)
* Facebook scrambles to close *CSRF* hole exposing *private data*
* Viral clickjacking *Like* **worm** hits Facebook users
* Closes hole that let spammers **auto-post** to walls, friends


!SLIDE bullets incremental
## GI - Want more? ##
* [Web Hacking Incident Database](http://projects.webappsec.org/Web-Hacking-Incident-Database)


!SLIDE bullets incremental
## GI - Top 5 Attack methods ##
* Injection
* XSS
* Broken Authentication and Session Management
* Insecure Direct Object References
* CSRF


!SLIDE bullets incremental
## GI - Security testing approaches ##
* Many companies *test applications for security* with help of:
 * *Black box* testing
 * *White box* testing
 * *Code review*
* And they have: big budgets, dedicated teams


!SLIDE bullets incremental
## GI - How do we achieve this? ##
* Security acknowledging everyone involved
 * Not only sys admins or senior developers, *EVERYONE*
* And, we need to be aware of the *different attack types*

!SLIDE bullets incremental
## ... ##
* *Correctly* use *built-in* Rails security features
* And, in the end, remember...
 * The most *common problem* is that *domains* have their own set of *security rules*
 * And they may be *beyond* what *any framework* can provide
