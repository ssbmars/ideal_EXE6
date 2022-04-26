@echo off
armips Taisen_GXX.asm -sym Taisen_Gregar.sym
textpet run-script exe6gregar.tps
flips -c -b "Gregar\exe6gregar.gba" "idealEXE6 Gregar.gba" "patch/idealEXE6 Gregar.bps"
timeout 3