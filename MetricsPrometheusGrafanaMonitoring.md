For this task I have created locally a caddy container webserver

<img width="1034" height="62" alt="2026-06-26_15-08-06" src="https://github.com/user-attachments/assets/d1a4a553-021c-4f2e-ada8-2fa8b5fd5ae0" />


Now I wish to oobserver and monitor the performance of my Caddy webserver:

I have installed a Prometheus container along with a volume:

<img width="1057" height="264" alt="2026-06-26_15-10-52" src="https://github.com/user-attachments/assets/9734e2d7-c867-44cd-b6d8-c1a8f2b77880" />

I also created a basic yaml, to scrape data from my Caddy webserver.

global:
  scrape_interval: 15s

scrape_configs:
  - job_name: 'prometheus'
    static_configs:
      - targets: ['localhost:9090']
   

It has a scrape interval of 15s and is available locally under port 9090.

I then created a grafana container with a volume available locally on port 3001:

<img width="981" height="452" alt="2026-06-26_15-20-35" src="https://github.com/user-attachments/assets/d9f4158c-4a9e-4dd2-acbe-58cb22205569" />


<img width="869" height="912" alt="2026-06-26_15-21-20" src="https://github.com/user-attachments/assets/2753a032-6b9c-412a-a5b6-03f341150bdf" />

Afterwards I added prometheus as a data source http://localhost:9090

There was an issue connecting the data but after using the command "docker network connect monitoring prometheus"
this resolved the issue and Grafana was able to receive data from Prometheuses scrapes of the caddy webserver.


<img width="869" height="912" alt="2026-06-26_15-30-17" src="https://github.com/user-attachments/assets/008b08ff-4b55-4fd6-9c72-c8490a611355" />

I added to my prometheus.yml another job so that it scrapes metrics from my websever not just from itself

  - job_name: 'node-exporter'
    static_configs:
      - targets: ['node-exporter:9100']
   
  I created a node container to export the metrics, and then restarted the prometheus container.

  http://localhost:9100 node exporter is available locally:
  
  <img width="768" height="470" alt="2026-06-26_15-37-49" src="https://github.com/user-attachments/assets/91427cec-6344-478a-a55f-00e025a2a749" />


I then imported the node dashboard 1860:

<img width="817" height="778" alt="2026-06-26_15-39-49" src="https://github.com/user-attachments/assets/8f0f7b7f-bf95-4084-b591-f9eb3ee03099" />

Now i have some metrics I can observer and monitor in Grafana that come from my Caddy webserver.

