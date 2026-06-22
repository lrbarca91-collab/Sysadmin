This repo is to create a small script for a webserver configuration.

Manual steps I would have to do to check for a configuration change in my webserver.conf:

1. Navigate to file webserver.conf
2. Check functions and syntax of the webserver.conf
3. Compare functions and syntax to original version of webserver.conf

Steps 2 and 3 are apart of CI- Continuous Integration.

CD this would be the deployment part- Continuous deployment

In this case we would have the script be deployed regularly, I would say twice a day. This way we know if there has been any changes made expected or unexpected.

CI/CD in this example enables us to automate the linting, and comparing of the scripts before and after, test whether its working in an isolated environment and deploy it regularly without needing
somebody to manually do any of this.

Best practices: 

Commit messages should always entail what has been changed in the script
The script should have ## Version/Date in it.
Small changes should also be commented underneath ##Version/Date as #Change
