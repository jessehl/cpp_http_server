# netlib_docker
A Docker image that runs cpp-netlib


### Building the image
A Docker image named `netlib` can be built by invoking:
```bash
docker build . -t netlib
```

### Running the server app
Once the `netlib` image is built, you can run the server app using:
```
docker run -p 8000:8000 netlib
```
Visiting [http://localhost:8000](http://localhost:8000) should get you to the server.

### Debugging the build
The last line in the Dockerfile:
```Dockerfile
ENTRYPOINT ["./server", "0.0.0.0", "8000"]
```
Can be removed to prevent the app from starting. Then, invoking:
```bash
docker run -it -t netlib
```
is helpful in inspecting the content of the container. 
