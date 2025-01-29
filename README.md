# gh-actions

Collections of actions and workflows that are used in my own repos.

## Workflows

### ci-cd-gitops

Uses composite actions from this repo to:
* Build docker image
* Push it to registry
* Updates reference to tag using yq

Example of usage:
```
jobs:
  workflow:
    uses: m-wrzesien/gh-actions/.github/workflows/ci-cd-gitops.yaml@master
    permissions:
      contents: read
      packages: write
    secrets:
      token: ${{ secrets.GITHUB_TOKEN }}
      ssh-key-gitops-repo: ${{ secrets.CI_CD_WORKFLOW_KEY }}
```

#### Inputs
|Name|Description|Required?|Example value|Default value|
|-|-|-|-|-|
|`app`|Name of app, which will be used in commit message and `gitops-file` default value.|`false`|`example`|`${{ github.event.repository.name }}`|
|`context`|Path to dir containing Dockerfile.|`false`|`src/`|`.`|
|`gitops-file`|Path to file which will have changed reference to new docker tag.|`false`|`some/path/values.yaml`|`k8s/apps/{app}/values.yaml`|
|`gitops-repo`|Github repo.|`false`|`m-wrzesien/gh-actions`.|`m-wrzesien/infra`|
|`gitops-repo-branch`|Branch that will be used in `gitops-repo`.|`false`|`dev`|`master`|
|`image-name`|Name of repo.|`false`|`m-wrzesien/gh-actions`|`${{ github.repository }}`|
|`image-tag`|Tag which will be used by image.|`false`|`dev`|`(github.ref == 'refs/heads/master' && format('b{0}', github.run_number) \|\| format('pr{0}-b{1}',github.event.number, github.run_number))`|
|`mode`|Whether it workflow will be run in `pr` mode (only build image) or in `merged` mode (do whole workflow).|`false`|`pr`|`${{ (github.ref == 'refs/heads/master' && 'merge' \|\| 'pr') }}`|
|`registry`|URL or a hostname of registry.|`false`|`ghcr.io`|`ghcr.io`|


#### Secrets
|Name|Description|Required?|Example value|Default value|
|-|-|-|-|-|
|`token`|Github token requid for access to repo and pushing to registry.|`true`|`${{ secrets.GITHUB_TOKEN }}`|`null`|
|`ssh-key-gitops-repo`|SSH private key that gives write access to `gitops-repo`.|`true`|`${{ secrets.SSH_KEY }}`|`null`|

## Actions

### docker-build

Builds docker image
#### Inputs
|Name|Description|Required?|Example value|Default value|
|-|-|-|-|-|
|`context`|Path to dir containing Dockerfile.|`true`|`src/`|`.`|
|`tag`|Name of created image.|`true`|`ghcr.io/m-wrzesien/app:latest`|`null`|

### docker-login

Logins to registry. Was tested on ghcr.io (aka GitHub Packages)
#### Inputs
|Name|Description|Required?|Example value|Default value|
|-|-|-|-|-|
|`registry`|URL or a hostname of registry.|`true`|`ghcr.io`|`null`|
|`username`|Username of user used for loggin in.|`true`|`user`|`null`|
|`password`|Password of user used for loggin in.|`true`|`${{ secrets.GITHUB_TOKEN }}`|`null`|

### docker-push

Pushes **existing** image to registry.
#### Inputs
|Name|Description|Required?|Example value|Default value|
|-|-|-|-|-|
|`tag`|Name of created image.|`true`|`ghcr.io/m-wrzesien/app:latest`|`null`|
#### Output
|Name|Description|Example value|
|-|-|-|
|`digest`|Digest of pushed image in sha256 format.|`sha256:f9d633ff6640178c2d0525017174a688e2c1aef28f0a0130b26bd5554491f0da`|

# Notes
For this to work in context of private repos enable option `Accessible from repositories owned by the user 'x'` in `Access` section of https://github.com/m-wrzesien/gh-actions/settings/actions#access
