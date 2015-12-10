#!bin/bash
if [ ! -f /tmp/keys/gcloud_authentication_key.p12 ]; then
    echo "File /tmp/keys/gcloud_authentication_key.p12 doesn't exist"
fi

gcloud auth activate-service-account account-3@social-doors.iam.gserviceaccount.com --key-file /tmp/keys/gcloud_authentication_key.p12

