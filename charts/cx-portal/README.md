# CX PORTAL
## Packaging the Chart
```bash
helm package .
curl --data-binary "@cx-portal-0.1.0.tgz" http://<custom-chartmuseum-url>:<custom-chartmuseum-port>/api/charts

helm repo update
```

## Dependencies
Service | Description
:---|:---
Redis | redis 설치 되어 있어야 함
Mariadb | Mariadb 설치 되어 있어야 함
Openstack | Openstack 설치 되어 있어야 함
monitering | monitering 설치 되어 있어야 함
fabric | fabric 연계 시  fabric 서버 설치 되어 있어야 함


## Configuration

Parameter | Description | Default | Required 
:---|:---|:---|:---
web.domainName | web service domain name | "" | 
web.replicas | web pod replicas | 3 |  
web.image.registry | web image registry | "" |  
web.image.repository | web image repository | cx-web |  
web.image.tag | web image tag | "" |  
web.image.pullPolicy | web imagePullPolicy | IfNotPresent |  
redis.serviceName | redis serviceName | cx-session-redis-ha-haproxy |  
redis.sessionRedisPort | redis replicas | 6379 |  
mariadb.dbHost | mariadb dbHost | cx-db-mariadb-galera |  
mariadb.dbPort | mariadb dbPort | 3306 |  
uaa.replicas | uaa pod replicas | 3 |  
uaa.image.registry | uaa image registry | "" |  
uaa.image.repository | uaa image repository | cx-uaa |  
uaa.image.tag | uaa image tag | "" |  
uaa.dbName | uaa db name | uaa |  
uaa.dbUser | uaa db user | uaa |  
uaa.dbPass | uaa dbPass | uaa1234 |  
comm.replicas | comm replicas | 3 |  
comm.image.registry | comm image registry | "" |  
comm.image.repository | comm image repository | cx-comm |  
comm.image.tag | comm image tag | "" |  
comm.dbName | comm dbName | comm |  
comm.dbUser | comm dbUser | comm |  
comm.dbPass | comm dbPass | comm1234 |  
comm.adminId | comm adminId | admin |  
comm.adminPass | comm adminPass | admin1234 |  
iaas.replicas | iaas replicas | 3 |  
iaas.image.registry | iaas image registry | "" |  
iaas.image.repository | iaas image repository | cx-iaas |  
iaas.image.tag | iaas image tag | "" |  
iaas.dbName | iaas dbName | iaas |  
iaas.dbUser | iaas dbUser | iaas |  
iaas.dbPass | iaas dbPass | iaas1234 |  
iaas.lbType | iaas lbType | lbaas |  
iaas.adminId | iaas adminId | admin |  
iaas.adminPass | iaas adminPass | crossent1234 |  
monit.externalHost | monit endpointHost  | "" | Y 
monit.apiPort | monit apiPort | 9000 |  
monit.telegrafPort | monit telegrafPort | 8094 |   
monit.beatPort | monit beatPort | 5044 |  
keystone.externalHost | keystone endpointHost | "" | Y 
keystone.keystonePort | keystone keystonePort | 5000 |  
keystone.neutronPort | keystone neutronPort | 9696 |  
keystone.keystoneAdminPort | keystone keystoneAdminPort | 35357 |  
keystone.placementPort | keystone placementPort | 8778 |  
keystone.swiftPort | keystone swiftPort | 80 |  
keystone.novaPort | keystone novaPort | 8774 |  
keystone.cinderPort | keystone cinderPort | 8776 |  
keystone.glancePort | keystone glancePort | 9292 |  
fabric.enabled | fabric enabled | false |  
fabric.apiEndpointHost | fabric apiEndpointHost | "" | fabric.enabled=true and Y
fabric.adminId | fabric adminId | "" | fabric.enabled=true and Y
fabric.adminPass | fabric adminPass | "" | fabric.enabled=true and Y
fabric.protocol | fabric protocol (http|https) | "https" |  
fabric.apiPort | fabric apiPort | 8080 |  

## Installing the Chart
- 기본 배포: port 정보가 values.yaml과 일치 할 경우
```bash
helm install --name cx-portal \
    --set global.imageRegistry=<global image registry> \
    --set keystone.externalHost=<keystone endpointHost> \
    --set monit.externalHost=<monit endpointHost> \
    <custom-chartmuseum>/cx-portal
```
- 기본 배포: port 정보가 다를 경우
```bash
helm install --name cx-portal \
    --set global.imageRegistry=<global image registry> \
    --set monit.apiPort=<monit apiPort> \
    --set monit.telegrafPort=<monit telegrafPort> \
    --set monit.beatPort=<monit beatPort> \
    --set keystone.externalHost=<keystone endpointHost> \
    --set keystone.keystonePort=<keystone keystonePort> \
    --set keystone.neutronPort=<keystone neutronPort> \
    --set keystone.keystoneAdminPort=<keystone keystoneAdminPort> \
    --set keystone.placementPort=<keystone placementPort> \
    --set keystone.swiftPort=<keystone swiftPort> \
    --set keystone.novaPort=<keystone novaPort> \
    --set keystone.cinderPort=<keystone cinderPort> \
    --set keystone.glancePort=<keystone glancePort> \
    <custom-chartmuseum>/cx-portal
```
- 기본 배포: fabric 연계시 추가 항목
```bash
    --set fabric.enabled=true \
    --set apiEndpointHost=<fabric apiEndpointHost> \
    --set fabric.adminId=<fabric adminId> \
    --set fabric.adminPass=<fabric adminPass> \
    --set fabric.protocol=<fabric protocol> \
    --set fabric.apiPort=<fabric apiPort> \
```
- values.yaml 배포
```bash
vi values.yaml

web:
  replicas: 3
  domainName: ""
  image.registry: ""
  image.repository: "cx-web"
  image.tag: "0.1.0"
  imagePullPolicy: "IfNotPresent"

redis:
  serviceName: "cx-session-redis-ha-haproxy"
  sessionRedisPort: "6379"

mariadb:
  dbHost: "cx-db-mariadb-galera"
  dbPort: "3306"

uaa:
  replicas: 3
  dbName: "uaa"
  dbUser: "uaa"
  dbPass: "uaa1234"
  image.registry: ""
  image.repository: "cx-uaa"
  image.tag: "0.1.0"
  imagePullPolicy: "IfNotPresent"

comm:
  replicas: 3
  dbName: "comm"
  dbUser: "comm"
  dbPass: "comm1234"
  adminId: "admin"
  adminPass: "admin1234"
  image.registry: ""
  image.repository: "cx-comm"
  image.tag: "0.1.0"
  imagePullPolicy: "IfNotPresent"

iaas:
  replicas: "3"
  dbName: "iaas"
  dbUser: "iaas"
  dbPass: "iaas1234"
  lbType: "lbaas"
  adminId: "admin"
  adminPass: "crossent1234"
  image.registry: ""
  image.repository: "cx-iaas"
  image.tag: "0.1.0"
  imagePullPolicy: "IfNotPresent"

monit:
  endpointHost: ""
  apiPort: 9000
  telegrafPort: 8094
  beatPort: 5044

keystone:
  endpointHost: ""
  keystonePort: 5000
  neutronPort: 9696
  keystoneAdminPort: 35357
  placementPort: 8778
  swiftPort: 80
  novaPort: 8774
  cinderPort: 8776
  glancePort: 9292

fabric:
  enabled: false
  apiEndpointHost: ""
  adminId: ""
  adminPass: ""
  protocol: "https"
  apiPort: 8080

helm install --name cx-portal -f values.yaml <custom-chartmuseum>/cx-portal
```


