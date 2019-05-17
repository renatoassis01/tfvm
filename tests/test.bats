#!/usr/bin/env bats 
tf_install=0.11.13
tf_install_botton=0.10.0
tf_version_invalid=0.0.0

@test "testing ls-remote function" {
  result="$(tfvm ls-remote | wc -l)"
  [ "$result" -gt 0 ]
}

@test "testing install version especific function" {
  tfvm install "$tf_install"
  [ -f "$TFVMDIR/versions/$tf_install/terraform" ]
}

@test "testing install version já existis function" {
  result="$(tfvm install "$tf_install" | head -1)"
  [ "$result" == "Use: tfvm use 0.11.13" ]
}

@test "testing install version invalid function" {
  result="$(tfvm install $tf_version_invalid | head -1)"
  [ "$result" == "Version 0.0.0 invalid!" ]
}

@test "testing use function" {
  tfvm use "$tf_install"
  result="$(terraform -v | head -1 | cut -c 12-18)"
  [ "$result" == "$tf_install" ]
}

@test "testing use latest function" {
  tfvm install "$tf_install_botton"
  tfvm use latest
  result="$(terraform -v | head -1 | cut -c 12-18)"
  [ "$result" == "$tf_install" ]
}

@test "testing use version invalid function" {
  result="$(tfvm use $tf_version_invalid)"
  [ "$result" == "Version invalid or not installed." ]
}

@test "testing install version latest function" {
  last_local="$(tfvm ls-remote | sort -V | grep -Ev ".*-beta.*|.*-alpha.*|.*-rc.*" | tail -1)"
  tfvm install latest
  [ -f "$TFVMDIR/versions/$last_local/terraform" ]
}
