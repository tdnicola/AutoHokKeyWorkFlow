; Script Function:
;	Copy a formated content to the Clipboard, then Save it to a file
;       Then Load this file anytime to the Clipboard and paste it to Gmail or any other application you wish
;

; SAVE file2clipboard
 FileAppend, %ClipboardAll%, gmailSig.rtf ; gmailSig.rtf is changable to whatever filename you choose. Just make sure it is the same in the workflow script
return