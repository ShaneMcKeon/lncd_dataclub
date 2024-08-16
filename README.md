# LNCD CODE REVIEW AND DATA CLUB
**A repository for the Laboratory of Neurocognitive Development's code review and data club!**

This is a central location for presentations given as part of our data club series (data_club) or code + files shared and reviewed as part of our biweekly code review (code_review).

For data club materials: Please create a new directory titled topic_date_initials in the most relevant folder in data_club, and put your materials there. For example: data_club/neuroimaging_methods/myelinimaging_sept2024_vjs

For code review: ? 

## Getting started with the repo

To get acess to this github repo and all of its contents, you can clone the repo to your computer

```
git clone git@github.com:LabNeuroCogDevel/lncd_dataclub.git #using SSH keys 

git clone https://github.com/LabNeuroCogDevel/lncd_dataclub.git #using web url
```

## Adding files to the repo

Want to upload code or files to the repo so others can access them? Put the files in your lncd_dataclub directory (local clone) and then send them to the "remote" repo for everyone to access.

```
mv my_elegant_code.sh lncd_dataclub/code_review #lets get the files you want to share into your local clone
git add code_review/my_elegant_code.sh #tell github you want to add this file to the remote repo!
git commit -m "code review vibes are gonna be high" #commit your addition
git push origin main #push your added and committed changes to the remote repo for others to access
```

## Pulling files from the repo to your local clone

So, you cloned the repo a while ago, but now someone has uploaded some new, elegant code! To access these new files, you can "pull" them down from the remote repo to your local glone

```
cd lncd_dataclub #local repo
git pull origin main #ta-da! files appear!
``` 




