I have created a webserver, with caddy as a container in my Windows Subsystem-Linux.

<img width="926" height="662" alt="2026-06-24_13-09-52" src="https://github.com/user-attachments/assets/222260c8-1688-4f79-bb49-365a01569ec5" />

Service Name: Caddy-webserver
Port: 80
Type of Service: Web-server


Tested to see if my caddy web server is available under port 80 via curl command and in the web browser local url;

<img width="1669" height="832" alt="2026-06-24_13-16-16" src="https://github.com/user-attachments/assets/aeb2f5d8-e148-4c03-9997-18950d5fd9e7" />

curl request for a normal path:

<img width="774" height="353" alt="2026-06-24_14-09-22" src="https://github.com/user-attachments/assets/ee52a5de-fd30-4ae7-ad01-8ea5bbe4869e" />

Request to a non-existent path:

<img width="1073" height="117" alt="2026-06-24_14-10-50" src="https://github.com/user-attachments/assets/d7edabd0-365e-40c9-9151-35ea6a5754f4" />

Timed grep to display how long the request took along with the user and system CPU usage:


<img width="978" height="201" alt="2026-06-24_14-13-53" src="https://github.com/user-attachments/assets/9459a304-afda-41e3-bce4-3dbac4584697" />

24 Jun 2026 12:15:14 GMT -- target= http://localhost:8080/ : response message 202 OK time 0.08s

24 Jun 2026 12:16:10 GMT -- target= http://localhost:8080/ : 404 Not found time 0.12s

24 Jun 2026 12:16:10 GMT -- target= http://localhost:8080/ : none resonse time 0.016s

Check the webserver CPU, MEM Usage in Docker stats:

<img width="1072" height="257" alt="2026-06-24_14-32-40" src="https://github.com/user-attachments/assets/68d0c43d-e1c1-4f86-b95b-0f2416d50e6e" />

docker exec -it caddy df -h /

1% of the containers space is being used:

<img width="1072" height="257" alt="2026-06-24_14-32-40" src="https://github.com/user-attachments/assets/74ea1f2c-e86e-416a-bf58-9ef803558d54" />


