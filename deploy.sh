docker build -t jcollison/multi-client -f ./client/Dockerfile ./client
docker build -t jcollison/multi-server -f ./server/Dockerfile ./server
docker build -t jcollison/multi-worker -f ./worker/Dockerfile ./worker
docker push jcollison/multi-client
docker push jcollison/multi-server
docker push jcollison/multi-worker
kubectl apply -f k8s
