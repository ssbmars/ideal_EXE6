@echo off
armips Taisen_GXX.asm -sym Taisen_Gregar.sym
textpet run-script exe6gregar.tps
flips -c -b "Gregar\exe6gregar.gba" "idealEXE6 Gregar.gba" "patch/BR5J_00.bps"
timeout 3