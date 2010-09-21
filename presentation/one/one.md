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

* Esteban morning call. One employe automagically raised his own salary and was fired... so fix it.

!SLIDE bullets incremental
#Did some research#

* You found that that user used an Injection attack. He modified the query string adding and update statement.

!SLIDE bullets incremental
#Sanitize input#

* Use whitelist validation
* Use find, find_by 
 * If you need SQL fragments use:
  * An array of sanitized tainted strings
  * Pass a hash

!SLIDE bullets incremental
#Day 2 - Cross-Site Scripting(XSS)#

* Esteban morning call.
