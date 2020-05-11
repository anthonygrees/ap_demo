chef install base_linux_correct.rb
chef install base_linux_detect.rb
chef install base_windows2012_detect.rb
chef install base_windows2012_correct.rb
chef push development base_linux_correct.rb
chef push development base_linux_detect.rb
chef push development base_windows2012_detect.rb
chef push development base_windows2012_correct.rb
copy C:\chef-repo\.chef\reesyorg.pem C:\chef-repo\cookbooks\bjc_linux_bootstrap\recipes\validator.pem