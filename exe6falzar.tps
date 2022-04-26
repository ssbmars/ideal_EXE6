load-plugins plugins\
game mmbn6
load-file-index "Falzar\EXE6f.tpi"
read-text-archives "Falzar\output_exe6f.gba" 
read-text-archives "Falzar\Taisen_RXX.tpl" -p 
read-text-archives "Falzar\falzarmodcards.tpl" -p 

write-text-archives "idealEXE6 Falzar.gba"