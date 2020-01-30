# mern-auth

![Final App](https://i.postimg.cc/tybZb8dL/final-MERNAuth.gif)
Minimal full-stack MERN app with authentication using passport and JWTs.

This project uses the following technologies:

- [React](https://reactjs.org) and [React Router](https://reacttraining.com/react-router/) for frontend
- [Express](http://expressjs.com/) and [Node](https://nodejs.org/en/) for the backend
- [MongoDB](https://www.mongodb.com/) for the database
- [Redux](https://redux.js.org/basics/usagewithreact) for state management between React components

## Medium Series

- [Build a Login/Auth App with the MERN Stack — Part 1 (Backend)](https://blog.bitsrc.io/build-a-login-auth-app-with-mern-stack-part-1-c405048e3669)
- [Build a Login/Auth App with the MERN Stack — Part 2 (Frontend & Redux Setup)](https://blog.bitsrc.io/build-a-login-auth-app-with-mern-stack-part-2-frontend-6eac4e38ee82)
- [Build a Login/Auth App with the MERN Stack — Part 3 (Linking Redux with React Components)](https://blog.bitsrc.io/build-a-login-auth-app-with-the-mern-stack-part-3-react-components-88190f8db718)

# mern-auth - a Mongodb, Express, React & Node.js authentication application.
              Other parts of the project do and will have the following features:
# MERN-AUTH-DOCKER - https://hub.docker.com/repository/docker/pstambaugh14/mern-auth-jenks-k8s2

# MERN-AUTH-Ansible - Just added the files used by another project as I will likely be consolidating all repos here.

# MERN-AUTH-Jenkins - Needs re-vamping after patching of security updates - but will be glorious soon enough!

# MERN-AUTH-K8S - Surprisingly ready to go (after a LOT of tinkering that is... lol). :)


# Updates
# Day One
- Fixed Security Vulnerabilities that I lost track of - generously provided by GitHub's security alerting system.  This mainly consisted of versioning node modules in either yarn or package files.
- After applying the security updates the application stopped functioning locally (as expected) so I needed to rebuild the application from source.  This essentially consisted of clearing cache, removing the contents of the node_modules directory and other things to clean up the environment.
- In addition to this, even after a 'fresh' install of the application I was still running into various issues during the build.  Basically, it came down to having a run a couple of audits and update even more modules that either were or required dependencies as well.
- However, after the first build finally finished "successfully" the client side of the application wasn't working.  At first I thought it had been the fault of either Firewalld or SELinux but it didn't turn out to be the case.  Eventually I was able to narrow it down to being a required global module 'nodemon'.  Nodemon was part of the init script for the application and is required to run pretty much half of the entire application.  I noticed it was being called and nothing returned upon analyzing the log files, so I figured it either needed an environment variable via export, an alias for bash or - which will finally bring us to the correct answer - install it has a global module.  I dislike the fact that I had to grant sudo priveleges in order to attain this feat (install nodemon as a global module), but fingers crossed I should be okay.  

# Day Two
- After successfully being able to fix mern-auth in a local environment without containerization I figured it was now time to test the waters with Minikube once again!
- So, off the bat pretty much nothing worked at all (as expected).  With that said, I'll try my best to remember everything that I did to resolve the endless amounts of issues that arose from this newly found pain in the....
- Anyways, I don't know how I became so unorganized after taking a hiatus from this project for a couple of months but it turned out ABSOLUTELY NOTHING worked - once again! lol.  No worries, it's a great way for me to re-learn code I had forgotten. :)
- Firstly, the major YAML files necessary for deploying the initial environment and essential application configurations and modules that integrated with K8S API's didn't function at all - I figured it would be a bit of a hassle - and oh how it was.
- Basically, the major issue once I was able to get the environment established was the endless waltz with Storage Volume Persistence in the form of my previously configured persistentVolumeClaim schema - and I think it basically come down to lack of my own knowledge in obtaining and using 'secrets' and/or necessary environment variables used for directories, files, et al.
- Either way, what I ended up doing was switching out the persistentVolumeClaim in place of configMaps for directories and configuration files that needed to be mounted locally initially, modified, and configured or for whatever other reason anyone may have to maintain configurations for their unique environment (generally, in this case - solely the ./config/keys.js file necessary for parsing and shipping (hopefully securely) credentials to a remote Atlas MongoDB server somewhere in the clouds - pun intended...  I figured, for this sort of scenario, either option is viable but in the end I liked the configMaps much better IMO for whatever reason - mainly, probably because it actually worked with me lol.
- I also want to note for the future that I want to use a couple of more features that are involved with configMaps configurations and features... but that's for another time.
# The Major Issue
- The ConfigMaps worked fine but I had initial problems with the 'data' symbolic link directory which prevented proper communication between the passport.js module and keys.js.
  Essentially, both files were sitting in a virtual symlink directory provided by K8S virtual volume persistence and/or data held via the API and then consequently mounting that data into a virtual volume... However, the symlinks (if you did list directory -all) you could see that the 'data' virtual/application-layer filesystem/partition was, for some reason, sitting up a directory higher (which - correctly assumed, is NOT possible).  So, when server.js looked to call passport.js, passport.js then had a dependency of keys.js configured as: "const '../config/keys.js'", even though both files are clearly in the same directory in the normal/base filesystem.  With that said, I would receive the following error upon completing the deployment of the Pod:

{"log":"[0] \u001b[32m[nodemon] starting `node server.js`\u001b[39m\n","stream":"stdout","time":"2020-01-30T11:10:31.457535143Z"}
{"log":"[0] internal/modules/cjs/loader.js:638\n","stream":"stdout","time":"2020-01-30T11:10:33.780061423Z"}
{"log":"[0]     throw err;\n","stream":"stdout","time":"2020-01-30T11:10:33.780102505Z"}
{"log":"[0]     ^\n","stream":"stdout","time":"2020-01-30T11:10:33.780110009Z"}
{"log":"[0] \n","stream":"stdout","time":"2020-01-30T11:10:33.780129877Z"}
{"log":"[0] Error: Cannot find module '../config/keys'\n","stream":"stdout","time":"2020-01-30T11:10:33.780136056Z"}
{"log":"[0]     at Function.Module._resolveFilename (internal/modules/cjs/loader.js:636:15)\n","stream":"stdout","time":"2020-01-30T11:10:33.780141251Z"}
{"log":"[0]     at Function.Module._load (internal/modules/cjs/loader.js:562:25)\n","stream":"stdout","time":"2020-01-30T11:10:33.780146684Z"}
{"log":"[0]     at Module.require (internal/modules/cjs/loader.js:692:17)\n","stream":"stdout","time":"2020-01-30T11:10:33.780151894Z"}
{"log":"[0]     at require (internal/modules/cjs/helpers.js:25:18)\n","stream":"stdout","time":"2020-01-30T11:10:33.780157136Z"}
{"log":"[0]     at Object.\u003canonymous\u003e (/opt/mern-auth/config/..2020_01_30_11_10_25.033076288/passport.js:5:14)\n","stream":"stdout","time":"2020-01-30T11:10:33.78016228Z"}
{"log":"[0]     at Module._compile (internal/modules/cjs/loader.js:778:30)\n","stream":"stdout","time":"2020-01-30T11:10:33.780170843Z"}
{"log":"[0]     at Object.Module._extensions..js (internal/modules/cjs/loader.js:789:10)\n","stream":"stdout","time":"2020-01-30T11:10:33.780176369Z"}
{"log":"[0]     at Module.load (internal/modules/cjs/loader.js:653:32)\n","stream":"stdout","time":"2020-01-30T11:10:33.780181792Z"}
{"log":"[0]     at tryModuleLoad (internal/modules/cjs/loader.js:593:12)\n","stream":"stdout","time":"2020-01-30T11:10:33.780189979Z"}
{"log":"[0]     at Function.Module._load (internal/modules/cjs/loader.js:585:3)\n","stream":"stdout","time":"2020-01-30T11:10:33.780208932Z"}
{"log":"[0]     at Module.require (internal/modules/cjs/loader.js:692:17)\n","stream":"stdout","time":"2020-01-30T11:10:33.780214706Z"}
{"log":"[0]     at require (internal/modules/cjs/helpers.js:25:18)\n","stream":"stdout","time":"2020-01-30T11:10:33.780241413Z"}
{"log":"[0]     at Object.\u003canonymous\u003e (/opt/mern-auth/server.js:41:1)\n","stream":"stdout","time":"2020-01-30T11:10:33.780247039Z"}
{"log":"[0]     at Module._compile (internal/modules/cjs/loader.js:778:30)\n","stream":"stdout","time":"2020-01-30T11:10:33.780252501Z"}
{"log":"[0]     at Object.Module._extensions..js (internal/modules/cjs/loader.js:789:10)\n","stream":"stdout","time":"2020-01-30T11:10:33.780257658Z"}
{"log":"[0]     at Module.load (internal/modules/cjs/loader.js:653:32)\n","stream":"stdout","time":"2020-01-30T11:10:33.780262887Z"}
{"log":"[0] \u001b[31m[nodemon] app crashed - waiting for file changes before starting...\u001b[39m\n","stream":"stdout","time":"2020-01-30T11:10:33.869360586Z"}
{"log":"[1] \u001b[34mℹ\u001b[39m \u001b[90m｢wds｣\u001b[39m: Project is running at http://172.17.0.6/\n","stream":"stdout","time":"2020-01-30T11:10:36.456053369Z"}
{"log":"[1] \u001b[34mℹ\u001b[39m \u001b[90m｢wds｣\u001b[39m: webpack output is served from /\n","stream":"stdout","time":"2020-01-30T11:10:36.45677166Z"}
{"log":"[1] \u001b[34mℹ\u001b[39m \u001b[90m｢wds｣\u001b[39m: Content not from webpack is served from /opt/mern-auth/client/public\n","stream":"stdout","time":"2020-01-30T11:10:36.456814082Z"}
{"log":"[1] \u001b[34mℹ\u001b[39m \u001b[90m｢wds｣\u001b[39m: 404s will fallback to /index.html\n","stream":"stdout","time":"2020-01-30T11:10:36.456823686Z"}

After noticing these logs I did a bit of tracing to discover that 'server.js' calls 'passport.js' and then 'passport.js' would then call 'keys.js'.  I ran an ls -la on the 'config' directory and then saw that the symlinks were in a near infinite-loop, considering it looked as such inside of the container:   

ls -la ./config
keys.js --> '..data/<random-string-of-numbers>'
passport.js --> '..data/<random-string-of-numbers>'

From there I did a 'cd' into this ..data directory in which I then attempted to execute the failing line of code inspired by the passport.js file:
cd ..data
cat passport.js | grep -i keys
const keys = require("../config/keys");
cat ../keys.js
Error: No such file or directory
cd ../
pwd
/opt/mern-auth/config
cat keys.js
module.exports = {
  mongoURI: "YOUR_MONGO_URI_HERE",
  secretOrKey: "secret"
};


With that said, I was fortunate enough to discover where the issue was and then diagnose from there.
Thankfully I found this thread from StackOverflow: 'https://stackoverflow.com/questions/50685385/kubernetes-config-map-symlinks-data-is-there-a-way-to-avoid-them'

This is the particular portion that resolved the issue for me (via the stackoverflow page):

I think this solution is satisfactory : specifying exact file path in mountPath, will get rid of the symlinks to ..data and  ..2018_06_04_19_31_41.860238952

So if I apply such a manifest :

apiVersion: v1
kind: Pod
metadata:
  name: my-lamp-site
spec:
    containers:
    - name: php
      image: php:7.0-apache
      volumeMounts:
      - mountPath: /var/www/html/users.xml
        name: site-data
        subPath: users.xml
    volumes:
    - name: site-data
      configMap:
        name: users

---

apiVersion: v1
kind: ConfigMap
metadata:
  name: users
data:
  users.xml: |
      <?xml version="1.0" encoding="UTF-8" standalone="yes"?>
      <users>
      </users>

Apparently, I'm making use of subpath explicitly, and they're not part of the "auto update magic" from ConfigMaps, I won't see any more symlinks :

$ kubectl exec  my-lamp-site -c php -- ls -al /var/www/html
total 12
drwxr-xr-x 1 www-data www-data 4096 Jun  4 19:18 .
drwxr-xr-x 1 root     root     4096 Jun  4 17:58 ..
-rw-r--r-- 1 root     root       73 Jun  4 19:18 users.xml

Be careful to not forget subPath, otherwise users.xml will be a directory !

-----------------------------------------------------------------------------------------------------------------------------

# Goal of This Project
Is, other than learning a tremendous amount of great knowledge in participating in this, to be able to provide DevOps tools for anyone who wishes to use/test the mern-stack based authentication application.  My goal is simply to script as much as I can to provide to the masses (lel) a final product that is easily deployable, easily stalable and operating-system agnostic using such tools as Ansible, Docker, Jenkins and Kubernetes.  I want to be able to make this simple application good enough through my own scripting to be able to be used in any given enterprise-grade corperation.  This project is not so much about the application itself at all for me, it's moreso a test of my own knowledge to improve my enterprise-grade knowledge-base and skillsets - and it has taught me more than I couldn've ever expected!!  Hope anyone who comes across this enjoys the ease of installation and use I have been able to provided through painstaking sleepless nights XD.  Enjoy!
P.S. - Shout-out to the real contributor of the application itself (not just the boring scripting that I do...) Rishi Prasad for engaging the Internets into a great, open source and free application for anyone to use and learn from - and for providing amazing documentation via Medium.com as well.  Cheers!


# Credits:
MERN Authentication app source code is courtesy of: Rishi Prasad (https://blog.bitsrc.io/@rishipr)
You can check out his original project with installation instructions at: https://blog.bitsrc.io/build-a-login-auth-app-with-mern-stack-part-1-c405048e3669 .
You can also directly view or download his code at: https://github.com/rishipr/mern-auth .

## License

Created by Patrick Stambaugh.
https://github.com/pstambaugh14/MERN-AUTH-DOCKER


## Configuration

Make sure to add your own `MONGOURI` from your [mLab](http://mlab.com) database in `config/keys.js`.

```javascript
module.exports = {
  mongoURI: "YOUR_MONGO_URI_HERE",
  secretOrKey: "secret"
};
```

## Quick Start

## Starting MERN-AUTH-DOCKER using Docker Compose:
Start up your docker container with: "docker-compose up" in the directory where you cloned this.  And that should be it - enjoy!


## Quick Start Reference - Docker Container will run the following on build and execution automatically:

```javascript
// Install dependencies for server & client
npm install && npm run client-install

// Run client & server with concurrently
npm run dev

// Server runs on http://localhost:5000 and client on http://localhost:3000
```

For deploying to Heroku, please refer to [this](https://www.youtube.com/watch?v=71wSzpLyW9k) helpful video by TraversyMedia.
