all: with-configuration.iso 

iso/boot/grub/layouts/de.gkb: iso/boot/grub/layouts
	ckbcomp de | grub-mklayout -o iso/boot/grub/layouts/de.gkb

iso/boot/grub/layouts:
	mkdir iso/boot/grub/layouts

with-configuration.iso: iso/boot/grub/grub.cfg iso/boot/grub/layouts/de.gkb
	grub-mkrescue --modules="part_msdos ext2 part_gpt" -v -o with-configuration.iso iso

clean:
	rm -fr *.iso
	rm -fr iso/boot/grub/layouts
