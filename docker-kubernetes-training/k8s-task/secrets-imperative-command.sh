kubectl create secret generic db-user-pass --from-file=./db-username.txt --from-file=./db-password.txt
kubectl describe secrets/db-user-pass
kubectl get secrets db-user-pass -o yaml
echo 'bXlwYXNzd29yZAo=' | base64 --decode
echo 'ZHJ1cGFsCg==' | base64 --decode


######

secrets/db-user-pass  db-username
secrets/db-user-pass  db-password
