!SLIDE 
# Web Security With Rails #

!SLIDE bullets incremental
# The Application #

* Esteban is going nuts, he can not handle his company salaries and raises process.
* He contacts you and ask you to build a quite simple application

!SLIDE bullets incremental
# The Specs #

* Target audience is an small company with about 50 employees.
* This application helps everyone review their salaries and ask for a raise.
* We have employees, human resources and one manager.
* Everyone can see his current salary.
* Everyone but the manager can ask for a raise.
* Human resources approve or reject employee raises.
* The manager approves Human resources raises.
* Human resources can view all employee salaries.
* Manager can view everyone salaries.
    
!SLIDE incremental
# And you build it! #

Awesome, the application works. Everyone is happy. That's it right?
 
!SLIDE bullets incremental
# Day 1 - Injection #

* Esteban morning call. One employe automagically raised his own salary and was fired... so fix it.
* After analyzing logs and doing some research, you found that that user used a Injection attack. He modified the query string adding and update statement.
* Sanitize input:
  * Use whitelist validation
    * Use find, find_by 
    * If you need SQL fragments use:
    * An array of sanitized tainted strings
      * Pass a hash

!SLIDE bullets incremental
# Day 2 - Cross-Site Scripting(XSS) #

* Esteban morning call.
