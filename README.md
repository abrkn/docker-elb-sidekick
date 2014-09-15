elb-sidekick
===

Registers the calling instance to to the specified Amazon AWS ELB. Deregisters when the container exits.

Usage
---

```
// Press CTRL-C to deregister
docker run -ti \
    --env AWS_ACCESS_KEY_ID=... \
    --env AWS_SECRET_ACCESS_KEY=... \
    --env ELB_NAME=... \
    --env AWS_DEFAULT_REGION=... \
    abrkn/elb-sidekick
```

Author
---

Andreas Brekken <a@abrkn.com>

Tips
---

1AndreasWc7XAMzCXfuk7EWiVp5gnEuXSd

License
---

ISC

