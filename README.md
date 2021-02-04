# Here are some useful commands to run the project

# To build the docker image of the project

docker build -t ft_server .

# To run the container on the image and run the server
# With autoindex ON
docker run -d -p 80:80 -p 443:443 ft_server
# With autoindex OFF
docker run -d -p 80:80 -p 443:443 -e autoindex=off ft_server

# To check all container, active or inactive

docker ps -a

# To stop all running containers and clean all containers without confirmation prompt
# Use it before running the container again

docker stop $(docker ps -a -q) && docker container prune --force

# To check all images built 

docker images

# To clean all images built (and more)

docker system prune -a

# Test connexion in http or https  to the server in a incognito window of your favorite browser
http://localhost
https://localhost
