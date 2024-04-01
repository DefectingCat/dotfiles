docker run -d --name gymo-runner --restart unless-stopped -v ./runner/:/runner/ -it --entrypoint /runner/run.sh github-runner
