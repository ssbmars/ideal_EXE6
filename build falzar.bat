@echo off
armips Taisen_RXX.asm -sym Taisen_Falzar.sym
textpet run-script exe6falzar.tps
flips -c -b "Falzar\exe6falzar.gba" "idealEXE6 Falzar.gba" "patch/BR6J_00.bps"
timeout 3