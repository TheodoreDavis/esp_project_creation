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

$name = "Sample_Project"
$path = "C:\Users\stat_tcdavis\Desktop"

$temp = $path + "\" + $name
New-Item -Path $temp -Force -ItemType directory

$path += "\" + $name

$temp = $path + "\" + "CMakeLists.txt"
Out-File -FilePath $temp -Encoding string -Force -InputObject "# Automatically generated using IDF_Project_Generator`ncmake_minimum_required(VERSION 3.5)`n`ninclude(`$ENV{IDF_PATH}/tools/cmake/project.cmake)`nproject($name)"
$temp = $path + "\" + "Makefile"
Out-File -FilePath $temp -Encoding string -Force -InputObject "# Automatically generated using IDF_Project_Generator`n`nPROJECT_NAME := $name`ninclude `$(IDF_PATH)/make/project.mk"

$temp = $path + "\" + "main"
New-Item -Path $temp -Force -ItemType directory

$temp = $path + "\" + "main" + "\" + "CMakeLists.txt"
Out-File -FilePath $temp -Encoding string -Force -InputObject "# Automatically generated using IDF_Project_Generator`nidf_component_register(SRCS `"$name.c`"`n`t`t`t`t`tINCLUDE_DIRS `".`")"

