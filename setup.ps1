param (
	[string]$scriptLocation = ${env:ProgramFiles(x86)},
	[Parameter(Mandatory = $true)][string]$email = ""
)

Write-Host "Using $($scriptLocation) for repository installation directory"

echo "Setting execution policy to unrestricted..."
Set-ExecutionPolicy Unrestricted				# Allow any Powershell script to be run on this machine
echo "Execution policy set to unrestricted."

$SSHKeyPath = Join-Path -Path $env:USERPROFILE -ChildPath "\.ssh\id_rsa"

$hasSSHKey = Test-Path $SSHKeyPath

if ($hasSSHKey) {
	Write-Host "SSH key detected at $($SSHKeyPath). Using existing key."
} Else {
	Write-Host "No SSH key found at $($SSHKeyPath). Generating new SSH key..."
	ssh-keygen -t rsa -C $email
}

