load-plugins plugins\
game mmbn6
load-file-index "Gregar\EXE6g.tpi"
read-text-archives "Gregar\Taisen_GXX_asm.gba" 
read-text-archives "Gregar\Taisen_GXX.tpl" -p 
read-text-archives "Gregar\gregarmodcards.tpl" -p

write-text-archives "Taisen_Gregar.gba"