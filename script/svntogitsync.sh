cd /devopstools/svntogitsync/mytruck/GitFromSvn
echo $(pwd)
ls -ltr
echo "Current GIT branch details"
git branch -a
echo "Going to fetch update from SVN server"
git svn rebase
echo "Going to push the update received from SVN server into new GIT repo branch"
git push -u origin featureSyncFromSvn/MyTruck_Devops