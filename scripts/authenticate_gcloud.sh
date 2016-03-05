#!bin/bash
if [ ! -f /tmp/keys/gcloud_authentication_key.p12 ]; then
    echo "File /tmp/keys/gcloud_authentication_key.p12 doesn't exist"
fi

gcloud auth activate-service-account jenkins-docker@tenpines10-demo.iam.gserviceaccount.com --key-file /tmp/keys/gcloud_authentication_key.p12 --password-file /tmp/keys/gcloud_authentication_password.txt
gcloud container clusters get-credentials tenpines-cluster --project tenpines10-demo --zone us-central1-b
