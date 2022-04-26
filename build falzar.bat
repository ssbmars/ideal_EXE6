@echo off
armips Taisen_RXX.asm -sym Taisen_Falzar.sym
armips shrink_falzar.asm
textpet run-script exe6falzar.tps
flips -c -b "Falzar\exe6falzar.gba" "Taisen_Falzar.gba" "patch/EXE6 Falzar.bps"
timeout 3