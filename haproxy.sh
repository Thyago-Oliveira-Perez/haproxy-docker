echo "=== Run Haproxy with docker ==="

#Create the network that gonna be used
docker network create --driver=bridge --subnet=192.168.0.0/16 haproxy-network

#Run nginx on port 81(external):80(internal)
docker run -it --rm -d -p 81:80 --name nginx nginx

#Run Haproxy on port 80(external):80(internal)
sudo docker run --rm -itp 80:80 --name haproxy -v ~/workspace/haproxy/haproxy.cfg:/usr/local/etc/haproxy/haproxy.cfg haproxy:2.6