# Script for MyTruck project. Similar script exists for DrayWatch project with corresponding SVN & GIT repo
cd /devopstools/svntogitsync/mytruck

# Preparing an author file
svn checkout svn://scrbsoadk001287.crb.apmoller.net/mytruck/APP-2017_MYTRUCK/branches/MyTruck_Devops MyTruckSvnRepo

cd MyTruckSvnRepo
svn log -q | awk -F '|' '/^r/ {sub("^ ", "", $2); sub(" $", "", $2); print $2" = "$2" <"$2">"}' | sort -u > authors.txt
chmod -R 755 authors.txt

# Cloning from SVN into GIT For mytruck from SVN branch /Migration which will create master & Codebase branches :

git svn clone --branches=/branches/MyTruck_Devops --authors-file=authors.txt svn://scrbsoadk001287.crb.apmoller.net/mytruck/APP-2017_MYTRUCK GitFromSvn

cd /devopstools/svntogitsync/mytruck/GitFromSvn

# Then check branch created in GIT, i.e. master etc . 
git checkout -b featureSyncFromSvn/MyTruck_Devops  remotes/origin/Codebase

echo "Current GIT branch details"
git branch -a
echo "Going to fetch update from SVN server"
git svn rebase
echo "Going to push the update received from SVN server into new GIT repo branch"
git push -u origin featureSyncFromSvn/MyTruck_Devops

# The above line pushes the changes from SVN into corresponding Remote GIT Branch.