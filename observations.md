# Observations
---
🤔 So, why do we use rollout restart?
kubectl rollout restart tells Kubernetes to:

✅ Gracefully restart all pods in a Deployment
✅ Without deleting the Deployment
✅ Without changing the image/version
- kubectl rollout deployment hello
  - Reload config changes
  - Sometimes pods get into a funky state. A rollout restart is a quick
  - Re-apply IAM permissions
---