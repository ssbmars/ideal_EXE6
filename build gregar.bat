@echo off
armips Taisen_GXX.asm -sym Taisen_Gregar.sym
armips shrink_gregar.asm
textpet run-script exe6gregar.tps
flips -c -b "Gregar\exe6gregar.gba" "Taisen_Gregar.gba" "patch/EXE6 Gregar.bps"
timeout 3