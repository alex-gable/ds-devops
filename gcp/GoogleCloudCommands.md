#GCP

### New Instance

```
gcloud compute --project=animated-canyon-243718 instances create deep-learning --zone=us-central1-a --machine-type=n1-standard-8 --subnet=default --network-tier=PREMIUM --no-restart-on-failure --maintenance-policy=TERMINATE --preemptible --service-account=449626683039-compute@developer.gserviceaccount.com --scopes=https://www.googleapis.com/auth/devstorage.read_only,https://www.googleapis.com/auth/logging.write,https://www.googleapis.com/auth/monitoring.write,https://www.googleapis.com/auth/servicecontrol,https://www.googleapis.com/auth/service.management.readonly,https://www.googleapis.com/auth/trace.append --accelerator=type=nvidia-tesla-k80,count=1 --image=ubuntu-1804-bionic-v20190722a --image-project=ubuntu-os-cloud --boot-disk-size=128GB --boot-disk-type=pd-standard --boot-disk-device-name=deep-learning

```
