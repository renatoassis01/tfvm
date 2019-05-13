tf_install=0.11.13
tf_install_botton=0.10.0
tf_use_ver_invalid="Version invalid or not installed."
tf_version_invalid=0.0.0

 @test "testing ls-remote function" {
  result="$(tfvm ls-remote | wc -l)"
  [ "$result" -gt 0 ]
}

@test "testing install function" {
  tfvm install "$tf_install"
  result="$(tfvm ls | wc -l)"
  [ "$result" -ge 3 ]
}

@test "testing install version invalid function" {
  result="$(tfvm install $tf_version_invalid | head -1)"
  echo $result
  [ "$result" == "Version 0.0.0 invalid!" ]
}

@test "testing use function" {
  tfvm use "$tf_install"
  result="$(terraform -v | cut -c 12-17)"
  [ "$result" == "$tf_install" ]
}

@test "testing use latest function" {
  tfvm install "$tf_install_botton"
  tfvm use latest
  result="$(terraform -v | cut -c 12-17)"
  [ "$result" == "$tf_install" ]
}

@test "testing use version invalid function" {
  result="$(tfvm use 0.0.0)"
  [ "$result" == "$tf_use_ver_invalid" ]
}
