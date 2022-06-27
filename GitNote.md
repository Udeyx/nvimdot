* config username and email
```shell
git config --global user.name "Your Name Comes Here"
git config --global user.email you@yourdomain.example.com
```
* initialize a local repository
```shell
# git controls our repository at the layer of a folder
cd project
git init
# create a snapshot of all files in the folder, '.'
# means the current directory
git add .
# the above command will store these data temporarily
# to save them permanently
git commit
```

