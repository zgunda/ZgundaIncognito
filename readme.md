# Zgunda Incognito
Launch Google Chrome on Windows with a new data directory every time.

## Usage
1. Create a folder, say `C:\Program Files\Zgunda`.
1. Place the two files from this repo in it: spawnquiet.vbs and ZgundaIncognito.cmd
1. Place [sdelete.exe](https://docs.microsoft.com/en-us/sysinternals/downloads/sdelete) in the same folder.
1. Create a shortcut whose target is: `C:\Windows\System32\wscript.exe "C:\Program Files\Zgunda\spawnquiet.vbs" "'C:\Program Files\Zgunda\ZgundaIncognito.cmd'"`

Now whenever you run that shortcut it will open Google Chrome in a new incognito window completely separate from all other Chrome instances running on your machine. No cookies or other data shared between them.

When you close all tabs/windows from that browser instance, the data directory it used will be permanently and securely deleted.
