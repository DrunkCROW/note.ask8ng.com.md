; Copyright (c) 2016-2017 Utero OS Developers. See the COPYRIGHT
; file at the top-level directory of this distribution.
;
; Licensed under the Apache License, Version 2.0 <LICENSE-APACHE or
; http://www.apache.org/licenses/LICENSE-2.0> or the MIT license
; <LICENSE-MIT or http://opensource.org/licenses/MIT>, at your
; option. This file may not be copied, modified, or distributed
; except according to those terms.
;
; The part of this file was taken from:
; https://github.com/phil-opp/blog_os/blob/set_up_rust/src/arch/x86_64/multiboot_header.asm

section .multiboot_header
header_start:
	dd 0xe85250d6									; magic number (multiboot 2)
	dd 0													; architecture 0 (protected mode i386)
	dd header_end - header_start	; header length
	; checksum
	dd 0x100000000 - (0xe85250d6 + 0 + (header_end - header_start))

	; insert optional multiboot tags here

	; required end tag
	dw 0	; type
	dw 0	; flags
	dd 8	; size
header_end:
