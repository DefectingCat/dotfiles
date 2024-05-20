docker run --name gymo-runner --restart unless-stopped -v ./runner/:/runner/ -it --entrypoint /bin/bash github-runner
