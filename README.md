scripts
=======

Things I write as I need them, things that don't go anywhere else.

Notes
-----
google_selection  
Grabs text from the clipboard, searches text in a new firefox tab. One subtlety is that all special characters in the search string must be properly encoded for the search to succeed – frex. the character # must be encoded as %23. To get around this I just encode every character in the string. I have this bound to  a keyboard shortcut.

i3statusbar.sh  
My status line, which is passed into i3 as the status bar. Runs an infinite loop every second to rebuild the string out of info from basic system calls. 
	
note  
Write and organize quick notes. Calling `note` with no arguments creates a generic file named “note” plus the current date, such as “note_2014_07_13”. Arguments can list all created notes, make a note with a specific name, append a date, time, and/or unix timestamp.  
The file note_completion is a bash completion script, which can be dropped in to the directory `/etc/bash_completion.d/`. It should provide tab completion for existing files in your notes directory.


tpacpi-bat_info  
Thinkpads have a special battery feature to start/stop charging while the laptop remains plugged in. I have some aliases to use these features, but this script just lists settings info in one place. I have this aliased to “acpi” because it does the same thing with more information.

lsdasha  
A wrapper that runs a normal `ls` to list the contents of a directory, and then tries `ls -a` to find hidden files, if the directory seems empty. Saves me five entire keystrokes. 
