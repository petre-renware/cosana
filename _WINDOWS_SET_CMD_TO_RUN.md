
# Install right dependencies on Windows for Markdown and PDF with weasyprint





## download and install GTK to be able to install `weasyprint`

https://github.com/tschoonj/GTK-for-Windows-Runtime-Environment-Installer/releases


## this SET command is neccesary to run GTK on Windows

`set WEASYPRINT_DLL_DIRECTORIES=C:\GTK3-Runtime Win64\bin;`

or

`set WEASYPRINT_DLL_DIRECTORIES=C:\GTK3\bin;`

