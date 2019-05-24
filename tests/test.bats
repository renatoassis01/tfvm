#!/usr/bin/env bats 
tf_install=0.11.13
tf_install_botton=0.10.0
tf_version_invalid=0.0.0

@test "testing ls-remote function" {
  result="$(tfvm ls-remote | wc -l)"
  [ "$result" -gt 0 ]
}

@test "testing install function version especific" {
  tfvm install "$tf_install"
  [ -f "$TFVMDIR/versions/$tf_install/terraform" ]
}

@test "testing the install function for an existing version" {
  result="$(tfvm install "$tf_install" | head -1)"
  [ "$result" == "Use: tfvm use 0.11.13" ]
}

@test "testing the install function version invalid" {
  result="$(tfvm install $tf_version_invalid | head -1)"
  [ "$result" == "Version 0.0.0 invalid!" ]
}

@test "testing function use latest" {
  tfvm install "$tf_install_botton"
  result=$(tfvm use latest)
  result=$(echo $result | cut -c 29-35) 
  [ "$result" == "$tf_install" ]
}

@test "testing function use " {
  tfvm use "$tf_install"
  result="$(terraform -v | head -1 | cut -c 12-18)"
  [ "$result" == "$tf_install" ]
}

@test "testing function use version invalid" {
  result="$(tfvm use $tf_version_invalid)"
  [ "$result" == "Version invalid or not installed." ]
}

@test "testing function install version latest" {
  last_local="$(tfvm ls-remote | sort -V | grep -Ev ".*-beta.*|.*-alpha.*|.*-rc.*" | tail -1)"
  tfvm install latest
  [ -f "$TFVMDIR/versions/$last_local/terraform" ]
}
