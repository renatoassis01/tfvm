# Basic Terraform version manager

## Dependencies

You need `git, curl or wget`

## Install

 ```sh
    git clone https://github.com/renatoassis01/tfvm.git .tfvm
 ```

Add to your profile (`~/.bash_profile`, `~/.zshrc`, `~/.profile`, or `~/.bashrc`)

```sh
#tfvm
export TFVMDIR=$HOME/.tfvm
export PATH=$TFVMDIR/bin:$PATH
```
**Note:**  source you profile eg: source .bashrc

## How to use:

```sh
tfvm ls-remote                               # Lists the published version
tfvm install 0.11.13                         # Install a specific version number
tfvm use 0.11.13                             # Use a version installed
tfvm ls                                      # List all installed versions
```                                     

Project based [Node Version Manager - nvm](https://github.com/nvm-sh/nvm)



**Note:**  tested only linux