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
tfvm use latest                              # Use last version installed
tfvm use 0.11.13                             # Use a version installed
tfvm ls                                      # List all installed versions
```                                     

Project based [Node Version Manager - nvm](https://github.com/nvm-sh/nvm)

### Roadmap

- [x] Basic version funcional
- [x] Implement the option to use the latest version, using the `latest` (tfvm use latest) flag
- [ ] Implement the option to install the latest version by using the `latest` (tfvm install latest) flag 
- [ ] Test units
- [ ] CD/CI
- [ ] Suport OSX


**Note:**  tested only linux