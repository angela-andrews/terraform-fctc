# Terraform Up & Running Chapters 4-5 Complete Project

## Layout

```text
live/
  global/
    iam/
    s3/
  stage/
    services/webserver-cluster/
    data-stores/mysql/
  prod/
    services/webserver-cluster/
    data-stores/mysql/
modules/
  services/webserver-cluster/
  data-stores/mysql/
```

## Apply order

1. `live/global/s3`
2. Copy `live/global/s3/backend.tf.example` to `backend.tf`, then run `terraform init -migrate-state`
3. `live/global/iam`
4. `live/stage/data-stores/mysql`
5. `live/stage/services/webserver-cluster`
6. `live/prod/data-stores/mysql`
7. `live/prod/services/webserver-cluster`

Set the database password before planning a MySQL stack:

```bash
export TF_VAR_db_password='replace-with-a-strong-password'
```
