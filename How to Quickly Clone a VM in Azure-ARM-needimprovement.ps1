#Enter name of the ResourceGroup in which you have the snapshots
$resourceGroupName = 'myrg'

#Enter name of the snapshot that will be used to create Managed Disks
$snapshotName = 'mysnapshot'

#Enter name of the Managed Disk
$diskName = 'okdok49'

#Enter size of the disk in GB
$diskSize = '128'

#Enter the storage type for Disk. PremiumLRS / StandardLRS.
$storageType = 'Premium_LRS'

#Enter the Azure region where Managed Disk will be created. It should be same as Snapshot location
$location = 'Southeast Asia'

#Set the context to the subscription Id where Managed Disk will be created
Select-AzureRmSubscription -SubscriptionId '8eeeabab-e8a0-431e-ae20-8d408f411544'

#Get the Snapshot ID by using the details provided
$snapshot = Get-AzureRmSnapshot -ResourceGroupName $resourceGroupName -SnapshotName $snapshotName 

#Create a new Managed Disk from the Snapshot provided 
$disk = New-AzureRmDiskConfig -AccountType $storageType -Location $location -CreateOption Copy -SourceResourceId $snapshot.Id

New-AzureRmDisk -Disk $disk -ResourceGroupName $resourceGroupName -DiskName $diskName
###########################
#Enter the name of an existing virtual network where virtual machine will be created
$virtualNetworkName = 'myrg-vnet'

#Enter the name of the virtual machine to be created
$virtualMachineName = 'myrndvm'

#Provide the size of the virtual machine
$virtualMachineSize = 'Standard DS1 v2'

#Initialize virtual machine configuration
$VirtualMachine = New-AzureRmVMConfig -VMName $virtualMachineName -VMSize $virtualMachineSize

#(Optional Step) Add data disk to the configuration. Enter DataDisk Id
#$VirtualMachine = Add-AzureRmVMDataDisk -VM $VirtualMachine -Name $dataDiskName -ManagedDiskId <DataDisk ResourceID> -Lun "0" -CreateOption "Attach"

#Use the Managed Disk Resource Id to attach it to the virtual machine. Use OS type based on the OS present in the disk - Windows / Linux
$VirtualMachine = Set-AzureRmVMOSDisk -VM $VirtualMachine -ManagedDiskId $disk.Id -CreateOption Attach -Windows

#Create a public IP 
$publicIp = New-AzureRmPublicIpAddress -Name ($VirtualMachineName.ToLower()+'_ip') -ResourceGroupName $resourceGroupName -Location $snapshot.Location -AllocationMethod Dynamic

#Get VNET Information
$vnet = Get-AzureRmVirtualNetwork -Name $virtualNetworkName -ResourceGroupName $resourceGroupName

# Create NIC for the VM
$nic = New-AzureRmNetworkInterface -Name ($VirtualMachineName.ToLower()+'_nic') -ResourceGroupName $resourceGroupName -Location $snapshot.Location -SubnetId $vnet.Subnets[0].Id -PublicIpAddressId $publicIp.Id

$VirtualMachine = Add-AzureRmVMNetworkInterface -VM $VirtualMachine -Id $nic.Id

#Create the virtual machine with Managed Disk
New-AzureRmVM -VM $VirtualMachine -ResourceGroupName $resourceGroupName -Location $snapshot.Location



###https://www.techmanyu.com/how-to-quickly-clone-a-vm-in-azure/ 