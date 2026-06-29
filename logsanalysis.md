In this mini-project the aim is to analyse the environment that I have and where the logs are saved 
and how to observe them.

Within my linux Ubuntu system WSL:

I will start by investigating the systemlogs

/var/log/

/var/log/syslog

this shows me the general syslogs for my linux ubuntu system

/var/log/auth.log

shows me all the login and authentication attempts

here we can see an instance of me using the sudo ss -tulpn to see the sockets and ports being used:

<img width="1043" height="179" alt="2026-06-25_16-01-34" src="https://github.com/user-attachments/assets/561f3e60-58e0-4d33-bb6f-3f8ef05b6c02" />


/var/log/apt/history.log

here I am able to see whats been happening in my package manager and what packages have been installed:

<img width="1024" height="569" alt="2026-06-25_16-07-02" src="https://github.com/user-attachments/assets/36d6ecb8-0002-40b1-9f52-e7fadedb4baa" />


