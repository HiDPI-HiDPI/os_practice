
# デフォルト動作

default :
	../sample/tolset/z_tools/make.exe img

# ファイル生成規則

ipl.bin : ipl.nas Makefile
	../sample/tolset/z_tools/nask.exe ipl.nas ipl.bin ipl.lst

helloos.img : ipl.bin Makefile
	../sample/tolset/z_tools/edimg.exe   imgin:../sample/tolset/z_tools/fdimg0at.tek \
		wbinimg src:ipl.bin len:512 from:0 to:0   imgout:helloos.img

# コマンド

asm :
	../sample/tolset/z_tools/make.exe -r ipl.bin

img :
	../sample/tolset/z_tools/make.exe -r helloos.img

run :
	../sample/tolset/z_tools/make.exe img
	copy helloos.img ..\sample\tolset\z_tools\qemu\fdimage0.bin
	../sample/tolset/z_tools/make.exe -C ../z_tools/qemu

install :
	../sample/tolset/z_tools/make.exe img
	../sample/tolset/z_tools/imgtol.com w a: helloos.img

clean :
	-del ipl.bin
	-del ipl.lst

src_only :
	../sample/tolset/z_tools/make.exe clean
	-del helloos.img
