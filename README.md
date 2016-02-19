#Jenkins Docker Image

To run this image use
```
docker run -p 8086:8080 -v /var/run/docker.sock:/var/run/docker.sock -v $(which docker):/usr/bin/docker -v /usr/lib/x86_64-linux-gnu/libapparmor.so.1.1.0:/lib/x86_64-linux-gnu/libapparmor.so.1 -v /var/jenkins_home:/var/jenkins_home -u root -d --restart always jenkins-docker
```