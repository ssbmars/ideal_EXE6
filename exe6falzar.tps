load-plugins plugins\
game mmbn6
load-file-index "Falzar\EXE6f.tpi"
read-text-archives "Falzar\Taisen_RXX_asm.gba" 
read-text-archives "Falzar\Taisen_RXX.tpl" -p 
read-text-archives "Falzar\falzarmodcards.tpl" -p 


write-text-archives "Taisen_Falzar.gba"