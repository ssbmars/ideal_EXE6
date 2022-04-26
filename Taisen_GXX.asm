// for EXE6GXX
loadPasswordIndex equ 0x08044868
loadKaizouCard equ 0x8143630
playSound equ 0x0815B33A
playSoundConst1 equ 0x8164C8C
memcopyCardNames equ 0x0815A2D8
cardNameAddress	equ 0x0814357C
// ---
.gba
.open "empty.gba", "Gregar\output_exe6g.gba", 0x08000000
.import "Gregar\Taisen_GXX.gba", 0, 0x911A00


.org 0x08072CA0
.include "KaizouLoader.asm"

//revert translated title screen to EXE version
.org 0x08030CC4 :: .dw 0x887F892C	//image address
.org 0x08030CD0 :: .dw 0x087F872C	//palette
.org 0x08030D0C :: .dw 0x087FD658	//sprite repositioner

.close