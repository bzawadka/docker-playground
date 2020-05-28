docker build -t lexworks/multi-client:latest -t lexworks/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t lexworks/multi-server:latest -t lexworks/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t lexworks/multi-worker:latest -t lexworks/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push lexworks/multi-client:latest
docker push lexworks/multi-server:latest
docker push lexworks/multi-worker:latest

docker push lexworks/multi-client:$SHA
docker push lexworks/multi-server:$SHA
docker push lexworks/multi-worker:$SHA

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=lexworks/multi-server:$SHA
kubectl set image deployments/client-deployment client=lexworks/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=lexworks/multi-worker:$SHA