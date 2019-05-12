Describe 'Terraform files' {

    It "are correctly formatted" {
      $terraformPath = "terraform"
      if ($env.TF_BUILD.Length -ne 0) {
        $terraformPath = "/opt/hostedtoolcache/terraform/0.11.13/x64/terraform" 
      }
      $result = Invoke-Expression "$terraformPath fmt -check=true"
      $result | Should -BeNullOrEmpty
      $LastExitCode | Should -Be 0
    }
}
