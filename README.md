# hello-dev

![Flow chart of how this works](/docs/assets/images/miro_flow.jpg)
Miro board: https://miro.com/app/board/uXjVN8cKiGo=/?share_link_id=396473428527


- This repo corresponds to the dev env. It is the one that is responsible for building the image and pushing it to Docker Hub: https://hub.docker.com/r/kcandidate/hello
- Once we know that the image works as expected, then we can promote it to prod. In this case, we simply do it by changing the image tag in https://github.com/k-candidate/hello-prod/blob/main/resources/hello-deploy.yaml
- ArgoCD takes care of the deployments for both dev and prod: https://github.com/k-candidate/argocd-demo-install

## Demo
To demonstrate, do the following:
- Clone the repo
- Change the version in `index.html` and `resources/hello-deploy.yaml`
- Push
```
git add .
git commit -m "feat: newer version"
git tag v1.0.8
git push origin --tags v1.0.8
git push
```
- Github Actions will take care of building and pushing the image to Docker Hub.
- ArgoCD will take care of deploying the new version to dev.
- Make sure that all works ok in dev.
- If you deem this version stable, and decide to upgrade prod, then simply change the image tag in https://github.com/k-candidate/hello-prod/blob/main/resources/hello-deploy.yaml and ArgoCD will take care of deploying the new image to prod.

## Possible Improvements:
- [x] Use `trivy` to scan the image for vulnerabilities and upload results to Security tab.
- [ ] Add Autoscaling using KEDA.
