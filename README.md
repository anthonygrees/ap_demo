# ap_demo
Demo environment for the Apprentice Chef Training Lab that shows DCA on:
 - Centos 7
 - Windows 2012r2
 - Windows 2016

It uses `waivers` to ensure the CIS benchmarks for L1 pass

### Run the Demo

#### Step 1 : Install the policyfiles

The following PowerShell will install the required `policyfiles` and `push` them to the Chef Server.  It will also grab the validator.pem file.

```bash
cd policyfiles

& policy_push.ps1
```

#### Step 2 : Run Kitchen

The following VM's will be created

```bash
kitchen list

Instance                                Driver  Provisioner  Verifier  Transport  Last Action    Last Error
default-centos-detect-centos-7          Ec2     ChefZero     Inspec    Ssh        <Not Created>  <None>
default-centos-correct-centos-7         Ec2     ChefZero     Inspec    Ssh        <Not Created>  <None>
default-win2012-detect-windows-2012r2   Ec2     ChefZero     Inspec    Winrm      <Not Created>  <None>
default-win2012-correct-windows-2012r2  Ec2     ChefZero     Inspec    Winrm      <Not Created>  <None>
default-win2016-detect-windows-2016     Ec2     ChefZero     Inspec    Winrm      <Not Created>  <None>
default-win2016-correct-windows-2016    Ec2     ChefZero     Inspec    Winrm      <Not Created>  <None>
```

Now run the converge

```bash

kitchen converge
```
