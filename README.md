Codebox IDE
============

> Dockerized codebox IDE server for editing on the cloud

This docker image runs a supervised codebox nodejs server that provides a WebIDE for cloud development

## Features:

- Supervisord process manager keeps codebox server alive in case of a crash
- Ability to provision container w/ ssh keys on runtime (useful for pulling/pushing to github from within the container)
   - *Note:* Only passphraseless keys can be added automatically to the ssh-agent
- Includes [additional themes](https://github.com/linc01n/codebox-theme)  

## Managing & running the container

### Build

`docker build -t codebox ./`

where -t is the tag name we give the container

### Run

To run the container, execute

`docker run -d -p 8000:8000 -v /path/to/host/codebase:/var/www -v /optional/path/to/ssh/keys:/var/ssh --name codebox codebox`

- container listens on port `8000` and expects code to be available on `/var/www/` inside the container
