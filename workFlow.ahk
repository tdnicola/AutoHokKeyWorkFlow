SetCapsLockState, AlwaysOff

CapsLock & j::Send, {blind}{Left}
CapsLock & k::Send, {blind}{Down}
CapsLock & l::Send, {blind}{Right}
CapsLock & i::Send, {blind}{Up}
CapsLock & BS::Send, {blind}{Delete}
CapsLock & '::Send, {blind}{End}
CapsLock & p::Send, {blind}{PgUp}
CapsLock & [::Send, {blind}{Home}
CapsLock & `;::Send, {blind}{PgDn}


#q:: ;windows+q is trigger
	Run, https://na101.salesforce.com/00OC0000007AsMo
	return


; Script Function:
;	Copy a formated content to the Clipboard, then Save it to a file
;	Then Load this file anytime to the Clipboard and paste it to Gmail
;

#a:: ;Windows+a is the trigger 

; LOAD file2clipboard
FileRead, Clipboard, *c gmailSig.rtf ; look for the use of *c  before the filename.rtf. so dont change that

; ---
; paste
Send ^v
return

#w:: ;Windows+w is the trigger 
	;copy the 15 digit code from clipboard
	copied_salesforce_Id = Clipboard 

	;MsgBox, %Clipboard%
	web_browser := ComObjCreate("InternetExplorer.Application")

	; for testing purposes keeping visable as true to see if it navigates correctly
	;web_browser.Visible := true

	web_browser.Navigate("www.adminbooster.com/tool/15to18")

	while web_browser.busy
		sleep 100

	sleep 500

	;input field
	salesforce_id_input := web_browser.document.getElementById("J")

	;inputting the clipboard into the input box
	salesforce_id_input.value := clipboard

	;click convert button
	web_browser.document.getElementsByClassName("convert15to18").(1).Click()

	;get completed innerText
	salesforce_18_digit := web_browser.document.getElementById("L").innerText

	;Copy 18 digit salesforce to clipboard
	clipboard := salesforce_18_digit

	;display the 18 digit salesforce ID
	MsgBox %salesforce_18_digit%
	return
	
; word replacements
::eligiblity::eligibility