
git branch <feature>; 
 
git commit -m "<>"; ... ; 
 
git rebase origin develop; 
 
git checkout develop; 
 
git pull; 
 
git merge <feature>; 
 
git push

===========================================

Detached head
That means you are either in the middle of a rebase or stash pop or that you have checked out a particular commit id
you can checkout a specific commit via git checkout <commit-id>
This forces the repo to make the working copy match exactly that commit
But you aren't on any branch
The right thing to do depends on what case you are in
You are probably in a rebase
but look in your .git directory for folders called rebase-merge or rebase-apply
Either indicates that you are in the middle of a rebase
the best thing to do if you've left your repo in the middle of a rebase is
git rebase --abort
Which just sets you back to the last meaningful state of the repository
And then look in your shell history for what you were up to
If you checked out a specific commit, then you can just say "git checkout -b <name>" and that creates a new branch at the commit you have checked out
And sets you to it, so that you are no longer in detached head
As with a lot of git stuff, this probably seems baroque, but it makes some sense  once you understand how git works

<-------------------------Install new Version of git
yum -y install https://centos6.iuscommunity.org/ius-release.rpm
rpm --import /etc/pki/rpm-gpg/IUS-COMMUNITY-GPG-KEY
 
wget http://packages.sw.be/rpmforge-release/rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm
rpm --import http://apt.sw.be/RPM-GPG-KEY.dag.txt
rpm -K rpmforge-release-0.5.3-1.el6.rf.*.rpm
rpm -i rpmforge-release-0.5.3-1.el6.rf.*.rpm
 
yum clean all
yum update
yum remove git
 
yum --disablerepo=base,updates --enablerepo=rpmforge-extras install git2u-2.9.0-1.ius.centos6.x86_64
<-----------------------------------------------------------------


$ git init
Initialized empty Git repository in C:/temp/test2/.git/

Bruce.Campbell@MOC-L-CAMPBELLB  /c/temp/test2 (master)
$ touch readme.md

Bruce.Campbell@MOC-L-CAMPBELLB  /c/temp/test2 (master)
$ git add readme.md

Bruce.Campbell@MOC-L-CAMPBELLB  /c/temp/test2 (master)
$ git commit -m "First Commit "
[master (root-commit) 722d3e8] First Commit
 1 file changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 readme.md

Bruce.Campbell@MOC-L-CAMPBELLB  /c/temp/test2 (master)
$ git remote add origin https://github.com/wavescholar/test.git

Bruce.Campbell@MOC-L-CAMPBELLB  /c/temp/test2 (master)
$ git remote
origin

Bruce.Campbell@MOC-L-CAMPBELLB  /c/temp/test2 (master)
$ git remote -v
origin  https://github.com/wavescholar/test.git (fetch)
origin  https://github.com/wavescholar/test.git (push)

Bruce.Campbell@MOC-L-CAMPBELLB  /c/temp/test2 (master)
$ git push -u origin master
Counting objects: 3, done.
Writing objects: 100% (3/3), 217 bytes | 0 bytes/s, done.
Total 3 (delta 0), reused 0 (delta 0)
To https://github.com/wavescholar/test.git
 * [new branch]      master -> master
Branch master set up to track remote branch master from origin.

Bruce.Campbell@MOC-L-CAMPBELLB  /c/temp/test2 (master)
$ git branch -la
* master
  remotes/origin/master

Bruce.Campbell@MOC-L-CAMPBELLB  /c/temp/test2 (master)
$ git branch -m old.master

Bruce.Campbell@MOC-L-CAMPBELLB  /c/temp/test2 (old.master)
$ git branch -la
* old.master
  remotes/origin/master

Bruce.Campbell@MOC-L-CAMPBELLB  /c/temp/test2 (old.master)
$ git checkout master
Branch master set up to track remote branch master from origin.
Switched to a new branch 'master'

Bruce.Campbell@MOC-L-CAMPBELLB  /c/temp/test2 (master)
$ git status
On branch master
Your branch is up-to-date with 'origin/master'.
nothing to commit, working directory clean

Bruce.Campbell@MOC-L-CAMPBELLB  /c/temp/test2 (master)
$ git branch -la
* master
  old.master
  remotes/origin/master

Bruce.Campbell@MOC-L-CAMPBELLB  /c/temp/test2 (master)
$ git checkout -b develop
Switched to a new branch 'develop'

Bruce.Campbell@MOC-L-CAMPBELLB  /c/temp/test2 (develop)
$ vi readme_develop.md

Bruce.Campbell@MOC-L-CAMPBELLB  /c/temp/test2 (develop)
$ git add .
warning: LF will be replaced by CRLF in readme_develop.md.
The file will have its original line endings in your working directory.

Bruce.Campbell@MOC-L-CAMPBELLB  /c/temp/test2 (develop)
$ git commit -m "First Develop Commit "
[develop 92b8d5e] First Develop Commit
warning: LF will be replaced by CRLF in readme_develop.md.
The file will have its original line endings in your working directory.
 1 file changed, 1 insertion(+)
 create mode 100644 readme_develop.md

Bruce.Campbell@MOC-L-CAMPBELLB  /c/temp/test2 (develop)
$ git branch -la
* develop
  master
  old.master
  remotes/origin/master

Bruce.Campbell@MOC-L-CAMPBELLB  /c/temp/test2 (develop)
$ git push -u origin develop
Counting objects: 3, done.
Delta compression using up to 8 threads.
Compressing objects: 100% (2/2), done.
Writing objects: 100% (3/3), 294 bytes | 0 bytes/s, done.
Total 3 (delta 0), reused 0 (delta 0)
To https://github.com/wavescholar/test.git
 * [new branch]      develop -> develop
Branch develop set up to track remote branch develop from origin.

Bruce.Campbell@MOC-L-CAMPBELLB  /c/temp/test2 (develop)
$ git branch -la
* develop
  master
  old.master
  remotes/origin/develop
  remotes/origin/master

Bruce.Campbell@MOC-L-CAMPBELLB  /c/temp/test2 (develop)
$ git checkout -b feature1
Switched to a new branch 'feature1'

Bruce.Campbell@MOC-L-CAMPBELLB  /c/temp/test2 (feature1)
$ vi readme_feature.md

Bruce.Campbell@MOC-L-CAMPBELLB  /c/temp/test2 (feature1)
$ git add .
warning: LF will be replaced by CRLF in readme_feature.md.
The file will have its original line endings in your working directory.

Bruce.Campbell@MOC-L-CAMPBELLB  /c/temp/test2 (feature1)
$ git commit -m "Frist Feature Commit"
[feature1 83c8884] Frist Feature Commit
warning: LF will be replaced by CRLF in readme_feature.md.
The file will have its original line endings in your working directory.
 1 file changed, 1 insertion(+)
 create mode 100644 readme_feature.md

Bruce.Campbell@MOC-L-CAMPBELLB  /c/temp/test2 (feature1)
$ git commit -m "First Feature Commit" --amend
[feature1 d14b727] First Feature Commit
 Date: Mon Feb 8 16:10:34 2016 -0500
warning: LF will be replaced by CRLF in readme_feature.md.
The file will have its original line endings in your working directory.
 1 file changed, 1 insertion(+)
 create mode 100644 readme_feature.md

Bruce.Campbell@MOC-L-CAMPBELLB  /c/temp/test2 (feature1)
$ git status
On branch feature1
nothing to commit, working directory clean

Bruce.Campbell@MOC-L-CAMPBELLB  /c/temp/test2 (feature1)
$ git rebase origin develop
fatal: Needed a single revision
invalid upstream origin

Bruce.Campbell@MOC-L-CAMPBELLB  /c/temp/test2 (feature1)
$ git rebase origin/develop
Current branch feature1 is up to date.

Bruce.Campbell@MOC-L-CAMPBELLB  /c/temp/test2 (feature1)
$ git checkout develop
Switched to branch 'develop'
Your branch is up-to-date with 'origin/develop'.

Bruce.Campbell@MOC-L-CAMPBELLB  /c/temp/test2 (develop)
$ git pull
Already up-to-date.

Bruce.Campbell@MOC-L-CAMPBELLB  /c/temp/test2 (develop)
$ git merge feature1
Updating 92b8d5e..d14b727
Fast-forward
 readme_feature.md | 1 +
 1 file changed, 1 insertion(+)
 create mode 100644 readme_feature.md

Bruce.Campbell@MOC-L-CAMPBELLB  /c/temp/test2 (develop)
$ git push
Counting objects: 3, done.
Delta compression using up to 8 threads.
Compressing objects: 100% (2/2), done.
Writing objects: 100% (3/3), 328 bytes | 0 bytes/s, done.
Total 3 (delta 0), reused 0 (delta 0)
To https://github.com/wavescholar/test.git
   92b8d5e..d14b727  develop -> develop

Bruce.Campbell@MOC-L-CAMPBELLB  /c/temp/test2 (develop)
$ git checkout master
Switched to branch 'master'
Your branch is up-to-date with 'origin/master'.

Bruce.Campbell@MOC-L-CAMPBELLB  /c/temp/test2 (master)
$ git pull
Already up-to-date.

Bruce.Campbell@MOC-L-CAMPBELLB  /c/temp/test2 (master)
$ git merge origin/develop
Updating 722d3e8..d14b727
Fast-forward
 readme_develop.md | 1 +
 readme_feature.md | 1 +
 2 files changed, 2 insertions(+)
 create mode 100644 readme_develop.md
 create mode 100644 readme_feature.md

Bruce.Campbell@MOC-L-CAMPBELLB  /c/temp/test2 (master)
$ git tag -l "v0.0.1"

Bruce.Campbell@MOC-L-CAMPBELLB  /c/temp/test2 (master)
$ git tag

Bruce.Campbell@MOC-L-CAMPBELLB  /c/temp/test2 (master)
$ git tag -a "v0.0.1"

Bruce.Campbell@MOC-L-CAMPBELLB  /c/temp/test2 (master)
$ git tag
v0.0.1

Bruce.Campbell@MOC-L-CAMPBELLB  /c/temp/test2 (master)
$ git show v0.0.1
tag v0.0.1
Tagger: Bruce Campbell <bruce.campbell@sensus.com>
Date:   Mon Feb 8 16:21:32 2016 -0500

First Release

commit d14b72724b412c2df45fadfd1c9e55c121664b11
Author: Bruce Campbell <bruce.campbell@sensus.com>
Date:   Mon Feb 8 16:10:34 2016 -0500

    First Feature Commit

diff --git a/readme_feature.md b/readme_feature.md
new file mode 100644
index 0000000..d6612ef
--- /dev/null
+++ b/readme_feature.md
@@ -0,0 +1 @@
+FEATURE

Bruce.Campbell@MOC-L-CAMPBELLB  /c/temp/test2 (master)
$ git checkout  d14b727
Note: checking out 'd14b727'.

You are in 'detached HEAD' state. You can look around, make experimental
changes and commit them, and you can discard any commits you make in this
state without impacting any branches by performing another checkout.

If you want to create a new branch to retain commits you create, you may
do so (now or later) by using -b with the checkout command again. Example:

  git checkout -b <new-branch-name>

HEAD is now at d14b727... First Feature Commit

Bruce.Campbell@MOC-L-CAMPBELLB  /c/temp/test2 ((v0.0.1))
$ git checkout master
Switched to branch 'master'
Your branch is ahead of 'origin/master' by 2 commits.
  (use "git push" to publish your local commits)

Bruce.Campbell@MOC-L-CAMPBELLB  /c/temp/test2 (master)
$ git push origin --tags
Counting objects: 1, done.
Writing objects: 100% (1/1), 170 bytes | 0 bytes/s, done.
Total 1 (delta 0), reused 0 (delta 0)
To https://github.com/wavescholar/test.git
 * [new tag]         v0.0.1 -> v0.0.1

Bruce.Campbell@MOC-L-CAMPBELLB  /c/temp/test2 (master)
$ git show
commit d14b72724b412c2df45fadfd1c9e55c121664b11
Author: Bruce Campbell <bruce.campbell@sensus.com>
Date:   Mon Feb 8 16:10:34 2016 -0500

    First Feature Commit

diff --git a/readme_feature.md b/readme_feature.md
new file mode 100644
index 0000000..d6612ef
--- /dev/null
+++ b/readme_feature.md
@@ -0,0 +1 @@
+FEATURE

Bruce.Campbell@MOC-L-CAMPBELLB  /c/temp/test2 (master)
$ git checkout  d14b72724
Note: checking out 'd14b72724'.

You are in 'detached HEAD' state. You can look around, make experimental
changes and commit them, and you can discard any commits you make in this
state without impacting any branches by performing another checkout.

If you want to create a new branch to retain commits you create, you may
do so (now or later) by using -b with the checkout command again. Example:

  git checkout -b <new-branch-name>

HEAD is now at d14b727... First Feature Commit

Bruce.Campbell@MOC-L-CAMPBELLB  /c/temp/test2 ((v0.0.1))
$ git checkout -b releasev0.0.1_branch
Switched to a new branch 'releasev0.0.1_branch'

Bruce.Campbell@MOC-L-CAMPBELLB  /c/temp/test2 (releasev0.0.1_branch)
$ git log -1
commit d14b72724b412c2df45fadfd1c9e55c121664b11
Author: Bruce Campbell <bruce.campbell@sensus.com>
Date:   Mon Feb 8 16:10:34 2016 -0500

    First Feature Commit

Bruce.Campbell@MOC-L-CAMPBELLB  /c/temp/test2 (releasev0.0.1_branch)
$ vi patch.txt

Bruce.Campbell@MOC-L-CAMPBELLB  /c/temp/test2 (releasev0.0.1_branch)
$ git push -u origin releasev0.0.1_branch
Total 0 (delta 0), reused 0 (delta 0)
To https://github.com/wavescholar/test.git
 * [new branch]      releasev0.0.1_branch -> releasev0.0.1_branch
Branch releasev0.0.1_branch set up to track remote branch releasev0.0.1_branch from origin.

Bruce.Campbell@MOC-L-CAMPBELLB  /c/temp/test2 (releasev0.0.1_branch)
$ git log -1
commit d14b72724b412c2df45fadfd1c9e55c121664b11
Author: Bruce Campbell <bruce.campbell@sensus.com>
Date:   Mon Feb 8 16:10:34 2016 -0500

    First Feature Commit

Bruce.Campbell@MOC-L-CAMPBELLB  /c/temp/test2 (releasev0.0.1_branch)
$ git status
On branch releasev0.0.1_branch
Your branch is up-to-date with 'origin/releasev0.0.1_branch'.
Untracked files:
  (use "git add <file>..." to include in what will be committed)

        patch.txt

nothing added to commit but untracked files present (use "git add" to track)

Bruce.Campbell@MOC-L-CAMPBELLB  /c/temp/test2 (releasev0.0.1_branch)
$ git add .
warning: LF will be replaced by CRLF in patch.txt.
The file will have its original line endings in your working directory.

Bruce.Campbell@MOC-L-CAMPBELLB  /c/temp/test2 (releasev0.0.1_branch)
$ git commit -m "First Patch"
[releasev0.0.1_branch 539875b] First Patch
warning: LF will be replaced by CRLF in patch.txt.
The file will have its original line endings in your working directory.
 1 file changed, 1 insertion(+)
 create mode 100644 patch.txt

Bruce.Campbell@MOC-L-CAMPBELLB  /c/temp/test2 (releasev0.0.1_branch)
$ git show
commit 539875b4bec394a5091d7f7ee78124c884c881b6
Author: Bruce Campbell <bruce.campbell@sensus.com>
Date:   Mon Feb 8 16:32:28 2016 -0500

    First Patch

diff --git a/patch.txt b/patch.txt
new file mode 100644
index 0000000..ccb6673
--- /dev/null
+++ b/patch.txt
@@ -0,0 +1 @@
+PATCH

Bruce.Campbell@MOC-L-CAMPBELLB  /c/temp/test2 (releasev0.0.1_branch)
$ git checkout develop
Switched to branch 'develop'
Your branch is up-to-date with 'origin/develop'.

Bruce.Campbell@MOC-L-CAMPBELLB  /c/temp/test2 (develop)
$ git pull
Already up-to-date.

Bruce.Campbell@MOC-L-CAMPBELLB  /c/temp/test2 (develop)
$ git cherry-pick 539875
[develop 9ed2dfb] First Patch
 Date: Mon Feb 8 16:32:28 2016 -0500
 1 file changed, 1 insertion(+)
 create mode 100644 patch.txt
  


  -----------------------------Notes from Working On Feature Branch 
Here we want to roll back some changes and re-organize the file structure

  Bruce.Campbell@MOC-L-CAMPBELLB  /e/Analytics/DSWebService (TimeSeriesEngineTSE-7                              )
$ git status
On branch TimeSeriesEngineTSE-7
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

        new file:   DSWSWorkflow.py
        new file:   DSWSWorkflow.pyc
        new file:   DSWebSrvice_VPC_PythonSetup_Readme.md
        new file:   DriveFeatureAnalysis.py
        new file:   input.csv


Bruce.Campbell@MOC-L-CAMPBELLB  /e/Analytics/DSWebService (TimeSeriesEngineTSE-7                              )
$ git stash
Saved working directory and index state WIP on TimeSeriesEngineTSE-7: 022d8b9 Fi                              rst Develop Commit
HEAD is now at 022d8b9 First Develop Commit

Bruce.Campbell@MOC-L-CAMPBELLB  /e/Analytics/DSWebService (TimeSeriesEngineTSE-7                              )
$ git checkout -b TimeSeriesEngineTSE-7-temp
Switched to a new branch 'TimeSeriesEngineTSE-7-temp'

Bruce.Campbell@MOC-L-CAMPBELLB  /e/Analytics/DSWebService (TimeSeriesEngineTSE-7                              -temp)
$ git stash pop
On branch TimeSeriesEngineTSE-7-temp
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

        new file:   DSWSWorkflow.py
        new file:   DSWSWorkflow.pyc
        new file:   DSWebSrvice_VPC_PythonSetup_Readme.md
        new file:   DriveFeatureAnalysis.py
        new file:   input.csv

Dropped refs/stash@{0} (c719a08227dac6f93bd1bc6693322ddab658b0fb)

Bruce.Campbell@MOC-L-CAMPBELLB  /e/Analytics/DSWebService (TimeSeriesEngineTSE-7                              -temp)
$ git status
On branch TimeSeriesEngineTSE-7-temp
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

        new file:   DSWSWorkflow.py
        new file:   DSWSWorkflow.pyc
        new file:   DSWebSrvice_VPC_PythonSetup_Readme.md
        new file:   DriveFeatureAnalysis.py
        new file:   input.csv

Changes not staged for commit:
  (use "git add/rm <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

        modified:   .gitignore
        deleted:    DSWSWorkflow.py
        deleted:    DSWSWorkflow.pyc
        deleted:    DriveFeatureAnalysis.py
        deleted:    input.csv

Untracked files:
  (use "git add <file>..." to include in what will be committed)

        src/
        test/


Bruce.Campbell@MOC-L-CAMPBELLB  /e/Analytics/DSWebService (TimeSeriesEngineTSE-7                              -temp)
$ git add .

Bruce.Campbell@MOC-L-CAMPBELLB  /e/Analytics/DSWebService (TimeSeriesEngineTSE-7                              -temp)
$ git commit -m "Creating Project Structure"
[TimeSeriesEngineTSE-7-temp 6560edd] Creating Project Structure
 5 files changed, 249 insertions(+)
 create mode 100644 DSWebSrvice_VPC_PythonSetup_Readme.md
 create mode 100644 src/DSWSWorkflow.py
 create mode 100644 src/DriveFeatureAnalysis.py
 create mode 100644 test/input.csv

Bruce.Campbell@MOC-L-CAMPBELLB  /e/Analytics/DSWebService (TimeSeriesEngineTSE-7                              -temp)
$ git checkout TimeSeriesEngineTSE-7
Switched to branch 'TimeSeriesEngineTSE-7'

Bruce.Campbell@MOC-L-CAMPBELLB  /e/Analytics/DSWebService (TimeSeriesEngineTSE-7                              )
$ ls
doc/  setup_dsws.sh

Bruce.Campbell@MOC-L-CAMPBELLB  /e/Analytics/DSWebService (TimeSeriesEngineTSE-7                              )
$ git checkout TimeSeriesEngineTSE-t-temp .
error: pathspec 'TimeSeriesEngineTSE-t-temp' did not match any file(s) known to                               git.

Bruce.Campbell@MOC-L-CAMPBELLB  /e/Analytics/DSWebService (TimeSeriesEngineTSE-7                              )
$ git checkout TimeSeriesEngineTSE-temp .
error: pathspec 'TimeSeriesEngineTSE-temp' did not match any file(s) known to gi                              t.

Bruce.Campbell@MOC-L-CAMPBELLB  /e/Analytics/DSWebService (TimeSeriesEngineTSE-7                              )
$ git checkout TimeSeriesEngineTSE-7-temp .

Bruce.Campbell@MOC-L-CAMPBELLB  /e/Analytics/DSWebService (TimeSeriesEngineTSE-7)
$ git status
On branch TimeSeriesEngineTSE-7
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

        modified:   .gitignore
        new file:   DSWebSrvice_VPC_PythonSetup_Readme.md
        new file:   src/DSWSWorkflow.py
        new file:   src/DriveFeatureAnalysis.py
        new file:   test/input.csv


Bruce.Campbell@MOC-L-CAMPBELLB  /e/Analytics/DSWebService (TimeSeriesEngineTSE-7)
$ git add .

Bruce.Campbell@MOC-L-CAMPBELLB  /e/Analytics/DSWebService (TimeSeriesEngineTSE-7)
$ git commit -m "Project Structure fomr temp branch"
[TimeSeriesEngineTSE-7 a2d8556] Project Structure fomr temp branch
 5 files changed, 249 insertions(+)
 create mode 100644 DSWebSrvice_VPC_PythonSetup_Readme.md
 create mode 100644 src/DSWSWorkflow.py
 create mode 100644 src/DriveFeatureAnalysis.py
 create mode 100644 test/input.csv



---------------------------Rebase and merge feature to development and change the sommit message AFTER the push
 git rebase origin/development
Current branch TimeSeriesEngineTSE-7 is up to date.

Bruce.Campbell@MOC-L-CAMPBELLB  /e/Analytics/DSWebService (TimeSeriesEngineTSE-7)
$ git remote -v
origin  https://github.com/verdeeco/DSWebService.git (fetch)
origin  https://github.com/verdeeco/DSWebService.git (push)

Bruce.Campbell@MOC-L-CAMPBELLB  /e/Analytics/DSWebService (TimeSeriesEngineTSE-7)
$  git checkout development
Switched to branch 'development'
Your branch is up-to-date with 'origin/development'.

Bruce.Campbell@MOC-L-CAMPBELLB  /e/Analytics/DSWebService (development)
$ git pull
Already up-to-date.

Bruce.Campbell@MOC-L-CAMPBELLB  /e/Analytics/DSWebService (development)
$ git merge TimeSeriesEngineTSE-7
Updating 022d8b9..a2d8556
Fast-forward
 .gitignore                            |   1 +
 DSWebSrvice_VPC_PythonSetup_Readme.md |  72 +++++++++++++++++++
 src/DSWSWorkflow.py                   | 127 ++++++++++++++++++++++++++++++++++
 src/DriveFeatureAnalysis.py           |  48 +++++++++++++
 test/input.csv                        |   1 +
 5 files changed, 249 insertions(+)
 create mode 100644 DSWebSrvice_VPC_PythonSetup_Readme.md
 create mode 100644 src/DSWSWorkflow.py
 create mode 100644 src/DriveFeatureAnalysis.py
 create mode 100644 test/input.csv

Bruce.Campbell@MOC-L-CAMPBELLB  /e/Analytics/DSWebService (development)
$ git push
Counting objects: 9, done.
Delta compression using up to 8 threads.
Compressing objects: 100% (7/7), done.
Writing objects: 100% (9/9), 2.43 KiB | 0 bytes/s, done.
Total 9 (delta 1), reused 0 (delta 0)
To https://github.com/verdeeco/DSWebService.git
   022d8b9..a2d8556  development -> development

Bruce.Campbell@MOC-L-CAMPBELLB  /e/Analytics/DSWebService (development)
$ git commit --amend
[development 5d8cf9a] New Project Structure
 Date: Tue Feb 9 15:19:02 2016 -0500
 5 files changed, 249 insertions(+)
 create mode 100644 DSWebSrvice_VPC_PythonSetup_Readme.md
 create mode 100644 src/DSWSWorkflow.py
 create mode 100644 src/DriveFeatureAnalysis.py
 create mode 100644 test/input.csv

Bruce.Campbell@MOC-L-CAMPBELLB  /e/Analytics/DSWebService (development)
$
------------------------------------Second push to development


Bruce.Campbell@MOC-L-CAMPBELLB  /e/Analytics/DSWebService (TimeSeriesEngineTSE-7)
$ git status
On branch TimeSeriesEngineTSE-7
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

        modified:   setup_dsws.sh
        modified:   src/DSWSWorkflow.py
        modified:   src/DriveFeatureAnalysis.py

Untracked files:
  (use "git add <file>..." to include in what will be committed)

        DSWebServiceDemoConfig.txt
        readme.txt
        requirements.txt
        src/DSWSWorkflowLogger.log
        src/DSWebServiceDemo.py
        src/FeatureAnalysis/
        src/ServerPredict/
        src/__init__.py
        src/readme.txt

no changes added to commit (use "git add" and/or "git commit -a")

Bruce.Campbell@MOC-L-CAMPBELLB  /e/Analytics/DSWebService (TimeSeriesEngineTSE-7)
$ git add .
warning: CRLF will be replaced by LF in DSWebServiceDemoConfig.txt.
The file will have its original line endings in your working directory.
warning: CRLF will be replaced by LF in readme.txt.
The file will have its original line endings in your working directory.
warning: CRLF will be replaced by LF in requirements.txt.
The file will have its original line endings in your working directory.
warning: CRLF will be replaced by LF in src/DSWebServiceDemo.py.
The file will have its original line endings in your working directory.
warning: CRLF will be replaced by LF in src/ServerPredict/ServerPredict.py.
The file will have its original line endings in your working directory.
warning: CRLF will be replaced by LF in src/__init__.py.
The file will have its original line endings in your working directory.
warning: CRLF will be replaced by LF in src/readme.txt.
The file will have its original line endings in your working directory.

Bruce.Campbell@MOC-L-CAMPBELLB  /e/Analytics/DSWebService (TimeSeriesEngineTSE-7)
$ git status
warning: CRLF will be replaced by LF in readme.txt.
The file will have its original line endings in your working directory.
warning: CRLF will be replaced by LF in src/DSWebServiceDemo.py.
The file will have its original line endings in your working directory.
On branch TimeSeriesEngineTSE-7
Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

        new file:   DSWebServiceDemoConfig.txt
        new file:   readme.txt
        new file:   requirements.txt
        modified:   setup_dsws.sh
        modified:   src/DSWSWorkflow.py
        new file:   src/DSWSWorkflowLogger.log
        new file:   src/DSWebServiceDemo.py
        modified:   src/DriveFeatureAnalysis.py
        new file:   src/FeatureAnalysis/__init__.py
        new file:   src/ServerPredict/ServerPredict.py
        new file:   src/ServerPredict/__init__.py
        new file:   src/__init__.py
        new file:   src/readme.txt


Bruce.Campbell@MOC-L-CAMPBELLB  /e/Analytics/DSWebService (TimeSeriesEngineTSE-7)
$ git commit -m "Adding some comments, package structure, and demo WebService module.  All of this is work in progress to be reviewd by Sarin"
[TimeSeriesEngineTSE-7 warning: CRLF will be replaced by LF in readme.txt.
The file will have its original line endings in your working directory.
warning: CRLF will be replaced by LF in src/DSWebServiceDemo.py.
The file will have its original line endings in your working directory.
e7612e5] Adding some comments, package structure, and demo WebService module.  All of this is work in progress to be reviewd by Sarin
warning: CRLF will be replaced by LF in DSWebServiceDemoConfig.txt.
The file will have its original line endings in your working directory.
warning: CRLF will be replaced by LF in readme.txt.
The file will have its original line endings in your working directory.
warning: CRLF will be replaced by LF in requirements.txt.
The file will have its original line endings in your working directory.
warning: CRLF will be replaced by LF in src/DSWebServiceDemo.py.
The file will have its original line endings in your working directory.
warning: CRLF will be replaced by LF in src/ServerPredict/ServerPredict.py.
The file will have its original line endings in your working directory.
warning: CRLF will be replaced by LF in src/__init__.py.
The file will have its original line endings in your working directory.
warning: CRLF will be replaced by LF in src/readme.txt.
The file will have its original line endings in your working directory.
 13 files changed, 655 insertions(+), 30 deletions(-)
 create mode 100644 DSWebServiceDemoConfig.txt
 create mode 100644 readme.txt
 create mode 100644 requirements.txt
 create mode 100644 src/DSWSWorkflowLogger.log
 create mode 100644 src/DSWebServiceDemo.py
 create mode 100644 src/FeatureAnalysis/__init__.py
 create mode 100644 src/ServerPredict/ServerPredict.py
 create mode 100644 src/ServerPredict/__init__.py
 create mode 100644 src/__init__.py
 create mode 100644 src/readme.txt

Bruce.Campbell@MOC-L-CAMPBELLB  /e/Analytics/DSWebService (TimeSeriesEngineTSE-7)
$ git rebase origin/development
First, rewinding head to replay your work on top of it...
Unlink of file 'src/DSWSWorkflowLogger.log' failed. Should I try again? (y/n) y
Applying: Adding some comments, package structure, and demo WebService module.  All of this is work in progress to be reviewd by Sarin

Bruce.Campbell@MOC-L-CAMPBELLB  /e/Analytics/DSWebService (TimeSeriesEngineTSE-7)
$ git checkout development
Switched to branch 'development'
Your branch is up-to-date with 'origin/development'.

Bruce.Campbell@MOC-L-CAMPBELLB  /e/Analytics/DSWebService (development)
$ git pull
remote: Counting objects: 22, done.
remote: Compressing objects: 100% (15/15), done.
remote: Total 22 (delta 9), reused 18 (delta 5), pack-reused 0
Unpacking objects: 100% (22/22), done.
From https://github.com/verdeeco/DSWebService
 * [new branch]      Amin_Sandbox -> origin/Amin_Sandbox
   1c5e6bf..c25a5d9  Sarin_Sandbox -> origin/Sarin_Sandbox
Already up-to-date.

Bruce.Campbell@MOC-L-CAMPBELLB  /e/Analytics/DSWebService (development)
$ git merge TimeSeriesEngineTSE-7
Updating 5d8cf9a..238f4b0
Fast-forward
 DSWebServiceDemoConfig.txt         |  16 ++
 readme.txt                         |  59 +++++++
 requirements.txt                   |   7 +
 setup_dsws.sh                      |   3 +-
 src/DSWSWorkflow.py                |  96 +++++++++--
 src/DSWSWorkflowLogger.log         |  81 ++++++++++
 src/DSWebServiceDemo.py            |  62 ++++++++
 src/DriveFeatureAnalysis.py        |  39 +++--
 src/FeatureAnalysis/__init__.py    |   0
 src/ServerPredict/ServerPredict.py | 316 +++++++++++++++++++++++++++++++++++++
 src/ServerPredict/__init__.py      |   0
 src/__init__.py                    |   3 +
 src/readme.txt                     |   3 +
 13 files changed, 655 insertions(+), 30 deletions(-)
 create mode 100644 DSWebServiceDemoConfig.txt
 create mode 100644 readme.txt
 create mode 100644 requirements.txt
 create mode 100644 src/DSWSWorkflowLogger.log
 create mode 100644 src/DSWebServiceDemo.py
 create mode 100644 src/FeatureAnalysis/__init__.py
 create mode 100644 src/ServerPredict/ServerPredict.py
 create mode 100644 src/ServerPredict/__init__.py
 create mode 100644 src/__init__.py
 create mode 100644 src/readme.txt

Bruce.Campbell@MOC-L-CAMPBELLB  /e/Analytics/DSWebService (development)
$ git push
Counting objects: 17, done.
Delta compression using up to 8 threads.
Compressing objects: 100% (15/15), done.
Writing objects: 100% (17/17), 8.98 KiB | 0 bytes/s, done.
Total 17 (delta 2), reused 0 (delta 0)
To https://github.com/verdeeco/DSWebService.git
   5d8cf9a..238f4b0  development -> development

-------------------------------Third dev push
$ git checkout TimeSeriesEngineTSE-7
M       src/DSWSWorkflow.py
M       src/DSWSWorkflowLogger.log
M       src/DriveFeatureAnalysis.py
Switched to branch 'TimeSeriesEngineTSE-7'

Bruce.Campbell@MOC-L-CAMPBELLB  /e/Analytics/DSWebService (TimeSeriesEngineTSE-7)
$ git status
On branch TimeSeriesEngineTSE-7
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

        modified:   src/DSWSWorkflow.py
        modified:   src/DSWSWorkflowLogger.log
        modified:   src/DriveFeatureAnalysis.py

Untracked files:
  (use "git add <file>..." to include in what will be committed)

        test/output.csv

no changes added to commit (use "git add" and/or "git commit -a")

Bruce.Campbell@MOC-L-CAMPBELLB  /e/Analytics/DSWebService (TimeSeriesEngineTSE-7)
$ git add .
warning: CRLF will be replaced by LF in test/output.csv.
The file will have its original line endings in your working directory.

Bruce.Campbell@MOC-L-CAMPBELLB  /e/Analytics/DSWebService (TimeSeriesEngineTSE-7)
$ git commit -m "TSE-7 Working on Workflow Library - added wiring and fixed bugs"
[TimeSeriesEngineTSE-7 ce45713] TSE-7 Working on Workflow Library - added wiring and fixed bugs
warning: CRLF will be replaced by LF in test/output.csv.
The file will have its original line endings in your working directory.
 4 files changed, 199 insertions(+), 67 deletions(-)
 create mode 100644 test/output.csv

Bruce.Campbell@MOC-L-CAMPBELLB  /e/Analytics/DSWebService (TimeSeriesEngineTSE-7)
$ git rebase origin/development
Current branch TimeSeriesEngineTSE-7 is up to date.

Bruce.Campbell@MOC-L-CAMPBELLB  /e/Analytics/DSWebService (TimeSeriesEngineTSE-7)
$ git checkout development
Unlink of file 'src/DSWSWorkflowLogger.log' failed. Should I try again? (y/n) y
Switched to branch 'development'
Your branch is up-to-date with 'origin/development'.

Bruce.Campbell@MOC-L-CAMPBELLB  /e/Analytics/DSWebService (development)
$ git pull
Already up-to-date.

Bruce.Campbell@MOC-L-CAMPBELLB  /e/Analytics/DSWebService (development)
$ git merge TimeSeriesEngineTSE-7
Updating 238f4b0..ce45713
Fast-forward
 src/DSWSWorkflow.py         | 114 +++++++++++++++++++++++++-------------------
 src/DSWSWorkflowLogger.log  |  77 ++++++++++++++++++++++++++++++
 src/DriveFeatureAnalysis.py |  74 +++++++++++++++++++++-------
 test/output.csv             |   1 +
 4 files changed, 199 insertions(+), 67 deletions(-)
 create mode 100644 test/output.csv

Bruce.Campbell@MOC-L-CAMPBELLB  /e/Analytics/DSWebService (development)
$ git push
Counting objects: 8, done.
Delta compression using up to 8 threads.
Compressing objects: 100% (7/7), done.
Writing objects: 100% (8/8), 2.32 KiB | 0 bytes/s, done.
Total 8 (delta 4), reused 0 (delta 0)
To https://github.com/verdeeco/DSWebService.git
   238f4b0..ce45713  development -> development


