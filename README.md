# Basic Terraform version manager

[![Codacy Badge](https://api.codacy.com/project/badge/Grade/e54dd13e95b74a3d897cb89c7dd836a2)](https://app.codacy.com/app/renatoassis/tfvm?utm_source=github.com&utm_medium=referral&utm_content=renatoassis01/tfvm&utm_campaign=Badge_Grade_Dashboard)
[![Build Status](https://dev.azure.com/renatoassis/Basic%20Terraform%20version%20manager/_apis/build/status/renatoassis01.tfvm?branchName=master)](https://dev.azure.com/renatoassis/Basic%20Terraform%20version%20manager/_build/latest?definitionId=1&branchName=master)
[![platform](https://img.shields.io/badge/platform-linux%20%7C%20macosx-9cf.svg)](https://img.shields.io/badge/platform-linux%20%7C%20macosx-9cf.svg)

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
export PATH=$TFVMDIR/bin:$TFVMDIR/bin/shims:$PATH
```

> **Note:**  source you profile eg: source .bashrc

```sh
 tfvm -v
 Basic Terraform version manager (version: x.x.x)

```

## How to use:

```sh
tfvm ls-remote                               # Lists the published version
tfvm install 0.11.13                         # Install a specific version number
tfvm install latest                          # Install last version published
tfvm use latest                              # Use last version installed
tfvm use 0.11.13                             # Use a version installed
tfvm ls                                      # List all installed versions
tfvm clear                                   # Clear all installed versions except enabled version
```                                     


## Bash completion

Add to your profile (`~/.bash_profile`, `~/.zshrc`, `~/.profile`, or `~/.bashrc`)

```
[[ -r $TFVMDIR/bash_completion ]] && \. $TFVMDIR/bash_completion

```
> **Note:**  source you profile eg: source .bashrc

## Usage:

> $ tfvm <kbd>Tab</kbd>

```
install    ls         ls-remote  use        -v         --version 
```

> $ tfvm install <kbd>Tab</kbd> <kbd>Tab</kbd> <kbd>Tab</kbd>

```
 0.11.12 0.11.13 0.11.14 latest  
```

> $ tfvm use <kbd>Tab</kbd> <kbd>Tab</kbd> <kbd>Tab</kbd>

```
0.11.12 0.11.13 0.11.14 latest  
```

Inspired by [Node Version Manager - nvm](https://github.com/nvm-sh/nvm)


### Development

   Dependencies: 
   
   - shellcheck: [Shell script analysis tool](https://www.shellcheck.net/) 
   - Bats: [Bash Automated Testing System](https://github.com/bats-core/bats-core)

   
   run shellcheck:

   ```sh
       shellcheck ./bin/tfvm
   ```
   
   
   run test:

   ```sh
     bats ./tests/test.bats
   ```
  
  Submit your pull request


### Todo

- [x] Basic version funcional
- [x] Implement the option to use the latest version, using the `latest` (tfvm use latest) flag
- [x] Implement the option to install the latest version by using the `latest` (tfvm install latest) flag 
- [x] Bash Completion
- [x] Zsh Completion
- [x] Test units
- [x] CD/CI
- [x] Suport OSX
- [x] Clear all installed versions
## License

[![MIT License](http://img.shields.io/badge/license-MIT-blue.svg?style=flat)](LICENSE)