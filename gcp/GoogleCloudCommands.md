#GCP

## Create New Instance
Set
GCLOUD_PROJ_ID
GCLOUD_SERVICE_ACCT
in your environment


```
gcloud compute --project=$GCLOUD_PROJ_ID instances create deep-learning --zone=us-central1-a --machine-type=n1-standard-8 --subnet=default --network-tier=PREMIUM --no-restart-on-failure --maintenance-policy=TERMINATE --preemptible --service-account=$GCLOUD_SERVICE_ACCT@developer.gserviceaccount.com --scopes=https://www.googleapis.com/auth/devstorage.read_only,https://www.googleapis.com/auth/logging.write,https://www.googleapis.com/auth/monitoring.write,https://www.googleapis.com/auth/servicecontrol,https://www.googleapis.com/auth/service.management.readonly,https://www.googleapis.com/auth/trace.append --accelerator=type=nvidia-tesla-k80,count=1 --image=ubuntu-1804-bionic-v20190722a --image-project=ubuntu-os-cloud --boot-disk-size=256GB --boot-disk-type=pd-standard --boot-disk-device-name=deep-learning
```

Shell into it
```
gcloud config set project $GCLOUD_PROJ_ID
gcloud beta compute --project "$GCLOUD_PROJ_ID" ssh --zone "us-central1-a" "deep-learning"
```

Copy files

```
gcloud compute scp --project $GCLOUD_PROJ_ID --zone us-central1-a --recurse <local file or directory> tensorflow-1-vm:~/
```

If you enabled Jupyter use this to get a URL to notebook.
```
gcloud compute instances describe --project $GCLOUD_PROJ_ID --zone us-central1-a tensorflow-1-vm | grep googleusercontent.com | grep datalab
```
