# site-checker
A script that checks to see if a site has changed and notifies you by email

## Getting started
- Clone the repo: `git clone https://github.com/elliotaplant/site-checker`
- Install dependencies: `npm install nodemailer`
- Create a cronjob: `crontab -e`
  - '15 15 * * * cd /home/elliot/code/site-checker && . .envrc && ./full.sh http://n-gate.com elliotaplant@gmail.com'
