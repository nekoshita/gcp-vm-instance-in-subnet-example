# gcp-vm-instance-in-subnet-example

## これは何？
- GCPでVPCとsubnetを作成し、subnet内にVMインスタンスを起動します
- subnet内に起動したVMインスタンスにSSH接続します

## セットアップ
- `Terraform v0.14.5`のインストール
  - https://releases.hashicorp.com/terraform/
- Google Cloud Platformのprojectを作成する
  - https://cloud.google.com/resource-manager/docs/creating-managing-projects
- GCP StorageのBucketを作成する
  - https://cloud.google.com/storage/docs/creating-buckets
- `gcloud CLI`のインストール（VMインスタンスにSSH接続したい場合）
  - https://cloud.google.com/sdk/gcloud

## リソースの作成
```
$ export GCP_PROJECT_ID="your-gcp-project-id"
$ export GCS_BUCKET_NAME="your-gcs-bucket-name"

$ bin/apply $GCP_PROJECT_ID $GCS_BUCKET_NAME
```

## リソースの削除
```
$ export GCP_PROJECT_ID="your-gcp-project-id"
$ export GCS_BUCKET_NAME="your-gcs-bucket-name"

$ bin/destroy $GCP_PROJECT_ID $GCS_BUCKET_NAME
```

## VMインスタンスへのSSH接続
```
$ export ZONE="asia-northeast1-a"
$ export VM_INSTANCE_NAME="bastion"
$ export GCP_PROJECT_ID="your-gcp-project-id"

# GCPのprojectを作成したgoogleアカウントでログインする（すでにログインしてる場合は不要）
$ gcloud auth login

$ gcloud beta compute ssh --zone $ZONE $VM_INSTANCE_NAME --project $GCP_PROJECT_ID
```