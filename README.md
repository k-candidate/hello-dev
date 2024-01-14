# hello-dev

![Flow chart of how this works](/docs/assets/images/miro_flow.jpg)
Miro board: https://miro.com/app/board/uXjVN8cKiGo=/?share_link_id=396473428527


- This repo corresponds to the dev env. It is the one that is responsible for building the image and pushing it to Docker Hub: https://hub.docker.com/r/kcandidate/hello
- Once we know that the image works as expected, then we can promote it to prod. In this case, we simply do it by changing the image tag in https://github.com/k-candidate/hello-prod/blob/main/resources/hello-deploy.yaml
- ArgoCD takes care of the deployments for both dev and prod: https://github.com/k-candidate/argocd-demo-install
