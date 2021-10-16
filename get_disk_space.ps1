$servername = "LAPTOP-5SDIKK41"

$diskinfo = Get-WmiObject -Class Win32_LogicalDisk -ComputerName $servername |

Select-Object @{Name="DeviceID";Expression={$_.DeviceID}},
         @{Name="DriveType";Expression={switch ($_.DriveType){
                 0 {"Unknown"}

                 1 {"No Root Directory"}
                 2 {"Removable Disk"}
                 3 {"Local Disk"}
                 4 {"Network Drive"}
                 5 {"Compact Disc"}
                 6 {"RAM Disk"}
          }};
          },
          @{Name="Size (GB)";Expression={"{0:N1}" -f ($_.Size/1GB)}},
          @{Name="Free Space (GB)";Expression={"{0:N1}" -f($_.FreeSpace/1GB)}},
          @{Name="Free Space (%)";
          Expression={
             if ($_.Size -gt 0){
                "{0:P0}" -f($_.FreeSpace/$_.Size)
             }
             else
            {
               0
            }
          }
        }


$data = @{date="{0:MM}/{0:dd}/{0:yyyy} {0:hh}:{0:mm}" -f (get-date);value = $diskinfo}
$json = $data | ConvertTo-Json
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Invoke-RestMethod -Method post -uri "https://funsendgrid.azurewebsites.net/api/HttpTriggerPowerShell1?code=dMIGDN7NTB4rrXUBJW8JoyM18YxPVyep2VYhOp6FFZHbUZsFSNB9Kw==" -Body $json