# Rancher to Consul Integration

![alt text](https://cloud.githubusercontent.com/assets/6406166/12301289/2d4459e2-b9ed-11e5-9810-1af522034a6d.png)

This is a small dockerized microservice POC project to integrate Rancher with "outside of rancher" services such as service discovery (consul) and load balancing/proxy (haproxy). This relies and listens to Rancher WebSocket Events to dynamically update consul whenever container changes occur.

Note: This in no way is production ready.

## Installation

### Pre-req

1. You have already setup consul and haproxy (I am using progrium/consul container, along with ciscocloud/haproxy-consul container) and it's running.
2. You have Rancher already up and running and have the api keys.

### O.K enough already, how do I RUN this rancher to consul docker container?

Run the Docker Container

``` 
   docker run -d -e RANCHER_ACCESS_KEY={YOURACCESSKEY} -e RANCHER_SECRET_KEY={YOURSECRETKEY} -e RANCHER_HOST={YOURRANCHERHOST} -e CONSUL_URL={YOURCONSULHOST} -p 1880:1880 sarlindo/rancherconsul

   Example of my command when I run it in my environment:
   
   docker run -d -e RANCHER_ACCESS_KEY=1A8AB41D362CD61B8E8F -e RANCHER_SECRET_KEY=TPdkbtDShxeBSXPfTtHkCUFyCKUeojmgFAzmfQPm -e RANCHER_HOST=192.168.8.100:8383 -e CONSUL_URL=192.168.8.101:8500 -p 1880:1800 sarlindo/rancherconsul
   
```

## Usage

```
Startup a new stack in rancher, ghost would be a good example, then navigate to your consul GUI and see if ghost was registered with consul. Then scale ghost from 1 to 2 and see if consul gets updated with the new container instance as well.
Now scale it back to 1 and see if the container is removed from consul and only 1 left.

```

## Screen shots of my environment


### Rancher Screen Shot

![alt text](https://cloud.githubusercontent.com/assets/6406166/12301168/a99bce7c-b9ec-11e5-99c6-603959093d70.png)

### Consul Screen Shot

![alt text](https://cloud.githubusercontent.com/assets/6406166/12301169/a99f2162-b9ec-11e5-9354-a84333a5b89e.png)

### Ghost app Screen Shot

![alt text](https://cloud.githubusercontent.com/assets/6406166/12301171/a9a521ac-b9ec-11e5-873e-afb604ad5eec.png)

### Haproxy Config file that gets automatically updated Screen Shot

![alt text](https://cloud.githubusercontent.com/assets/6406166/12301170/a9a0535c-b9ec-11e5-8b19-3aebfba0f3ff.png)

### Rancher to Consul Integration - the actual code/flow Screen Shot

![alt text](https://cloud.githubusercontent.com/assets/6406166/12301167/a99a5f10-b9ec-11e5-9095-bd03efb3d582.png)

## TO-DO

