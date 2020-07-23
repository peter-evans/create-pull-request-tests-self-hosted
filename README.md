# create-pull-request-tests-self-hosted

```bash
docker build -t actions-runner .
```

```bash
# docker run -it --rm actions-runner ${OWNER} ${REPO} ${REPO_SCOPED_PAT} ${NAME}

docker run -it --rm actions-runner \
  peter-evans \
  create-pull-request-tests-self-hosted \
  ${REPO_SCOPED_PAT} \
  create-pull-request-tests-self-hosted
```
