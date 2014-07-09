scripts
=======

Things I write as I need them, things that don't go anywhere else.

Notes
-----
google_selection
Grabs text from the clipboard, searches text in a new firefox tab. One subtlety is that all special characters in the search string must be properly encoded for the search to succeed – frex. # must be encoded as %23. To get around this I just encode the entire string. I have this bound to  a keyboard shortcut.

i3statusbar.sh
My status line, which is passed into i3 as the status bar. Runs an infinite loop every second to rebuild the string out of info from basic system calls. 
	
note
In progress. Used to create text files in a set directory for the purpose of writing quick notes. Defaults to note_year_month_date, so that notes remain organized despite my best efforts. Also has options for listing all notes, opening notes with a unique name (no stamp), and notes with a timestamp in second.

tpacpi-bat_info
Thinkpads have a special battery feature to start/stop charging while the laptop remains plugged in. I have some aliases to use these features, but this script just lists settings info in one place. I have this aliased to “acpi” because it does the same thing with more information.

Todo
----
* finish note v1.0
