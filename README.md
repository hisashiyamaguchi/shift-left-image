# Orca Security - Shift Left Security quick start guide
Orca Security has a capability of DevSecOps - a concept & philosopy of the
collaborative security improvement framework for the entire SDLS. The repo here
is a quick demo for your audiences.
<br>
<br>


## Prerequisites
- Orca Security free trial license - visit [Orca Security](https://orca.security/lp/cloud-security-risk-assessment/) if you don't have
  a free trial license.
- GitHub account.
- MacBook with GitHub CLI.
<br>
<br>


## Set-up
Go Orca dashboard, and click "Shift Left" on the left pane and click "CREATE NEW". Put a name on Project name field and put an unique name on Project key field - this must be unique and the value must be specified on your GitHub Action workflow yml. Select "Orca Built-in Container Image Best Practices Policy", and click "Create".
<br>
<div align="center">
<img src="./images/2.png" width=50%>
</div>
<br>

Click the settings icon on the top right, and click "Authorization" on the left
pane. Click "CREATE API TOKEN", and put a name on Name field. Click "CREATE
TOKEN" and you may find an API Token on the screen - grab it.
<br>
<div align="center">
<img src="./images/1.png" width=50%>
</div>
<br>

Folk the repo, and go "Settings" -> "Secrets" -> "Actions". Click "New
repository secret", and put "ORCA_SECURITY_API_TOKEN" on Name field and put the
API Token value on Secret field, and click Add secret.
<div align="center">
<img src="./images/3.png" width=50%>
</div>
<br>

[Go GitHub Actions workflow yml](https://github.com/hisashiyamaguchi/shift-left-image/blob/main/.github/workflows/ci-with-imagescan-pipeline.yml), and put your Project key that you just
specified on Orca dashboard.
```yml
env: 
  IMAGE_NAME: base_infra:latest
  PROJECT_KEY: hogehoge
  CLI_VERSION: latest
```

<br>
<br>


## Demo!
1. Say the concept of DevSecOps to your audiences with short words, and expain the
demo platform & prerequisite.
2. Clone the repo to your local laptop. Go the repo directory and any codes
   - README.md is the easiest.
3. Commit the change locally and push the commit to remote repo - GitHub
   Actions workflow will be triggered, and start buiding&scanning the Docker
image.
4. Orca Security is going to detect the image policy violation, and the
   scanning will be fail - the reason is you did not set specific user on your
Dockerfile, and the image has been built with root-user.
5. Visit Orca dashboard and show scanning logs - you can show red flag error
   logs.
6. Uncomment the line#6 on [Dockerfile](https://github.com/hisashiyamaguchi/shift-left-image/blob/main/Dockerfile).
```text
# Uncomment the below line to set the a specific user for the container execution instead of running with user root
USER demo
```
7. Commit the change again locally and push it to the remote repo. GitHub
   Actions workflow will be triggerd again, and the building&scanning will be
succeeded this time as the building is done with non-root user - "principle of
least priviledge" has been demonstrated!
<br>
<br>

## Issue Reporting
If you have found a bug or if you have updates request, please report them at this repository issues section.
