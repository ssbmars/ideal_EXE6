// for EXE6GXX
loadPasswordIndex equ 0x08044868
loadKaizouCard equ 0x8143630
playSound equ 0x0815B33A
playSoundConst1 equ 0x8164C8C
memcopyCardNames equ 0x0815A2D8
cardNameAddress	equ 0x0814357C
// ---
// bingus stuff
.definelabel RedirectWindrack, 0x080D2428
.definelabel WindRStep1, 0x080D2438
.definelabel WindRStep2, 0x080D24D8
.definelabel DeleteSpell, 0x0801721A
.definelabel ThunderHook, 0x080CE6CC
.definelabel BootScene1, 0x0803E280
.definelabel BootScene2, 0x08030550
.definelabel screenio1, 0x080004BE
.definelabel screenio2, 0x0803E254
.definelabel screenio3, 0x0803E2EC
.definelabel DecrossChecker, 0x081D78B6
.definelabel PVPFade,	0x08135F56
.definelabel PVPUnfade,	0x080E5960
.definelabel BossFade,	0x0809CC02
.definelabel FreeSpace,	0x08911A00
// ---
.gba
.open "empty.gba", "Gregar\output_exe6g.gba", 0x08000000
.import "Gregar\Taisen_GXX.gba", 0, 0x911A00


.org 0x08072CA0
.include "KaizouLoader.asm"
.include "bbn6.asm"

//remove MB limit for patch cards
.org 0x08143654
	nop

//revert translated title screen to EXE version
.org 0x08030CC4 :: .dw 0x887F892C	//image address
.org 0x08030CD0 :: .dw 0x087F872C	//palette
.org 0x08030D0C :: .dw 0x087FD658	//sprite repositioner

.close