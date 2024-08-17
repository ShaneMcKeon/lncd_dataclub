# LNCD CODE REVIEW AND DATA CLUB
**A repository for the Laboratory of Neurocognitive Development's code review and data club!**

This is a central location for 
 * [`data_club`](data_club/) presentation series ([example commands](#data-club)) or
 * [`code_review`](code_review/) files and annotation ([example commands](#code-review))

[Sign up](https://docs.google.com/spreadsheets/d/11oS9XdHAXNV9azwq0Yaxyq6ir_R-8KfF8OWUghnhgug/edit) on the roster sheet (https://tinyurl.com/lncd-data-code-club)

## Adding Data Club Materials
You'll need this repo `clone`d locally. Jump to [Repo Setup](#repo-setup) for that.

Please create a new directory titled `topic_date_initials` in the most relevant folder in `data_club/`, and put your materials there. For example: `data_club/neuroimaging_methods/myelinimaging_2024-09_vjs`

In a terminal, you can do this like
```sh
mkdir -p data_club/neuroimaging_methods/myelinimaging_2024-09_vjs
cp ~/docs/mypresentation data_club/neuroimaging_methods/myelinimaging_2024-09_vjs
git commit -Am 'adding myelin imaging presentation' && git push
```

For more explict commands jump to [Data Club](#data-club).

## Adding Code to Review

You'll need this repo `clone`d locally. Jump to [Repo Setup](#repo-setup) for that.

  1. add code to a folder like `code_review/yyymmdd_intials`
  1. create a new branch
  1. push to your local fork
  1. submit a pull request
  1. look at the reviews

For more explict commands jump to [Code Review](#code-review).

----  

## Git help

### Getting started with the repo

For local access to this repo and all of its contents, you need to `git clone` the github remote onto your computer. For write access, you'll also need to help github confirm your identity. We'll use [ssh key authentication](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account) -- it's slightly more ergonomic than [generating and using a http](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens) [auth token](https://github.com/settings/tokens).

#### Install `gh` helper program

Download `gh`, the [github cli tool](https://cli.github.com/). This tool enables command line access to github (vs git) specific tasks: key management, forking, pull requests, and issues. On MacOS, you can use [`brew`](https://brew.sh/) to install `gh`. This will lower the number of times you need to switch between the web browser and terminal.

  1. install `gh`
  2. authenticate with github

First install
```sh
# on macOS, see https://brew.sh
brew install gh

# on linux (quick and dirty, no man page; 2024-08-17)
curl -L https://github.com/cli/cli/releases/download/v2.54.0/gh_2.54.0_linux_amd64.tar.gz |
  tar -C ~/bin/ --strip-components=2 -wildcards -tvzf - '*/bin/gh'
```

Then authenticate
```sh
gh auth login
```


#### Github SSH key auth setup

  1. copy ssh keys from `~/.ssh/id*pub` (create if missing with `ssh-keygen`)
  2. paste key on github: https://github.com/settings/keys (or use `gh`)

```sh
# contents of a public id file
# copied to new key on https://github.com/settings/keys
head ~/.ssh/id*.pub

# if above is empty, first run
ssh-keygen
```

Alternatively, skip pasting into the browser by using `gh`
```sh
gh ssh-key add ~/.ssh/id_ed25519.pub
```

#### Repo Setup
After `gh` is installed ([help](#install-gh-helper-program)) and ssh keys are setup ([help](#github-ssh-key-auth-setup)), in a terminal, run
```sh
# get remote data locally
git clone git@github.com:LabNeuroCogDevel/lncd_dataclub.git
cd lncd_dataclub

git config push.autoSetupRemote true               # dont complain about making branches
gh repo fork --remote                              # create a personal fork
gh repo set-default LabNeuroCogDevel/lncd_dataclub # but default pr/issues on shared
```

Congrats on finishing the setup. You may want to jump to instructions for [Data Club](#data-club) or [Code Review](#code-review).

#### Specific repo setup notes
The above `clone` and `fork` sequence configures two remote sources 
 * `origin` is your personal github fork
 * `upstream` is the canonical group managed LNCD repo

You can `push` to and `pull` from either. They do not have to be in sync -- neither with each other nor with your or anyone else's local copy. Each can contain their own branches. These names are an artifact of the `git` and `gh` command defaults. You can have an arbitrary number of remotes with any name you like.

See `cat .git/config` for more info and confirmation.

```
[remote "upstream"]
        url = git@github.com:LabNeuroCogDevel/lncd_dataclub.git
[branch "main"]
        remote = upstream
[remote "origin"]
        url = git@github.com:WillForan/lncd_dataclub.git
```
-------

## Data Club

You'll need `lncd_dataclub` files cloned locally on your computer.
See [Repo Setup](#repo-setup).


### Adding files to the repo

Want to upload code or files to the repo so others can access them?
Put the files in your `lncd_dataclub` directory (local clone) and then send (add, commit, push) them to the "remote" repo (github.com) for everyone to access.

```sh
cp my_elegant_code.sh lncd_dataclub/data_club/ # 1. put code-to-share into your local clone
git add data_club/my_elegant_code.sh           # 2. tell git to track the file
git commit -m "good code review vibes"         # 3. commit your addition w/ an annotation
git push upstream                              # 4. send to remote (github)
```

### Pulling files from the repo to your local clone

So, you cloned the repo a while ago, but now someone has uploaded some new, elegant code!
To access these new files, you can "pull" them down from the remote repo to your local glone

```sh
cd lncd_dataclub     # go to the local repo
git pull upstream    # ta-da! new files and changes appear!
``` 
---- 

## Code Review

You'll need `lncd_dataclub` files cloned locally on your computer.
See [Repo Setup](#repo-setup).

### Create a pull request
Following the **branch and pull request** steps outlined in [Adding Code to Review](#adding-code-to-review)

```sh
cd lncd_dataclub                     # 0.1 enter repo on local computer
git pull upstream                    # 0.2 make sure we're up to date 
git checkout -b 20240817_wf          # 1. create a new branch
                                     # 2. add files to review
mkdir code_review/20240817_wf/
cp code-to-review.R  code_review/20240817_wf/

git add code_review/20240817_wf/*    # 3. tell git about those files
git commit -m 'sus code does x'      # 4. annotate addition
git push origin                      # 5. send changes to your github.com fork
gh pr create --fill                  # 6. create pull request to upstream LNCD github repo
```

You can follow the github URL printed out by `gh pr create` to see reviews and annotations others submit.

NB. See `git branch` to see the current branch. Use `git switch main` to get back to the main branch
