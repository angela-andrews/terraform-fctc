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
## Storing Secrets

This chapter is about storing secrets. Create a secret and store in AWS Secrets manager


## Apply order

1. `live/global/s3`✅
2. Copy `live/global/s3/backend.tf.example` to `backend.tf`, then run `terraform init -migrate-state` 🚫 
3. `live/global/iam` ✅
4. `live/stage/data-stores/mysql` 
5. `live/stage/services/webserver-cluster` 
6. `live/prod/data-stores/mysql` 
7. `live/prod/services/webserver-cluster`



## Destroy Order

Destroy the webservers first since they have variables looking for db_port and db_address, so If you delete the db first, the webserver is stuck looking for these 2 variables.

1. `live/prod/services/webserver-cluster`
2. `live/prod/data-stores/mysql`
3. `live/stage/services/webserver-cluster`
4. `live/stage/data-stores/mysql`

Keep or destroy the users 👩‍💻 and the backend 🪣 for future exercises
