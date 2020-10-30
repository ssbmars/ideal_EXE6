// for EXE6RXX
loadPasswordIndex equ 0x08044898
loadKaizouCard equ 0x8141868
playSound equ 0x081597FE
playSoundConst1 equ 0x8163150
memcopyCardNames equ 0x0815879C
cardNameAddress	equ 0x081417B4
// ---

.open "Falzar\Taisen_RXX.gba", "Falzar\Taisen_RXX_asm.gba", 0x08000000

.gba

.org 0x08071D90
.include "KaizouLoader.asm"

//.org 0x08071DE0
//.include "RandomSong.asm"


//revert translated title screen to EXE version
.org 0x08030CC4 :: .dw 0x887F9AB0	//image address
.org 0x08030CD0 :: .dw 0x087F98B0	//palette
.org 0x08030D0C :: .dw 0x087FE5E0	//sprite repositioner



//Random Battle- use bo3 code
.org 0x081341B9
	.db	0x06

.include "asm_jp.asm"		//applies JP version-agnostic changes and executes .close