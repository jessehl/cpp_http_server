# cpp_http_server
A Docker image that runs a c++ server using [crow-cpp](https://github.com/CrowCpp/crow/tree/master). 


### Building the image
A Docker image named `server` can be built by invoking:
```bash
docker build . -t server
```

### Running the server app
Once the `server` image is built, you can run the server:
```
docker run -p 8000:8000 server
```
Note: `8000` is the port you're running on. Visiting [http://localhost:8000](http://localhost:8000) should get you to the server!


### Debugging the build
Invoking:
```bash
docker run -it server bash
```
is helpful in inspecting the content of the container. 

