!SLIDE 
.notes another dark side
#Security in **Ruby on Rails**#


!SLIDE bullets incremental
## Why? ![Twitter](twitter_logo.png) ##
* ![Twitter](twitter.jpeg)
* &lt;a href="http://x.xx/@"**[MALICIOUS_CODE]**/">http://x.xx/@"**[MALICIOUS_CODE]**/&lt;/a&gt;


!SLIDE bullets incremental
## Why? ##
* ![Facebook](facebook_logo.jpeg)
* Facebook scrambles to close *CSRF* hole exposing *private data*
* Viral clickjacking *Like* **worm** hits Facebook users
* Closes hole that let spammers **auto-post** to walls, friends


!SLIDE bullets incremental
## Want more? ##
* [Web Hacking Incident Database](http://projects.webappsec.org/Web-Hacking-Incident-Database)


!SLIDE bullets incremental
## Top 5 Attack methods ##
* SQL Injection
* XSS
* Broken Authentication and Session Management
* Insecure Direct Object References
* CSRF


!SLIDE bullets incremental
* Many companies *test applications for security* with help of:
 * Black box testing
 * White box testing
 * Code reviews


!SLIDE bullets incremental
* And they have ...
* Dedicated:
 * Teams
 * Budgets


!SLIDE bullets incremental
* Which usually means ...
 * Highly *expensive* projects with *big budgets*


!SLIDE bullets incremental
* *Security principles* should be applied with the same *agile* principles that **RoR** is built-on
* Everyone has to knoe about this not only sys admins or senior developers, everyone

!SLIDE bullets incremental
## Rails security ##
* **RoR** follows convention over configuration 
 * Meaning it has many *built-in* security features
* But...
 * In order to build *secure applications* we must *use* these *built-in* features *correctlty*
 * And we need to be aware of different attack types

!SLIDE bullets incremental
## ... ##
* At the end remember...
 * Most problem domains have their *own* set of *security rules* 
 * *Beyond* what any framework can provide
