docker build -t iskrovam/multi-client:latest -t iskrovam/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t iskrovam/multi-server:latest -t iskrovam/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t iskrovam/multi-worker:latest -t iskrovam/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push iskrovam/multi-client:latest
docker push iskrovam/multi-server:latest
docker push iskrovam/multi-worker:latest

docker push iskrovam/multi-client:$SHA
docker push iskrovam/multi-server:$SHA
docker push iskrovam/multi-worker:$SHA

kubectl apply -f k8s

kubectl set image deployments/server-deployment server=iskrovam/multi-server:$SHA
kubectl set image deployments/client-deployment client=iskrovam/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=iskrovam/multi-worker:$SHA