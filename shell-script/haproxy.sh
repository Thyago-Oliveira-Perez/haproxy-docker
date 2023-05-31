echo "=== Run Haproxy with docker ==="

#Create the network that gonna be used
docker network create --driver=bridge --subnet=172.20.0.0/16 haproxy-network

#Run nginx on port 81(external):80(internal)
docker run -it --rm -d -p 81:80 --network haproxy-network --ip 172.20.0.5 --name=nginx nginx

#Run Haproxy on port 80(external):80(internal)
sudo docker run --rm -itp 80:80 --network haproxy-network  --ip 172.20.0.4 --name=haproxy -v ./haproxy.cfg:/usr/local/etc/haproxy/haproxy.cfg haproxy:2.6