docker build -t jcollison/multi-client:latest -t jcollison/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t jcollison/multi-server:latest -t jcollison/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t jcollison/multi-worker:latest -t jcollison/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push jcollison/multi-client:latest
docker push jcollison/multi-server:latest
docker push jcollison/multi-worker:latest
docker push jcollison/multi-client:$SHA
docker push jcollison/multi-server:$SHA
docker push jcollison/multi-worker:$SHA

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=jcollison/multi-server:$SHA
kubectl set image deployments/client-deployment client=jcollison/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=jcollison/multi-worker:$SHA