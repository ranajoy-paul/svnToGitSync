# svnToGitSync
This repo is to consist Svn to Git repo sycn script

Use Case – SVN to GIT Migration with Automatic Synchronization:
===============================================================
Existing code base on SVN will be migrated to GIT using Git Svn utility.
Team will continue to use SVN repository for the in-progress projects.
New project changes to be made on the GIT repository. But changes made on GIT will NOT flow back to SVN.
Changes made on SVN repository branch for the in-progress projects will be continuously synchronized to GIT repository branch.
Freeze SVN after successful production move of in-progress projects and continue with GIT for any new project. 

Migration Strategy:
======================
Determine the branch that needs to be migrated from SVN to GIT.
Using Git Svn utility perform one time code migration from SVN to GIT for the selected branch along with a master branch.
Create script from SVN to pull any changes committed on SVN to sync with GIT with a regular automated scheduler.  
Continue to use SVN for in-progress project(s). Changes committed on SVN branch will flow to corresponding branch in GIT.
New project work will be done on a new development and feature on GIT following Git flow. There will not be any flow back to SVN.
Pull request will be created from the SVN-GIT synchronization branch to the GIT development branch on regular basis to keep the development branch up-to-date.
SVN will be made read-only after the successful production move of in-progress project(s).

Implementation Details
=========================
For utilizing GIT- SVN module utility is needed to be installed in a staging linux server (git-svn.x86_64 0:1.8.3.1-20.el7).
This staging(intermediate) linux box is used to clone SVN repo from a particular branch to convert into corresponding GIT repo branches (master and one feature).
IBM DevOps box(scrbiasdkcph871.crb.apmoller.net) has been used as staging box for this purpose
SVN repo & branch detail for DrayWatch which has been used is as given below :
svn://10.255.217.45/draywatch/branches/DRW_IaaS_Linux_Migration

Jenkins Job Details
=========================
The Jenkins job is created in Jenkins Master box for DrayWatch project as given below
http://scrbjendk007258.crb.apmoller.net:10001/view/draywatch/

The Job is using a script to connect to required Git repo and sync with DrayWatch SVN repo. Job is auto      
scheduled to run every morning during Monday to Friday. This will ensure all SVN changes will flow back to   
GIT branch(ex- feature/DRW_IaaS_Linux_Migration) automatically.



          

        

