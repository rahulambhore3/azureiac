$vm = Get-AzVM -ResourceGroupName 'az-vm-esus2-rg' -VMName 'az-test-vm'
$vm.HardwareProfile.VmSize = 'Standard_B1s'
Update-AzVM -VM $vm -ResourceGroupName 'az-vm-esus2-rg'