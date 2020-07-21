This is not your normal Bento box. Instead of building a system from an ISO we're building a system from an Amazon provided VirtualBox VDI file. This means the process is a bit different than usual.

## Building The Virtual Machine

### Virtual Box

1. Download the VirtualBox .vdi file for Amazon Linux 2 and place it in the same directory as this readme file. Amazon hosts these at https://cdn.amazonlinux.com/os-images/latest/virtualbox/. Make sure to name it `amazon.vdi` instead of the version specific name that Amazon gives it on their site.

```bash
$ wget -O amazon.vdi https://cdn.amazonlinux.com/os-images/2.0.20200617.0/virtualbox/amzn2-virtualbox-2.0.20200617.0-x86_64.xfs.gpt.vdi
```

2. Run the `STEP1_build_ovf.sh` script to prepare this VDI file for packer and export it as a OVF file.

```bash
./STEP1_build_ovf.sh
```

3. Run `packer build`

```bash
cd packer_templates/amazonlinux/
packer build -only=virtualbox-iso amazon-2-x86_64.json
```

4. OPTIONAL: Cleanup the leftover files in the directory


#### Example 

```bash
$ cd packer_templates/amazonlinux
$ wget -O amazon.vdi https://cdn.amazonlinux.com/os-images/2.0.20200617.0/virtualbox/amzn2-virtualbox-2.0.20200617.0-x86_64.xfs.gpt.vdi
$ ./STEP1_build_ovf.sh
```

### Vmware

1. Download OVFTOOL: https://code.vmware.com/web/tool/4.4.0/ovf, e.g. 
 * Linux - `VMware-ovftool-4.4.0-16360108-lin.x86_64.bundle`
 * Windows - `VMware-ovftool-4.4.0-16360108-win.x86_64.msi`
 * Mac OS- `VMware-ovftool-4.4.0-16360108-mac.x64.dmg`

2. Install OVF Tool

```bash
$ chmod 777 VMware-ovftool-4.4.0-16360108-lin.x86_64.bundle
$ sudo ./VMware-ovftool-4.4.0-16360108-lin.x86_64.bundle
$ which ovftool
/usr/bin/ovftool
```

3. Download the VMware `.ova` file for Amazon Linux 2 and place it in the same directory as this readme file. Amazon hosts these at https://cdn.amazonlinux.com/os-images/latest/vmware/. Make sure to name it `amazon.ova` instead of the version specific name that Amazon gives it on their site.

```bash
$ wget -O amazon.ova https://cdn.amazonlinux.com/os-images/2.0.20200617.0/vmware/amzn2-vmware_esx-2.0.20200617.0-x86_64.xfs.gpt.ova
```

4. Run the `ovftool` to convert the VMware OVA to VMX for packer

```bash
$ ovftool amazon.ova amazon.vmx
```

5. Run `packer build`

```bash
cd packer_templates/amazonlinux/
packer build -only=vmware-vmx amazon-2-x86_64.json
```

#### Example 

```bash
$ wget -O amazon.ova https://cdn.amazonlinux.com/os-images/2.0.20200617.0/vmware/amzn2-vmware_esx-2.0.20200617.0-x86_64.xfs.gpt.ova
$ ovftool amazon.ova amazon.vmx
$ packer build -only=vmware-vmx amazon-2-x86_64.json


```