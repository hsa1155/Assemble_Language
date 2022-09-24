在程式中,我先初始化r1r2r3的值
然後分別先把r1r2r3的值更新成算式要的值
之後把三個值都加到r0上（初始化為0）

之後用arm-none-eabi-gcc 加上-g參數編譯 然後insight打開.exe檔

開啟insight後 要先選取.exe檔
然後在view裡面選取conslole
之後先打
target sim
然後
load hw2.exe
break main
在程式裡面設置其他中斷點
然後在console裡面打 r
之後就逐步進行
