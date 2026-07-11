$nat = Get-NetNat -Name "k8s-nat" -ErrorAction SilentlyContinue

if ($null -eq $nat) {

    New-NetNat `
        -Name "k8s-nat" `
        -InternalIPInterfaceAddressPrefix "192.168.100.0/24"

    Write-Host "NAT creado."

}
else {

    Write-Host "El NAT ya existe."

}

Get-NetNat -Name "k8s-nat"