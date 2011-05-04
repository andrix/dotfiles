"
" Vim syntax highlighting for hibernate.conf files.
"
" To load manually, open your hibernate.conf and type :set ft=hibernate
"
" To load automatically, copy this file to your ~/.vim/syntax/ and put the
" following into your .vimrc:
"
"   augroup filetypedetect
"       au BufNewFile,BufRead hibernate.conf set filetype=hibernate
"       au BufNewFile,BufRead common.conf set filetype=hibernate
"       au BufNewFile,BufRead suspend2.conf set filetype=hibernate
"       au BufNewFile,BufRead disk.conf set filetype=hibernate
"       au BufNewFile,BufRead ram.conf set filetype=hibernate
"   augroup END
"

" Initial setup:
syntax clear
syntax case ignore

" Erroneous components:
syntax match hibernate_error /\S\+/
highlight link hibernate_error Error

" Various allowable lines:
syntax match hibernate_start_line /^/ nextgroup=hibernate_error,hibernate_comment,hibernate_conf

" General syntax items:
syntax keyword hibernate_boolean on off yes no 1 0 contained nextgroup=hibernate_error
highlight link hibernate_boolean Constant

syntax match hibernate_integer /\d\+/ contained nextgroup=hibernate_error
highlight link hibernate_integer Constant

syntax match hibernate_text /.*/ contained nextgroup=hibernate_error
highlight link hibernate_text Constant

syntax match hibernate_decimal /[0-9\.]\+/ contained nextgroup=hibernate_error
highlight link hibernate_decimal Constant

syntax match hibernate_powerdown_method /([345]|shutdown|platform|firmware)/ contained nextgroup=hibernate_error
highlight link hibernate_powerdown_method Constant

syntax match hibernate_procsetting /[a-zA-Z0-9_]\+/ contained nextgroup=hibernate_procvalue
highlight link hibernate_procsetting Constant

syntax match hibernate_procvalue /.*/ contained nextgroup=hibernate_procvalue
highlight link hibernate_procvalue Constant

syntax match hibernate_order_num /\d\d/ contained nextgroup=hibernate_filenames
highlight link hibernate_order_num Constant


" Builtins :
syntax keyword hibernate_conf hibernatevt contained nextgroup=hibernate_integer skipwhite
syntax keyword hibernate_conf verbosity contained nextgroup=hibernate_verbosity skipwhite
syntax keyword hibernate_conf logfile contained nextgroup=hibernate_filenames skipwhite
syntax keyword hibernate_conf logtimestamp contained nextgroup=hibernate_boolean skipwhite
syntax keyword hibernate_conf logverbosity contained nextgroup=hibernate_verbosity skipwhite
syntax keyword hibernate_conf alwaysforce contained nextgroup=hibernate_boolean skipwhite
syntax keyword hibernate_conf alwayskill contained nextgroup=hibernate_boolean skipwhite
syntax keyword hibernate_conf distribution contained nextgroup=hibernate_distribution skipwhite
syntax keyword hibernate_conf include contained nextgroup=hibernate_filenames skipwhite
syntax keyword hibernate_conf trymethod contained nextgroup=hibernate_filenames skipwhite
syntax keyword hibernate_conf xdisplay contained nextgroup=hibernate_xdisplay skipwhite
highlight link hibernate_conf Keyword

syntax match hibernate_filenames /.*$/ contained
highlight link hibernate_filenames Constant

syntax match hibernate_filewriter_target /[^ \t]\+[ \t]\+\d\+$/ contained
highlight link hibernate_filewriter_target Constant

syntax match hibernate_verbosity /[0-4]/ contained
highlight link hibernate_verbosity Constant

syntax keyword hibernate_distribution debian fedora mandrake redhat gentoo suse slackware contained
highlight link hibernate_distribution Special

syntax match hibernate_xdisplay /[a-zA-Z0-9\-_\.]*:\d\+\(.\d\+\)\?$/ contained
highlight link hibernate_xdisplay Constant

" bootsplash
syntax keyword hibernate_conf bootsplash contained nextgroup=hibernate_boolean skipwhite
syntax keyword hibernate_conf bootsplashconfig contained nextgroup=hibernate_filenames skipwhite

" clock
syntax keyword hibernate_conf saveclock contained nextgroup=hibernate_boolean,hibernate_clock_restore_only skipwhite
syntax match hibernate_clock_restore_only /restore.*/ contained
highlight link hibernate_clock_restore_only Constant

" devices
syntax keyword hibernate_conf incompatibledevices contained nextgroup=hibernate_filenames skipwhite

" disk cache
syntax keyword hibernate_conf disablewritecacheon contained nextgroup=hibernate_filenames skipwhite

" fbsplash
syntax keyword hibernate_conf fbsplash contained nextgroup=hibernate_boolean skipwhite
syntax keyword hibernate_conf fbsplashtheme contained nextgroup=hibernate_filenames skipwhite

" filesystems
syntax match hibernate_filesystem /[a-zA-Z0-9\-_]\+/ contained nextgroup=hibernate_filesystem skipwhite
highlight link hibernate_filesystem Constant

syntax keyword hibernate_conf unmount contained nextgroup=hibernate_filenames skipwhite
syntax keyword hibernate_conf unmountfstypes contained nextgroup=hibernate_filesystem skipwhite
syntax keyword hibernate_conf unmountgracetime contained nextgroup=hibernate_decimal skipwhite
syntax keyword hibernate_conf mount contained nextgroup=hibernate_filenames skipwhite

" grub
syntax keyword hibernate_conf changegrubmenu contained nextgroup=hibernate_boolean skipwhite
syntax keyword hibernate_conf grubmenufile contained nextgroup=hibernate_filenames skipwhite
syntax keyword hibernate_conf alternategrubmenufile contained nextgroup=hibernate_filenames skipwhite
syntax keyword hibernate_conf backupgrubmenufile contained nextgroup=hibernate_filenames skipwhite
syntax keyword hibernate_conf remountxfsboot contained nextgroup=hibernate_boolean skipwhite

" hardware_tweaks
syntax keyword hibernate_conf ibmacpi contained nextgroup=hibernate_boolean skipwhite
syntax keyword hibernate_conf radeontool contained nextgroup=hibernate_boolean skipwhite
syntax keyword hibernate_conf runi915resolution contained nextgroup=hibernate_boolean skipwhite
syntax keyword hibernate_conf fullspeedcpu contained nextgroup=hibernate_boolean skipwhite

" lilo
syntax keyword hibernate_conf ensureliloresumes contained nextgroup=hibernate_boolean skipwhite

" lock
syntax match hibernate_username /[a-zA-Z0-9\-_]\+/ contained skipwhite
highlight link hibernate_username Constant

syntax keyword hibernate_conf lockkde contained nextgroup=hibernate_boolean skipwhite
syntax keyword hibernate_conf lockxscreensaver contained nextgroup=hibernate_boolean skipwhite
syntax keyword hibernate_conf lockgnomescreensaver contained nextgroup=hibernate_boolean skipwhite
syntax keyword hibernate_conf lockxlock contained nextgroup=hibernate_boolean skipwhite
syntax keyword hibernate_conf lockxautolock contained nextgroup=hibernate_boolean skipwhite
syntax keyword hibernate_conf lockconsoleas contained nextgroup=hibernate_username skipwhite

" misclaunch
syntax keyword hibernate_conf onsuspend contained nextgroup=hibernate_order_num skipwhite
syntax keyword hibernate_conf onresume contained nextgroup=hibernate_order_num skipwhite

" modules
syntax match hibernate_modules /[a-zA-Z0-9\-_]\+/ contained nextgroup=hibernate_modules skipwhite
highlight link hibernate_modules Constant

syntax keyword hibernate_modules_auto auto contained nextgroup=hibernate_modules skipwhite
highlight link hibernate_modules_auto Constant

syntax keyword hibernate_conf unloadmodules contained nextgroup=hibernate_modules skipwhite
syntax keyword hibernate_conf loadmodules contained nextgroup=hibernate_modules_auto,hibernate_modules skipwhite

syntax keyword hibernate_conf unloadblacklistedmodules contained nextgroup=hibernate_boolean skipwhite

syntax keyword hibernate_conf unloadallmodules contained nextgroup=hibernate_boolean skipwhite
syntax keyword hibernate_conf loadmodulesfromfile contained nextgroup=hibernate_filenames skipwhite

" modules_gentoo
syntax keyword hibernate_conf gentoomodulesautoload contained nextgroup=hibernate_boolean skipwhite

" network
syntax match hibernate_interfaces /[a-z0-9\.]\+/ contained nextgroup=hibernate_interfaces skipwhite
highlight link hibernate_interfaces Constant

syntax keyword hibernate_network_auto auto contained nextgroup=hibernate_interfaces skipwhite
highlight link hibernate_network_auto Constant

syntax keyword hibernate_conf downinterfaces contained nextgroup=hibernate_interfaces,hibernate_network_auto skipwhite
syntax keyword hibernate_conf upinterfaces contained nextgroup=hibernate_interfaces,hibernate_network_auto skipwhite

" networkmanager
syntax keyword hibernate_conf enablenmreconnect contained nextgroup=hibernate_boolean skipwhite

" pause_audio
syntax keyword hibernate_conf muteaudio contained nextgroup=hibernate_boolean skipwhite
syntax keyword hibernate_conf pauseaudio contained nextgroup=hibernate_boolean skipwhite

" pcmcia
syntax keyword hibernate_conf ejectcards contained nextgroup=hibernate_boolean skipwhite

" programs
syntax match hibernate_programs /\S\+/ contained nextgroup=hibernate_programs skipwhite
highlight link hibernate_programs Constant

syntax keyword hibernate_conf incompatibleprograms contained nextgroup=hibernate_programs skipwhite

" services
syntax match hibernate_services /\S\+/ contained nextgroup=hibernate_services skipwhite
highlight link hibernate_services Constant

syntax keyword hibernate_conf stopservices contained nextgroup=hibernate_services skipwhite
syntax keyword hibernate_conf startservices contained nextgroup=hibernate_services skipwhite
syntax keyword hibernate_conf restartservices contained nextgroup=hibernate_services skipwhite

" suspend2
syntax match hibernate_suspend2allsettings /\d\+\(\s\+\d\+\)\+/ contained skipwhite
highlight link hibernate_suspend2allsettings Constant

syntax match hibernate_imagesizelimit /\(\d\+\|nocache\)/ contained skipwhite
highlight link hibernate_imagesizelimit Constant

syntax keyword hibernate_conf usesuspend2 contained nextgroup=hibernate_boolean skipwhite
syntax keyword hibernate_conf reboot contained nextgroup=hibernate_boolean skipwhite
syntax keyword hibernate_conf enableescape contained nextgroup=hibernate_boolean skipwhite
syntax keyword hibernate_conf defaultconsolelevel contained nextgroup=hibernate_integer skipwhite
syntax keyword hibernate_conf imagesizelimit contained nextgroup=hibernate_imagesizelimit skipwhite
syntax keyword hibernate_conf suspend2allsettings contained nextgroup=hibernate_suspend2allsettings skipwhite
syntax keyword hibernate_conf suspend2allsettingsfile contained nextgroup=hibernate_filenames skipwhite
syntax keyword hibernate_conf suspenddevice contained nextgroup=hibernate_filenames skipwhite
syntax keyword hibernate_conf filewriterlocation contained nextgroup=hibernate_filewriter_target skipwhite
syntax keyword hibernate_conf verifyfilewriterresume2 contained nextgroup=hibernate_boolean skipwhite
syntax keyword hibernate_conf loadsuspendmodules contained nextgroup=hibernate_modules skipwhite
syntax keyword hibernate_conf unloadsuspendmodulesafterresume contained nextgroup=hibernate_boolean skipwhite
syntax keyword hibernate_conf powerdownmethod contained nextgroup=hibernate_powerdown_method skipwhite
syntax keyword hibernate_conf compressor contained nextgroup=hibernate_modules skipwhite
syntax keyword hibernate_conf compression contained nextgroup=hibernate_modules skipwhite
syntax keyword hibernate_conf encryptor contained nextgroup=hibernate_modules skipwhite
syntax keyword hibernate_conf encryption contained nextgroup=hibernate_modules skipwhite
syntax keyword hibernate_conf procsetting contained nextgroup=hibernate_procsetting skipwhite
syntax keyword hibernate_conf asynciolimit contained nextgroup=hibernate_integer skipwhite

" acpi_sleep
syntax keyword hibernate_conf useacpisleep contained nextgroup=hibernate_acpi_state skipwhite
syntax match hibernate_acpi_state /[34]/ contained skipwhite
highlight link hibernate_acpi_state Special

" sysfspowerstate
syntax keyword hibernate_conf usesysfspowerstate contained nextgroup=hibernate_sysfspowerstate skipwhite
syntax match hibernate_sysfspowerstate /\(disk\|mem\|standby\)/ contained skipwhite
highlight link hibernate_sysfspowerstate Special

" ususpend
syntax keyword hibernate_conf useususpend contained nextgroup=hibernate_boolean skipwhite

" vbetool
syntax keyword hibernate_conf enablevbetool contained nextgroup=hibernate_boolean skipwhite
syntax keyword hibernate_conf restorevbestatefrom contained nextgroup=hibernate_filenames skipwhite
syntax keyword hibernate_conf vbetoolpost contained nextgroup=hibernate_boolean skipwhite
syntax keyword hibernate_conf restorevcsadata contained nextgroup=hibernate_boolean skipwhite

" xhacks
syntax keyword hibernate_conf switchtotextmode contained nextgroup=hibernate_boolean skipwhite
syntax keyword hibernate_conf usedummyxserver contained nextgroup=hibernate_boolean skipwhite
syntax keyword hibernate_conf dummyxserverconfig contained nextgroup=hibernate_filename skipwhite

" xstatus
syntax keyword hibernate_xstatus kde gnome x contained
highlight link hibernate_xstatus Special

syntax keyword hibernate_conf xstatus contained nextgroup=hibernate_xstatus skipwhite
syntax keyword hibernate_conf xmessagedisable contained nextgroup=hibernate_boolean skipwhite
syntax keyword hibernate_conf xsuspendtext contained nextgroup=hibernate_text skipwhite
syntax keyword hibernate_conf xresumetext contained nextgroup=hibernate_text skipwhite
syntax keyword hibernate_conf xosdsettings contained nextgroup=hibernate_text skipwhite

" xbacklight
syntax keyword hibernate_conf backlight contained nextgroup=hibernate_boolean skipwhite

" gaim
syntax keyword hibernate_conf logoutgaim contained nextgroup=hibernate_boolean skipwhite
syntax keyword hibernate_conf gaimrestorestatus contained nextgroup=hibernate_boolean skipwhite
syntax keyword hibernate_conf gaimlogoutmessage contained nextgroup=hibernate_text skipwhite
syntax keyword hibernate_conf gaimloginmessage contained nextgroup=hibernate_text skipwhite

" Full-line comments:
syntax match hibernate_comment /^#.*/
highlight link hibernate_comment Comment
