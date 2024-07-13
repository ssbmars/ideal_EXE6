// for EXE6RXX
loadPasswordIndex equ 0x08044898
loadKaizouCard equ 0x8141868
playSound equ 0x081597FE
playSoundConst1 equ 0x8163150
memcopyCardNames equ 0x0815879C
cardNameAddress	equ 0x081417B4
// ---
// bingus stuff
.definelabel RedirectWindrack, 0x080D0BC8
.definelabel WindRStep1, 0x080D0BD8
.definelabel WindRStep2, 0x080D0C78
.definelabel DeleteSpell, 0x0801721A
.definelabel ThunderHook, 0x080CCE6C
.definelabel BootScene1, 0x0803E2AC
.definelabel BootScene2, 0x08030550
.definelabel screenio1, 0x080004BE
.definelabel screenio2, 0x0803E280
.definelabel screenio3, 0x0803E318
.definelabel DecrossChecker, 0x081D78BA
.definelabel PVPFade,	0x0813418E
.definelabel PVPUnfade,	0x080E4634
.definelabel BossFade,	0x0809B6D2
.definelabel FreeSpace,	0x08911A00
// ---
.gba
.open "empty.gba", "Falzar\output_exe6f.gba", 0x08000000
.import "Falzar\Taisen_RXX.gba", 0, 0x911A00


.org 0x08071E00
.include "KaizouLoader.asm"
.include "bbn6.asm"

//change MB limit to 120
.org 0x0814188A
	cmp		r0,120

//revert translated title screen to EXE version
.org 0x08030CC4 :: .dw 0x887F9AB0	//image address
.org 0x08030CD0 :: .dw 0x087F98B0	//palette
.org 0x08030D0C :: .dw 0x087FE5E0	//sprite repositioner

.close