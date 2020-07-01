&$prompts

$prompts = {
	$name = Read-Host "Name of your project"
	$path = Read-Host "Path of your workspace"
	cls
	Write-Host "Is this information correct?"
	Write-Host "Name: $name"
	Write-Host "Path: $path"
	.$prompts
}

$temp Read-Host "Is this information correct? [Y/n]"
cls
Switch ($temp) {
	N {&$prompts}
	n {&$prompts}
	Default {Write-Host "Generating..."}
}

New-Item -ItemType "directory" -Path ""
