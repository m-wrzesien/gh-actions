# gh-actions

Collections of actions that are used in my own repos.

## docker-build

Builds docker image
### Parameters
|Name|Description|Required?|Example value|Default value|
|-|-|-|-|-|
|`debug`|Enable debug in action.|`false`|`${{ secrets.ACTIONS_STEP_DEBUG }}`|`false`|
|`context`|Path to dir containing Dockerfile.|`true`|`src/`|`.`|
|`tag`|Name of created image.|`true`|`ghcr.io/m-wrzesien/app:latest`|`null`|

## docker-login

Logins to registry. Was tested on ghcr.io (aka GitHub Packages)
### Parameters
|Name|Description|Required?|Example value|Default value|
|-|-|-|-|-|
|`debug`|Enable debug in action.|`false`|`${{ secrets.ACTIONS_STEP_DEBUG }}`|`false`|
|`registry`|URL or a hostname of registry.|`true`|`ghcr.io`|`null`|
|`username`|Username of user used for loggin in.|`true`|`user`|`null`|
|`password`|Password of user used for loggin in.|`true`|`${{ secrets.GITHUB_TOKEN }}`|`null`|

## docker-push

Pushes **existing** image to registry.
### Parameters
|Name|Description|Required?|Example value|Default value|
|-|-|-|-|-|
|`debug`|Enable debug in action.|`false`|`${{ secrets.ACTIONS_STEP_DEBUG }}`|`false`|
|`tag`|Name of created image.|`true`|`ghcr.io/m-wrzesien/app:latest`|`null`|
### Output
|Name|Description|Example value|
|-|-|-|
|`digest`|Digest of pushed image in sha256 format.|`sha256:f9d633ff6640178c2d0525017174a688e2c1aef28f0a0130b26bd5554491f0da`|

# Notes
For this to work in context of private repos enable option `Accessible from repositories owned by the user 'x'` in `Access` section of https://github.com/m-wrzesien/gh-actions/settings/actions#access