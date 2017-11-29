# Hashicorp packer with default entrypoint

We are using hashicorp/packer to build our AWS test runners AMIs with gitlab-ci

I tried using the docker executor in gitlab-ci, but the hashicorp/packer entrypoint is [/bin/packer](https://github.com/hashicorp/docker-hub-images/blob/master/packer/Dockerfile-light#L17)
to be able to use the image docker run as an command

But this causes the gitlab-ci to fail, as it needs to run some commands as a preparation

So the solution here is to create another versin of hashicorp/packer overriding the entrypoint to the default `sh -c`