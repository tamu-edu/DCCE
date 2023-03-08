
a.out:     file format elf64-x86-64


Disassembly of section .interp:

0000000000000318 <.interp>:
 318:	2f                   	(bad)  
 319:	6c                   	insb   (%dx),%es:(%rdi)
 31a:	69 62 36 34 2f 6c 64 	imul   $0x646c2f34,0x36(%rdx),%esp
 321:	2d 6c 69 6e 75       	sub    $0x756e696c,%eax
 326:	78 2d                	js     355 <_init-0xcab>
 328:	78 38                	js     362 <_init-0xc9e>
 32a:	36 2d 36 34 2e 73    	ss sub $0x732e3436,%eax
 330:	6f                   	outsl  %ds:(%rsi),(%dx)
 331:	2e 32 00             	xor    %cs:(%rax),%al

Disassembly of section .note.gnu.property:

0000000000000338 <.note.gnu.property>:
 338:	04 00                	add    $0x0,%al
 33a:	00 00                	add    %al,(%rax)
 33c:	10 00                	adc    %al,(%rax)
 33e:	00 00                	add    %al,(%rax)
 340:	05 00 00 00 47       	add    $0x47000000,%eax
 345:	4e 55                	rex.WRX push %rbp
 347:	00 02                	add    %al,(%rdx)
 349:	00 00                	add    %al,(%rax)
 34b:	c0 04 00 00          	rolb   $0x0,(%rax,%rax,1)
 34f:	00 03                	add    %al,(%rbx)
 351:	00 00                	add    %al,(%rax)
 353:	00 00                	add    %al,(%rax)
 355:	00 00                	add    %al,(%rax)
	...

Disassembly of section .note.gnu.build-id:

0000000000000358 <.note.gnu.build-id>:
 358:	04 00                	add    $0x0,%al
 35a:	00 00                	add    %al,(%rax)
 35c:	14 00                	adc    $0x0,%al
 35e:	00 00                	add    %al,(%rax)
 360:	03 00                	add    (%rax),%eax
 362:	00 00                	add    %al,(%rax)
 364:	47                   	rex.RXB
 365:	4e 55                	rex.WRX push %rbp
 367:	00 55 bf             	add    %dl,-0x41(%rbp)
 36a:	52                   	push   %rdx
 36b:	ca 1e 1b             	lret   $0x1b1e
 36e:	96                   	xchg   %eax,%esi
 36f:	c2 5f e0             	retq   $0xe05f
 372:	6a f8                	pushq  $0xfffffffffffffff8
 374:	5d                   	pop    %rbp
 375:	89 cb                	mov    %ecx,%ebx
 377:	b3 53                	mov    $0x53,%bl
 379:	94                   	xchg   %eax,%esp
 37a:	15                   	.byte 0x15
 37b:	a4                   	movsb  %ds:(%rsi),%es:(%rdi)

Disassembly of section .note.ABI-tag:

000000000000037c <.note.ABI-tag>:
 37c:	04 00                	add    $0x0,%al
 37e:	00 00                	add    %al,(%rax)
 380:	10 00                	adc    %al,(%rax)
 382:	00 00                	add    %al,(%rax)
 384:	01 00                	add    %eax,(%rax)
 386:	00 00                	add    %al,(%rax)
 388:	47                   	rex.RXB
 389:	4e 55                	rex.WRX push %rbp
 38b:	00 00                	add    %al,(%rax)
 38d:	00 00                	add    %al,(%rax)
 38f:	00 03                	add    %al,(%rbx)
 391:	00 00                	add    %al,(%rax)
 393:	00 02                	add    %al,(%rdx)
 395:	00 00                	add    %al,(%rax)
 397:	00 00                	add    %al,(%rax)
 399:	00 00                	add    %al,(%rax)
	...

Disassembly of section .gnu.hash:

00000000000003a0 <.gnu.hash>:
 3a0:	02 00                	add    (%rax),%al
 3a2:	00 00                	add    %al,(%rax)
 3a4:	14 00                	adc    $0x0,%al
 3a6:	00 00                	add    %al,(%rax)
 3a8:	01 00                	add    %eax,(%rax)
 3aa:	00 00                	add    %al,(%rax)
 3ac:	06                   	(bad)  
 3ad:	00 00                	add    %al,(%rax)
 3af:	00 00                	add    %al,(%rax)
 3b1:	00 91 00 01 00 00    	add    %dl,0x100(%rcx)
 3b7:	00 14 00             	add    %dl,(%rax,%rax,1)
 3ba:	00 00                	add    %al,(%rax)
 3bc:	00 00                	add    %al,(%rax)
 3be:	00 00                	add    %al,(%rax)
 3c0:	d0 65 ce             	shlb   -0x32(%rbp)
 3c3:	6d                   	insl   (%dx),%es:(%rdi)
 3c4:	15                   	.byte 0x15
 3c5:	98                   	cwtl   
 3c6:	0c 43                	or     $0x43,%al

Disassembly of section .dynsym:

00000000000003c8 <.dynsym>:
	...
 3e0:	a0 00 00 00 12 00 00 	movabs 0x12000000,%al
 3e7:	00 00 
	...
 3f5:	00 00                	add    %al,(%rax)
 3f7:	00 ce                	add    %cl,%dh
 3f9:	01 00                	add    %eax,(%rax)
 3fb:	00 12                	add    %dl,(%rdx)
	...
 40d:	00 00                	add    %al,(%rax)
 40f:	00 d3                	add    %dl,%bl
 411:	00 00                	add    %al,(%rax)
 413:	00 12                	add    %dl,(%rdx)
	...
 425:	00 00                	add    %al,(%rax)
 427:	00 47 00             	add    %al,0x0(%rdi)
 42a:	00 00                	add    %al,(%rax)
 42c:	12 00                	adc    (%rax),%al
	...
 43e:	00 00                	add    %al,(%rax)
 440:	54                   	push   %rsp
 441:	00 00                	add    %al,(%rax)
 443:	00 12                	add    %dl,(%rdx)
	...
 455:	00 00                	add    %al,(%rax)
 457:	00 76 00             	add    %dh,0x0(%rsi)
 45a:	00 00                	add    %al,(%rax)
 45c:	12 00                	adc    (%rax),%al
	...
 46e:	00 00                	add    %al,(%rax)
 470:	b9 01 00 00 12       	mov    $0x12000001,%ecx
	...
 485:	00 00                	add    %al,(%rax)
 487:	00 8b 00 00 00 12    	add    %cl,0x12000000(%rbx)
	...
 49d:	00 00                	add    %al,(%rax)
 49f:	00 ac 01 00 00 12 00 	add    %ch,0x120000(%rcx,%rax,1)
	...
 4b6:	00 00                	add    %al,(%rax)
 4b8:	37                   	(bad)  
 4b9:	01 00                	add    %eax,(%rax)
 4bb:	00 12                	add    %dl,(%rdx)
	...
 4cd:	00 00                	add    %al,(%rax)
 4cf:	00 26                	add    %ah,(%rsi)
 4d1:	01 00                	add    %eax,(%rax)
 4d3:	00 12                	add    %dl,(%rdx)
	...
 4e5:	00 00                	add    %al,(%rax)
 4e7:	00 9b 01 00 00 12    	add    %bl,0x12000001(%rbx)
	...
 4fd:	00 00                	add    %al,(%rax)
 4ff:	00 63 00             	add    %ah,0x0(%rbx)
 502:	00 00                	add    %al,(%rax)
 504:	12 00                	adc    (%rax),%al
	...
 516:	00 00                	add    %al,(%rax)
 518:	6f                   	outsl  %ds:(%rsi),(%dx)
 519:	01 00                	add    %eax,(%rax)
 51b:	00 12                	add    %dl,(%rdx)
	...
 52d:	00 00                	add    %al,(%rax)
 52f:	00 11                	add    %dl,(%rcx)
 531:	00 00                	add    %al,(%rax)
 533:	00 20                	add    %ah,(%rax)
	...
 545:	00 00                	add    %al,(%rax)
 547:	00 d7                	add    %dl,%bh
 549:	01 00                	add    %eax,(%rax)
 54b:	00 12                	add    %dl,(%rdx)
	...
 55d:	00 00                	add    %al,(%rax)
 55f:	00 c4                	add    %al,%ah
 561:	00 00                	add    %al,(%rax)
 563:	00 20                	add    %ah,(%rax)
	...
 575:	00 00                	add    %al,(%rax)
 577:	00 2d 00 00 00 20    	add    %ch,0x20000000(%rip)        # 2000057d <_end+0x1fffc3b5>
	...
 58d:	00 00                	add    %al,(%rax)
 58f:	00 0e                	add    %cl,(%rsi)
 591:	01 00                	add    %eax,(%rax)
 593:	00 12                	add    %dl,(%rdx)
	...
 5a5:	00 00                	add    %al,(%rax)
 5a7:	00 bf 01 00 00 22    	add    %bh,0x22000001(%rdi)
	...
 5bd:	00 00                	add    %al,(%rax)
 5bf:	00 87 01 00 00 11    	add    %al,0x11000001(%rdi)
 5c5:	00 1a                	add    %bl,(%rdx)
 5c7:	00 40 40             	add    %al,0x40(%rax)
 5ca:	00 00                	add    %al,(%rax)
 5cc:	00 00                	add    %al,(%rax)
 5ce:	00 00                	add    %al,(%rax)
 5d0:	10 01                	adc    %al,(%rcx)
 5d2:	00 00                	add    %al,(%rax)
 5d4:	00 00                	add    %al,(%rax)
	...

Disassembly of section .dynstr:

00000000000005d8 <.dynstr>:
 5d8:	00 6c 69 62          	add    %ch,0x62(%rcx,%rbp,2)
 5dc:	70 74                	jo     652 <_init-0x9ae>
 5de:	68 72 65 61 64       	pushq  $0x64616572
 5e3:	2e 73 6f             	jae,pn 655 <_init-0x9ab>
 5e6:	2e 30 00             	xor    %al,%cs:(%rax)
 5e9:	5f                   	pop    %rdi
 5ea:	49 54                	rex.WB push %r12
 5ec:	4d 5f                	rex.WRB pop %r15
 5ee:	64 65 72 65          	fs gs jb 657 <_init-0x9a9>
 5f2:	67 69 73 74 65 72 54 	imul   $0x4d547265,0x74(%ebx),%esi
 5f9:	4d 
 5fa:	43 6c                	rex.XB insb (%dx),%es:(%rdi)
 5fc:	6f                   	outsl  %ds:(%rsi),(%dx)
 5fd:	6e                   	outsb  %ds:(%rsi),(%dx)
 5fe:	65 54                	gs push %rsp
 600:	61                   	(bad)  
 601:	62                   	(bad)  
 602:	6c                   	insb   (%dx),%es:(%rdi)
 603:	65 00 5f 49          	add    %bl,%gs:0x49(%rdi)
 607:	54                   	push   %rsp
 608:	4d 5f                	rex.WRB pop %r15
 60a:	72 65                	jb     671 <_init-0x98f>
 60c:	67 69 73 74 65 72 54 	imul   $0x4d547265,0x74(%ebx),%esi
 613:	4d 
 614:	43 6c                	rex.XB insb (%dx),%es:(%rdi)
 616:	6f                   	outsl  %ds:(%rsi),(%dx)
 617:	6e                   	outsb  %ds:(%rsi),(%dx)
 618:	65 54                	gs push %rsp
 61a:	61                   	(bad)  
 61b:	62                   	(bad)  
 61c:	6c                   	insb   (%dx),%es:(%rdi)
 61d:	65 00 70 74          	add    %dh,%gs:0x74(%rax)
 621:	68 72 65 61 64       	pushq  $0x64616572
 626:	5f                   	pop    %rdi
 627:	6a 6f                	pushq  $0x6f
 629:	69 6e 00 70 74 68 72 	imul   $0x72687470,0x0(%rsi),%ebp
 630:	65 61                	gs (bad) 
 632:	64 5f                	fs pop %rdi
 634:	63 72 65             	movslq 0x65(%rdx),%esi
 637:	61                   	(bad)  
 638:	74 65                	je     69f <_init-0x961>
 63a:	00 70 74             	add    %dh,0x74(%rax)
 63d:	68 72 65 61 64       	pushq  $0x64616572
 642:	5f                   	pop    %rdi
 643:	6d                   	insl   (%dx),%es:(%rdi)
 644:	75 74                	jne    6ba <_init-0x946>
 646:	65 78 5f             	gs js  6a8 <_init-0x958>
 649:	6c                   	insb   (%dx),%es:(%rdi)
 64a:	6f                   	outsl  %ds:(%rsi),(%dx)
 64b:	63 6b 00             	movslq 0x0(%rbx),%ebp
 64e:	70 74                	jo     6c4 <_init-0x93c>
 650:	68 72 65 61 64       	pushq  $0x64616572
 655:	5f                   	pop    %rdi
 656:	62 61                	(bad)  
 658:	72 72                	jb     6cc <_init-0x934>
 65a:	69 65 72 5f 77 61 69 	imul   $0x6961775f,0x72(%rbp),%esp
 661:	74 00                	je     663 <_init-0x99d>
 663:	70 74                	jo     6d9 <_init-0x927>
 665:	68 72 65 61 64       	pushq  $0x64616572
 66a:	5f                   	pop    %rdi
 66b:	6d                   	insl   (%dx),%es:(%rdi)
 66c:	75 74                	jne    6e2 <_init-0x91e>
 66e:	65 78 5f             	gs js  6d0 <_init-0x930>
 671:	75 6e                	jne    6e1 <_init-0x91f>
 673:	6c                   	insb   (%dx),%es:(%rdi)
 674:	6f                   	outsl  %ds:(%rsi),(%dx)
 675:	63 6b 00             	movslq 0x0(%rbx),%ebp
 678:	70 74                	jo     6ee <_init-0x912>
 67a:	68 72 65 61 64       	pushq  $0x64616572
 67f:	5f                   	pop    %rdi
 680:	62 61                	(bad)  
 682:	72 72                	jb     6f6 <_init-0x90a>
 684:	69 65 72 5f 69 6e 69 	imul   $0x696e695f,0x72(%rbp),%esp
 68b:	74 00                	je     68d <_init-0x973>
 68d:	6c                   	insb   (%dx),%es:(%rdi)
 68e:	69 62 73 74 64 63 2b 	imul   $0x2b636474,0x73(%rdx),%esp
 695:	2b 2e                	sub    (%rsi),%ebp
 697:	73 6f                	jae    708 <_init-0x8f8>
 699:	2e 36 00 5f 5f       	cs add %bl,%ss:0x5f(%rdi)
 69e:	67 6d                	insl   (%dx),%es:(%edi)
 6a0:	6f                   	outsl  %ds:(%rsi),(%dx)
 6a1:	6e                   	outsb  %ds:(%rsi),(%dx)
 6a2:	5f                   	pop    %rdi
 6a3:	73 74                	jae    719 <_init-0x8e7>
 6a5:	61                   	(bad)  
 6a6:	72 74                	jb     71c <_init-0x8e4>
 6a8:	5f                   	pop    %rdi
 6a9:	5f                   	pop    %rdi
 6aa:	00 5f 5a             	add    %bl,0x5a(%rdi)
 6ad:	53                   	push   %rbx
 6ae:	74 34                	je     6e4 <_init-0x91c>
 6b0:	65 6e                	outsb  %gs:(%rsi),(%dx)
 6b2:	64 6c                	fs insb (%dx),%es:(%rdi)
 6b4:	49 63 53 74          	movslq 0x74(%r11),%rdx
 6b8:	31 31                	xor    %esi,(%rcx)
 6ba:	63 68 61             	movslq 0x61(%rax),%ebp
 6bd:	72 5f                	jb     71e <_init-0x8e2>
 6bf:	74 72                	je     733 <_init-0x8cd>
 6c1:	61                   	(bad)  
 6c2:	69 74 73 49 63 45 45 	imul   $0x52454563,0x49(%rbx,%rsi,2),%esi
 6c9:	52 
 6ca:	53                   	push   %rbx
 6cb:	74 31                	je     6fe <_init-0x902>
 6cd:	33 62 61             	xor    0x61(%rdx),%esp
 6d0:	73 69                	jae    73b <_init-0x8c5>
 6d2:	63 5f 6f             	movslq 0x6f(%rdi),%ebx
 6d5:	73 74                	jae    74b <_init-0x8b5>
 6d7:	72 65                	jb     73e <_init-0x8c2>
 6d9:	61                   	(bad)  
 6da:	6d                   	insl   (%dx),%es:(%rdi)
 6db:	49 54                	rex.WB push %r12
 6dd:	5f                   	pop    %rdi
 6de:	54                   	push   %rsp
 6df:	30 5f 45             	xor    %bl,0x45(%rdi)
 6e2:	53                   	push   %rbx
 6e3:	36 5f                	ss pop %rdi
 6e5:	00 5f 5a             	add    %bl,0x5a(%rdi)
 6e8:	4e 53                	rex.WRX push %rbx
 6ea:	74 38                	je     724 <_init-0x8dc>
 6ec:	69 6f 73 5f 62 61 73 	imul   $0x7361625f,0x73(%rdi),%ebp
 6f3:	65 34 49             	gs xor $0x49,%al
 6f6:	6e                   	outsb  %ds:(%rsi),(%dx)
 6f7:	69 74 44 31 45 76 00 	imul   $0x5f007645,0x31(%rsp,%rax,2),%esi
 6fe:	5f 
 6ff:	5a                   	pop    %rdx
 700:	4e 53                	rex.WRX push %rbx
 702:	6f                   	outsl  %ds:(%rsi),(%dx)
 703:	6c                   	insb   (%dx),%es:(%rdi)
 704:	73 45                	jae    74b <_init-0x8b5>
 706:	50                   	push   %rax
 707:	46 52                	rex.RX push %rdx
 709:	53                   	push   %rbx
 70a:	6f                   	outsl  %ds:(%rsi),(%dx)
 70b:	53                   	push   %rbx
 70c:	5f                   	pop    %rdi
 70d:	45 00 5f 5a          	add    %r11b,0x5a(%r15)
 711:	53                   	push   %rbx
 712:	74 6c                	je     780 <_init-0x880>
 714:	73 49                	jae    75f <_init-0x8a1>
 716:	53                   	push   %rbx
 717:	74 31                	je     74a <_init-0x8b6>
 719:	31 63 68             	xor    %esp,0x68(%rbx)
 71c:	61                   	(bad)  
 71d:	72 5f                	jb     77e <_init-0x882>
 71f:	74 72                	je     793 <_init-0x86d>
 721:	61                   	(bad)  
 722:	69 74 73 49 63 45 45 	imul   $0x52454563,0x49(%rbx,%rsi,2),%esi
 729:	52 
 72a:	53                   	push   %rbx
 72b:	74 31                	je     75e <_init-0x8a2>
 72d:	33 62 61             	xor    0x61(%rdx),%esp
 730:	73 69                	jae    79b <_init-0x865>
 732:	63 5f 6f             	movslq 0x6f(%rdi),%ebx
 735:	73 74                	jae    7ab <_init-0x855>
 737:	72 65                	jb     79e <_init-0x862>
 739:	61                   	(bad)  
 73a:	6d                   	insl   (%dx),%es:(%rdi)
 73b:	49 63 54 5f 45       	movslq 0x45(%r15,%rbx,2),%rdx
 740:	53                   	push   %rbx
 741:	35 5f 50 4b 63       	xor    $0x634b505f,%eax
 746:	00 5f 5a             	add    %bl,0x5a(%rdi)
 749:	4e 53                	rex.WRX push %rbx
 74b:	74 38                	je     785 <_init-0x87b>
 74d:	69 6f 73 5f 62 61 73 	imul   $0x7361625f,0x73(%rdi),%ebp
 754:	65 34 49             	gs xor $0x49,%al
 757:	6e                   	outsb  %ds:(%rsi),(%dx)
 758:	69 74 43 31 45 76 00 	imul   $0x5f007645,0x31(%rbx,%rax,2),%esi
 75f:	5f 
 760:	5a                   	pop    %rdx
 761:	53                   	push   %rbx
 762:	74 34                	je     798 <_init-0x868>
 764:	63 6f 75             	movslq 0x75(%rdi),%ebp
 767:	74 00                	je     769 <_init-0x897>
 769:	6c                   	insb   (%dx),%es:(%rdi)
 76a:	69 62 63 2e 73 6f 2e 	imul   $0x2e6f732e,0x63(%rdx),%esp
 771:	36 00 5f 5f          	add    %bl,%ss:0x5f(%rdi)
 775:	73 74                	jae    7eb <_init-0x815>
 777:	61                   	(bad)  
 778:	63 6b 5f             	movslq 0x5f(%rbx),%ebp
 77b:	63 68 6b             	movslq 0x6b(%rax),%ebp
 77e:	5f                   	pop    %rdi
 77f:	66 61                	data16 (bad) 
 781:	69 6c 00 5f 5f 63 78 	imul   $0x6178635f,0x5f(%rax,%rax,1),%ebp
 788:	61 
 789:	5f                   	pop    %rdi
 78a:	61                   	(bad)  
 78b:	74 65                	je     7f2 <_init-0x80e>
 78d:	78 69                	js     7f8 <_init-0x808>
 78f:	74 00                	je     791 <_init-0x86f>
 791:	73 6c                	jae    7ff <_init-0x801>
 793:	65 65 70 00          	gs gs jo 797 <_init-0x869>
 797:	5f                   	pop    %rdi
 798:	5f                   	pop    %rdi
 799:	63 78 61             	movslq 0x61(%rax),%edi
 79c:	5f                   	pop    %rdi
 79d:	66 69 6e 61 6c 69    	imul   $0x696c,0x61(%rsi),%bp
 7a3:	7a 65                	jp     80a <_init-0x7f6>
 7a5:	00 73 74             	add    %dh,0x74(%rbx)
 7a8:	72 65                	jb     80f <_init-0x7f1>
 7aa:	72 72                	jb     81e <_init-0x7e2>
 7ac:	6f                   	outsl  %ds:(%rsi),(%dx)
 7ad:	72 00                	jb     7af <_init-0x851>
 7af:	5f                   	pop    %rdi
 7b0:	5f                   	pop    %rdi
 7b1:	6c                   	insb   (%dx),%es:(%rdi)
 7b2:	69 62 63 5f 73 74 61 	imul   $0x6174735f,0x63(%rdx),%esp
 7b9:	72 74                	jb     82f <_init-0x7d1>
 7bb:	5f                   	pop    %rdi
 7bc:	6d                   	insl   (%dx),%es:(%rdi)
 7bd:	61                   	(bad)  
 7be:	69 6e 00 47 4c 49 42 	imul   $0x42494c47,0x0(%rsi),%ebp
 7c5:	43 58                	rex.XB pop %r8
 7c7:	58                   	pop    %rax
 7c8:	5f                   	pop    %rdi
 7c9:	33 2e                	xor    (%rsi),%ebp
 7cb:	34 00                	xor    $0x0,%al
 7cd:	47                   	rex.RXB
 7ce:	4c                   	rex.WR
 7cf:	49                   	rex.WB
 7d0:	42                   	rex.X
 7d1:	43 5f                	rex.XB pop %r15
 7d3:	32 2e                	xor    (%rsi),%ch
 7d5:	34 00                	xor    $0x0,%al
 7d7:	47                   	rex.RXB
 7d8:	4c                   	rex.WR
 7d9:	49                   	rex.WB
 7da:	42                   	rex.X
 7db:	43 5f                	rex.XB pop %r15
 7dd:	32 2e                	xor    (%rsi),%ch
 7df:	32 2e                	xor    (%rsi),%ch
 7e1:	35                   	.byte 0x35
	...

Disassembly of section .gnu.version:

00000000000007e4 <.gnu.version>:
 7e4:	00 00                	add    %al,(%rax)
 7e6:	02 00                	add    (%rax),%al
 7e8:	03 00                	add    (%rax),%eax
 7ea:	04 00                	add    $0x0,%al
 7ec:	02 00                	add    (%rax),%al
 7ee:	02 00                	add    (%rax),%al
 7f0:	02 00                	add    (%rax),%al
 7f2:	03 00                	add    (%rax),%eax
 7f4:	02 00                	add    (%rax),%al
 7f6:	03 00                	add    (%rax),%eax
 7f8:	04 00                	add    $0x0,%al
 7fa:	04 00                	add    $0x0,%al
 7fc:	05 00 02 00 04       	add    $0x4000200,%eax
 801:	00 00                	add    %al,(%rax)
 803:	00 03                	add    %al,(%rbx)
 805:	00 00                	add    %al,(%rax)
 807:	00 00                	add    %al,(%rax)
 809:	00 04 00             	add    %al,(%rax,%rax,1)
 80c:	03 00                	add    (%rax),%eax
 80e:	04 00                	add    $0x0,%al

Disassembly of section .gnu.version_r:

0000000000000810 <.gnu.version_r>:
 810:	01 00                	add    %eax,(%rax)
 812:	01 00                	add    %eax,(%rax)
 814:	b5 00                	mov    $0x0,%ch
 816:	00 00                	add    %al,(%rax)
 818:	10 00                	adc    %al,(%rax)
 81a:	00 00                	add    %al,(%rax)
 81c:	20 00                	and    %al,(%rax)
 81e:	00 00                	add    %al,(%rax)
 820:	74 29                	je     84b <_init-0x7b5>
 822:	92                   	xchg   %eax,%edx
 823:	08 00                	or     %al,(%rax)
 825:	00 04 00             	add    %al,(%rax,%rax,1)
 828:	e9 01 00 00 00       	jmpq   82e <_init-0x7d2>
 82d:	00 00                	add    %al,(%rax)
 82f:	00 01                	add    %al,(%rcx)
 831:	00 02                	add    %al,(%rdx)
 833:	00 91 01 00 00 10    	add    %dl,0x10000001(%rcx)
 839:	00 00                	add    %al,(%rax)
 83b:	00 30                	add    %dh,(%rax)
 83d:	00 00                	add    %al,(%rax)
 83f:	00 14 69             	add    %dl,(%rcx,%rbp,2)
 842:	69 0d 00 00 05 00 f5 	imul   $0x1f5,0x50000(%rip),%ecx        # 5084c <_end+0x4c684>
 849:	01 00 00 
 84c:	10 00                	adc    %al,(%rax)
 84e:	00 00                	add    %al,(%rax)
 850:	75 1a                	jne    86c <_init-0x794>
 852:	69 09 00 00 03 00    	imul   $0x30000,(%rcx),%ecx
 858:	ff 01                	incl   (%rcx)
 85a:	00 00                	add    %al,(%rax)
 85c:	00 00                	add    %al,(%rax)
 85e:	00 00                	add    %al,(%rax)
 860:	01 00                	add    %eax,(%rax)
 862:	01 00                	add    %eax,(%rax)
 864:	01 00                	add    %eax,(%rax)
 866:	00 00                	add    %al,(%rax)
 868:	10 00                	adc    %al,(%rax)
 86a:	00 00                	add    %al,(%rax)
 86c:	00 00                	add    %al,(%rax)
 86e:	00 00                	add    %al,(%rax)
 870:	75 1a                	jne    88c <_init-0x774>
 872:	69 09 00 00 02 00    	imul   $0x20000,(%rcx),%ecx
 878:	ff 01                	incl   (%rcx)
 87a:	00 00                	add    %al,(%rax)
 87c:	00 00                	add    %al,(%rax)
	...

Disassembly of section .rela.dyn:

0000000000000880 <.rela.dyn>:
 880:	20 3d 00 00 00 00    	and    %bh,0x0(%rip)        # 886 <_init-0x77a>
 886:	00 00                	add    %al,(%rax)
 888:	08 00                	or     %al,(%rax)
 88a:	00 00                	add    %al,(%rax)
 88c:	00 00                	add    %al,(%rax)
 88e:	00 00                	add    %al,(%rax)
 890:	c0 12 00             	rclb   $0x0,(%rdx)
 893:	00 00                	add    %al,(%rax)
 895:	00 00                	add    %al,(%rax)
 897:	00 28                	add    %ch,(%rax)
 899:	3d 00 00 00 00       	cmp    $0x0,%eax
 89e:	00 00                	add    %al,(%rax)
 8a0:	08 00                	or     %al,(%rax)
 8a2:	00 00                	add    %al,(%rax)
 8a4:	00 00                	add    %al,(%rax)
 8a6:	00 00                	add    %al,(%rax)
 8a8:	85 14 00             	test   %edx,(%rax,%rax,1)
 8ab:	00 00                	add    %al,(%rax)
 8ad:	00 00                	add    %al,(%rax)
 8af:	00 30                	add    %dh,(%rax)
 8b1:	3d 00 00 00 00       	cmp    $0x0,%eax
 8b6:	00 00                	add    %al,(%rax)
 8b8:	08 00                	or     %al,(%rax)
 8ba:	00 00                	add    %al,(%rax)
 8bc:	00 00                	add    %al,(%rax)
 8be:	00 00                	add    %al,(%rax)
 8c0:	80 12 00             	adcb   $0x0,(%rdx)
 8c3:	00 00                	add    %al,(%rax)
 8c5:	00 00                	add    %al,(%rax)
 8c7:	00 08                	add    %cl,(%rax)
 8c9:	40 00 00             	add    %al,(%rax)
 8cc:	00 00                	add    %al,(%rax)
 8ce:	00 00                	add    %al,(%rax)
 8d0:	08 00                	or     %al,(%rax)
 8d2:	00 00                	add    %al,(%rax)
 8d4:	00 00                	add    %al,(%rax)
 8d6:	00 00                	add    %al,(%rax)
 8d8:	08 40 00             	or     %al,0x0(%rax)
 8db:	00 00                	add    %al,(%rax)
 8dd:	00 00                	add    %al,(%rax)
 8df:	00 c8                	add    %cl,%al
 8e1:	3f                   	(bad)  
 8e2:	00 00                	add    %al,(%rax)
 8e4:	00 00                	add    %al,(%rax)
 8e6:	00 00                	add    %al,(%rax)
 8e8:	06                   	(bad)  
 8e9:	00 00                	add    %al,(%rax)
 8eb:	00 14 00             	add    %dl,(%rax,%rax,1)
	...
 8f6:	00 00                	add    %al,(%rax)
 8f8:	d0 3f                	sarb   (%rdi)
 8fa:	00 00                	add    %al,(%rax)
 8fc:	00 00                	add    %al,(%rax)
 8fe:	00 00                	add    %al,(%rax)
 900:	06                   	(bad)  
 901:	00 00                	add    %al,(%rax)
 903:	00 03                	add    %al,(%rbx)
	...
 90d:	00 00                	add    %al,(%rax)
 90f:	00 d8                	add    %bl,%al
 911:	3f                   	(bad)  
 912:	00 00                	add    %al,(%rax)
 914:	00 00                	add    %al,(%rax)
 916:	00 00                	add    %al,(%rax)
 918:	06                   	(bad)  
 919:	00 00                	add    %al,(%rax)
 91b:	00 0f                	add    %cl,(%rdi)
	...
 925:	00 00                	add    %al,(%rax)
 927:	00 e0                	add    %ah,%al
 929:	3f                   	(bad)  
 92a:	00 00                	add    %al,(%rax)
 92c:	00 00                	add    %al,(%rax)
 92e:	00 00                	add    %al,(%rax)
 930:	06                   	(bad)  
 931:	00 00                	add    %al,(%rax)
 933:	00 10                	add    %dl,(%rax)
	...
 93d:	00 00                	add    %al,(%rax)
 93f:	00 e8                	add    %ch,%al
 941:	3f                   	(bad)  
 942:	00 00                	add    %al,(%rax)
 944:	00 00                	add    %al,(%rax)
 946:	00 00                	add    %al,(%rax)
 948:	06                   	(bad)  
 949:	00 00                	add    %al,(%rax)
 94b:	00 11                	add    %dl,(%rcx)
	...
 955:	00 00                	add    %al,(%rax)
 957:	00 f0                	add    %dh,%al
 959:	3f                   	(bad)  
 95a:	00 00                	add    %al,(%rax)
 95c:	00 00                	add    %al,(%rax)
 95e:	00 00                	add    %al,(%rax)
 960:	06                   	(bad)  
 961:	00 00                	add    %al,(%rax)
 963:	00 12                	add    %dl,(%rdx)
	...
 96d:	00 00                	add    %al,(%rax)
 96f:	00 f8                	add    %bh,%al
 971:	3f                   	(bad)  
 972:	00 00                	add    %al,(%rax)
 974:	00 00                	add    %al,(%rax)
 976:	00 00                	add    %al,(%rax)
 978:	06                   	(bad)  
 979:	00 00                	add    %al,(%rax)
 97b:	00 13                	add    %dl,(%rbx)
	...
 985:	00 00                	add    %al,(%rax)
 987:	00 40 40             	add    %al,0x40(%rax)
 98a:	00 00                	add    %al,(%rax)
 98c:	00 00                	add    %al,(%rax)
 98e:	00 00                	add    %al,(%rax)
 990:	05 00 00 00 15       	add    $0x15000000,%eax
	...

Disassembly of section .rela.plt:

00000000000009a0 <.rela.plt>:
 9a0:	60                   	(bad)  
 9a1:	3f                   	(bad)  
 9a2:	00 00                	add    %al,(%rax)
 9a4:	00 00                	add    %al,(%rax)
 9a6:	00 00                	add    %al,(%rax)
 9a8:	07                   	(bad)  
 9a9:	00 00                	add    %al,(%rax)
 9ab:	00 01                	add    %al,(%rcx)
	...
 9b5:	00 00                	add    %al,(%rax)
 9b7:	00 68 3f             	add    %ch,0x3f(%rax)
 9ba:	00 00                	add    %al,(%rax)
 9bc:	00 00                	add    %al,(%rax)
 9be:	00 00                	add    %al,(%rax)
 9c0:	07                   	(bad)  
 9c1:	00 00                	add    %al,(%rax)
 9c3:	00 02                	add    %al,(%rdx)
	...
 9cd:	00 00                	add    %al,(%rax)
 9cf:	00 70 3f             	add    %dh,0x3f(%rax)
 9d2:	00 00                	add    %al,(%rax)
 9d4:	00 00                	add    %al,(%rax)
 9d6:	00 00                	add    %al,(%rax)
 9d8:	07                   	(bad)  
 9d9:	00 00                	add    %al,(%rax)
 9db:	00 04 00             	add    %al,(%rax,%rax,1)
	...
 9e6:	00 00                	add    %al,(%rax)
 9e8:	78 3f                	js     a29 <_init-0x5d7>
 9ea:	00 00                	add    %al,(%rax)
 9ec:	00 00                	add    %al,(%rax)
 9ee:	00 00                	add    %al,(%rax)
 9f0:	07                   	(bad)  
 9f1:	00 00                	add    %al,(%rax)
 9f3:	00 05 00 00 00 00    	add    %al,0x0(%rip)        # 9f9 <_init-0x607>
 9f9:	00 00                	add    %al,(%rax)
 9fb:	00 00                	add    %al,(%rax)
 9fd:	00 00                	add    %al,(%rax)
 9ff:	00 80 3f 00 00 00    	add    %al,0x3f(%rax)
 a05:	00 00                	add    %al,(%rax)
 a07:	00 07                	add    %al,(%rdi)
 a09:	00 00                	add    %al,(%rax)
 a0b:	00 06                	add    %al,(%rsi)
	...
 a15:	00 00                	add    %al,(%rax)
 a17:	00 88 3f 00 00 00    	add    %cl,0x3f(%rax)
 a1d:	00 00                	add    %al,(%rax)
 a1f:	00 07                	add    %al,(%rdi)
 a21:	00 00                	add    %al,(%rax)
 a23:	00 07                	add    %al,(%rdi)
	...
 a2d:	00 00                	add    %al,(%rax)
 a2f:	00 90 3f 00 00 00    	add    %dl,0x3f(%rax)
 a35:	00 00                	add    %al,(%rax)
 a37:	00 07                	add    %al,(%rdi)
 a39:	00 00                	add    %al,(%rax)
 a3b:	00 08                	add    %cl,(%rax)
	...
 a45:	00 00                	add    %al,(%rax)
 a47:	00 98 3f 00 00 00    	add    %bl,0x3f(%rax)
 a4d:	00 00                	add    %al,(%rax)
 a4f:	00 07                	add    %al,(%rdi)
 a51:	00 00                	add    %al,(%rax)
 a53:	00 09                	add    %cl,(%rcx)
	...
 a5d:	00 00                	add    %al,(%rax)
 a5f:	00 a0 3f 00 00 00    	add    %ah,0x3f(%rax)
 a65:	00 00                	add    %al,(%rax)
 a67:	00 07                	add    %al,(%rdi)
 a69:	00 00                	add    %al,(%rax)
 a6b:	00 0a                	add    %cl,(%rdx)
	...
 a75:	00 00                	add    %al,(%rax)
 a77:	00 a8 3f 00 00 00    	add    %ch,0x3f(%rax)
 a7d:	00 00                	add    %al,(%rax)
 a7f:	00 07                	add    %al,(%rdi)
 a81:	00 00                	add    %al,(%rax)
 a83:	00 0b                	add    %cl,(%rbx)
	...
 a8d:	00 00                	add    %al,(%rax)
 a8f:	00 b0 3f 00 00 00    	add    %dh,0x3f(%rax)
 a95:	00 00                	add    %al,(%rax)
 a97:	00 07                	add    %al,(%rdi)
 a99:	00 00                	add    %al,(%rax)
 a9b:	00 0c 00             	add    %cl,(%rax,%rax,1)
	...
 aa6:	00 00                	add    %al,(%rax)
 aa8:	b8 3f 00 00 00       	mov    $0x3f,%eax
 aad:	00 00                	add    %al,(%rax)
 aaf:	00 07                	add    %al,(%rdi)
 ab1:	00 00                	add    %al,(%rax)
 ab3:	00 0d 00 00 00 00    	add    %cl,0x0(%rip)        # ab9 <_init-0x547>
 ab9:	00 00                	add    %al,(%rax)
 abb:	00 00                	add    %al,(%rax)
 abd:	00 00                	add    %al,(%rax)
 abf:	00 c0                	add    %al,%al
 ac1:	3f                   	(bad)  
 ac2:	00 00                	add    %al,(%rax)
 ac4:	00 00                	add    %al,(%rax)
 ac6:	00 00                	add    %al,(%rax)
 ac8:	07                   	(bad)  
 ac9:	00 00                	add    %al,(%rax)
 acb:	00 0e                	add    %cl,(%rsi)
	...

Disassembly of section .init:

0000000000001000 <_init>:
    1000:	f3 0f 1e fa          	endbr64 
    1004:	48 83 ec 08          	sub    $0x8,%rsp
    1008:	48 8b 05 d9 2f 00 00 	mov    0x2fd9(%rip),%rax        # 3fe8 <__gmon_start__>
    100f:	48 85 c0             	test   %rax,%rax
    1012:	74 02                	je     1016 <_init+0x16>
    1014:	ff d0                	callq  *%rax
    1016:	48 83 c4 08          	add    $0x8,%rsp
    101a:	c3                   	retq   

Disassembly of section .plt:

0000000000001020 <.plt>:
    1020:	ff 35 2a 2f 00 00    	pushq  0x2f2a(%rip)        # 3f50 <_GLOBAL_OFFSET_TABLE_+0x8>
    1026:	f2 ff 25 2b 2f 00 00 	bnd jmpq *0x2f2b(%rip)        # 3f58 <_GLOBAL_OFFSET_TABLE_+0x10>
    102d:	0f 1f 00             	nopl   (%rax)
    1030:	f3 0f 1e fa          	endbr64 
    1034:	68 00 00 00 00       	pushq  $0x0
    1039:	f2 e9 e1 ff ff ff    	bnd jmpq 1020 <.plt>
    103f:	90                   	nop
    1040:	f3 0f 1e fa          	endbr64 
    1044:	68 01 00 00 00       	pushq  $0x1
    1049:	f2 e9 d1 ff ff ff    	bnd jmpq 1020 <.plt>
    104f:	90                   	nop
    1050:	f3 0f 1e fa          	endbr64 
    1054:	68 02 00 00 00       	pushq  $0x2
    1059:	f2 e9 c1 ff ff ff    	bnd jmpq 1020 <.plt>
    105f:	90                   	nop
    1060:	f3 0f 1e fa          	endbr64 
    1064:	68 03 00 00 00       	pushq  $0x3
    1069:	f2 e9 b1 ff ff ff    	bnd jmpq 1020 <.plt>
    106f:	90                   	nop
    1070:	f3 0f 1e fa          	endbr64 
    1074:	68 04 00 00 00       	pushq  $0x4
    1079:	f2 e9 a1 ff ff ff    	bnd jmpq 1020 <.plt>
    107f:	90                   	nop
    1080:	f3 0f 1e fa          	endbr64 
    1084:	68 05 00 00 00       	pushq  $0x5
    1089:	f2 e9 91 ff ff ff    	bnd jmpq 1020 <.plt>
    108f:	90                   	nop
    1090:	f3 0f 1e fa          	endbr64 
    1094:	68 06 00 00 00       	pushq  $0x6
    1099:	f2 e9 81 ff ff ff    	bnd jmpq 1020 <.plt>
    109f:	90                   	nop
    10a0:	f3 0f 1e fa          	endbr64 
    10a4:	68 07 00 00 00       	pushq  $0x7
    10a9:	f2 e9 71 ff ff ff    	bnd jmpq 1020 <.plt>
    10af:	90                   	nop
    10b0:	f3 0f 1e fa          	endbr64 
    10b4:	68 08 00 00 00       	pushq  $0x8
    10b9:	f2 e9 61 ff ff ff    	bnd jmpq 1020 <.plt>
    10bf:	90                   	nop
    10c0:	f3 0f 1e fa          	endbr64 
    10c4:	68 09 00 00 00       	pushq  $0x9
    10c9:	f2 e9 51 ff ff ff    	bnd jmpq 1020 <.plt>
    10cf:	90                   	nop
    10d0:	f3 0f 1e fa          	endbr64 
    10d4:	68 0a 00 00 00       	pushq  $0xa
    10d9:	f2 e9 41 ff ff ff    	bnd jmpq 1020 <.plt>
    10df:	90                   	nop
    10e0:	f3 0f 1e fa          	endbr64 
    10e4:	68 0b 00 00 00       	pushq  $0xb
    10e9:	f2 e9 31 ff ff ff    	bnd jmpq 1020 <.plt>
    10ef:	90                   	nop
    10f0:	f3 0f 1e fa          	endbr64 
    10f4:	68 0c 00 00 00       	pushq  $0xc
    10f9:	f2 e9 21 ff ff ff    	bnd jmpq 1020 <.plt>
    10ff:	90                   	nop

Disassembly of section .plt.got:

0000000000001100 <__cxa_finalize@plt>:
    1100:	f3 0f 1e fa          	endbr64 
    1104:	f2 ff 25 bd 2e 00 00 	bnd jmpq *0x2ebd(%rip)        # 3fc8 <__cxa_finalize@GLIBC_2.2.5>
    110b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

Disassembly of section .plt.sec:

0000000000001110 <pthread_barrier_init@plt>:
    1110:	f3 0f 1e fa          	endbr64 
    1114:	f2 ff 25 45 2e 00 00 	bnd jmpq *0x2e45(%rip)        # 3f60 <pthread_barrier_init@GLIBC_2.2.5>
    111b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001120 <strerror@plt>:
    1120:	f3 0f 1e fa          	endbr64 
    1124:	f2 ff 25 3d 2e 00 00 	bnd jmpq *0x2e3d(%rip)        # 3f68 <strerror@GLIBC_2.2.5>
    112b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001130 <pthread_join@plt>:
    1130:	f3 0f 1e fa          	endbr64 
    1134:	f2 ff 25 35 2e 00 00 	bnd jmpq *0x2e35(%rip)        # 3f70 <pthread_join@GLIBC_2.2.5>
    113b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001140 <pthread_create@plt>:
    1140:	f3 0f 1e fa          	endbr64 
    1144:	f2 ff 25 2d 2e 00 00 	bnd jmpq *0x2e2d(%rip)        # 3f78 <pthread_create@GLIBC_2.2.5>
    114b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001150 <pthread_barrier_wait@plt>:
    1150:	f3 0f 1e fa          	endbr64 
    1154:	f2 ff 25 25 2e 00 00 	bnd jmpq *0x2e25(%rip)        # 3f80 <pthread_barrier_wait@GLIBC_2.2.5>
    115b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001160 <sleep@plt>:
    1160:	f3 0f 1e fa          	endbr64 
    1164:	f2 ff 25 1d 2e 00 00 	bnd jmpq *0x2e1d(%rip)        # 3f88 <sleep@GLIBC_2.2.5>
    116b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001170 <pthread_mutex_unlock@plt>:
    1170:	f3 0f 1e fa          	endbr64 
    1174:	f2 ff 25 15 2e 00 00 	bnd jmpq *0x2e15(%rip)        # 3f90 <pthread_mutex_unlock@GLIBC_2.2.5>
    117b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001180 <__cxa_atexit@plt>:
    1180:	f3 0f 1e fa          	endbr64 
    1184:	f2 ff 25 0d 2e 00 00 	bnd jmpq *0x2e0d(%rip)        # 3f98 <__cxa_atexit@GLIBC_2.2.5>
    118b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001190 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>:
    1190:	f3 0f 1e fa          	endbr64 
    1194:	f2 ff 25 05 2e 00 00 	bnd jmpq *0x2e05(%rip)        # 3fa0 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@GLIBCXX_3.4>
    119b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000011a0 <_ZNSolsEPFRSoS_E@plt>:
    11a0:	f3 0f 1e fa          	endbr64 
    11a4:	f2 ff 25 fd 2d 00 00 	bnd jmpq *0x2dfd(%rip)        # 3fa8 <_ZNSolsEPFRSoS_E@GLIBCXX_3.4>
    11ab:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000011b0 <__stack_chk_fail@plt>:
    11b0:	f3 0f 1e fa          	endbr64 
    11b4:	f2 ff 25 f5 2d 00 00 	bnd jmpq *0x2df5(%rip)        # 3fb0 <__stack_chk_fail@GLIBC_2.4>
    11bb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000011c0 <pthread_mutex_lock@plt>:
    11c0:	f3 0f 1e fa          	endbr64 
    11c4:	f2 ff 25 ed 2d 00 00 	bnd jmpq *0x2ded(%rip)        # 3fb8 <pthread_mutex_lock@GLIBC_2.2.5>
    11cb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000011d0 <_ZNSt8ios_base4InitC1Ev@plt>:
    11d0:	f3 0f 1e fa          	endbr64 
    11d4:	f2 ff 25 e5 2d 00 00 	bnd jmpq *0x2de5(%rip)        # 3fc0 <_ZNSt8ios_base4InitC1Ev@GLIBCXX_3.4>
    11db:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

Disassembly of section .text:

00000000000011e0 <_start>:
    11e0:	f3 0f 1e fa          	endbr64 
    11e4:	31 ed                	xor    %ebp,%ebp
    11e6:	49 89 d1             	mov    %rdx,%r9
    11e9:	5e                   	pop    %rsi
    11ea:	48 89 e2             	mov    %rsp,%rdx
    11ed:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
    11f1:	50                   	push   %rax
    11f2:	54                   	push   %rsp
    11f3:	4c 8d 05 16 03 00 00 	lea    0x316(%rip),%r8        # 1510 <__libc_csu_fini>
    11fa:	48 8d 0d 9f 02 00 00 	lea    0x29f(%rip),%rcx        # 14a0 <__libc_csu_init>
    1201:	48 8d 3d 3e 01 00 00 	lea    0x13e(%rip),%rdi        # 1346 <main>
    1208:	ff 15 d2 2d 00 00    	callq  *0x2dd2(%rip)        # 3fe0 <__libc_start_main@GLIBC_2.2.5>
    120e:	f4                   	hlt    
    120f:	90                   	nop

0000000000001210 <deregister_tm_clones>:
    1210:	48 8d 3d f9 2d 00 00 	lea    0x2df9(%rip),%rdi        # 4010 <__TMC_END__>
    1217:	48 8d 05 f2 2d 00 00 	lea    0x2df2(%rip),%rax        # 4010 <__TMC_END__>
    121e:	48 39 f8             	cmp    %rdi,%rax
    1221:	74 15                	je     1238 <deregister_tm_clones+0x28>
    1223:	48 8b 05 ae 2d 00 00 	mov    0x2dae(%rip),%rax        # 3fd8 <_ITM_deregisterTMCloneTable>
    122a:	48 85 c0             	test   %rax,%rax
    122d:	74 09                	je     1238 <deregister_tm_clones+0x28>
    122f:	ff e0                	jmpq   *%rax
    1231:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    1238:	c3                   	retq   
    1239:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001240 <register_tm_clones>:
    1240:	48 8d 3d c9 2d 00 00 	lea    0x2dc9(%rip),%rdi        # 4010 <__TMC_END__>
    1247:	48 8d 35 c2 2d 00 00 	lea    0x2dc2(%rip),%rsi        # 4010 <__TMC_END__>
    124e:	48 29 fe             	sub    %rdi,%rsi
    1251:	48 89 f0             	mov    %rsi,%rax
    1254:	48 c1 ee 3f          	shr    $0x3f,%rsi
    1258:	48 c1 f8 03          	sar    $0x3,%rax
    125c:	48 01 c6             	add    %rax,%rsi
    125f:	48 d1 fe             	sar    %rsi
    1262:	74 14                	je     1278 <register_tm_clones+0x38>
    1264:	48 8b 05 85 2d 00 00 	mov    0x2d85(%rip),%rax        # 3ff0 <_ITM_registerTMCloneTable>
    126b:	48 85 c0             	test   %rax,%rax
    126e:	74 08                	je     1278 <register_tm_clones+0x38>
    1270:	ff e0                	jmpq   *%rax
    1272:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    1278:	c3                   	retq   
    1279:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001280 <__do_global_dtors_aux>:
    1280:	f3 0f 1e fa          	endbr64 
    1284:	80 3d c5 2e 00 00 00 	cmpb   $0x0,0x2ec5(%rip)        # 4150 <completed.8061>
    128b:	75 2b                	jne    12b8 <__do_global_dtors_aux+0x38>
    128d:	55                   	push   %rbp
    128e:	48 83 3d 32 2d 00 00 	cmpq   $0x0,0x2d32(%rip)        # 3fc8 <__cxa_finalize@GLIBC_2.2.5>
    1295:	00 
    1296:	48 89 e5             	mov    %rsp,%rbp
    1299:	74 0c                	je     12a7 <__do_global_dtors_aux+0x27>
    129b:	48 8b 3d 66 2d 00 00 	mov    0x2d66(%rip),%rdi        # 4008 <__dso_handle>
    12a2:	e8 59 fe ff ff       	callq  1100 <__cxa_finalize@plt>
    12a7:	e8 64 ff ff ff       	callq  1210 <deregister_tm_clones>
    12ac:	c6 05 9d 2e 00 00 01 	movb   $0x1,0x2e9d(%rip)        # 4150 <completed.8061>
    12b3:	5d                   	pop    %rbp
    12b4:	c3                   	retq   
    12b5:	0f 1f 00             	nopl   (%rax)
    12b8:	c3                   	retq   
    12b9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000012c0 <frame_dummy>:
    12c0:	f3 0f 1e fa          	endbr64 
    12c4:	e9 77 ff ff ff       	jmpq   1240 <register_tm_clones>

00000000000012c9 <_Z3foov>:
pthread_mutex_t lock;
pthread_barrier_t barrier;

#define NUM_THREAD 2
void foo()
{
    12c9:	f3 0f 1e fa          	endbr64 
    12cd:	55                   	push   %rbp
    12ce:	48 89 e5             	mov    %rsp,%rbp
  std::cout << "calling foo" << std::endl;
    12d1:	48 8d 35 2d 0d 00 00 	lea    0xd2d(%rip),%rsi        # 2005 <_ZStL19piecewise_construct+0x1>
    12d8:	48 8d 3d 61 2d 00 00 	lea    0x2d61(%rip),%rdi        # 4040 <_ZSt4cout@@GLIBCXX_3.4>
    12df:	e8 ac fe ff ff       	callq  1190 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
    12e4:	48 89 c2             	mov    %rax,%rdx
    12e7:	48 8b 05 e2 2c 00 00 	mov    0x2ce2(%rip),%rax        # 3fd0 <_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@GLIBCXX_3.4>
    12ee:	48 89 c6             	mov    %rax,%rsi
    12f1:	48 89 d7             	mov    %rdx,%rdi
    12f4:	e8 a7 fe ff ff       	callq  11a0 <_ZNSolsEPFRSoS_E@plt>
}
    12f9:	90                   	nop
    12fa:	5d                   	pop    %rbp
    12fb:	c3                   	retq   

00000000000012fc <_Z10threadFuncPv>:

void * threadFunc(void * arg)
{
    12fc:	f3 0f 1e fa          	endbr64 
    1300:	55                   	push   %rbp
    1301:	48 89 e5             	mov    %rsp,%rbp
    1304:	48 83 ec 10          	sub    $0x10,%rsp
    1308:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
  pthread_mutex_lock(&lock);
    130c:	48 8d 3d 4d 2e 00 00 	lea    0x2e4d(%rip),%rdi        # 4160 <lock>
    1313:	e8 a8 fe ff ff       	callq  11c0 <pthread_mutex_lock@plt>
  foo();
    1318:	e8 ac ff ff ff       	callq  12c9 <_Z3foov>
  pthread_mutex_unlock(&lock);
    131d:	48 8d 3d 3c 2e 00 00 	lea    0x2e3c(%rip),%rdi        # 4160 <lock>
    1324:	e8 47 fe ff ff       	callq  1170 <pthread_mutex_unlock@plt>
  sleep(2);
    1329:	bf 02 00 00 00       	mov    $0x2,%edi
    132e:	e8 2d fe ff ff       	callq  1160 <sleep@plt>
  pthread_barrier_wait(&barrier);
    1333:	48 8d 3d 66 2e 00 00 	lea    0x2e66(%rip),%rdi        # 41a0 <barrier>
    133a:	e8 11 fe ff ff       	callq  1150 <pthread_barrier_wait@plt>
  return NULL;
    133f:	b8 00 00 00 00       	mov    $0x0,%eax
}
    1344:	c9                   	leaveq 
    1345:	c3                   	retq   

0000000000001346 <main>:

int main()
{
    1346:	f3 0f 1e fa          	endbr64 
    134a:	55                   	push   %rbp
    134b:	48 89 e5             	mov    %rsp,%rbp
    134e:	53                   	push   %rbx
    134f:	48 83 ec 38          	sub    $0x38,%rsp
    1353:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    135a:	00 00 
    135c:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    1360:	31 c0                	xor    %eax,%eax
  pthread_barrier_init(&barrier, NULL, NUM_THREAD);
    1362:	ba 02 00 00 00       	mov    $0x2,%edx
    1367:	be 00 00 00 00       	mov    $0x0,%esi
    136c:	48 8d 3d 2d 2e 00 00 	lea    0x2e2d(%rip),%rdi        # 41a0 <barrier>
    1373:	e8 98 fd ff ff       	callq  1110 <pthread_barrier_init@plt>
  pthread_t threadId[NUM_THREAD];
  for (int i = 0; i < NUM_THREAD; i++) {
    1378:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%rbp)
    137f:	83 7d c4 01          	cmpl   $0x1,-0x3c(%rbp)
    1383:	7f 69                	jg     13ee <main+0xa8>
    int err = pthread_create(&threadId[i], NULL, &threadFunc, NULL);
    1385:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
    1389:	8b 55 c4             	mov    -0x3c(%rbp),%edx
    138c:	48 63 d2             	movslq %edx,%rdx
    138f:	48 c1 e2 03          	shl    $0x3,%rdx
    1393:	48 01 d0             	add    %rdx,%rax
    1396:	b9 00 00 00 00       	mov    $0x0,%ecx
    139b:	48 8d 15 5a ff ff ff 	lea    -0xa6(%rip),%rdx        # 12fc <_Z10threadFuncPv>
    13a2:	be 00 00 00 00       	mov    $0x0,%esi
    13a7:	48 89 c7             	mov    %rax,%rdi
    13aa:	e8 91 fd ff ff       	callq  1140 <pthread_create@plt>
    13af:	89 45 cc             	mov    %eax,-0x34(%rbp)
    if (err)
    13b2:	83 7d cc 00          	cmpl   $0x0,-0x34(%rbp)
    13b6:	74 30                	je     13e8 <main+0xa2>
    {
      std::cout << "Thread creation failed : " << strerror(err);
    13b8:	48 8d 35 52 0c 00 00 	lea    0xc52(%rip),%rsi        # 2011 <_ZStL19piecewise_construct+0xd>
    13bf:	48 8d 3d 7a 2c 00 00 	lea    0x2c7a(%rip),%rdi        # 4040 <_ZSt4cout@@GLIBCXX_3.4>
    13c6:	e8 c5 fd ff ff       	callq  1190 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
    13cb:	48 89 c3             	mov    %rax,%rbx
    13ce:	8b 45 cc             	mov    -0x34(%rbp),%eax
    13d1:	89 c7                	mov    %eax,%edi
    13d3:	e8 48 fd ff ff       	callq  1120 <strerror@plt>
    13d8:	48 89 c6             	mov    %rax,%rsi
    13db:	48 89 df             	mov    %rbx,%rdi
    13de:	e8 ad fd ff ff       	callq  1190 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt>
      return err;
    13e3:	8b 45 cc             	mov    -0x34(%rbp),%eax
    13e6:	eb 35                	jmp    141d <main+0xd7>
  for (int i = 0; i < NUM_THREAD; i++) {
    13e8:	83 45 c4 01          	addl   $0x1,-0x3c(%rbp)
    13ec:	eb 91                	jmp    137f <main+0x39>
    }
  }

  for (int i = 0; i < NUM_THREAD; i++) {
    13ee:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%rbp)
    13f5:	83 7d c8 01          	cmpl   $0x1,-0x38(%rbp)
    13f9:	7f 1d                	jg     1418 <main+0xd2>
    pthread_join(threadId[i], NULL);
    13fb:	8b 45 c8             	mov    -0x38(%rbp),%eax
    13fe:	48 98                	cltq   
    1400:	48 8b 44 c5 d0       	mov    -0x30(%rbp,%rax,8),%rax
    1405:	be 00 00 00 00       	mov    $0x0,%esi
    140a:	48 89 c7             	mov    %rax,%rdi
    140d:	e8 1e fd ff ff       	callq  1130 <pthread_join@plt>
  for (int i = 0; i < NUM_THREAD; i++) {
    1412:	83 45 c8 01          	addl   $0x1,-0x38(%rbp)
    1416:	eb dd                	jmp    13f5 <main+0xaf>
  }

  return 0;
    1418:	b8 00 00 00 00       	mov    $0x0,%eax
}
    141d:	48 8b 4d e8          	mov    -0x18(%rbp),%rcx
    1421:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
    1428:	00 00 
    142a:	74 05                	je     1431 <main+0xeb>
    142c:	e8 7f fd ff ff       	callq  11b0 <__stack_chk_fail@plt>
    1431:	48 83 c4 38          	add    $0x38,%rsp
    1435:	5b                   	pop    %rbx
    1436:	5d                   	pop    %rbp
    1437:	c3                   	retq   

0000000000001438 <_Z41__static_initialization_and_destruction_0ii>:
    1438:	f3 0f 1e fa          	endbr64 
    143c:	55                   	push   %rbp
    143d:	48 89 e5             	mov    %rsp,%rbp
    1440:	48 83 ec 10          	sub    $0x10,%rsp
    1444:	89 7d fc             	mov    %edi,-0x4(%rbp)
    1447:	89 75 f8             	mov    %esi,-0x8(%rbp)
    144a:	83 7d fc 01          	cmpl   $0x1,-0x4(%rbp)
    144e:	75 32                	jne    1482 <_Z41__static_initialization_and_destruction_0ii+0x4a>
    1450:	81 7d f8 ff ff 00 00 	cmpl   $0xffff,-0x8(%rbp)
    1457:	75 29                	jne    1482 <_Z41__static_initialization_and_destruction_0ii+0x4a>
  extern wostream wclog;	/// Linked to standard error (buffered)
#endif
  ///@}

  // For construction of filebuffers for cout, cin, cerr, clog et. al.
  static ios_base::Init __ioinit;
    1459:	48 8d 3d 60 2d 00 00 	lea    0x2d60(%rip),%rdi        # 41c0 <_ZStL8__ioinit>
    1460:	e8 6b fd ff ff       	callq  11d0 <_ZNSt8ios_base4InitC1Ev@plt>
    1465:	48 8d 15 9c 2b 00 00 	lea    0x2b9c(%rip),%rdx        # 4008 <__dso_handle>
    146c:	48 8d 35 4d 2d 00 00 	lea    0x2d4d(%rip),%rsi        # 41c0 <_ZStL8__ioinit>
    1473:	48 8b 05 7e 2b 00 00 	mov    0x2b7e(%rip),%rax        # 3ff8 <_ZNSt8ios_base4InitD1Ev@GLIBCXX_3.4>
    147a:	48 89 c7             	mov    %rax,%rdi
    147d:	e8 fe fc ff ff       	callq  1180 <__cxa_atexit@plt>
    1482:	90                   	nop
    1483:	c9                   	leaveq 
    1484:	c3                   	retq   

0000000000001485 <_GLOBAL__sub_I_lock>:
    1485:	f3 0f 1e fa          	endbr64 
    1489:	55                   	push   %rbp
    148a:	48 89 e5             	mov    %rsp,%rbp
    148d:	be ff ff 00 00       	mov    $0xffff,%esi
    1492:	bf 01 00 00 00       	mov    $0x1,%edi
    1497:	e8 9c ff ff ff       	callq  1438 <_Z41__static_initialization_and_destruction_0ii>
    149c:	5d                   	pop    %rbp
    149d:	c3                   	retq   
    149e:	66 90                	xchg   %ax,%ax

00000000000014a0 <__libc_csu_init>:
    14a0:	f3 0f 1e fa          	endbr64 
    14a4:	41 57                	push   %r15
    14a6:	4c 8d 3d 73 28 00 00 	lea    0x2873(%rip),%r15        # 3d20 <__frame_dummy_init_array_entry>
    14ad:	41 56                	push   %r14
    14af:	49 89 d6             	mov    %rdx,%r14
    14b2:	41 55                	push   %r13
    14b4:	49 89 f5             	mov    %rsi,%r13
    14b7:	41 54                	push   %r12
    14b9:	41 89 fc             	mov    %edi,%r12d
    14bc:	55                   	push   %rbp
    14bd:	48 8d 2d 6c 28 00 00 	lea    0x286c(%rip),%rbp        # 3d30 <__do_global_dtors_aux_fini_array_entry>
    14c4:	53                   	push   %rbx
    14c5:	4c 29 fd             	sub    %r15,%rbp
    14c8:	48 83 ec 08          	sub    $0x8,%rsp
    14cc:	e8 2f fb ff ff       	callq  1000 <_init>
    14d1:	48 c1 fd 03          	sar    $0x3,%rbp
    14d5:	74 1f                	je     14f6 <__libc_csu_init+0x56>
    14d7:	31 db                	xor    %ebx,%ebx
    14d9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    14e0:	4c 89 f2             	mov    %r14,%rdx
    14e3:	4c 89 ee             	mov    %r13,%rsi
    14e6:	44 89 e7             	mov    %r12d,%edi
    14e9:	41 ff 14 df          	callq  *(%r15,%rbx,8)
    14ed:	48 83 c3 01          	add    $0x1,%rbx
    14f1:	48 39 dd             	cmp    %rbx,%rbp
    14f4:	75 ea                	jne    14e0 <__libc_csu_init+0x40>
    14f6:	48 83 c4 08          	add    $0x8,%rsp
    14fa:	5b                   	pop    %rbx
    14fb:	5d                   	pop    %rbp
    14fc:	41 5c                	pop    %r12
    14fe:	41 5d                	pop    %r13
    1500:	41 5e                	pop    %r14
    1502:	41 5f                	pop    %r15
    1504:	c3                   	retq   
    1505:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
    150c:	00 00 00 00 

0000000000001510 <__libc_csu_fini>:
    1510:	f3 0f 1e fa          	endbr64 
    1514:	c3                   	retq   

Disassembly of section .fini:

0000000000001518 <_fini>:
    1518:	f3 0f 1e fa          	endbr64 
    151c:	48 83 ec 08          	sub    $0x8,%rsp
    1520:	48 83 c4 08          	add    $0x8,%rsp
    1524:	c3                   	retq   

Disassembly of section .rodata:

0000000000002000 <_IO_stdin_used>:
    2000:	01 00                	add    %eax,(%rax)
    2002:	02 00                	add    (%rax),%al

0000000000002004 <_ZStL19piecewise_construct>:
    2004:	00 63 61             	add    %ah,0x61(%rbx)
    2007:	6c                   	insb   (%dx),%es:(%rdi)
    2008:	6c                   	insb   (%dx),%es:(%rdi)
    2009:	69 6e 67 20 66 6f 6f 	imul   $0x6f6f6620,0x67(%rsi),%ebp
    2010:	00 54 68 72          	add    %dl,0x72(%rax,%rbp,2)
    2014:	65 61                	gs (bad) 
    2016:	64 20 63 72          	and    %ah,%fs:0x72(%rbx)
    201a:	65 61                	gs (bad) 
    201c:	74 69                	je     2087 <__GNU_EH_FRAME_HDR+0x5b>
    201e:	6f                   	outsl  %ds:(%rsi),(%dx)
    201f:	6e                   	outsb  %ds:(%rsi),(%dx)
    2020:	20 66 61             	and    %ah,0x61(%rsi)
    2023:	69 6c 65 64 20 3a 20 	imul   $0x203a20,0x64(%rbp,%riz,2),%ebp
    202a:	00 

Disassembly of section .eh_frame_hdr:

000000000000202c <__GNU_EH_FRAME_HDR>:
    202c:	01 1b                	add    %ebx,(%rbx)
    202e:	03 3b                	add    (%rbx),%edi
    2030:	60                   	(bad)  
    2031:	00 00                	add    %al,(%rax)
    2033:	00 0b                	add    %cl,(%rbx)
    2035:	00 00                	add    %al,(%rax)
    2037:	00 f4                	add    %dh,%ah
    2039:	ef                   	out    %eax,(%dx)
    203a:	ff                   	(bad)  
    203b:	ff 94 00 00 00 d4 f0 	callq  *-0xf2c0000(%rax,%rax,1)
    2042:	ff                   	(bad)  
    2043:	ff                   	(bad)  
    2044:	bc 00 00 00 e4       	mov    $0xe4000000,%esp
    2049:	f0 ff                	lock (bad) 
    204b:	ff d4                	callq  *%rsp
    204d:	00 00                	add    %al,(%rax)
    204f:	00 b4 f1 ff ff 7c 00 	add    %dh,0x7cffff(%rcx,%rsi,8)
    2056:	00 00                	add    %al,(%rax)
    2058:	9d                   	popfq  
    2059:	f2 ff                	repnz (bad) 
    205b:	ff                   	(bad)  
    205c:	ec                   	in     (%dx),%al
    205d:	00 00                	add    %al,(%rax)
    205f:	00 d0                	add    %dl,%al
    2061:	f2 ff                	repnz (bad) 
    2063:	ff 0c 01             	decl   (%rcx,%rax,1)
    2066:	00 00                	add    %al,(%rax)
    2068:	1a f3                	sbb    %bl,%dh
    206a:	ff                   	(bad)  
    206b:	ff 2c 01             	ljmp   *(%rcx,%rax,1)
    206e:	00 00                	add    %al,(%rax)
    2070:	0c f4                	or     $0xf4,%al
    2072:	ff                   	(bad)  
    2073:	ff 50 01             	callq  *0x1(%rax)
    2076:	00 00                	add    %al,(%rax)
    2078:	59                   	pop    %rcx
    2079:	f4                   	hlt    
    207a:	ff                   	(bad)  
    207b:	ff 70 01             	pushq  0x1(%rax)
    207e:	00 00                	add    %al,(%rax)
    2080:	74 f4                	je     2076 <__GNU_EH_FRAME_HDR+0x4a>
    2082:	ff                   	(bad)  
    2083:	ff 94 01 00 00 e4 f4 	callq  *-0xb1c0000(%rcx,%rax,1)
    208a:	ff                   	(bad)  
    208b:	ff                   	(bad)  
    208c:	dc 01                	faddl  (%rcx)
	...

Disassembly of section .eh_frame:

0000000000002090 <__FRAME_END__-0x18c>:
    2090:	14 00                	adc    $0x0,%al
    2092:	00 00                	add    %al,(%rax)
    2094:	00 00                	add    %al,(%rax)
    2096:	00 00                	add    %al,(%rax)
    2098:	01 7a 52             	add    %edi,0x52(%rdx)
    209b:	00 01                	add    %al,(%rcx)
    209d:	78 10                	js     20af <__GNU_EH_FRAME_HDR+0x83>
    209f:	01 1b                	add    %ebx,(%rbx)
    20a1:	0c 07                	or     $0x7,%al
    20a3:	08 90 01 00 00 14    	or     %dl,0x14000001(%rax)
    20a9:	00 00                	add    %al,(%rax)
    20ab:	00 1c 00             	add    %bl,(%rax,%rax,1)
    20ae:	00 00                	add    %al,(%rax)
    20b0:	30 f1                	xor    %dh,%cl
    20b2:	ff                   	(bad)  
    20b3:	ff 2f                	ljmp   *(%rdi)
    20b5:	00 00                	add    %al,(%rax)
    20b7:	00 00                	add    %al,(%rax)
    20b9:	44 07                	rex.R (bad) 
    20bb:	10 00                	adc    %al,(%rax)
    20bd:	00 00                	add    %al,(%rax)
    20bf:	00 24 00             	add    %ah,(%rax,%rax,1)
    20c2:	00 00                	add    %al,(%rax)
    20c4:	34 00                	xor    $0x0,%al
    20c6:	00 00                	add    %al,(%rax)
    20c8:	58                   	pop    %rax
    20c9:	ef                   	out    %eax,(%dx)
    20ca:	ff                   	(bad)  
    20cb:	ff e0                	jmpq   *%rax
    20cd:	00 00                	add    %al,(%rax)
    20cf:	00 00                	add    %al,(%rax)
    20d1:	0e                   	(bad)  
    20d2:	10 46 0e             	adc    %al,0xe(%rsi)
    20d5:	18 4a 0f             	sbb    %cl,0xf(%rdx)
    20d8:	0b 77 08             	or     0x8(%rdi),%esi
    20db:	80 00 3f             	addb   $0x3f,(%rax)
    20de:	1a 3a                	sbb    (%rdx),%bh
    20e0:	2a 33                	sub    (%rbx),%dh
    20e2:	24 22                	and    $0x22,%al
    20e4:	00 00                	add    %al,(%rax)
    20e6:	00 00                	add    %al,(%rax)
    20e8:	14 00                	adc    $0x0,%al
    20ea:	00 00                	add    %al,(%rax)
    20ec:	5c                   	pop    %rsp
    20ed:	00 00                	add    %al,(%rax)
    20ef:	00 10                	add    %dl,(%rax)
    20f1:	f0 ff                	lock (bad) 
    20f3:	ff 10                	callq  *(%rax)
	...
    20fd:	00 00                	add    %al,(%rax)
    20ff:	00 14 00             	add    %dl,(%rax,%rax,1)
    2102:	00 00                	add    %al,(%rax)
    2104:	74 00                	je     2106 <__GNU_EH_FRAME_HDR+0xda>
    2106:	00 00                	add    %al,(%rax)
    2108:	08 f0                	or     %dh,%al
    210a:	ff                   	(bad)  
    210b:	ff d0                	callq  *%rax
	...
    2115:	00 00                	add    %al,(%rax)
    2117:	00 1c 00             	add    %bl,(%rax,%rax,1)
    211a:	00 00                	add    %al,(%rax)
    211c:	8c 00                	mov    %es,(%rax)
    211e:	00 00                	add    %al,(%rax)
    2120:	a9 f1 ff ff 33       	test   $0x33fffff1,%eax
    2125:	00 00                	add    %al,(%rax)
    2127:	00 00                	add    %al,(%rax)
    2129:	45 0e                	rex.RB (bad) 
    212b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
    2131:	6a 0c                	pushq  $0xc
    2133:	07                   	(bad)  
    2134:	08 00                	or     %al,(%rax)
    2136:	00 00                	add    %al,(%rax)
    2138:	1c 00                	sbb    $0x0,%al
    213a:	00 00                	add    %al,(%rax)
    213c:	ac                   	lods   %ds:(%rsi),%al
    213d:	00 00                	add    %al,(%rax)
    213f:	00 bc f1 ff ff 4a 00 	add    %bh,0x4affff(%rcx,%rsi,8)
    2146:	00 00                	add    %al,(%rax)
    2148:	00 45 0e             	add    %al,0xe(%rbp)
    214b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
    2151:	02 41 0c             	add    0xc(%rcx),%al
    2154:	07                   	(bad)  
    2155:	08 00                	or     %al,(%rax)
    2157:	00 20                	add    %ah,(%rax)
    2159:	00 00                	add    %al,(%rax)
    215b:	00 cc                	add    %cl,%ah
    215d:	00 00                	add    %al,(%rax)
    215f:	00 e6                	add    %ah,%dh
    2161:	f1                   	icebp  
    2162:	ff                   	(bad)  
    2163:	ff f2                	push   %rdx
    2165:	00 00                	add    %al,(%rax)
    2167:	00 00                	add    %al,(%rax)
    2169:	45 0e                	rex.RB (bad) 
    216b:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
    2171:	45 83 03 02          	rex.RB addl $0x2,(%r11)
    2175:	e4 0c                	in     $0xc,%al
    2177:	07                   	(bad)  
    2178:	08 00                	or     %al,(%rax)
    217a:	00 00                	add    %al,(%rax)
    217c:	1c 00                	sbb    $0x0,%al
    217e:	00 00                	add    %al,(%rax)
    2180:	f0 00 00             	lock add %al,(%rax)
    2183:	00 b4 f2 ff ff 4d 00 	add    %dh,0x4dffff(%rdx,%rsi,8)
    218a:	00 00                	add    %al,(%rax)
    218c:	00 45 0e             	add    %al,0xe(%rbp)
    218f:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
    2195:	02 44 0c 07          	add    0x7(%rsp,%rcx,1),%al
    2199:	08 00                	or     %al,(%rax)
    219b:	00 20                	add    %ah,(%rax)
    219d:	00 00                	add    %al,(%rax)
    219f:	00 10                	add    %dl,(%rax)
    21a1:	01 00                	add    %eax,(%rax)
    21a3:	00 e1                	add    %ah,%cl
    21a5:	f2 ff                	repnz (bad) 
    21a7:	ff 19                	lcall  *(%rcx)
    21a9:	00 00                	add    %al,(%rax)
    21ab:	00 00                	add    %al,(%rax)
    21ad:	45 0e                	rex.RB (bad) 
    21af:	10 86 02 43 0d 06    	adc    %al,0x60d4302(%rsi)
    21b5:	50                   	push   %rax
    21b6:	0c 07                	or     $0x7,%al
    21b8:	08 00                	or     %al,(%rax)
    21ba:	00 00                	add    %al,(%rax)
    21bc:	00 00                	add    %al,(%rax)
    21be:	00 00                	add    %al,(%rax)
    21c0:	44 00 00             	add    %r8b,(%rax)
    21c3:	00 34 01             	add    %dh,(%rcx,%rax,1)
    21c6:	00 00                	add    %al,(%rax)
    21c8:	d8 f2                	fdiv   %st(2),%st
    21ca:	ff                   	(bad)  
    21cb:	ff 65 00             	jmpq   *0x0(%rbp)
    21ce:	00 00                	add    %al,(%rax)
    21d0:	00 46 0e             	add    %al,0xe(%rsi)
    21d3:	10 8f 02 49 0e 18    	adc    %cl,0x180e4902(%rdi)
    21d9:	8e 03                	mov    (%rbx),%es
    21db:	45 0e                	rex.RB (bad) 
    21dd:	20 8d 04 45 0e 28    	and    %cl,0x280e4504(%rbp)
    21e3:	8c 05 44 0e 30 86    	mov    %es,-0x79cff1bc(%rip)        # ffffffff8630302d <_end+0xffffffff862fee65>
    21e9:	06                   	(bad)  
    21ea:	48 0e                	rex.W (bad) 
    21ec:	38 83 07 47 0e 40    	cmp    %al,0x400e4707(%rbx)
    21f2:	6e                   	outsb  %ds:(%rsi),(%dx)
    21f3:	0e                   	(bad)  
    21f4:	38 41 0e             	cmp    %al,0xe(%rcx)
    21f7:	30 41 0e             	xor    %al,0xe(%rcx)
    21fa:	28 42 0e             	sub    %al,0xe(%rdx)
    21fd:	20 42 0e             	and    %al,0xe(%rdx)
    2200:	18 42 0e             	sbb    %al,0xe(%rdx)
    2203:	10 42 0e             	adc    %al,0xe(%rdx)
    2206:	08 00                	or     %al,(%rax)
    2208:	10 00                	adc    %al,(%rax)
    220a:	00 00                	add    %al,(%rax)
    220c:	7c 01                	jl     220f <__GNU_EH_FRAME_HDR+0x1e3>
    220e:	00 00                	add    %al,(%rax)
    2210:	00 f3                	add    %dh,%bl
    2212:	ff                   	(bad)  
    2213:	ff 05 00 00 00 00    	incl   0x0(%rip)        # 2219 <__GNU_EH_FRAME_HDR+0x1ed>
    2219:	00 00                	add    %al,(%rax)
	...

000000000000221c <__FRAME_END__>:
    221c:	00 00                	add    %al,(%rax)
	...

Disassembly of section .init_array:

0000000000003d20 <__frame_dummy_init_array_entry>:
    3d20:	c0 12 00             	rclb   $0x0,(%rdx)
    3d23:	00 00                	add    %al,(%rax)
    3d25:	00 00                	add    %al,(%rax)
    3d27:	00 85 14 00 00 00    	add    %al,0x14(%rbp)
    3d2d:	00 00                	add    %al,(%rax)
	...

Disassembly of section .fini_array:

0000000000003d30 <__do_global_dtors_aux_fini_array_entry>:
    3d30:	80 12 00             	adcb   $0x0,(%rdx)
    3d33:	00 00                	add    %al,(%rax)
    3d35:	00 00                	add    %al,(%rax)
	...

Disassembly of section .dynamic:

0000000000003d38 <_DYNAMIC>:
    3d38:	01 00                	add    %eax,(%rax)
    3d3a:	00 00                	add    %al,(%rax)
    3d3c:	00 00                	add    %al,(%rax)
    3d3e:	00 00                	add    %al,(%rax)
    3d40:	01 00                	add    %eax,(%rax)
    3d42:	00 00                	add    %al,(%rax)
    3d44:	00 00                	add    %al,(%rax)
    3d46:	00 00                	add    %al,(%rax)
    3d48:	01 00                	add    %eax,(%rax)
    3d4a:	00 00                	add    %al,(%rax)
    3d4c:	00 00                	add    %al,(%rax)
    3d4e:	00 00                	add    %al,(%rax)
    3d50:	b5 00                	mov    $0x0,%ch
    3d52:	00 00                	add    %al,(%rax)
    3d54:	00 00                	add    %al,(%rax)
    3d56:	00 00                	add    %al,(%rax)
    3d58:	01 00                	add    %eax,(%rax)
    3d5a:	00 00                	add    %al,(%rax)
    3d5c:	00 00                	add    %al,(%rax)
    3d5e:	00 00                	add    %al,(%rax)
    3d60:	91                   	xchg   %eax,%ecx
    3d61:	01 00                	add    %eax,(%rax)
    3d63:	00 00                	add    %al,(%rax)
    3d65:	00 00                	add    %al,(%rax)
    3d67:	00 0c 00             	add    %cl,(%rax,%rax,1)
    3d6a:	00 00                	add    %al,(%rax)
    3d6c:	00 00                	add    %al,(%rax)
    3d6e:	00 00                	add    %al,(%rax)
    3d70:	00 10                	add    %dl,(%rax)
    3d72:	00 00                	add    %al,(%rax)
    3d74:	00 00                	add    %al,(%rax)
    3d76:	00 00                	add    %al,(%rax)
    3d78:	0d 00 00 00 00       	or     $0x0,%eax
    3d7d:	00 00                	add    %al,(%rax)
    3d7f:	00 18                	add    %bl,(%rax)
    3d81:	15 00 00 00 00       	adc    $0x0,%eax
    3d86:	00 00                	add    %al,(%rax)
    3d88:	19 00                	sbb    %eax,(%rax)
    3d8a:	00 00                	add    %al,(%rax)
    3d8c:	00 00                	add    %al,(%rax)
    3d8e:	00 00                	add    %al,(%rax)
    3d90:	20 3d 00 00 00 00    	and    %bh,0x0(%rip)        # 3d96 <_DYNAMIC+0x5e>
    3d96:	00 00                	add    %al,(%rax)
    3d98:	1b 00                	sbb    (%rax),%eax
    3d9a:	00 00                	add    %al,(%rax)
    3d9c:	00 00                	add    %al,(%rax)
    3d9e:	00 00                	add    %al,(%rax)
    3da0:	10 00                	adc    %al,(%rax)
    3da2:	00 00                	add    %al,(%rax)
    3da4:	00 00                	add    %al,(%rax)
    3da6:	00 00                	add    %al,(%rax)
    3da8:	1a 00                	sbb    (%rax),%al
    3daa:	00 00                	add    %al,(%rax)
    3dac:	00 00                	add    %al,(%rax)
    3dae:	00 00                	add    %al,(%rax)
    3db0:	30 3d 00 00 00 00    	xor    %bh,0x0(%rip)        # 3db6 <_DYNAMIC+0x7e>
    3db6:	00 00                	add    %al,(%rax)
    3db8:	1c 00                	sbb    $0x0,%al
    3dba:	00 00                	add    %al,(%rax)
    3dbc:	00 00                	add    %al,(%rax)
    3dbe:	00 00                	add    %al,(%rax)
    3dc0:	08 00                	or     %al,(%rax)
    3dc2:	00 00                	add    %al,(%rax)
    3dc4:	00 00                	add    %al,(%rax)
    3dc6:	00 00                	add    %al,(%rax)
    3dc8:	f5                   	cmc    
    3dc9:	fe                   	(bad)  
    3dca:	ff 6f 00             	ljmp   *0x0(%rdi)
    3dcd:	00 00                	add    %al,(%rax)
    3dcf:	00 a0 03 00 00 00    	add    %ah,0x3(%rax)
    3dd5:	00 00                	add    %al,(%rax)
    3dd7:	00 05 00 00 00 00    	add    %al,0x0(%rip)        # 3ddd <_DYNAMIC+0xa5>
    3ddd:	00 00                	add    %al,(%rax)
    3ddf:	00 d8                	add    %bl,%al
    3de1:	05 00 00 00 00       	add    $0x0,%eax
    3de6:	00 00                	add    %al,(%rax)
    3de8:	06                   	(bad)  
    3de9:	00 00                	add    %al,(%rax)
    3deb:	00 00                	add    %al,(%rax)
    3ded:	00 00                	add    %al,(%rax)
    3def:	00 c8                	add    %cl,%al
    3df1:	03 00                	add    (%rax),%eax
    3df3:	00 00                	add    %al,(%rax)
    3df5:	00 00                	add    %al,(%rax)
    3df7:	00 0a                	add    %cl,(%rdx)
    3df9:	00 00                	add    %al,(%rax)
    3dfb:	00 00                	add    %al,(%rax)
    3dfd:	00 00                	add    %al,(%rax)
    3dff:	00 0b                	add    %cl,(%rbx)
    3e01:	02 00                	add    (%rax),%al
    3e03:	00 00                	add    %al,(%rax)
    3e05:	00 00                	add    %al,(%rax)
    3e07:	00 0b                	add    %cl,(%rbx)
    3e09:	00 00                	add    %al,(%rax)
    3e0b:	00 00                	add    %al,(%rax)
    3e0d:	00 00                	add    %al,(%rax)
    3e0f:	00 18                	add    %bl,(%rax)
    3e11:	00 00                	add    %al,(%rax)
    3e13:	00 00                	add    %al,(%rax)
    3e15:	00 00                	add    %al,(%rax)
    3e17:	00 15 00 00 00 00    	add    %dl,0x0(%rip)        # 3e1d <_DYNAMIC+0xe5>
	...
    3e25:	00 00                	add    %al,(%rax)
    3e27:	00 03                	add    %al,(%rbx)
    3e29:	00 00                	add    %al,(%rax)
    3e2b:	00 00                	add    %al,(%rax)
    3e2d:	00 00                	add    %al,(%rax)
    3e2f:	00 48 3f             	add    %cl,0x3f(%rax)
    3e32:	00 00                	add    %al,(%rax)
    3e34:	00 00                	add    %al,(%rax)
    3e36:	00 00                	add    %al,(%rax)
    3e38:	02 00                	add    (%rax),%al
    3e3a:	00 00                	add    %al,(%rax)
    3e3c:	00 00                	add    %al,(%rax)
    3e3e:	00 00                	add    %al,(%rax)
    3e40:	38 01                	cmp    %al,(%rcx)
    3e42:	00 00                	add    %al,(%rax)
    3e44:	00 00                	add    %al,(%rax)
    3e46:	00 00                	add    %al,(%rax)
    3e48:	14 00                	adc    $0x0,%al
    3e4a:	00 00                	add    %al,(%rax)
    3e4c:	00 00                	add    %al,(%rax)
    3e4e:	00 00                	add    %al,(%rax)
    3e50:	07                   	(bad)  
    3e51:	00 00                	add    %al,(%rax)
    3e53:	00 00                	add    %al,(%rax)
    3e55:	00 00                	add    %al,(%rax)
    3e57:	00 17                	add    %dl,(%rdi)
    3e59:	00 00                	add    %al,(%rax)
    3e5b:	00 00                	add    %al,(%rax)
    3e5d:	00 00                	add    %al,(%rax)
    3e5f:	00 a0 09 00 00 00    	add    %ah,0x9(%rax)
    3e65:	00 00                	add    %al,(%rax)
    3e67:	00 07                	add    %al,(%rdi)
    3e69:	00 00                	add    %al,(%rax)
    3e6b:	00 00                	add    %al,(%rax)
    3e6d:	00 00                	add    %al,(%rax)
    3e6f:	00 80 08 00 00 00    	add    %al,0x8(%rax)
    3e75:	00 00                	add    %al,(%rax)
    3e77:	00 08                	add    %cl,(%rax)
    3e79:	00 00                	add    %al,(%rax)
    3e7b:	00 00                	add    %al,(%rax)
    3e7d:	00 00                	add    %al,(%rax)
    3e7f:	00 20                	add    %ah,(%rax)
    3e81:	01 00                	add    %eax,(%rax)
    3e83:	00 00                	add    %al,(%rax)
    3e85:	00 00                	add    %al,(%rax)
    3e87:	00 09                	add    %cl,(%rcx)
    3e89:	00 00                	add    %al,(%rax)
    3e8b:	00 00                	add    %al,(%rax)
    3e8d:	00 00                	add    %al,(%rax)
    3e8f:	00 18                	add    %bl,(%rax)
    3e91:	00 00                	add    %al,(%rax)
    3e93:	00 00                	add    %al,(%rax)
    3e95:	00 00                	add    %al,(%rax)
    3e97:	00 1e                	add    %bl,(%rsi)
    3e99:	00 00                	add    %al,(%rax)
    3e9b:	00 00                	add    %al,(%rax)
    3e9d:	00 00                	add    %al,(%rax)
    3e9f:	00 08                	add    %cl,(%rax)
    3ea1:	00 00                	add    %al,(%rax)
    3ea3:	00 00                	add    %al,(%rax)
    3ea5:	00 00                	add    %al,(%rax)
    3ea7:	00 fb                	add    %bh,%bl
    3ea9:	ff                   	(bad)  
    3eaa:	ff 6f 00             	ljmp   *0x0(%rdi)
    3ead:	00 00                	add    %al,(%rax)
    3eaf:	00 01                	add    %al,(%rcx)
    3eb1:	00 00                	add    %al,(%rax)
    3eb3:	08 00                	or     %al,(%rax)
    3eb5:	00 00                	add    %al,(%rax)
    3eb7:	00 fe                	add    %bh,%dh
    3eb9:	ff                   	(bad)  
    3eba:	ff 6f 00             	ljmp   *0x0(%rdi)
    3ebd:	00 00                	add    %al,(%rax)
    3ebf:	00 10                	add    %dl,(%rax)
    3ec1:	08 00                	or     %al,(%rax)
    3ec3:	00 00                	add    %al,(%rax)
    3ec5:	00 00                	add    %al,(%rax)
    3ec7:	00 ff                	add    %bh,%bh
    3ec9:	ff                   	(bad)  
    3eca:	ff 6f 00             	ljmp   *0x0(%rdi)
    3ecd:	00 00                	add    %al,(%rax)
    3ecf:	00 03                	add    %al,(%rbx)
    3ed1:	00 00                	add    %al,(%rax)
    3ed3:	00 00                	add    %al,(%rax)
    3ed5:	00 00                	add    %al,(%rax)
    3ed7:	00 f0                	add    %dh,%al
    3ed9:	ff                   	(bad)  
    3eda:	ff 6f 00             	ljmp   *0x0(%rdi)
    3edd:	00 00                	add    %al,(%rax)
    3edf:	00 e4                	add    %ah,%ah
    3ee1:	07                   	(bad)  
    3ee2:	00 00                	add    %al,(%rax)
    3ee4:	00 00                	add    %al,(%rax)
    3ee6:	00 00                	add    %al,(%rax)
    3ee8:	f9                   	stc    
    3ee9:	ff                   	(bad)  
    3eea:	ff 6f 00             	ljmp   *0x0(%rdi)
    3eed:	00 00                	add    %al,(%rax)
    3eef:	00 04 00             	add    %al,(%rax,%rax,1)
	...

Disassembly of section .got:

0000000000003f48 <_GLOBAL_OFFSET_TABLE_>:
    3f48:	38 3d 00 00 00 00    	cmp    %bh,0x0(%rip)        # 3f4e <_GLOBAL_OFFSET_TABLE_+0x6>
	...
    3f5e:	00 00                	add    %al,(%rax)
    3f60:	30 10                	xor    %dl,(%rax)
    3f62:	00 00                	add    %al,(%rax)
    3f64:	00 00                	add    %al,(%rax)
    3f66:	00 00                	add    %al,(%rax)
    3f68:	40 10 00             	adc    %al,(%rax)
    3f6b:	00 00                	add    %al,(%rax)
    3f6d:	00 00                	add    %al,(%rax)
    3f6f:	00 50 10             	add    %dl,0x10(%rax)
    3f72:	00 00                	add    %al,(%rax)
    3f74:	00 00                	add    %al,(%rax)
    3f76:	00 00                	add    %al,(%rax)
    3f78:	60                   	(bad)  
    3f79:	10 00                	adc    %al,(%rax)
    3f7b:	00 00                	add    %al,(%rax)
    3f7d:	00 00                	add    %al,(%rax)
    3f7f:	00 70 10             	add    %dh,0x10(%rax)
    3f82:	00 00                	add    %al,(%rax)
    3f84:	00 00                	add    %al,(%rax)
    3f86:	00 00                	add    %al,(%rax)
    3f88:	80 10 00             	adcb   $0x0,(%rax)
    3f8b:	00 00                	add    %al,(%rax)
    3f8d:	00 00                	add    %al,(%rax)
    3f8f:	00 90 10 00 00 00    	add    %dl,0x10(%rax)
    3f95:	00 00                	add    %al,(%rax)
    3f97:	00 a0 10 00 00 00    	add    %ah,0x10(%rax)
    3f9d:	00 00                	add    %al,(%rax)
    3f9f:	00 b0 10 00 00 00    	add    %dh,0x10(%rax)
    3fa5:	00 00                	add    %al,(%rax)
    3fa7:	00 c0                	add    %al,%al
    3fa9:	10 00                	adc    %al,(%rax)
    3fab:	00 00                	add    %al,(%rax)
    3fad:	00 00                	add    %al,(%rax)
    3faf:	00 d0                	add    %dl,%al
    3fb1:	10 00                	adc    %al,(%rax)
    3fb3:	00 00                	add    %al,(%rax)
    3fb5:	00 00                	add    %al,(%rax)
    3fb7:	00 e0                	add    %ah,%al
    3fb9:	10 00                	adc    %al,(%rax)
    3fbb:	00 00                	add    %al,(%rax)
    3fbd:	00 00                	add    %al,(%rax)
    3fbf:	00 f0                	add    %dh,%al
    3fc1:	10 00                	adc    %al,(%rax)
	...

Disassembly of section .data:

0000000000004000 <__data_start>:
	...

0000000000004008 <__dso_handle>:
    4008:	08 40 00             	or     %al,0x0(%rax)
    400b:	00 00                	add    %al,(%rax)
    400d:	00 00                	add    %al,(%rax)
	...

Disassembly of section .bss:

0000000000004040 <_ZSt4cout@@GLIBCXX_3.4>:
	...

0000000000004150 <completed.8061>:
	...

0000000000004160 <lock>:
	...

00000000000041a0 <barrier>:
	...

00000000000041c0 <_ZStL8__ioinit>:
	...

Disassembly of section .comment:

0000000000000000 <.comment>:
   0:	47                   	rex.RXB
   1:	43                   	rex.XB
   2:	43 3a 20             	rex.XB cmp (%r8),%spl
   5:	28 55 62             	sub    %dl,0x62(%rbp)
   8:	75 6e                	jne    78 <_init-0xf88>
   a:	74 75                	je     81 <_init-0xf7f>
   c:	20 39                	and    %bh,(%rcx)
   e:	2e 34 2e             	cs xor $0x2e,%al
  11:	30 2d 31 75 62 75    	xor    %ch,0x75627531(%rip)        # 75627548 <_end+0x75623380>
  17:	6e                   	outsb  %ds:(%rsi),(%dx)
  18:	74 75                	je     8f <_init-0xf71>
  1a:	31 7e 32             	xor    %edi,0x32(%rsi)
  1d:	30 2e                	xor    %ch,(%rsi)
  1f:	30 34 2e             	xor    %dh,(%rsi,%rbp,1)
  22:	31 29                	xor    %ebp,(%rcx)
  24:	20 39                	and    %bh,(%rcx)
  26:	2e 34 2e             	cs xor $0x2e,%al
  29:	30 00                	xor    %al,(%rax)

Disassembly of section .debug_aranges:

0000000000000000 <.debug_aranges>:
   0:	2c 00                	sub    $0x0,%al
   2:	00 00                	add    %al,(%rax)
   4:	02 00                	add    (%rax),%al
   6:	00 00                	add    %al,(%rax)
   8:	00 00                	add    %al,(%rax)
   a:	08 00                	or     %al,(%rax)
   c:	00 00                	add    %al,(%rax)
   e:	00 00                	add    %al,(%rax)
  10:	c9                   	leaveq 
  11:	12 00                	adc    (%rax),%al
  13:	00 00                	add    %al,(%rax)
  15:	00 00                	add    %al,(%rax)
  17:	00 d5                	add    %dl,%ch
  19:	01 00                	add    %eax,(%rax)
	...

Disassembly of section .debug_info:

0000000000000000 <.debug_info>:
       0:	3d 36 00 00 04       	cmp    $0x4000036,%eax
       5:	00 00                	add    %al,(%rax)
       7:	00 00                	add    %al,(%rax)
       9:	00 08                	add    %cl,(%rax)
       b:	01 a7 0e 00 00 04    	add    %esp,0x400000e(%rdi)
      11:	92                   	xchg   %eax,%edx
      12:	1f                   	(bad)  
      13:	00 00                	add    %al,(%rax)
      15:	20 2c 00             	and    %ch,(%rax,%rax,1)
      18:	00 c9                	add    %cl,%cl
      1a:	12 00                	adc    (%rax),%al
      1c:	00 00                	add    %al,(%rax)
      1e:	00 00                	add    %al,(%rax)
      20:	00 d5                	add    %dl,%ch
      22:	01 00                	add    %eax,(%rax)
	...
      2c:	00 02                	add    %al,(%rdx)
      2e:	73 74                	jae    a4 <_init-0xf5c>
      30:	64 00 1a             	add    %bl,%fs:(%rdx)
      33:	00 a7 10 00 00 03    	add    %ah,0x3000010(%rdi)
      39:	76 21                	jbe    5c <_init-0xfa4>
      3b:	00 00                	add    %al,(%rax)
      3d:	07                   	(bad)  
      3e:	18 01                	sbb    %al,(%rcx)
      40:	41 04 07             	rex.B add $0x7,%al
      43:	18 01                	sbb    %al,(%rcx)
      45:	41 38 00             	cmp    %al,(%r8)
      48:	00 00                	add    %al,(%rax)
      4a:	05 03 40 0b 8f       	add    $0x8f0b4003,%eax
      4f:	14 00                	adc    $0x0,%al
      51:	00 05 03 8d 0b 05    	add    %al,0x50b8d03(%rip)        # 50b8d5a <_end+0x50b4b92>
      57:	14 00                	adc    $0x0,%al
      59:	00 05 03 8f 0b 51    	add    %al,0x510b8f03(%rip)        # 510b8f62 <_end+0x510b4d9a>
      5f:	16                   	(bad)  
      60:	00 00                	add    %al,(%rax)
      62:	05 03 90 0b 68       	add    $0x680b9003,%eax
      67:	16                   	(bad)  
      68:	00 00                	add    %al,(%rax)
      6a:	05 03 91 0b 85       	add    $0x850b9103,%eax
      6f:	16                   	(bad)  
      70:	00 00                	add    %al,(%rax)
      72:	05 03 92 0b b8       	add    $0xb80b9203,%eax
      77:	16                   	(bad)  
      78:	00 00                	add    %al,(%rax)
      7a:	05 03 93 0b d4       	add    $0xd40b9303,%eax
      7f:	16                   	(bad)  
      80:	00 00                	add    %al,(%rax)
      82:	05 03 94 0b f6       	add    $0xf60b9403,%eax
      87:	16                   	(bad)  
      88:	00 00                	add    %al,(%rax)
      8a:	05 03 95 0b 12       	add    $0x120b9503,%eax
      8f:	17                   	(bad)  
      90:	00 00                	add    %al,(%rax)
      92:	05 03 96 0b 2f       	add    $0x2f0b9603,%eax
      97:	17                   	(bad)  
      98:	00 00                	add    %al,(%rax)
      9a:	05 03 97 0b 50       	add    $0x500b9703,%eax
      9f:	17                   	(bad)  
      a0:	00 00                	add    %al,(%rax)
      a2:	05 03 98 0b 67       	add    $0x670b9803,%eax
      a7:	17                   	(bad)  
      a8:	00 00                	add    %al,(%rax)
      aa:	05 03 99 0b 74       	add    $0x740b9903,%eax
      af:	17                   	(bad)  
      b0:	00 00                	add    %al,(%rax)
      b2:	05 03 9a 0b 9b       	add    $0x9b0b9a03,%eax
      b7:	17                   	(bad)  
      b8:	00 00                	add    %al,(%rax)
      ba:	05 03 9b 0b c1       	add    $0xc10b9b03,%eax
      bf:	17                   	(bad)  
      c0:	00 00                	add    %al,(%rax)
      c2:	05 03 9c 0b de       	add    $0xde0b9c03,%eax
      c7:	17                   	(bad)  
      c8:	00 00                	add    %al,(%rax)
      ca:	05 03 9d 0b 0a       	add    $0xa0b9d03,%eax
      cf:	18 00                	sbb    %al,(%rax)
      d1:	00 05 03 9e 0b 26    	add    %al,0x260b9e03(%rip)        # 260b9eda <_end+0x260b5d12>
      d7:	18 00                	sbb    %al,(%rax)
      d9:	00 05 03 a0 0b 3d    	add    %al,0x3d0ba003(%rip)        # 3d0ba0e2 <_end+0x3d0b5f1a>
      df:	18 00                	sbb    %al,(%rax)
      e1:	00 05 03 a2 0b 5f    	add    %al,0x5f0ba203(%rip)        # 5f0ba2ea <_end+0x5f0b6122>
      e7:	18 00                	sbb    %al,(%rax)
      e9:	00 05 03 a3 0b 80    	add    %al,-0x7ff45cfd(%rip)        # ffffffff800ba3f2 <_end+0xffffffff800b622a>
      ef:	18 00                	sbb    %al,(%rax)
      f1:	00 05 03 a4 0b 9c    	add    %al,-0x63f45bfd(%rip)        # ffffffff9c0ba4fa <_end+0xffffffff9c0b6332>
      f7:	18 00                	sbb    %al,(%rax)
      f9:	00 05 03 a6 0b c3    	add    %al,-0x3cf459fd(%rip)        # ffffffffc30ba702 <_end+0xffffffffc30b653a>
      ff:	18 00                	sbb    %al,(%rax)
     101:	00 05 03 a9 0b e8    	add    %al,-0x17f456fd(%rip)        # ffffffffe80baa0a <_end+0xffffffffe80b6842>
     107:	18 00                	sbb    %al,(%rax)
     109:	00 05 03 ac 0b 0e    	add    %al,0xe0bac03(%rip)        # e0bad12 <_end+0xe0b6b4a>
     10f:	19 00                	sbb    %eax,(%rax)
     111:	00 05 03 ae 0b 33    	add    %al,0x330bae03(%rip)        # 330baf1a <_end+0x330b6d52>
     117:	19 00                	sbb    %eax,(%rax)
     119:	00 05 03 b0 0b 4f    	add    %al,0x4f0bb003(%rip)        # 4f0bb122 <_end+0x4f0b6f5a>
     11f:	19 00                	sbb    %eax,(%rax)
     121:	00 05 03 b2 0b 6f    	add    %al,0x6f0bb203(%rip)        # 6f0bb32a <_end+0x6f0b7162>
     127:	19 00                	sbb    %eax,(%rax)
     129:	00 05 03 b3 0b 96    	add    %al,-0x69f44cfd(%rip)        # ffffffff960bb432 <_end+0xffffffff960b726a>
     12f:	19 00                	sbb    %eax,(%rax)
     131:	00 05 03 b4 0b b1    	add    %al,-0x4ef44bfd(%rip)        # ffffffffb10bb53a <_end+0xffffffffb10b7372>
     137:	19 00                	sbb    %eax,(%rax)
     139:	00 05 03 b5 0b cc    	add    %al,-0x33f44afd(%rip)        # ffffffffcc0bb642 <_end+0xffffffffcc0b747a>
     13f:	19 00                	sbb    %eax,(%rax)
     141:	00 05 03 b6 0b e7    	add    %al,-0x18f449fd(%rip)        # ffffffffe70bb74a <_end+0xffffffffe70b7582>
     147:	19 00                	sbb    %eax,(%rax)
     149:	00 05 03 b7 0b 02    	add    %al,0x20bb703(%rip)        # 20bb852 <_end+0x20b768a>
     14f:	1a 00                	sbb    (%rax),%al
     151:	00 05 03 b8 0b 1d    	add    %al,0x1d0bb803(%rip)        # 1d0bb95a <_end+0x1d0b7792>
     157:	1a 00                	sbb    (%rax),%al
     159:	00 05 03 b9 0b ea    	add    %al,-0x15f446fd(%rip)        # ffffffffea0bba62 <_end+0xffffffffea0b789a>
     15f:	1a 00                	sbb    (%rax),%al
     161:	00 05 03 ba 0b 00    	add    %al,0xbba03(%rip)        # bbb6a <_end+0xb79a2>
     167:	1b 00                	sbb    (%rax),%eax
     169:	00 05 03 bb 0b 20    	add    %al,0x200bbb03(%rip)        # 200bbc72 <_end+0x200b7aaa>
     16f:	1b 00                	sbb    (%rax),%eax
     171:	00 05 03 bc 0b 40    	add    %al,0x400bbc03(%rip)        # 400bbd7a <_end+0x400b7bb2>
     177:	1b 00                	sbb    (%rax),%eax
     179:	00 05 03 bd 0b 60    	add    %al,0x600bbd03(%rip)        # 600bbe82 <_end+0x600b7cba>
     17f:	1b 00                	sbb    (%rax),%eax
     181:	00 05 03 be 0b 8c    	add    %al,-0x73f441fd(%rip)        # ffffffff8c0bbf8a <_end+0xffffffff8c0b7dc2>
     187:	1b 00                	sbb    (%rax),%eax
     189:	00 05 03 bf 0b a7    	add    %al,-0x58f440fd(%rip)        # ffffffffa70bc092 <_end+0xffffffffa70b7eca>
     18f:	1b 00                	sbb    (%rax),%eax
     191:	00 05 03 c1 0b c9    	add    %al,-0x36f43efd(%rip)        # ffffffffc90bc29a <_end+0xffffffffc90b80d2>
     197:	1b 00                	sbb    (%rax),%eax
     199:	00 05 03 c3 0b e5    	add    %al,-0x1af43cfd(%rip)        # ffffffffe50bc4a2 <_end+0xffffffffe50b82da>
     19f:	1b 00                	sbb    (%rax),%eax
     1a1:	00 05 03 c4 0b 05    	add    %al,0x50bc403(%rip)        # 50bc5aa <_end+0x50b83e2>
     1a7:	1c 00                	sbb    $0x0,%al
     1a9:	00 05 03 c5 0b 32    	add    %al,0x320bc503(%rip)        # 320bc6b2 <_end+0x320b84ea>
     1af:	1c 00                	sbb    $0x0,%al
     1b1:	00 05 03 c6 0b 53    	add    %al,0x530bc603(%rip)        # 530bc7ba <_end+0x530b85f2>
     1b7:	1c 00                	sbb    $0x0,%al
     1b9:	00 05 03 c7 0b 73    	add    %al,0x730bc703(%rip)        # 730bc8c2 <_end+0x730b86fa>
     1bf:	1c 00                	sbb    $0x0,%al
     1c1:	00 05 03 c8 0b 8a    	add    %al,-0x75f437fd(%rip)        # ffffffff8a0bc9ca <_end+0xffffffff8a0b8802>
     1c7:	1c 00                	sbb    $0x0,%al
     1c9:	00 05 03 c9 0b ab    	add    %al,-0x54f436fd(%rip)        # ffffffffab0bcad2 <_end+0xffffffffab0b890a>
     1cf:	1c 00                	sbb    $0x0,%al
     1d1:	00 05 03 ca 0b cc    	add    %al,-0x33f435fd(%rip)        # ffffffffcc0bcbda <_end+0xffffffffcc0b8a12>
     1d7:	1c 00                	sbb    $0x0,%al
     1d9:	00 05 03 cb 0b ed    	add    %al,-0x12f434fd(%rip)        # ffffffffed0bcce2 <_end+0xffffffffed0b8b1a>
     1df:	1c 00                	sbb    $0x0,%al
     1e1:	00 05 03 cc 0b 0e    	add    %al,0xe0bcc03(%rip)        # e0bcdea <_end+0xe0b8c22>
     1e7:	1d 00 00 05 03       	sbb    $0x3050000,%eax
     1ec:	cd 0b                	int    $0xb
     1ee:	26 1d 00 00 05 03    	es sbb $0x3050000,%eax
     1f4:	ce                   	(bad)  
     1f5:	0b 42 1d             	or     0x1d(%rdx),%eax
     1f8:	00 00                	add    %al,(%rax)
     1fa:	05 03 ce 0b 61       	add    $0x610bce03,%eax
     1ff:	1d 00 00 05 03       	sbb    $0x3050000,%eax
     204:	cf                   	iret   
     205:	0b 80 1d 00 00 05    	or     0x500001d(%rax),%eax
     20b:	03 cf                	add    %edi,%ecx
     20d:	0b 9f 1d 00 00 05    	or     0x500001d(%rdi),%ebx
     213:	03 d0                	add    %eax,%edx
     215:	0b be 1d 00 00 05    	or     0x500001d(%rsi),%edi
     21b:	03 d0                	add    %eax,%edx
     21d:	0b dd                	or     %ebp,%ebx
     21f:	1d 00 00 05 03       	sbb    $0x3050000,%eax
     224:	d1 0b                	rorl   (%rbx)
     226:	fc                   	cld    
     227:	1d 00 00 05 03       	sbb    $0x3050000,%eax
     22c:	d1 0b                	rorl   (%rbx)
     22e:	1b 1e                	sbb    (%rsi),%ebx
     230:	00 00                	add    %al,(%rax)
     232:	05 03 d2 0b 3a       	add    $0x3a0bd203,%eax
     237:	1e                   	(bad)  
     238:	00 00                	add    %al,(%rax)
     23a:	05 03 d2 0b 5e       	add    $0x5e0bd203,%eax
     23f:	1e                   	(bad)  
     240:	00 00                	add    %al,(%rax)
     242:	06                   	(bad)  
     243:	03 0b                	add    (%rbx),%ecx
     245:	01 16                	add    %edx,(%rsi)
     247:	82                   	(bad)  
     248:	1e                   	(bad)  
     249:	00 00                	add    %al,(%rax)
     24b:	06                   	(bad)  
     24c:	03 0c 01             	add    (%rcx,%rax,1),%ecx
     24f:	16                   	(bad)  
     250:	9e                   	sahf   
     251:	1e                   	(bad)  
     252:	00 00                	add    %al,(%rax)
     254:	06                   	(bad)  
     255:	03 0d 01 16 c6 1e    	add    0x1ec61601(%rip),%ecx        # 1ec6185c <_end+0x1ec5d694>
     25b:	00 00                	add    %al,(%rax)
     25d:	06                   	(bad)  
     25e:	03 1b                	add    (%rbx),%ebx
     260:	01 0e                	add    %ecx,(%rsi)
     262:	c9                   	leaveq 
     263:	1b 00                	sbb    (%rax),%eax
     265:	00 06                	add    %al,(%rsi)
     267:	03 1e                	add    (%rsi),%ebx
     269:	01 0e                	add    %ecx,(%rsi)
     26b:	c3                   	retq   
     26c:	18 00                	sbb    %al,(%rax)
     26e:	00 06                	add    %al,(%rsi)
     270:	03 21                	add    (%rcx),%esp
     272:	01 0e                	add    %ecx,(%rsi)
     274:	0e                   	(bad)  
     275:	19 00                	sbb    %eax,(%rax)
     277:	00 06                	add    %al,(%rsi)
     279:	03 24 01             	add    (%rcx,%rax,1),%esp
     27c:	0e                   	(bad)  
     27d:	4f 19 00             	rex.WRXB sbb %r8,(%r8)
     280:	00 06                	add    %al,(%rsi)
     282:	03 28                	add    (%rax),%ebp
     284:	01 0e                	add    %ecx,(%rsi)
     286:	82                   	(bad)  
     287:	1e                   	(bad)  
     288:	00 00                	add    %al,(%rax)
     28a:	06                   	(bad)  
     28b:	03 29                	add    (%rcx),%ebp
     28d:	01 0e                	add    %ecx,(%rsi)
     28f:	9e                   	sahf   
     290:	1e                   	(bad)  
     291:	00 00                	add    %al,(%rax)
     293:	06                   	(bad)  
     294:	03 2a                	add    (%rdx),%ebp
     296:	01 0e                	add    %ecx,(%rsi)
     298:	c6                   	(bad)  
     299:	1e                   	(bad)  
     29a:	00 00                	add    %al,(%rax)
     29c:	07                   	(bad)  
     29d:	eb 06                	jmp    2a5 <_init-0xd5b>
     29f:	00 00                	add    %al,(%rax)
     2a1:	01 04 5b             	add    %eax,(%rbx,%rbx,2)
     2a4:	0a c1                	or     %cl,%al
     2a6:	02 00                	add    (%rax),%al
     2a8:	00 08                	add    %cl,(%rax)
     2aa:	eb 06                	jmp    2b2 <_init-0xd4e>
     2ac:	00 00                	add    %al,(%rax)
     2ae:	04 5e                	add    $0x5e,%al
     2b0:	0e                   	(bad)  
     2b1:	5d                   	pop    %rbp
     2b2:	23 00                	and    (%rax),%eax
     2b4:	00 01                	add    %al,(%rcx)
     2b6:	ba 02 00 00 09       	mov    $0x9000002,%edx
     2bb:	f3 1e                	repz (bad) 
     2bd:	00 00                	add    %al,(%rax)
     2bf:	00 00                	add    %al,(%rax)
     2c1:	0a 9c 02 00 00 0b 12 	or     0x120b0000(%rdx,%rax,1),%bl
     2c8:	1f                   	(bad)  
     2c9:	00 00                	add    %al,(%rax)
     2cb:	04 62                	add    $0x62,%al
     2cd:	1a 0d 1f 00 00 c1    	sbb    -0x3effffe1(%rip),%cl        # ffffffffc10002f2 <_end+0xffffffffc0ffc12a>
     2d3:	02 00                	add    (%rax),%al
     2d5:	00 0c 3f             	add    %cl,(%rdi,%rdi,1)
     2d8:	2b 00                	sub    (%rax),%eax
     2da:	00 05 34 0d b9 04    	add    %al,0x4b90d34(%rip)        # 4b91014 <_end+0x4b8ce4c>
     2e0:	00 00                	add    %al,(%rax)
     2e2:	0d 41 2b 00 00       	or     $0x2b41,%eax
     2e7:	08 05 4f 0b ab 04    	or     %al,0x4ab0b4f(%rip)        # 4ab0e3c <_end+0x4aacc74>
     2ed:	00 00                	add    %al,(%rax)
     2ef:	0e                   	(bad)  
     2f0:	b9 24 00 00 05       	mov    $0x5000024,%ecx
     2f5:	51                   	push   %rcx
     2f6:	0d 03 14 00 00       	or     $0x1403,%eax
     2fb:	00 0f                	add    %cl,(%rdi)
     2fd:	41 2b 00             	sub    (%r8),%eax
     300:	00 05 53 10 22 04    	add    %al,0x4221053(%rip)        # 4221359 <_end+0x421d191>
     306:	00 00                	add    %al,(%rax)
     308:	10 03                	adc    %al,(%rbx)
     30a:	00 00                	add    %al,(%rax)
     30c:	1b 03                	sbb    (%rbx),%eax
     30e:	00 00                	add    %al,(%rax)
     310:	09 f9                	or     %edi,%ecx
     312:	1e                   	(bad)  
     313:	00 00                	add    %al,(%rax)
     315:	10 03                	adc    %al,(%rbx)
     317:	14 00                	adc    $0x0,%al
     319:	00 00                	add    %al,(%rax)
     31b:	11 34 02             	adc    %esi,(%rdx,%rax,1)
     31e:	00 00                	add    %al,(%rax)
     320:	05 55 0c f2 0a       	add    $0xaf20c55,%eax
     325:	00 00                	add    %al,(%rax)
     327:	2f                   	(bad)  
     328:	03 00                	add    (%rax),%eax
     32a:	00 35 03 00 00 09    	add    %dh,0x9000003(%rip)        # 9000333 <_end+0x8ffc16b>
     330:	f9                   	stc    
     331:	1e                   	(bad)  
     332:	00 00                	add    %al,(%rax)
     334:	00 11                	add    %dl,(%rcx)
     336:	fc                   	cld    
     337:	12 00                	adc    (%rax),%al
     339:	00 05 56 0c 7e 29    	add    %al,0x297e0c56(%rip)        # 297e0f95 <_end+0x297dcdcd>
     33f:	00 00                	add    %al,(%rax)
     341:	49 03 00             	add    (%r8),%rax
     344:	00 4f 03             	add    %cl,0x3(%rdi)
     347:	00 00                	add    %al,(%rax)
     349:	09 f9                	or     %edi,%ecx
     34b:	1e                   	(bad)  
     34c:	00 00                	add    %al,(%rax)
     34e:	00 12                	add    %dl,(%rdx)
     350:	3e 02 00             	add    %ds:(%rax),%al
     353:	00 05 58 0d b7 14    	add    %al,0x14b70d58(%rip)        # 14b710b1 <_end+0x14b6cee9>
     359:	00 00                	add    %al,(%rax)
     35b:	03 14 00             	add    (%rax,%rax,1),%edx
     35e:	00 67 03             	add    %ah,0x3(%rdi)
     361:	00 00                	add    %al,(%rax)
     363:	6d                   	insl   (%dx),%es:(%rdi)
     364:	03 00                	add    (%rax),%eax
     366:	00 09                	add    %cl,(%rcx)
     368:	ff 1e                	lcall  *(%rsi)
     36a:	00 00                	add    %al,(%rax)
     36c:	00 13                	add    %dl,(%rbx)
     36e:	41 2b 00             	sub    (%r8),%eax
     371:	00 05 60 07 b6 12    	add    %al,0x12b60760(%rip)        # 12b60ad7 <_end+0x12b5c90f>
     377:	00 00                	add    %al,(%rax)
     379:	01 82 03 00 00 88    	add    %eax,-0x77fffffd(%rdx)
     37f:	03 00                	add    (%rax),%eax
     381:	00 09                	add    %cl,(%rcx)
     383:	f9                   	stc    
     384:	1e                   	(bad)  
     385:	00 00                	add    %al,(%rax)
     387:	00 13                	add    %dl,(%rbx)
     389:	41 2b 00             	sub    (%r8),%eax
     38c:	00 05 62 07 c9 16    	add    %al,0x16c90762(%rip)        # 16c90af4 <_end+0x16c8c92c>
     392:	00 00                	add    %al,(%rax)
     394:	01 9d 03 00 00 a8    	add    %ebx,-0x57fffffd(%rbp)
     39a:	03 00                	add    (%rax),%eax
     39c:	00 09                	add    %cl,(%rcx)
     39e:	f9                   	stc    
     39f:	1e                   	(bad)  
     3a0:	00 00                	add    %al,(%rax)
     3a2:	10 05 1f 00 00 00    	adc    %al,0x1f(%rip)        # 3c7 <_init-0xc39>
     3a8:	13 41 2b             	adc    0x2b(%rcx),%eax
     3ab:	00 00                	add    %al,(%rax)
     3ad:	05 65 07 f9 1f       	add    $0x1ff90765,%eax
     3b2:	00 00                	add    %al,(%rax)
     3b4:	01 bd 03 00 00 c8    	add    %edi,-0x37fffffd(%rbp)
     3ba:	03 00                	add    (%rax),%eax
     3bc:	00 09                	add    %cl,(%rcx)
     3be:	f9                   	stc    
     3bf:	1e                   	(bad)  
     3c0:	00 00                	add    %al,(%rax)
     3c2:	10 d7                	adc    %dl,%bh
     3c4:	04 00                	add    $0x0,%al
     3c6:	00 00                	add    %al,(%rax)
     3c8:	13 41 2b             	adc    0x2b(%rcx),%eax
     3cb:	00 00                	add    %al,(%rax)
     3cd:	05 69 07 27 2a       	add    $0x2a270769,%eax
     3d2:	00 00                	add    %al,(%rax)
     3d4:	01 dd                	add    %ebx,%ebp
     3d6:	03 00                	add    (%rax),%eax
     3d8:	00 e8                	add    %ch,%al
     3da:	03 00                	add    (%rax),%eax
     3dc:	00 09                	add    %cl,(%rcx)
     3de:	f9                   	stc    
     3df:	1e                   	(bad)  
     3e0:	00 00                	add    %al,(%rax)
     3e2:	10 0b                	adc    %cl,(%rbx)
     3e4:	1f                   	(bad)  
     3e5:	00 00                	add    %al,(%rax)
     3e7:	00 14 66             	add    %dl,(%rsi,%riz,2)
     3ea:	09 00                	or     %eax,(%rax)
     3ec:	00 05 76 07 8b 06    	add    %al,0x68b0776(%rip)        # 68b0b68 <_end+0x68ac9a0>
     3f2:	00 00                	add    %al,(%rax)
     3f4:	11 1f                	adc    %ebx,(%rdi)
     3f6:	00 00                	add    %al,(%rax)
     3f8:	01 01                	add    %eax,(%rcx)
     3fa:	04 00                	add    $0x0,%al
     3fc:	00 0c 04             	add    %cl,(%rsp,%rax,1)
     3ff:	00 00                	add    %al,(%rax)
     401:	09 f9                	or     %edi,%ecx
     403:	1e                   	(bad)  
     404:	00 00                	add    %al,(%rax)
     406:	10 05 1f 00 00 00    	adc    %al,0x1f(%rip)        # 42b <_init-0xbd5>
     40c:	14 66                	adc    $0x66,%al
     40e:	09 00                	or     %eax,(%rax)
     410:	00 05 7a 07 64 25    	add    %al,0x2564077a(%rip)        # 25640b90 <_end+0x2563c9c8>
     416:	00 00                	add    %al,(%rax)
     418:	11 1f                	adc    %ebx,(%rdi)
     41a:	00 00                	add    %al,(%rax)
     41c:	01 25 04 00 00 30    	add    %esp,0x30000004(%rip)        # 30000426 <_end+0x2fffc25e>
     422:	04 00                	add    $0x0,%al
     424:	00 09                	add    %cl,(%rcx)
     426:	f9                   	stc    
     427:	1e                   	(bad)  
     428:	00 00                	add    %al,(%rax)
     42a:	10 0b                	adc    %cl,(%rbx)
     42c:	1f                   	(bad)  
     42d:	00 00                	add    %al,(%rax)
     42f:	00 13                	add    %dl,(%rbx)
     431:	68 1b 00 00 05       	pushq  $0x500001b
     436:	81 07 0e 11 00 00    	addl   $0x110e,(%rdi)
     43c:	01 45 04             	add    %eax,0x4(%rbp)
     43f:	00 00                	add    %al,(%rax)
     441:	50                   	push   %rax
     442:	04 00                	add    $0x0,%al
     444:	00 09                	add    %cl,(%rcx)
     446:	f9                   	stc    
     447:	1e                   	(bad)  
     448:	00 00                	add    %al,(%rax)
     44a:	09 77 14             	or     %esi,0x14(%rdi)
     44d:	00 00                	add    %al,(%rax)
     44f:	00 13                	add    %dl,(%rbx)
     451:	1a 1f                	sbb    (%rdi),%bl
     453:	00 00                	add    %al,(%rax)
     455:	05 84 07 03 10       	add    $0x10030784,%eax
     45a:	00 00                	add    %al,(%rax)
     45c:	01 65 04             	add    %esp,0x4(%rbp)
     45f:	00 00                	add    %al,(%rax)
     461:	70 04                	jo     467 <_init-0xb99>
     463:	00 00                	add    %al,(%rax)
     465:	09 f9                	or     %edi,%ecx
     467:	1e                   	(bad)  
     468:	00 00                	add    %al,(%rax)
     46a:	10 11                	adc    %dl,(%rcx)
     46c:	1f                   	(bad)  
     46d:	00 00                	add    %al,(%rax)
     46f:	00 15 8b 19 00 00    	add    %dl,0x198b(%rip)        # 1e00 <_fini+0x8e8>
     475:	05 90 10 da 25       	add    $0x25da1090,%eax
     47a:	00 00                	add    %al,(%rax)
     47c:	17                   	(bad)  
     47d:	1f                   	(bad)  
     47e:	00 00                	add    %al,(%rax)
     480:	01 89 04 00 00 8f    	add    %ecx,-0x70fffffc(%rcx)
     486:	04 00                	add    $0x0,%al
     488:	00 09                	add    %cl,(%rcx)
     48a:	ff 1e                	lcall  *(%rsi)
     48c:	00 00                	add    %al,(%rax)
     48e:	00 16                	add    %dl,(%rsi)
     490:	9b                   	fwait
     491:	10 00                	adc    %al,(%rax)
     493:	00 05 99 07 93 2b    	add    %al,0x2b930799(%rip)        # 2b930c32 <_end+0x2b92ca6a>
     499:	00 00                	add    %al,(%rax)
     49b:	23 1f                	and    (%rdi),%ebx
     49d:	00 00                	add    %al,(%rax)
     49f:	01 a4 04 00 00 09 ff 	add    %esp,-0xf70000(%rsp,%rax,1)
     4a6:	1e                   	(bad)  
     4a7:	00 00                	add    %al,(%rax)
     4a9:	00 00                	add    %al,(%rax)
     4ab:	0a e2                	or     %dl,%ah
     4ad:	02 00                	add    (%rax),%al
     4af:	00 05 05 49 10 c1    	add    %al,-0x3eefb6fb(%rip)        # ffffffffc1104dba <_end+0xffffffffc1100bf2>
     4b5:	04 00                	add    $0x0,%al
     4b7:	00 00                	add    %al,(%rax)
     4b9:	05 05 39 1a e2       	add    $0xe21a3905,%eax
     4be:	02 00                	add    (%rax),%al
     4c0:	00 17                	add    %dl,(%rdi)
     4c2:	35 0b 00 00 05       	xor    $0x500000b,%eax
     4c7:	45 08 24 20          	or     %r12b,(%r8,%riz,1)
     4cb:	00 00                	add    %al,(%rax)
     4cd:	d7                   	xlat   %ds:(%rbx)
     4ce:	04 00                	add    $0x0,%al
     4d0:	00 10                	add    %dl,(%rax)
     4d2:	e2 02                	loop   4d6 <_init-0xb2a>
     4d4:	00 00                	add    %al,(%rax)
     4d6:	00 18                	add    %bl,(%rax)
     4d8:	4a 08 00             	rex.WX or %al,(%rax)
     4db:	00 07                	add    %al,(%rdi)
     4dd:	06                   	(bad)  
     4de:	01 1d ee 1e 00 00    	add    %ebx,0x1eee(%rip)        # 23d2 <__FRAME_END__+0x1b6>
     4e4:	19 82 05 00 00 0a    	sbb    %eax,0xa000005(%rdx)
     4ea:	e4 04                	in     $0x4,%al
     4ec:	00 00                	add    %al,(%rax)
     4ee:	07                   	(bad)  
     4ef:	50                   	push   %rax
     4f0:	21 00                	and    %eax,(%rax)
     4f2:	00 01                	add    %al,(%rcx)
     4f4:	06                   	(bad)  
     4f5:	39 0c 63             	cmp    %ecx,(%rbx,%riz,2)
     4f8:	05 00 00 1a 99       	add    $0x991a0000,%eax
     4fd:	00 00                	add    %al,(%rax)
     4ff:	00 06                	add    %al,(%rsi)
     501:	3b 2d 1e 1f 00 00    	cmp    0x1f1e(%rip),%ebp        # 2425 <__FRAME_END__+0x209>
     507:	1b 09                	sbb    (%rcx),%ecx
     509:	0c 00                	or     $0x0,%al
     50b:	00 06                	add    %al,(%rsi)
     50d:	3c 2d                	cmp    $0x2d,%al
     50f:	17                   	(bad)  
     510:	1f                   	(bad)  
     511:	00 00                	add    %al,(%rax)
     513:	12 db                	adc    %bl,%bl
     515:	0b 00                	or     (%rax),%eax
     517:	00 06                	add    %al,(%rsi)
     519:	3e 11 b4 15 00 00 07 	adc    %esi,%ds:0x5070000(%rbp,%rdx,1)
     520:	05 
     521:	00 00                	add    %al,(%rax)
     523:	2b 05 00 00 31 05    	sub    0x5310000(%rip),%eax        # 5310529 <_end+0x530c361>
     529:	00 00                	add    %al,(%rax)
     52b:	09 29                	or     %ebp,(%rcx)
     52d:	1f                   	(bad)  
     52e:	00 00                	add    %al,(%rax)
     530:	00 12                	add    %dl,(%rdx)
     532:	27                   	(bad)  
     533:	21 00                	and    %eax,(%rax)
     535:	00 06                	add    %al,(%rsi)
     537:	43 1c d4             	rex.XB sbb $0xd4,%al
     53a:	1b 00                	sbb    (%rax),%eax
     53c:	00 07                	add    %al,(%rdi)
     53e:	05 00 00 49 05       	add    $0x5490000,%eax
     543:	00 00                	add    %al,(%rax)
     545:	4f 05 00 00 09 29    	rex.WRXB add $0x29090000,%rax
     54b:	1f                   	(bad)  
     54c:	00 00                	add    %al,(%rax)
     54e:	00 1c 5f             	add    %bl,(%rdi,%rbx,2)
     551:	54                   	push   %rsp
     552:	70 00                	jo     554 <_init-0xaac>
     554:	17                   	(bad)  
     555:	1f                   	(bad)  
     556:	00 00                	add    %al,(%rax)
     558:	1d 5f 5f 76 00       	sbb    $0x765f5f,%eax
     55d:	17                   	(bad)  
     55e:	1f                   	(bad)  
     55f:	00 00                	add    %al,(%rax)
     561:	00 00                	add    %al,(%rax)
     563:	0a ee                	or     %dh,%ch
     565:	04 00                	add    $0x0,%al
     567:	00 07                	add    %al,(%rdi)
     569:	9d                   	popfq  
     56a:	0f 00 00             	sldt   (%rax)
     56d:	01 06                	add    %eax,(%rsi)
     56f:	39 0c dd 05 00 00 1a 	cmp    %ecx,0x1a000005(,%rbx,8)
     576:	99                   	cltd   
     577:	00 00                	add    %al,(%rax)
     579:	00 06                	add    %al,(%rsi)
     57b:	3b 2d 1e 1f 00 00    	cmp    0x1f1e(%rip),%ebp        # 249f <__FRAME_END__+0x283>
     581:	1b 09                	sbb    (%rcx),%ecx
     583:	0c 00                	or     $0x0,%al
     585:	00 06                	add    %al,(%rsi)
     587:	3c 2d                	cmp    $0x2d,%al
     589:	17                   	(bad)  
     58a:	1f                   	(bad)  
     58b:	00 00                	add    %al,(%rax)
     58d:	12 c3                	adc    %bl,%al
     58f:	0f 00 00             	sldt   (%rax)
     592:	06                   	(bad)  
     593:	3e 11 f2             	ds adc %esi,%edx
     596:	19 00                	sbb    %eax,(%rax)
     598:	00 81 05 00 00 a5    	add    %al,-0x5afffffb(%rcx)
     59e:	05 00 00 ab 05       	add    $0x5ab0000,%eax
     5a3:	00 00                	add    %al,(%rax)
     5a5:	09 2f                	or     %ebp,(%rdi)
     5a7:	1f                   	(bad)  
     5a8:	00 00                	add    %al,(%rax)
     5aa:	00 12                	add    %dl,(%rdx)
     5ac:	27                   	(bad)  
     5ad:	21 00                	and    %eax,(%rax)
     5af:	00 06                	add    %al,(%rsi)
     5b1:	43 1c 08             	rex.XB sbb $0x8,%al
     5b4:	1e                   	(bad)  
     5b5:	00 00                	add    %al,(%rax)
     5b7:	81 05 00 00 c3 05 00 	addl   $0x5c90000,0x5c30000(%rip)        # 5c305c1 <_end+0x5c2c3f9>
     5be:	00 c9 05 
     5c1:	00 00                	add    %al,(%rax)
     5c3:	09 2f                	or     %ebp,(%rdi)
     5c5:	1f                   	(bad)  
     5c6:	00 00                	add    %al,(%rax)
     5c8:	00 1c 5f             	add    %bl,(%rdi,%rbx,2)
     5cb:	54                   	push   %rsp
     5cc:	70 00                	jo     5ce <_init-0xa32>
     5ce:	17                   	(bad)  
     5cf:	1f                   	(bad)  
     5d0:	00 00                	add    %al,(%rax)
     5d2:	1d 5f 5f 76 00       	sbb    $0x765f5f,%eax
     5d7:	17                   	(bad)  
     5d8:	1f                   	(bad)  
     5d9:	00 00                	add    %al,(%rax)
     5db:	01 00                	add    %eax,(%rax)
     5dd:	0a 68 05             	or     0x5(%rax),%ch
     5e0:	00 00                	add    %al,(%rax)
     5e2:	18 71 00             	sbb    %dh,0x0(%rcx)
     5e5:	00 00                	add    %al,(%rax)
     5e7:	07                   	(bad)  
     5e8:	02 01                	add    (%rcx),%al
     5ea:	1a b3 13 00 00 1e    	sbb    0x1e000013(%rbx),%dh
     5f0:	cd 08                	int    $0x8
     5f2:	00 00                	add    %al,(%rax)
     5f4:	06                   	(bad)  
     5f5:	bd 09 0d 1e 7a       	mov    $0x7a1e0d09,%ebp
     5fa:	2b 00                	sub    (%rax),%eax
     5fc:	00 06                	add    %al,(%rsi)
     5fe:	0b 0a                	or     (%rdx),%ecx
     600:	0d 07 1b 17 00       	or     $0x171b07,%eax
     605:	00 01                	add    %al,(%rcx)
     607:	08 7f 0c             	or     %bh,0xc(%rdi)
     60a:	2d 06 00 00 1f       	sub    $0x1f000006,%eax
     60f:	07                   	(bad)  
     610:	04 fc                	add    $0xfc,%al
     612:	13 00                	adc    (%rax),%eax
     614:	00 08                	add    %cl,(%rax)
     616:	81 0c 23 06 00 00 20 	orl    $0x20000006,(%rbx,%riz,1)
     61d:	97                   	xchg   %eax,%edi
     61e:	00 00                	add    %al,(%rax)
     620:	00 00                	add    %al,(%rax)
     622:	00 1c 5f             	add    %bl,(%rdi,%rbx,2)
     625:	54                   	push   %rsp
     626:	70 00                	jo     628 <_init-0x9d8>
     628:	a0 13 00 00 00 07 7d 	movabs 0x1e7d0700000013,%al
     62f:	1e 00 
     631:	00 01                	add    %al,(%rcx)
     633:	08 7f 0c             	or     %bh,0xc(%rdi)
     636:	59                   	pop    %rcx
     637:	06                   	(bad)  
     638:	00 00                	add    %al,(%rax)
     63a:	1f                   	(bad)  
     63b:	07                   	(bad)  
     63c:	04 fc                	add    $0xfc,%al
     63e:	13 00                	adc    (%rax),%eax
     640:	00 08                	add    %cl,(%rax)
     642:	81 0c 4f 06 00 00 20 	orl    $0x20000006,(%rdi,%rcx,2)
     649:	97                   	xchg   %eax,%edi
     64a:	00 00                	add    %al,(%rax)
     64c:	00 00                	add    %al,(%rax)
     64e:	00 1c 5f             	add    %bl,(%rdi,%rbx,2)
     651:	54                   	push   %rsp
     652:	70 00                	jo     654 <_init-0x9ac>
     654:	99                   	cltd   
     655:	13 00                	adc    (%rax),%eax
     657:	00 00                	add    %al,(%rax)
     659:	07                   	(bad)  
     65a:	9f                   	lahf   
     65b:	00 00                	add    %al,(%rax)
     65d:	00 01                	add    %al,(%rcx)
     65f:	08 7f 0c             	or     %bh,0xc(%rdi)
     662:	85 06                	test   %eax,(%rsi)
     664:	00 00                	add    %al,(%rax)
     666:	1f                   	(bad)  
     667:	07                   	(bad)  
     668:	04 fc                	add    $0xfc,%al
     66a:	13 00                	adc    (%rax),%eax
     66c:	00 08                	add    %cl,(%rax)
     66e:	81 0c 7b 06 00 00 20 	orl    $0x20000006,(%rbx,%rdi,2)
     675:	97                   	xchg   %eax,%edi
     676:	00 00                	add    %al,(%rax)
     678:	00 00                	add    %al,(%rax)
     67a:	00 1c 5f             	add    %bl,(%rdi,%rbx,2)
     67d:	54                   	push   %rsp
     67e:	70 00                	jo     680 <_init-0x980>
     680:	92                   	xchg   %eax,%edx
     681:	13 00                	adc    (%rax),%eax
     683:	00 00                	add    %al,(%rax)
     685:	07                   	(bad)  
     686:	74 14                	je     69c <_init-0x964>
     688:	00 00                	add    %al,(%rax)
     68a:	01 09                	add    %ecx,(%rcx)
     68c:	4c 0a aa 06 00 00 08 	rex.WR or 0x8000006(%rdx),%r13b
     693:	74 14                	je     6a9 <_init-0x957>
     695:	00 00                	add    %al,(%rax)
     697:	09 4c 2b 7f          	or     %ecx,0x7f(%rbx,%rbp,1)
     69b:	1b 00                	sbb    (%rax),%eax
     69d:	00 01                	add    %al,(%rcx)
     69f:	a3 06 00 00 09 6b 1f 	movabs %eax,0x1f6b09000006
     6a6:	00 00 
     6a8:	00 00                	add    %al,(%rax)
     6aa:	0a 85 06 00 00 21    	or     0x21000006(%rbp),%al
     6b0:	cd 17                	int    $0x17
     6b2:	00 00                	add    %al,(%rax)
     6b4:	09 4f 35             	or     %ecx,0x35(%rdi)
     6b7:	aa                   	stos   %al,%es:(%rdi)
     6b8:	06                   	(bad)  
     6b9:	00 00                	add    %al,(%rax)
     6bb:	01 00                	add    %eax,(%rax)
     6bd:	22 75 24             	and    0x24(%rbp),%dh
     6c0:	00 00                	add    %al,(%rax)
     6c2:	0a 32                	or     (%rdx),%dh
     6c4:	0d 23 51 19 00       	or     $0x195123,%eax
     6c9:	00 01                	add    %al,(%rcx)
     6cb:	0b 22                	or     (%rdx),%esp
     6cd:	01 0c b1             	add    %ecx,(%rcx,%rsi,4)
     6d0:	08 00                	or     %al,(%rax)
     6d2:	00 24 19             	add    %ah,(%rcx,%rbx,1)
     6d5:	2c 00                	sub    $0x0,%al
     6d7:	00 0b                	add    %cl,(%rbx)
     6d9:	2b 01                	sub    (%rcx),%eax
     6db:	07                   	(bad)  
     6dc:	b1 26                	mov    $0x26,%cl
     6de:	00 00                	add    %al,(%rax)
     6e0:	ef                   	out    %eax,(%dx)
     6e1:	06                   	(bad)  
     6e2:	00 00                	add    %al,(%rax)
     6e4:	10 8b 1f 00 00 10    	adc    %cl,0x1000001f(%rbx)
     6ea:	91                   	xchg   %eax,%ecx
     6eb:	1f                   	(bad)  
     6ec:	00 00                	add    %al,(%rax)
     6ee:	00 18                	add    %bl,(%rax)
     6f0:	64 24 00             	fs and $0x0,%al
     6f3:	00 0b                	add    %cl,(%rbx)
     6f5:	24 01                	and    $0x1,%al
     6f7:	21 6b 14             	and    %ebp,0x14(%rbx)
     6fa:	00 00                	add    %al,(%rax)
     6fc:	0a ef                	or     %bh,%ch
     6fe:	06                   	(bad)  
     6ff:	00 00                	add    %al,(%rax)
     701:	25 65 71 00 0b       	and    $0xb007165,%eax
     706:	2f                   	(bad)  
     707:	01 07                	add    %eax,(%rdi)
     709:	e5 20                	in     $0x20,%eax
     70b:	00 00                	add    %al,(%rax)
     70d:	17                   	(bad)  
     70e:	1f                   	(bad)  
     70f:	00 00                	add    %al,(%rax)
     711:	20 07                	and    %al,(%rdi)
     713:	00 00                	add    %al,(%rax)
     715:	10 91 1f 00 00 10    	adc    %dl,0x1000001f(%rcx)
     71b:	91                   	xchg   %eax,%ecx
     71c:	1f                   	(bad)  
     71d:	00 00                	add    %al,(%rax)
     71f:	00 25 6c 74 00 0b    	add    %ah,0xb00746c(%rip)        # b007b91 <_end+0xb0039c9>
     725:	33 01                	xor    (%rcx),%eax
     727:	07                   	(bad)  
     728:	04 08                	add    $0x8,%al
     72a:	00 00                	add    %al,(%rax)
     72c:	17                   	(bad)  
     72d:	1f                   	(bad)  
     72e:	00 00                	add    %al,(%rax)
     730:	3f                   	(bad)  
     731:	07                   	(bad)  
     732:	00 00                	add    %al,(%rax)
     734:	10 91 1f 00 00 10    	adc    %dl,0x1000001f(%rcx)
     73a:	91                   	xchg   %eax,%ecx
     73b:	1f                   	(bad)  
     73c:	00 00                	add    %al,(%rax)
     73e:	00 26                	add    %ah,(%rsi)
     740:	91                   	xchg   %eax,%ecx
     741:	0e                   	(bad)  
     742:	00 00                	add    %al,(%rax)
     744:	0b 3b                	or     (%rbx),%edi
     746:	01 07                	add    %eax,(%rdi)
     748:	bc 1e 00 00 77       	mov    $0x7700001e,%esp
     74d:	14 00                	adc    $0x0,%al
     74f:	00 64 07 00          	add    %ah,0x0(%rdi,%rax,1)
     753:	00 10                	add    %dl,(%rax)
     755:	97                   	xchg   %eax,%edi
     756:	1f                   	(bad)  
     757:	00 00                	add    %al,(%rax)
     759:	10 97 1f 00 00 10    	adc    %dl,0x1000001f(%rdi)
     75f:	e2 05                	loop   766 <_init-0x89a>
     761:	00 00                	add    %al,(%rax)
     763:	00 26                	add    %ah,(%rsi)
     765:	ef                   	out    %eax,(%dx)
     766:	07                   	(bad)  
     767:	00 00                	add    %al,(%rax)
     769:	0b 50 01             	or     0x1(%rax),%edx
     76c:	07                   	(bad)  
     76d:	cd 24                	int    $0x24
     76f:	00 00                	add    %al,(%rax)
     771:	e2 05                	loop   778 <_init-0x888>
     773:	00 00                	add    %al,(%rax)
     775:	7f 07                	jg     77e <_init-0x882>
     777:	00 00                	add    %al,(%rax)
     779:	10 97 1f 00 00 00    	adc    %dl,0x1f(%rdi)
     77f:	26 4f 12 00          	rex.WRXB adc %es:(%r8),%r8b
     783:	00 0b                	add    %cl,(%rbx)
     785:	5a                   	pop    %rdx
     786:	01 07                	add    %eax,(%rdi)
     788:	3c 17                	cmp    $0x17,%al
     78a:	00 00                	add    %al,(%rax)
     78c:	97                   	xchg   %eax,%edi
     78d:	1f                   	(bad)  
     78e:	00 00                	add    %al,(%rax)
     790:	a4                   	movsb  %ds:(%rsi),%es:(%rdi)
     791:	07                   	(bad)  
     792:	00 00                	add    %al,(%rax)
     794:	10 97 1f 00 00 10    	adc    %dl,0x1000001f(%rdi)
     79a:	e2 05                	loop   7a1 <_init-0x85f>
     79c:	00 00                	add    %al,(%rax)
     79e:	10 91 1f 00 00 00    	adc    %dl,0x1f(%rcx)
     7a4:	26 1d 09 00 00 0b    	es sbb $0xb000009,%eax
     7aa:	68 01 07 2d 05       	pushq  $0x52d0701
     7af:	00 00                	add    %al,(%rax)
     7b1:	9d                   	popfq  
     7b2:	1f                   	(bad)  
     7b3:	00 00                	add    %al,(%rax)
     7b5:	c9                   	leaveq 
     7b6:	07                   	(bad)  
     7b7:	00 00                	add    %al,(%rax)
     7b9:	10 9d 1f 00 00 10    	adc    %bl,0x1000001f(%rbp)
     7bf:	97                   	xchg   %eax,%edi
     7c0:	1f                   	(bad)  
     7c1:	00 00                	add    %al,(%rax)
     7c3:	10 e2                	adc    %ah,%dl
     7c5:	05 00 00 00 26       	add    $0x26000000,%eax
     7ca:	ea                   	(bad)  
     7cb:	07                   	(bad)  
     7cc:	00 00                	add    %al,(%rax)
     7ce:	0b 70 01             	or     0x1(%rax),%esi
     7d1:	07                   	(bad)  
     7d2:	15 12 00 00 9d       	adc    $0x9d000012,%eax
     7d7:	1f                   	(bad)  
     7d8:	00 00                	add    %al,(%rax)
     7da:	ee                   	out    %al,(%dx)
     7db:	07                   	(bad)  
     7dc:	00 00                	add    %al,(%rax)
     7de:	10 9d 1f 00 00 10    	adc    %bl,0x1000001f(%rbp)
     7e4:	97                   	xchg   %eax,%edi
     7e5:	1f                   	(bad)  
     7e6:	00 00                	add    %al,(%rax)
     7e8:	10 e2                	adc    %ah,%dl
     7ea:	05 00 00 00 26       	add    $0x26000000,%eax
     7ef:	19 2c 00             	sbb    %ebp,(%rax,%rax,1)
     7f2:	00 0b                	add    %cl,(%rbx)
     7f4:	78 01                	js     7f7 <_init-0x809>
     7f6:	07                   	(bad)  
     7f7:	2a 1c 00             	sub    (%rax,%rax,1),%bl
     7fa:	00 9d 1f 00 00 13    	add    %bl,0x1300001f(%rbp)
     800:	08 00                	or     %al,(%rax)
     802:	00 10                	add    %dl,(%rax)
     804:	9d                   	popfq  
     805:	1f                   	(bad)  
     806:	00 00                	add    %al,(%rax)
     808:	10 e2                	adc    %ah,%dl
     80a:	05 00 00 10 ef       	add    $0xef100000,%eax
     80f:	06                   	(bad)  
     810:	00 00                	add    %al,(%rax)
     812:	00 26                	add    %ah,(%rsi)
     814:	61                   	(bad)  
     815:	24 00                	and    $0x0,%al
     817:	00 0b                	add    %cl,(%rbx)
     819:	80 01 07             	addb   $0x7,(%rcx)
     81c:	5b                   	pop    %rbx
     81d:	1a 00                	sbb    (%rax),%al
     81f:	00 ef                	add    %ch,%bh
     821:	06                   	(bad)  
     822:	00 00                	add    %al,(%rax)
     824:	2e 08 00             	or     %al,%cs:(%rax)
     827:	00 10                	add    %dl,(%rax)
     829:	a3 1f 00 00 00 18 06 	movabs %eax,0x2406180000001f
     830:	24 00 
     832:	00 0b                	add    %cl,(%rbx)
     834:	25 01 21 77 14       	and    $0x14772101,%eax
     839:	00 00                	add    %al,(%rax)
     83b:	0a 2e                	or     (%rsi),%ch
     83d:	08 00                	or     %al,(%rax)
     83f:	00 26                	add    %ah,(%rsi)
     841:	03 24 00             	add    (%rax,%rax,1),%esp
     844:	00 0b                	add    %cl,(%rbx)
     846:	86 01                	xchg   %al,(%rcx)
     848:	07                   	(bad)  
     849:	df 2c 00             	fildll (%rax,%rax,1)
     84c:	00 2e                	add    %ch,(%rsi)
     84e:	08 00                	or     %al,(%rax)
     850:	00 5b 08             	add    %bl,0x8(%rbx)
     853:	00 00                	add    %al,(%rax)
     855:	10 91 1f 00 00 00    	adc    %dl,0x1f(%rcx)
     85b:	26 8a 14 00          	mov    %es:(%rax,%rax,1),%dl
     85f:	00 0b                	add    %cl,(%rbx)
     861:	8a 01                	mov    (%rcx),%al
     863:	07                   	(bad)  
     864:	99                   	cltd   
     865:	19 00                	sbb    %eax,(%rax)
     867:	00 17                	add    %dl,(%rdi)
     869:	1f                   	(bad)  
     86a:	00 00                	add    %al,(%rax)
     86c:	7b 08                	jnp    876 <_init-0x78a>
     86e:	00 00                	add    %al,(%rax)
     870:	10 a3 1f 00 00 10    	adc    %ah,0x1000001f(%rbx)
     876:	a3 1f 00 00 00 27 65 	movabs %eax,0x666f65270000001f
     87d:	6f 66 
     87f:	00 0b                	add    %cl,(%rbx)
     881:	8e 01                	mov    (%rcx),%es
     883:	07                   	(bad)  
     884:	e0 12                	loopne 898 <_init-0x768>
     886:	00 00                	add    %al,(%rax)
     888:	2e 08 00             	or     %al,%cs:(%rax)
     88b:	00 26                	add    %ah,(%rsi)
     88d:	a5                   	movsl  %ds:(%rsi),%es:(%rdi)
     88e:	0a 00                	or     (%rax),%al
     890:	00 0b                	add    %cl,(%rbx)
     892:	92                   	xchg   %eax,%edx
     893:	01 07                	add    %eax,(%rdi)
     895:	74 2c                	je     8c3 <_init-0x73d>
     897:	00 00                	add    %al,(%rax)
     899:	2e 08 00             	or     %al,%cs:(%rax)
     89c:	00 a7 08 00 00 10    	add    %ah,0x10000008(%rdi)
     8a2:	a3 1f 00 00 00 28 77 	movabs %eax,0xf77280000001f
     8a9:	0f 00 
     8ab:	00 6b 14             	add    %ch,0x14(%rbx)
     8ae:	00 00                	add    %al,(%rax)
     8b0:	00 23                	add    %ah,(%rbx)
     8b2:	8f 28 00 00          	(bad)
     8b6:	01 0b                	add    %ecx,(%rbx)
     8b8:	9a                   	(bad)  
     8b9:	01 0c 9d 0a 00 00 24 	add    %ecx,0x2400000a(,%rbx,4)
     8c0:	19 2c 00             	sbb    %ebp,(%rax,%rax,1)
     8c3:	00 0b                	add    %cl,(%rbx)
     8c5:	a3 01 07 51 1e 00 00 	movabs %eax,0x8db00001e510701
     8cc:	db 08 
     8ce:	00 00                	add    %al,(%rax)
     8d0:	10 a9 1f 00 00 10    	adc    %ch,0x1000001f(%rcx)
     8d6:	af                   	scas   %es:(%rdi),%eax
     8d7:	1f                   	(bad)  
     8d8:	00 00                	add    %al,(%rax)
     8da:	00 18                	add    %bl,(%rax)
     8dc:	64 24 00             	fs and $0x0,%al
     8df:	00 0b                	add    %cl,(%rbx)
     8e1:	9c                   	pushfq 
     8e2:	01 21                	add    %esp,(%rcx)
     8e4:	ac                   	lods   %ds:(%rsi),%al
     8e5:	16                   	(bad)  
     8e6:	00 00                	add    %al,(%rax)
     8e8:	0a db                	or     %bl,%bl
     8ea:	08 00                	or     %al,(%rax)
     8ec:	00 25 65 71 00 0b    	add    %ah,0xb007165(%rip)        # b007a57 <_end+0xb00388f>
     8f2:	a7                   	cmpsl  %es:(%rdi),%ds:(%rsi)
     8f3:	01 07                	add    %eax,(%rdi)
     8f5:	ca 07 00             	lret   $0x7
     8f8:	00 17                	add    %dl,(%rdi)
     8fa:	1f                   	(bad)  
     8fb:	00 00                	add    %al,(%rax)
     8fd:	0c 09                	or     $0x9,%al
     8ff:	00 00                	add    %al,(%rax)
     901:	10 af 1f 00 00 10    	adc    %ch,0x1000001f(%rdi)
     907:	af                   	scas   %es:(%rdi),%eax
     908:	1f                   	(bad)  
     909:	00 00                	add    %al,(%rax)
     90b:	00 25 6c 74 00 0b    	add    %ah,0xb00746c(%rip)        # b007d7d <_end+0xb003bb5>
     911:	ab                   	stos   %eax,%es:(%rdi)
     912:	01 07                	add    %eax,(%rdi)
     914:	f9                   	stc    
     915:	1b 00                	sbb    (%rax),%eax
     917:	00 17                	add    %dl,(%rdi)
     919:	1f                   	(bad)  
     91a:	00 00                	add    %al,(%rax)
     91c:	2b 09                	sub    (%rcx),%ecx
     91e:	00 00                	add    %al,(%rax)
     920:	10 af 1f 00 00 10    	adc    %ch,0x1000001f(%rdi)
     926:	af                   	scas   %es:(%rdi),%eax
     927:	1f                   	(bad)  
     928:	00 00                	add    %al,(%rax)
     92a:	00 26                	add    %ah,(%rsi)
     92c:	91                   	xchg   %eax,%ecx
     92d:	0e                   	(bad)  
     92e:	00 00                	add    %al,(%rax)
     930:	0b af 01 07 14 0c    	or     0xc140701(%rdi),%ebp
     936:	00 00                	add    %al,(%rax)
     938:	77 14                	ja     94e <_init-0x6b2>
     93a:	00 00                	add    %al,(%rax)
     93c:	50                   	push   %rax
     93d:	09 00                	or     %eax,(%rax)
     93f:	00 10                	add    %dl,(%rax)
     941:	b5 1f                	mov    $0x1f,%ch
     943:	00 00                	add    %al,(%rax)
     945:	10 b5 1f 00 00 10    	adc    %dh,0x1000001f(%rbp)
     94b:	e2 05                	loop   952 <_init-0x6ae>
     94d:	00 00                	add    %al,(%rax)
     94f:	00 26                	add    %ah,(%rsi)
     951:	ef                   	out    %eax,(%dx)
     952:	07                   	(bad)  
     953:	00 00                	add    %al,(%rax)
     955:	0b bd 01 07 96 14    	or     0x14960701(%rbp),%edi
     95b:	00 00                	add    %al,(%rax)
     95d:	e2 05                	loop   964 <_init-0x69c>
     95f:	00 00                	add    %al,(%rax)
     961:	6b 09 00             	imul   $0x0,(%rcx),%ecx
     964:	00 10                	add    %dl,(%rax)
     966:	b5 1f                	mov    $0x1f,%ch
     968:	00 00                	add    %al,(%rax)
     96a:	00 26                	add    %ah,(%rsi)
     96c:	4f 12 00             	rex.WRXB adc (%r8),%r8b
     96f:	00 0b                	add    %cl,(%rbx)
     971:	c7 01 07 f2 13 00    	movl   $0x13f207,(%rcx)
     977:	00 b5 1f 00 00 90    	add    %dh,-0x6fffffe1(%rbp)
     97d:	09 00                	or     %eax,(%rax)
     97f:	00 10                	add    %dl,(%rax)
     981:	b5 1f                	mov    $0x1f,%ch
     983:	00 00                	add    %al,(%rax)
     985:	10 e2                	adc    %ah,%dl
     987:	05 00 00 10 af       	add    $0xaf100000,%eax
     98c:	1f                   	(bad)  
     98d:	00 00                	add    %al,(%rax)
     98f:	00 26                	add    %ah,(%rsi)
     991:	1d 09 00 00 0b       	sbb    $0xb000009,%eax
     996:	d5                   	(bad)  
     997:	01 07                	add    %eax,(%rdi)
     999:	33 25 00 00 bb 1f    	xor    0x1fbb0000(%rip),%esp        # 1fbb099f <_end+0x1fbac7d7>
     99f:	00 00                	add    %al,(%rax)
     9a1:	b5 09                	mov    $0x9,%ch
     9a3:	00 00                	add    %al,(%rax)
     9a5:	10 bb 1f 00 00 10    	adc    %bh,0x1000001f(%rbx)
     9ab:	b5 1f                	mov    $0x1f,%ch
     9ad:	00 00                	add    %al,(%rax)
     9af:	10 e2                	adc    %ah,%dl
     9b1:	05 00 00 00 26       	add    $0x26000000,%eax
     9b6:	ea                   	(bad)  
     9b7:	07                   	(bad)  
     9b8:	00 00                	add    %al,(%rax)
     9ba:	0b dd                	or     %ebp,%ebx
     9bc:	01 07                	add    %eax,(%rdi)
     9be:	ea                   	(bad)  
     9bf:	03 00                	add    (%rax),%eax
     9c1:	00 bb 1f 00 00 da    	add    %bh,-0x25ffffe1(%rbx)
     9c7:	09 00                	or     %eax,(%rax)
     9c9:	00 10                	add    %dl,(%rax)
     9cb:	bb 1f 00 00 10       	mov    $0x1000001f,%ebx
     9d0:	b5 1f                	mov    $0x1f,%ch
     9d2:	00 00                	add    %al,(%rax)
     9d4:	10 e2                	adc    %ah,%dl
     9d6:	05 00 00 00 26       	add    $0x26000000,%eax
     9db:	19 2c 00             	sbb    %ebp,(%rax,%rax,1)
     9de:	00 0b                	add    %cl,(%rbx)
     9e0:	e5 01                	in     $0x1,%eax
     9e2:	07                   	(bad)  
     9e3:	ee                   	out    %al,(%dx)
     9e4:	24 00                	and    $0x0,%al
     9e6:	00 bb 1f 00 00 ff    	add    %bh,-0xffffe1(%rbx)
     9ec:	09 00                	or     %eax,(%rax)
     9ee:	00 10                	add    %dl,(%rax)
     9f0:	bb 1f 00 00 10       	mov    $0x1000001f,%ebx
     9f5:	e2 05                	loop   9fc <_init-0x604>
     9f7:	00 00                	add    %al,(%rax)
     9f9:	10 db                	adc    %bl,%bl
     9fb:	08 00                	or     %al,(%rax)
     9fd:	00 00                	add    %al,(%rax)
     9ff:	26 61                	es (bad) 
     a01:	24 00                	and    $0x0,%al
     a03:	00 0b                	add    %cl,(%rbx)
     a05:	ed                   	in     (%dx),%eax
     a06:	01 07                	add    %eax,(%rdi)
     a08:	8a 08                	mov    (%rax),%cl
     a0a:	00 00                	add    %al,(%rax)
     a0c:	db 08                	fisttpl (%rax)
     a0e:	00 00                	add    %al,(%rax)
     a10:	1a 0a                	sbb    (%rdx),%cl
     a12:	00 00                	add    %al,(%rax)
     a14:	10 c1                	adc    %al,%cl
     a16:	1f                   	(bad)  
     a17:	00 00                	add    %al,(%rax)
     a19:	00 18                	add    %bl,(%rax)
     a1b:	06                   	(bad)  
     a1c:	24 00                	and    $0x0,%al
     a1e:	00 0b                	add    %cl,(%rbx)
     a20:	9d                   	popfq  
     a21:	01 21                	add    %esp,(%rcx)
     a23:	05 14 00 00 0a       	add    $0xa000014,%eax
     a28:	1a 0a                	sbb    (%rdx),%cl
     a2a:	00 00                	add    %al,(%rax)
     a2c:	26 03 24 00          	add    %es:(%rax,%rax,1),%esp
     a30:	00 0b                	add    %cl,(%rbx)
     a32:	f1                   	icebp  
     a33:	01 07                	add    %eax,(%rdi)
     a35:	00 2b                	add    %ch,(%rbx)
     a37:	00 00                	add    %al,(%rax)
     a39:	1a 0a                	sbb    (%rdx),%cl
     a3b:	00 00                	add    %al,(%rax)
     a3d:	47 0a 00             	rex.RXB or (%r8),%r8b
     a40:	00 10                	add    %dl,(%rax)
     a42:	af                   	scas   %es:(%rdi),%eax
     a43:	1f                   	(bad)  
     a44:	00 00                	add    %al,(%rax)
     a46:	00 26                	add    %ah,(%rsi)
     a48:	8a 14 00             	mov    (%rax,%rax,1),%dl
     a4b:	00 0b                	add    %cl,(%rbx)
     a4d:	f5                   	cmc    
     a4e:	01 07                	add    %eax,(%rdi)
     a50:	a3 1a 00 00 17 1f 00 	movabs %eax,0x6700001f1700001a
     a57:	00 67 
     a59:	0a 00                	or     (%rax),%al
     a5b:	00 10                	add    %dl,(%rax)
     a5d:	c1 1f 00             	rcrl   $0x0,(%rdi)
     a60:	00 10                	add    %dl,(%rax)
     a62:	c1 1f 00             	rcrl   $0x0,(%rdi)
     a65:	00 00                	add    %al,(%rax)
     a67:	27                   	(bad)  
     a68:	65 6f                	outsl  %gs:(%rsi),(%dx)
     a6a:	66 00 0b             	data16 add %cl,(%rbx)
     a6d:	f9                   	stc    
     a6e:	01 07                	add    %eax,(%rdi)
     a70:	66 0b 00             	or     (%rax),%ax
     a73:	00 1a                	add    %bl,(%rdx)
     a75:	0a 00                	or     (%rax),%al
     a77:	00 26                	add    %ah,(%rsi)
     a79:	a5                   	movsl  %ds:(%rsi),%es:(%rdi)
     a7a:	0a 00                	or     (%rax),%al
     a7c:	00 0b                	add    %cl,(%rbx)
     a7e:	fd                   	std    
     a7f:	01 07                	add    %eax,(%rdi)
     a81:	cc                   	int3   
     a82:	23 00                	and    (%rax),%eax
     a84:	00 1a                	add    %bl,(%rdx)
     a86:	0a 00                	or     (%rax),%al
     a88:	00 93 0a 00 00 10    	add    %dl,0x1000000a(%rbx)
     a8e:	c1 1f 00             	rcrl   $0x0,(%rdi)
     a91:	00 00                	add    %al,(%rax)
     a93:	28 77 0f             	sub    %dh,0xf(%rdi)
     a96:	00 00                	add    %al,(%rax)
     a98:	ac                   	lods   %ds:(%rsi),%al
     a99:	16                   	(bad)  
     a9a:	00 00                	add    %al,(%rax)
     a9c:	00 05 0c 2f 0b bc    	add    %al,-0x43f4d0f4(%rip)        # ffffffffbc0b39ae <_end+0xffffffffbc0af7e6>
     aa2:	20 00                	and    %al,(%rax)
     aa4:	00 05 0c 30 0b c8    	add    %al,-0x37f4cff4(%rip)        # ffffffffc80b3ab6 <_end+0xffffffffc80af8ee>
     aaa:	20 00                	and    %al,(%rax)
     aac:	00 05 0c 31 0b d4    	add    %al,-0x2bf4cef4(%rip)        # ffffffffd40b3bbe <_end+0xffffffffd40af9f6>
     ab2:	20 00                	and    %al,(%rax)
     ab4:	00 05 0c 32 0b e0    	add    %al,-0x1ff4cdf4(%rip)        # ffffffffe00b3cc6 <_end+0xffffffffe00afafe>
     aba:	20 00                	and    %al,(%rax)
     abc:	00 05 0c 34 0b 7c    	add    %al,0x7c0b340c(%rip)        # 7c0b3ece <_end+0x7c0afd06>
     ac2:	21 00                	and    %eax,(%rax)
     ac4:	00 05 0c 35 0b 88    	add    %al,-0x77f4caf4(%rip)        # ffffffff880b3fd6 <_end+0xffffffff880afe0e>
     aca:	21 00                	and    %eax,(%rax)
     acc:	00 05 0c 36 0b 94    	add    %al,-0x6bf4c9f4(%rip)        # ffffffff940b40de <_end+0xffffffff940aff16>
     ad2:	21 00                	and    %eax,(%rax)
     ad4:	00 05 0c 37 0b a0    	add    %al,-0x5ff4c8f4(%rip)        # ffffffffa00b41e6 <_end+0xffffffffa00b001e>
     ada:	21 00                	and    %eax,(%rax)
     adc:	00 05 0c 39 0b 1c    	add    %al,0x1c0b390c(%rip)        # 1c0b43ee <_end+0x1c0b0226>
     ae2:	21 00                	and    %eax,(%rax)
     ae4:	00 05 0c 3a 0b 28    	add    %al,0x280b3a0c(%rip)        # 280b44f6 <_end+0x280b032e>
     aea:	21 00                	and    %eax,(%rax)
     aec:	00 05 0c 3b 0b 34    	add    %al,0x340b3b0c(%rip)        # 340b45fe <_end+0x340b0436>
     af2:	21 00                	and    %eax,(%rax)
     af4:	00 05 0c 3c 0b 40    	add    %al,0x400b3c0c(%rip)        # 400b4706 <_end+0x400b053e>
     afa:	21 00                	and    %eax,(%rax)
     afc:	00 05 0c 3e 0b f4    	add    %al,-0xbf4c1f4(%rip)        # fffffffff40b490e <_end+0xfffffffff40b0746>
     b02:	21 00                	and    %eax,(%rax)
     b04:	00 05 0c 3f 0b dc    	add    %al,-0x23f4c0f4(%rip)        # ffffffffdc0b4a16 <_end+0xffffffffdc0b084e>
     b0a:	21 00                	and    %eax,(%rax)
     b0c:	00 05 0c 41 0b ec    	add    %al,-0x13f4bef4(%rip)        # ffffffffec0b4c1e <_end+0xffffffffec0b0a56>
     b12:	20 00                	and    %al,(%rax)
     b14:	00 05 0c 42 0b f8    	add    %al,-0x7f4bdf4(%rip)        # fffffffff80b4d26 <_end+0xfffffffff80b0b5e>
     b1a:	20 00                	and    %al,(%rax)
     b1c:	00 05 0c 43 0b 04    	add    %al,0x40b430c(%rip)        # 40b4e2e <_end+0x40b0c66>
     b22:	21 00                	and    %eax,(%rax)
     b24:	00 05 0c 44 0b 10    	add    %al,0x100b440c(%rip)        # 100b4f36 <_end+0x100b0d6e>
     b2a:	21 00                	and    %eax,(%rax)
     b2c:	00 05 0c 46 0b ac    	add    %al,-0x53f4b9f4(%rip)        # ffffffffac0b513e <_end+0xffffffffac0b0f76>
     b32:	21 00                	and    %eax,(%rax)
     b34:	00 05 0c 47 0b b8    	add    %al,-0x47f4b8f4(%rip)        # ffffffffb80b5246 <_end+0xffffffffb80b107e>
     b3a:	21 00                	and    %eax,(%rax)
     b3c:	00 05 0c 48 0b c4    	add    %al,-0x3bf4b7f4(%rip)        # ffffffffc40b534e <_end+0xffffffffc40b1186>
     b42:	21 00                	and    %eax,(%rax)
     b44:	00 05 0c 49 0b d0    	add    %al,-0x2ff4b6f4(%rip)        # ffffffffd00b5456 <_end+0xffffffffd00b128e>
     b4a:	21 00                	and    %eax,(%rax)
     b4c:	00 05 0c 4b 0b 4c    	add    %al,0x4c0b4b0c(%rip)        # 4c0b565e <_end+0x4c0b1496>
     b52:	21 00                	and    %eax,(%rax)
     b54:	00 05 0c 4c 0b 58    	add    %al,0x580b4c0c(%rip)        # 580b5766 <_end+0x580b159e>
     b5a:	21 00                	and    %eax,(%rax)
     b5c:	00 05 0c 4d 0b 64    	add    %al,0x640b4d0c(%rip)        # 640b586e <_end+0x640b16a6>
     b62:	21 00                	and    %eax,(%rax)
     b64:	00 05 0c 4e 0b 70    	add    %al,0x700b4e0c(%rip)        # 700b5976 <_end+0x700b17ae>
     b6a:	21 00                	and    %eax,(%rax)
     b6c:	00 05 0c 50 0b 00    	add    %al,0xb500c(%rip)        # b5b7e <_end+0xb19b6>
     b72:	22 00                	and    (%rax),%al
     b74:	00 05 0c 51 0b e8    	add    %al,-0x17f4aef4(%rip)        # ffffffffe80b5c86 <_end+0xffffffffe80b1abe>
     b7a:	21 00                	and    %eax,(%rax)
     b7c:	00 05 0d 35 0b 0c    	add    %al,0xc0b350d(%rip)        # c0b408f <_end+0xc0afec7>
     b82:	22 00                	and    (%rax),%al
     b84:	00 05 0d 36 0b 52    	add    %al,0x520b360d(%rip)        # 520b4197 <_end+0x520affcf>
     b8a:	23 00                	and    (%rax),%eax
     b8c:	00 05 0d 37 0b 6d    	add    %al,0x6d0b370d(%rip)        # 6d0b429f <_end+0x6d0b00d7>
     b92:	23 00                	and    (%rax),%eax
     b94:	00 18                	add    %bl,(%rax)
     b96:	0e                   	(bad)  
     b97:	27                   	(bad)  
     b98:	00 00                	add    %al,(%rax)
     b9a:	07                   	(bad)  
     b9b:	03 01                	add    (%rcx),%eax
     b9d:	1c 26                	sbb    $0x26,%al
     b9f:	1c 00                	sbb    $0x0,%al
     ba1:	00 05 0e 7f 0b 6b    	add    %al,0x6b0b7f0e(%rip)        # 6b0b8ab5 <_end+0x6b0b48ed>
     ba7:	25 00 00 05 0e       	and    $0xe050000,%eax
     bac:	80 0b 9f             	orb    $0x9f,(%rbx)
     baf:	25 00 00 05 0e       	and    $0xe050000,%eax
     bb4:	86 0b                	xchg   %cl,(%rbx)
     bb6:	06                   	(bad)  
     bb7:	26 00 00             	add    %al,%es:(%rax)
     bba:	05 0e 89 0b 24       	add    $0x240b890e,%eax
     bbf:	26 00 00             	add    %al,%es:(%rax)
     bc2:	05 0e 8c 0b 3f       	add    $0x3f0b8c0e,%eax
     bc7:	26 00 00             	add    %al,%es:(%rax)
     bca:	05 0e 8d 0b 55       	add    $0x550b8d0e,%eax
     bcf:	26 00 00             	add    %al,%es:(%rax)
     bd2:	05 0e 8e 0b 6b       	add    $0x6b0b8e0e,%eax
     bd7:	26 00 00             	add    %al,%es:(%rax)
     bda:	05 0e 8f 0b 81       	add    $0x810b8f0e,%eax
     bdf:	26 00 00             	add    %al,%es:(%rax)
     be2:	05 0e 91 0b ac       	add    $0xac0b910e,%eax
     be7:	26 00 00             	add    %al,%es:(%rax)
     bea:	05 0e 94 0b c8       	add    $0xc80b940e,%eax
     bef:	26 00 00             	add    %al,%es:(%rax)
     bf2:	05 0e 96 0b df       	add    $0xdf0b960e,%eax
     bf7:	26 00 00             	add    %al,%es:(%rax)
     bfa:	05 0e 99 0b fb       	add    $0xfb0b990e,%eax
     bff:	26 00 00             	add    %al,%es:(%rax)
     c02:	05 0e 9a 0b 17       	add    $0x170b9a0e,%eax
     c07:	27                   	(bad)  
     c08:	00 00                	add    %al,(%rax)
     c0a:	05 0e 9b 0b 38       	add    $0x380b9b0e,%eax
     c0f:	27                   	(bad)  
     c10:	00 00                	add    %al,(%rax)
     c12:	05 0e 9d 0b 59       	add    $0x590b9d0e,%eax
     c17:	27                   	(bad)  
     c18:	00 00                	add    %al,(%rax)
     c1a:	05 0e a0 0b 7b       	add    $0x7b0ba00e,%eax
     c1f:	27                   	(bad)  
     c20:	00 00                	add    %al,(%rax)
     c22:	05 0e a3 0b 8e       	add    $0x8e0ba30e,%eax
     c27:	27                   	(bad)  
     c28:	00 00                	add    %al,(%rax)
     c2a:	05 0e a5 0b 9b       	add    $0x9b0ba50e,%eax
     c2f:	27                   	(bad)  
     c30:	00 00                	add    %al,(%rax)
     c32:	05 0e a6 0b ae       	add    $0xae0ba60e,%eax
     c37:	27                   	(bad)  
     c38:	00 00                	add    %al,(%rax)
     c3a:	05 0e a7 0b cf       	add    $0xcf0ba70e,%eax
     c3f:	27                   	(bad)  
     c40:	00 00                	add    %al,(%rax)
     c42:	05 0e a8 0b ef       	add    $0xef0ba80e,%eax
     c47:	27                   	(bad)  
     c48:	00 00                	add    %al,(%rax)
     c4a:	05 0e a9 0b 0f       	add    $0xf0ba90e,%eax
     c4f:	28 00                	sub    %al,(%rax)
     c51:	00 05 0e ab 0b 26    	add    %al,0x260bab0e(%rip)        # 260bb765 <_end+0x260b759d>
     c57:	28 00                	sub    %al,(%rax)
     c59:	00 05 0e ac 0b 47    	add    %al,0x470bac0e(%rip)        # 470bb86d <_end+0x470b76a5>
     c5f:	28 00                	sub    %al,(%rax)
     c61:	00 05 0e f0 16 d3    	add    %al,-0x2ce90ff2(%rip)        # ffffffffd316fc75 <_end+0xffffffffd316baad>
     c67:	25 00 00 05 0e       	and    $0xe050000,%eax
     c6c:	f5                   	cmc    
     c6d:	16                   	(bad)  
     c6e:	77 11                	ja     c81 <_init-0x37f>
     c70:	00 00                	add    %al,(%rax)
     c72:	05 0e f6 16 63       	add    $0x6316f60e,%eax
     c77:	28 00                	sub    %al,(%rax)
     c79:	00 05 0e f8 16 7f    	add    %al,0x7f16f80e(%rip)        # 7f17048d <_end+0x7f16c2c5>
     c7f:	28 00                	sub    %al,(%rax)
     c81:	00 05 0e f9 16 d5    	add    %al,-0x2ae906f2(%rip)        # ffffffffd5170595 <_end+0xffffffffd516c3cd>
     c87:	28 00                	sub    %al,(%rax)
     c89:	00 05 0e fa 16 95    	add    %al,-0x6ae905f2(%rip)        # ffffffff9517069d <_end+0xffffffff9516c4d5>
     c8f:	28 00                	sub    %al,(%rax)
     c91:	00 05 0e fb 16 b5    	add    %al,-0x4ae904f2(%rip)        # ffffffffb51707a5 <_end+0xffffffffb516c5dd>
     c97:	28 00                	sub    %al,(%rax)
     c99:	00 05 0e fc 16 f0    	add    %al,-0xfe903f2(%rip)        # fffffffff01708ad <_end+0xfffffffff016c6e5>
     c9f:	28 00                	sub    %al,(%rax)
     ca1:	00 05 0f 62 0b 33    	add    %al,0x330b620f(%rip)        # 330b6eb6 <_end+0x330b2cee>
     ca7:	16                   	(bad)  
     ca8:	00 00                	add    %al,(%rax)
     caa:	05 0f 63 0b 94       	add    $0x940b630f,%eax
     caf:	29 00                	sub    %eax,(%rax)
     cb1:	00 05 0f 65 0b 0a    	add    %al,0xa0b650f(%rip)        # a0b71c6 <_end+0xa0b2ffe>
     cb7:	2a 00                	sub    (%rax),%al
     cb9:	00 05 0f 66 0b 1d    	add    %al,0x1d0b660f(%rip)        # 1d0b72ce <_end+0x1d0b3106>
     cbf:	2a 00                	sub    (%rax),%al
     cc1:	00 05 0f 67 0b 33    	add    %al,0x330b670f(%rip)        # 330b73d6 <_end+0x330b320e>
     cc7:	2a 00                	sub    (%rax),%al
     cc9:	00 05 0f 68 0b 4a    	add    %al,0x4a0b680f(%rip)        # 4a0b74de <_end+0x4a0b3316>
     ccf:	2a 00                	sub    (%rax),%al
     cd1:	00 05 0f 69 0b 61    	add    %al,0x610b690f(%rip)        # 610b75e6 <_end+0x610b341e>
     cd7:	2a 00                	sub    (%rax),%al
     cd9:	00 05 0f 6a 0b 77    	add    %al,0x770b6a0f(%rip)        # 770b76ee <_end+0x770b3526>
     cdf:	2a 00                	sub    (%rax),%al
     ce1:	00 05 0f 6b 0b 8e    	add    %al,-0x71f494f1(%rip)        # ffffffff8e0b77f6 <_end+0xffffffff8e0b362e>
     ce7:	2a 00                	sub    (%rax),%al
     ce9:	00 05 0f 6c 0b b0    	add    %al,-0x4ff493f1(%rip)        # ffffffffb00b78fe <_end+0xffffffffb00b3736>
     cef:	2a 00                	sub    (%rax),%al
     cf1:	00 05 0f 6d 0b d1    	add    %al,-0x2ef492f1(%rip)        # ffffffffd10b7a06 <_end+0xffffffffd10b383e>
     cf7:	2a 00                	sub    (%rax),%al
     cf9:	00 05 0f 71 0b ec    	add    %al,-0x13f48ef1(%rip)        # ffffffffec0b7e0e <_end+0xffffffffec0b3c46>
     cff:	2a 00                	sub    (%rax),%al
     d01:	00 05 0f 72 0b 12    	add    %al,0x120b720f(%rip)        # 120b7f16 <_end+0x120b3d4e>
     d07:	2b 00                	sub    (%rax),%eax
     d09:	00 05 0f 74 0b 32    	add    %al,0x320b740f(%rip)        # 320b811e <_end+0x320b3f56>
     d0f:	2b 00                	sub    (%rax),%eax
     d11:	00 05 0f 75 0b 53    	add    %al,0x530b750f(%rip)        # 530b8226 <_end+0x530b405e>
     d17:	2b 00                	sub    (%rax),%eax
     d19:	00 05 0f 76 0b 75    	add    %al,0x750b760f(%rip)        # 750b832e <_end+0x750b4166>
     d1f:	2b 00                	sub    (%rax),%eax
     d21:	00 05 0f 78 0b 8c    	add    %al,-0x73f487f1(%rip)        # ffffffff8c0b8536 <_end+0xffffffff8c0b436e>
     d27:	2b 00                	sub    (%rax),%eax
     d29:	00 05 0f 79 0b a3    	add    %al,-0x5cf486f1(%rip)        # ffffffffa30b863e <_end+0xffffffffa30b4476>
     d2f:	2b 00                	sub    (%rax),%eax
     d31:	00 05 0f 7e 0b b0    	add    %al,-0x4ff481f1(%rip)        # ffffffffb00b8b46 <_end+0xffffffffb00b497e>
     d37:	2b 00                	sub    (%rax),%eax
     d39:	00 05 0f 83 0b c3    	add    %al,-0x3cf47cf1(%rip)        # ffffffffc30b904e <_end+0xffffffffc30b4e86>
     d3f:	2b 00                	sub    (%rax),%eax
     d41:	00 05 0f 84 0b d9    	add    %al,-0x26f47bf1(%rip)        # ffffffffd90b9156 <_end+0xffffffffd90b4f8e>
     d47:	2b 00                	sub    (%rax),%eax
     d49:	00 05 0f 85 0b f4    	add    %al,-0xbf47af1(%rip)        # fffffffff40b925e <_end+0xfffffffff40b5096>
     d4f:	2b 00                	sub    (%rax),%eax
     d51:	00 05 0f 87 0b 07    	add    %al,0x70b870f(%rip)        # 70b9466 <_end+0x70b529e>
     d57:	2c 00                	sub    $0x0,%al
     d59:	00 05 0f 88 0b 1f    	add    %al,0x1f0b880f(%rip)        # 1f0b956e <_end+0x1f0b53a6>
     d5f:	2c 00                	sub    $0x0,%al
     d61:	00 05 0f 8b 0b 45    	add    %al,0x450b8b0f(%rip)        # 450b9876 <_end+0x450b56ae>
     d67:	2c 00                	sub    $0x0,%al
     d69:	00 05 0f 8d 0b 51    	add    %al,0x510b8d0f(%rip)        # 510b9a7e <_end+0x510b58b6>
     d6f:	2c 00                	sub    $0x0,%al
     d71:	00 05 0f 8f 0b 67    	add    %al,0x670b8f0f(%rip)        # 670b9c86 <_end+0x670b5abe>
     d77:	2c 00                	sub    $0x0,%al
     d79:	00 29                	add    %ch,(%rcx)
     d7b:	63 04 00             	movslq (%rax,%rax,1),%eax
     d7e:	00 10                	add    %dl,(%rax)
     d80:	9e                   	sahf   
     d81:	1a 14 9a             	sbb    (%rdx,%rbx,4),%dl
     d84:	0d 00 00 03 5c       	or     $0x5c030000,%eax
     d89:	04 00                	add    $0x0,%al
     d8b:	00 10                	add    %dl,(%rax)
     d8d:	a0 1a 14 04 10 a0 1a 	movabs 0x87141aa01004141a,%al
     d94:	14 87 
     d96:	0d 00 00 00 04       	or     $0x4000000,%eax
     d9b:	10 9e 1a 14 7a 0d    	adc    %bl,0xd7a141a(%rsi)
     da1:	00 00                	add    %al,(%rax)
     da3:	2a 5f 56             	sub    0x56(%rdi),%bl
     da6:	32 00                	xor    (%rax),%al
     da8:	11 47 14             	adc    %eax,0x14(%rdi)
     dab:	2b 11                	sub    (%rcx),%edx
     dad:	47 14 a3             	rex.RXB adc $0xa3,%al
     db0:	0d 00 00 2c 84       	or     $0x842c0000,%eax
     db5:	22 00                	and    (%rax),%al
     db7:	00 71 0e             	add    %dh,0xe(%rcx)
     dba:	00 00                	add    %al,(%rax)
     dbc:	2d bb 07 00 00       	sub    $0x7bb,%eax
     dc1:	01 12                	add    %edx,(%rdx)
     dc3:	60                   	(bad)  
     dc4:	02 0b                	add    (%rbx),%cl
     dc6:	01 6b 0e             	add    %ebp,0xe(%rbx)
     dc9:	00 00                	add    %al,(%rax)
     dcb:	2e bb 07 00 00 12    	cs mov $0x12000007,%ebx
     dd1:	64 02 07             	add    %fs:(%rdi),%al
     dd4:	27                   	(bad)  
     dd5:	2b 00                	sub    (%rax),%eax
     dd7:	00 01                	add    %al,(%rcx)
     dd9:	e1 0d                	loope  de8 <_init-0x218>
     ddb:	00 00                	add    %al,(%rax)
     ddd:	e7 0d                	out    %eax,$0xd
     ddf:	00 00                	add    %al,(%rax)
     de1:	09 9b 2c 00 00 00    	or     %ebx,0x2c(%rbx)
     de7:	2e ba 07 00 00 12    	cs mov $0x12000007,%edx
     ded:	65 02 07             	add    %gs:(%rdi),%al
     df0:	75 17                	jne    e09 <_init-0x1f7>
     df2:	00 00                	add    %al,(%rax)
     df4:	01 fd                	add    %edi,%ebp
     df6:	0d 00 00 08 0e       	or     $0xe080000,%eax
     dfb:	00 00                	add    %al,(%rax)
     dfd:	09 9b 2c 00 00 09    	or     %ebx,0x900002c(%rbx)
     e03:	77 14                	ja     e19 <_init-0x1e7>
     e05:	00 00                	add    %al,(%rax)
     e07:	00 2f                	add    %ch,(%rdi)
     e09:	bb 07 00 00 12       	mov    $0x12000007,%ebx
     e0e:	68 02 07 67 02       	pushq  $0x2670702
     e13:	00 00                	add    %al,(%rax)
     e15:	01 01                	add    %eax,(%rcx)
     e17:	1f                   	(bad)  
     e18:	0e                   	(bad)  
     e19:	00 00                	add    %al,(%rax)
     e1b:	2a 0e                	sub    (%rsi),%cl
     e1d:	00 00                	add    %al,(%rax)
     e1f:	09 9b 2c 00 00 10    	or     %ebx,0x1000002c(%rbx)
     e25:	a1 2c 00 00 00 30 66 	movabs 0x966300000002c,%eax
     e2c:	09 00 
     e2e:	00 12                	add    %dl,(%rdx)
     e30:	69 02 0d a5 0d 00    	imul   $0xda50d,(%rdx),%eax
     e36:	00 a7 2c 00 00 01    	add    %ah,0x100002c(%rdi)
     e3c:	01 45 0e             	add    %eax,0xe(%rbp)
     e3f:	00 00                	add    %al,(%rax)
     e41:	50                   	push   %rax
     e42:	0e                   	(bad)  
     e43:	00 00                	add    %al,(%rax)
     e45:	09 9b 2c 00 00 10    	or     %ebx,0x1000002c(%rbx)
     e4b:	a1 2c 00 00 00 31 1f 	movabs 0x151f310000002c,%eax
     e52:	15 00 
     e54:	00 12                	add    %dl,(%rdx)
     e56:	6d                   	insl   (%dx),%es:(%rdi)
     e57:	02 1b                	add    (%rbx),%bl
     e59:	30 25 00 00 31 5d    	xor    %ah,0x5d310000(%rip)        # 5d310e5f <_end+0x5d30cc97>
     e5f:	08 00                	or     %al,(%rax)
     e61:	00 12                	add    %dl,(%rdx)
     e63:	6e                   	outsb  %ds:(%rsi),(%dx)
     e64:	02 14 17             	add    (%rdi,%rdx,1),%dl
     e67:	1f                   	(bad)  
     e68:	00 00                	add    %al,(%rax)
     e6a:	00 0a                	add    %cl,(%rdx)
     e6c:	bc 0d 00 00 00       	mov    $0xd,%esp
     e71:	05 13 52 0b b9       	add    $0xb90b5213,%eax
     e76:	2c 00                	sub    $0x0,%al
     e78:	00 05 13 53 0b ad    	add    %al,-0x52f4aced(%rip)        # ffffffffad0b6191 <_end+0xffffffffad0b1fc9>
     e7e:	2c 00                	sub    $0x0,%al
     e80:	00 05 13 54 0b 05    	add    %al,0x50b5413(%rip)        # 50b6299 <_end+0x50b20d1>
     e86:	14 00                	adc    $0x0,%al
     e88:	00 05 13 5c 0b cb    	add    %al,-0x34f4a3ed(%rip)        # ffffffffcb0b6aa1 <_end+0xffffffffcb0b28d9>
     e8e:	2c 00                	sub    $0x0,%al
     e90:	00 05 13 65 0b e6    	add    %al,-0x19f49aed(%rip)        # ffffffffe60b73a9 <_end+0xffffffffe60b31e1>
     e96:	2c 00                	sub    $0x0,%al
     e98:	00 05 13 68 0b 01    	add    %al,0x10b6813(%rip)        # 10b76b1 <_end+0x10b34e9>
     e9e:	2d 00 00 05 13       	sub    $0x13050000,%eax
     ea3:	69 0b 17 2d 00 00    	imul   $0x2d17,(%rbx),%ecx
     ea9:	2c 30                	sub    $0x30,%al
     eab:	09 00                	or     %eax,(%rax)
     ead:	00 c5                	add    %al,%ch
     eaf:	0e                   	(bad)  
     eb0:	00 00                	add    %al,(%rax)
     eb2:	28 77 0f             	sub    %dh,0xf(%rdi)
     eb5:	00 00                	add    %al,(%rax)
     eb7:	6b 14 00 00          	imul   $0x0,(%rax,%rax,1),%edx
     ebb:	32 98 15 00 00 c5    	xor    -0x3affffeb(%rax),%bl
     ec1:	06                   	(bad)  
     ec2:	00 00                	add    %al,(%rax)
     ec4:	00 2c a8             	add    %ch,(%rax,%rbp,4)
     ec7:	0b 00                	or     (%rax),%eax
     ec9:	00 e1                	add    %ah,%cl
     ecb:	0e                   	(bad)  
     ecc:	00 00                	add    %al,(%rax)
     ece:	28 77 0f             	sub    %dh,0xf(%rdi)
     ed1:	00 00                	add    %al,(%rax)
     ed3:	ac                   	lods   %ds:(%rsi),%al
     ed4:	16                   	(bad)  
     ed5:	00 00                	add    %al,(%rax)
     ed7:	32 98 15 00 00 b1    	xor    -0x4effffeb(%rax),%bl
     edd:	08 00                	or     %al,(%rax)
     edf:	00 00                	add    %al,(%rax)
     ee1:	2c f4                	sub    $0xf4,%al
     ee3:	0c 00                	or     $0x0,%al
     ee5:	00 fd                	add    %bh,%ch
     ee7:	0e                   	(bad)  
     ee8:	00 00                	add    %al,(%rax)
     eea:	28 77 0f             	sub    %dh,0xf(%rdi)
     eed:	00 00                	add    %al,(%rax)
     eef:	6b 14 00 00          	imul   $0x0,(%rax,%rax,1),%edx
     ef3:	32 98 15 00 00 c5    	xor    -0x3affffeb(%rax),%bl
     ef9:	06                   	(bad)  
     efa:	00 00                	add    %al,(%rax)
     efc:	00 2c a7             	add    %ch,(%rdi,%riz,4)
     eff:	21 00                	and    %eax,(%rax)
     f01:	00 19                	add    %bl,(%rcx)
     f03:	0f 00 00             	sldt   (%rax)
     f06:	28 77 0f             	sub    %dh,0xf(%rdi)
     f09:	00 00                	add    %al,(%rax)
     f0b:	ac                   	lods   %ds:(%rsi),%al
     f0c:	16                   	(bad)  
     f0d:	00 00                	add    %al,(%rax)
     f0f:	32 98 15 00 00 b1    	xor    -0x4effffeb(%rax),%bl
     f15:	08 00                	or     %al,(%rax)
     f17:	00 00                	add    %al,(%rax)
     f19:	1b 9f 21 00 00 14    	sbb    0x14000021(%rdi),%ebx
     f1f:	8a 21                	mov    (%rcx),%ah
     f21:	e1 0e                	loope  f31 <_init-0xcf>
     f23:	00 00                	add    %al,(%rax)
     f25:	33 63 69             	xor    0x69(%rbx),%esp
     f28:	6e                   	outsb  %ds:(%rsi),(%dx)
     f29:	00 02                	add    %al,(%rdx)
     f2b:	3c 12                	cmp    $0x12,%al
     f2d:	d4                   	(bad)  
     f2e:	26 00 00             	add    %al,%es:(%rax)
     f31:	19 0f                	sbb    %ecx,(%rdi)
     f33:	00 00                	add    %al,(%rax)
     f35:	1b 51 10             	sbb    0x10(%rcx),%edx
     f38:	00 00                	add    %al,(%rax)
     f3a:	14 8d                	adc    $0x8d,%al
     f3c:	21 a9 0e 00 00 0b    	and    %ebp,0xb00000e(%rcx)
     f42:	b2 18                	mov    $0x18,%dl
     f44:	00 00                	add    %al,(%rax)
     f46:	02 3d 12 ad 18 00    	add    0x18ad12(%rip),%bh        # 18bc5e <_end+0x187a96>
     f4c:	00 35 0f 00 00 0b    	add    %dh,0xb00000f(%rip)        # b000f61 <_end+0xaffcd99>
     f52:	e4 13                	in     $0x13,%al
     f54:	00 00                	add    %al,(%rax)
     f56:	02 3e                	add    (%rsi),%bh
     f58:	12 df                	adc    %bh,%bl
     f5a:	13 00                	adc    (%rax),%eax
     f5c:	00 35 0f 00 00 0b    	add    %dh,0xb00000f(%rip)        # b000f71 <_end+0xaffcda9>
     f62:	b7 08                	mov    $0x8,%bh
     f64:	00 00                	add    %al,(%rax)
     f66:	02 3f                	add    (%rdi),%bh
     f68:	12 b2 08 00 00 35    	adc    0x35000008(%rdx),%dh
     f6e:	0f 00 00             	sldt   (%rax)
     f71:	1b 9e 21 00 00 14    	sbb    0x14000021(%rsi),%ebx
     f77:	b2 23                	mov    $0x23,%dl
     f79:	fd                   	std    
     f7a:	0e                   	(bad)  
     f7b:	00 00                	add    %al,(%rax)
     f7d:	0b 1b                	or     (%rbx),%ebx
     f7f:	26 00 00             	add    %al,%es:(%rax)
     f82:	02 42 13             	add    0x13(%rdx),%al
     f85:	16                   	(bad)  
     f86:	26 00 00             	add    %al,%es:(%rax)
     f89:	71 0f                	jno    f9a <_init-0x66>
     f8b:	00 00                	add    %al,(%rax)
     f8d:	1b 50 10             	sbb    0x10(%rax),%edx
     f90:	00 00                	add    %al,(%rax)
     f92:	14 b5                	adc    $0xb5,%al
     f94:	23 c5                	and    %ebp,%eax
     f96:	0e                   	(bad)  
     f97:	00 00                	add    %al,(%rax)
     f99:	0b 01                	or     (%rcx),%eax
     f9b:	09 00                	or     %eax,(%rax)
     f9d:	00 02                	add    %al,(%rdx)
     f9f:	43 13 fc             	rex.XB adc %r12d,%edi
     fa2:	08 00                	or     %al,(%rax)
     fa4:	00 8d 0f 00 00 0b    	add    %cl,0xb00000f(%rbp)
     faa:	54                   	push   %rsp
     fab:	03 00                	add    (%rax),%eax
     fad:	00 02                	add    %al,(%rdx)
     faf:	44 13 4f 03          	adc    0x3(%rdi),%r9d
     fb3:	00 00                	add    %al,(%rax)
     fb5:	8d 0f                	lea    (%rdi),%ecx
     fb7:	00 00                	add    %al,(%rax)
     fb9:	0b e4                	or     %esp,%esp
     fbb:	11 00                	adc    %eax,(%rax)
     fbd:	00 02                	add    %al,(%rdx)
     fbf:	45 13 df             	adc    %r15d,%r11d
     fc2:	11 00                	adc    %eax,(%rax)
     fc4:	00 8d 0f 00 00 34    	add    %cl,0x3400000f(%rbp)
     fca:	2e 08 00             	or     %al,%cs:(%rax)
     fcd:	00 02                	add    %al,(%rdx)
     fcf:	4a 19 bc 0d 00 00 35 	sbb    %rdi,0x61350000(%rbp,%r9,1)
     fd6:	61 
     fd7:	62 73                	(bad)  
     fd9:	00 15 67 03 31 00    	add    %dl,0x310367(%rip)        # 311346 <_end+0x30d17e>
     fdf:	00 00                	add    %al,(%rax)
     fe1:	8b 13                	mov    (%rbx),%edx
     fe3:	00 00                	add    %al,(%rax)
     fe5:	ef                   	out    %eax,(%dx)
     fe6:	0f 00 00             	sldt   (%rax)
     fe9:	10 8b 13 00 00 00    	adc    %cl,0x13(%rbx)
     fef:	35 61 62 73 00       	xor    $0x736261,%eax
     ff4:	15 55 03 5b 00       	adc    $0x5b0355,%eax
     ff9:	00 00                	add    %al,(%rax)
     ffb:	56                   	push   %rsi
     ffc:	1f                   	(bad)  
     ffd:	00 00                	add    %al,(%rax)
     fff:	09 10                	or     %edx,(%rax)
    1001:	00 00                	add    %al,(%rax)
    1003:	10 56 1f             	adc    %dl,0x1f(%rsi)
    1006:	00 00                	add    %al,(%rax)
    1008:	00 35 61 62 73 00    	add    %dh,0x736261(%rip)        # 73726f <_end+0x7330a7>
    100e:	15 4f 03 1d 00       	adc    $0x1d034f,%eax
    1013:	00 00                	add    %al,(%rax)
    1015:	a0 13 00 00 23 10 00 	movabs 0x1000001023000013,%al
    101c:	00 10 
    101e:	a0 13 00 00 00 35 61 	movabs 0x7362613500000013,%al
    1025:	62 73 
    1027:	00 15 4b 03 27 00    	add    %dl,0x27034b(%rip)        # 271378 <_end+0x26d1b0>
    102d:	00 00                	add    %al,(%rax)
    102f:	92                   	xchg   %eax,%edx
    1030:	13 00                	adc    (%rax),%eax
    1032:	00 3d 10 00 00 10    	add    %bh,0x10000010(%rip)        # 10001048 <_end+0xfffce80>
    1038:	92                   	xchg   %eax,%edx
    1039:	13 00                	adc    (%rax),%eax
    103b:	00 00                	add    %al,(%rax)
    103d:	35 61 62 73 00       	xor    $0x736261,%eax
    1042:	15 47 03 13 00       	adc    $0x130347,%eax
    1047:	00 00                	add    %al,(%rax)
    1049:	99                   	cltd   
    104a:	13 00                	adc    (%rax),%eax
    104c:	00 57 10             	add    %dl,0x10(%rdi)
    104f:	00 00                	add    %al,(%rax)
    1051:	10 99 13 00 00 00    	adc    %bl,0x13(%rcx)
    1057:	35 61 62 73 00       	xor    $0x736261,%eax
    105c:	15 3d 03 05 21       	adc    $0x2105033d,%eax
    1061:	00 00                	add    %al,(%rax)
    1063:	bf 1e 00 00 71       	mov    $0x7100001e,%edi
    1068:	10 00                	adc    %al,(%rax)
    106a:	00 10                	add    %dl,(%rax)
    106c:	bf 1e 00 00 00       	mov    $0x1e,%edi
    1071:	35 61 62 73 00       	xor    $0x736261,%eax
    1076:	15 38 03 51 00       	adc    $0x510338,%eax
    107b:	00 00                	add    %al,(%rax)
    107d:	26 1c 00             	es sbb $0x0,%al
    1080:	00 8b 10 00 00 10    	add    %cl,0x10000010(%rbx)
    1086:	26 1c 00             	es sbb $0x0,%al
    1089:	00 00                	add    %al,(%rax)
    108b:	36 64 69 76 00 0e b1 	ss imul $0x8703b10e,%fs:0x0(%rsi),%esi
    1092:	03 87 
    1094:	21 00                	and    %eax,(%rax)
    1096:	00 9f 25 00 00 10    	add    %bl,0x10000025(%rdi)
    109c:	26 1c 00             	es sbb $0x0,%al
    109f:	00 10                	add    %dl,(%rax)
    10a1:	26 1c 00             	es sbb $0x0,%al
    10a4:	00 00                	add    %al,(%rax)
    10a6:	00 37                	add    %dh,(%rdi)
    10a8:	b5 1b                	mov    $0x1b,%ch
    10aa:	00 00                	add    %al,(%rax)
    10ac:	07                   	(bad)  
    10ad:	1a 01                	sbb    (%rcx),%al
    10af:	0b 84 13 00 00 03 76 	or     0x76030000(%rbx,%rdx,1),%eax
    10b6:	21 00                	and    %eax,(%rax)
    10b8:	00 07                	add    %al,(%rdi)
    10ba:	1c 01                	sbb    $0x1,%al
    10bc:	41 04 07             	rex.B add $0x7,%al
    10bf:	1c 01                	sbb    $0x1,%al
    10c1:	41 b4 10             	mov    $0x10,%r12b
    10c4:	00 00                	add    %al,(%rax)
    10c6:	05 03 fb 0b 82       	add    $0x820bfb03,%eax
    10cb:	1e                   	(bad)  
    10cc:	00 00                	add    %al,(%rax)
    10ce:	06                   	(bad)  
    10cf:	03 04 01             	add    (%rcx,%rax,1),%eax
    10d2:	0b 9e 1e 00 00 06    	or     0x600001e(%rsi),%ebx
    10d8:	03 05 01 0b c6 1e    	add    0x1ec60b01(%rip),%eax        # 1ec61bdf <_end+0x1ec5da17>
    10de:	00 00                	add    %al,(%rax)
    10e0:	22 d6                	and    %dh,%dl
    10e2:	2a 00                	sub    (%rax),%al
    10e4:	00 16                	add    %dl,(%rsi)
    10e6:	23 0b                	and    (%rbx),%ecx
    10e8:	05 17 2c 0e e2       	add    $0xe20e2c17,%eax
    10ed:	05 00 00 05 17       	add    $0x17050000,%eax
    10f2:	2d 0e 95 0b 00       	sub    $0xb950e,%eax
    10f7:	00 07                	add    %al,(%rdi)
    10f9:	c6 00 00             	movb   $0x0,(%rax)
    10fc:	00 01                	add    %al,(%rcx)
    10fe:	18 3d 0c 3f 11 00    	sbb    %bh,0x113f0c(%rip)        # 115010 <_end+0x110e48>
    1104:	00 38                	add    %bh,(%rax)
    1106:	5a                   	pop    %rdx
    1107:	0b 00                	or     (%rax),%eax
    1109:	00 18                	add    %bl,(%rax)
    110b:	46 19 1e             	rex.RX sbb %r11d,(%rsi)
    110e:	1f                   	(bad)  
    110f:	00 00                	add    %al,(%rax)
    1111:	38 05 27 00 00 18    	cmp    %al,0x18000027(%rip)        # 1800113e <_end+0x17ffcf76>
    1117:	47 18 7e 14          	rex.RXB sbb %r15b,0x14(%r14)
    111b:	00 00                	add    %al,(%rax)
    111d:	38 21                	cmp    %ah,(%rcx)
    111f:	28 00                	sub    %al,(%rax)
    1121:	00 18                	add    %bl,(%rax)
    1123:	4b 1b 7e 14          	rex.WXB sbb 0x14(%r14),%rdi
    1127:	00 00                	add    %al,(%rax)
    1129:	38 d8                	cmp    %bl,%al
    112b:	0c 00                	or     $0x0,%al
    112d:	00 18                	add    %bl,(%rax)
    112f:	4e 1b 7e 14          	rex.WRX sbb 0x14(%rsi),%r15
    1133:	00 00                	add    %al,(%rax)
    1135:	28 83 08 00 00 77    	sub    %al,0x77000008(%rbx)
    113b:	14 00                	adc    $0x0,%al
    113d:	00 00                	add    %al,(%rax)
    113f:	05 0e c8 0b d3       	add    $0xd30bc80e,%eax
    1144:	25 00 00 05 0e       	and    $0xe050000,%eax
    1149:	d8 0b                	fmuls  (%rbx)
    114b:	63 28                	movslq (%rax),%ebp
    114d:	00 00                	add    %al,(%rax)
    114f:	05 0e e3 0b 7f       	add    $0x7f0be30e,%eax
    1154:	28 00                	sub    %al,(%rax)
    1156:	00 05 0e e4 0b 95    	add    %al,-0x6af41bf2(%rip)        # ffffffff950bf56a <_end+0xffffffff950bb3a2>
    115c:	28 00                	sub    %al,(%rax)
    115e:	00 05 0e e5 0b b5    	add    %al,-0x4af41af2(%rip)        # ffffffffb50bf672 <_end+0xffffffffb50bb4aa>
    1164:	28 00                	sub    %al,(%rax)
    1166:	00 05 0e e7 0b d5    	add    %al,-0x2af418f2(%rip)        # ffffffffd50bf87a <_end+0xffffffffd50bb6b2>
    116c:	28 00                	sub    %al,(%rax)
    116e:	00 05 0e e8 0b f0    	add    %al,-0xff417f2(%rip)        # fffffffff00bf982 <_end+0xfffffffff00bb7ba>
    1174:	28 00                	sub    %al,(%rax)
    1176:	00 35 64 69 76 00    	add    %dh,0x766964(%rip)        # 767ae0 <_end+0x763918>
    117c:	0e                   	(bad)  
    117d:	d5                   	(bad)  
    117e:	03 92 26 00 00 d3    	add    -0x2cffffda(%rdx),%edx
    1184:	25 00 00 96 11       	and    $0x11960000,%eax
    1189:	00 00                	add    %al,(%rax)
    118b:	10 bf 1e 00 00 10    	adc    %bh,0x1000001e(%rdi)
    1191:	bf 1e 00 00 00       	mov    $0x1e,%edi
    1196:	07                   	(bad)  
    1197:	5d                   	pop    %rbp
    1198:	29 00                	sub    %eax,(%rax)
    119a:	00 01                	add    %al,(%rcx)
    119c:	18 9c 0c dd 11 00 00 	sbb    %bl,0x11dd(%rsp,%rcx,1)
    11a3:	38 dd                	cmp    %bl,%ch
    11a5:	29 00                	sub    %eax,(%rax)
    11a7:	00 18                	add    %bl,(%rax)
    11a9:	9f                   	lahf   
    11aa:	18 7e 14             	sbb    %bh,0x14(%rsi)
    11ad:	00 00                	add    %al,(%rax)
    11af:	38 5a 0b             	cmp    %bl,0xb(%rdx)
    11b2:	00 00                	add    %al,(%rax)
    11b4:	18 a2 19 1e 1f 00    	sbb    %ah,0x1f1e19(%rdx)
    11ba:	00 38                	add    %bh,(%rax)
    11bc:	7e 07                	jle    11c5 <pthread_mutex_lock@plt+0x5>
    11be:	00 00                	add    %al,(%rax)
    11c0:	18 a3 18 7e 14 00    	sbb    %ah,0x147e18(%rbx)
    11c6:	00 38                	add    %bh,(%rax)
    11c8:	a9 16 00 00 18       	test   $0x18000016,%eax
    11cd:	a4                   	movsb  %ds:(%rsi),%es:(%rdi)
    11ce:	18 7e 14             	sbb    %bh,0x14(%rsi)
    11d1:	00 00                	add    %al,(%rax)
    11d3:	28 83 08 00 00 92    	sub    %al,-0x6dfffff8(%rbx)
    11d9:	13 00                	adc    (%rax),%eax
    11db:	00 00                	add    %al,(%rax)
    11dd:	07                   	(bad)  
    11de:	ad                   	lods   %ds:(%rsi),%eax
    11df:	1d 00 00 01 18       	sbb    $0x18010000,%eax
    11e4:	9c                   	pushfq 
    11e5:	0c 24                	or     $0x24,%al
    11e7:	12 00                	adc    (%rax),%al
    11e9:	00 38                	add    %bh,(%rax)
    11eb:	dd 29                	(bad)  (%rcx)
    11ed:	00 00                	add    %al,(%rax)
    11ef:	18 9f 18 7e 14 00    	sbb    %bl,0x147e18(%rdi)
    11f5:	00 38                	add    %bh,(%rax)
    11f7:	5a                   	pop    %rdx
    11f8:	0b 00                	or     (%rax),%eax
    11fa:	00 18                	add    %bl,(%rax)
    11fc:	a2 19 1e 1f 00 00 38 	movabs %al,0x77e3800001f1e19
    1203:	7e 07 
    1205:	00 00                	add    %al,(%rax)
    1207:	18 a3 18 7e 14 00    	sbb    %ah,0x147e18(%rbx)
    120d:	00 38                	add    %bh,(%rax)
    120f:	a9 16 00 00 18       	test   $0x18000016,%eax
    1214:	a4                   	movsb  %ds:(%rsi),%es:(%rdi)
    1215:	18 7e 14             	sbb    %bh,0x14(%rsi)
    1218:	00 00                	add    %al,(%rax)
    121a:	28 83 08 00 00 99    	sub    %al,-0x66fffff8(%rbx)
    1220:	13 00                	adc    (%rax),%eax
    1222:	00 00                	add    %al,(%rax)
    1224:	07                   	(bad)  
    1225:	54                   	push   %rsp
    1226:	06                   	(bad)  
    1227:	00 00                	add    %al,(%rax)
    1229:	01 18                	add    %ebx,(%rax)
    122b:	9c                   	pushfq 
    122c:	0c 6b                	or     $0x6b,%al
    122e:	12 00                	adc    (%rax),%al
    1230:	00 38                	add    %bh,(%rax)
    1232:	dd 29                	(bad)  (%rcx)
    1234:	00 00                	add    %al,(%rax)
    1236:	18 9f 18 7e 14 00    	sbb    %bl,0x147e18(%rdi)
    123c:	00 38                	add    %bh,(%rax)
    123e:	5a                   	pop    %rdx
    123f:	0b 00                	or     (%rax),%eax
    1241:	00 18                	add    %bl,(%rax)
    1243:	a2 19 1e 1f 00 00 38 	movabs %al,0x77e3800001f1e19
    124a:	7e 07 
    124c:	00 00                	add    %al,(%rax)
    124e:	18 a3 18 7e 14 00    	sbb    %ah,0x147e18(%rbx)
    1254:	00 38                	add    %bh,(%rax)
    1256:	a9 16 00 00 18       	test   $0x18000016,%eax
    125b:	a4                   	movsb  %ds:(%rsi),%es:(%rdi)
    125c:	18 7e 14             	sbb    %bh,0x14(%rsi)
    125f:	00 00                	add    %al,(%rax)
    1261:	28 83 08 00 00 a0    	sub    %al,-0x5ffffff8(%rbx)
    1267:	13 00                	adc    (%rax),%eax
    1269:	00 00                	add    %al,(%rax)
    126b:	07                   	(bad)  
    126c:	f3 29 00             	repz sub %eax,(%rax)
    126f:	00 01                	add    %al,(%rcx)
    1271:	18 3d 0c b2 12 00    	sbb    %bh,0x12b20c(%rip)        # 12c483 <_end+0x1282bb>
    1277:	00 38                	add    %bh,(%rax)
    1279:	5a                   	pop    %rdx
    127a:	0b 00                	or     (%rax),%eax
    127c:	00 18                	add    %bl,(%rax)
    127e:	46 19 1e             	rex.RX sbb %r11d,(%rsi)
    1281:	1f                   	(bad)  
    1282:	00 00                	add    %al,(%rax)
    1284:	38 05 27 00 00 18    	cmp    %al,0x18000027(%rip)        # 180012b1 <_end+0x17ffd0e9>
    128a:	47 18 7e 14          	rex.RXB sbb %r15b,0x14(%r14)
    128e:	00 00                	add    %al,(%rax)
    1290:	38 21                	cmp    %ah,(%rcx)
    1292:	28 00                	sub    %al,(%rax)
    1294:	00 18                	add    %bl,(%rax)
    1296:	4b 1b ba 13 00 00 38 	rex.WXB sbb 0x38000013(%r10),%rdi
    129d:	d8 0c 00             	fmuls  (%rax,%rax,1)
    12a0:	00 18                	add    %bl,(%rax)
    12a2:	4e 1b ba 13 00 00 28 	rex.WRX sbb 0x28000013(%rdx),%r15
    12a9:	83 08 00             	orl    $0x0,(%rax)
    12ac:	00 b3 13 00 00 00    	add    %dh,0x13(%rbx)
    12b2:	07                   	(bad)  
    12b3:	19 07                	sbb    %eax,(%rdi)
    12b5:	00 00                	add    %al,(%rax)
    12b7:	01 18                	add    %ebx,(%rax)
    12b9:	3d 0c f9 12 00       	cmp    $0x12f90c,%eax
    12be:	00 38                	add    %bh,(%rax)
    12c0:	5a                   	pop    %rdx
    12c1:	0b 00                	or     (%rax),%eax
    12c3:	00 18                	add    %bl,(%rax)
    12c5:	46 19 1e             	rex.RX sbb %r11d,(%rsi)
    12c8:	1f                   	(bad)  
{
    12c9:	00 00                	add    %al,(%rax)
    12cb:	38 05 27 00 00 18    	cmp    %al,0x18000027(%rip)        # 180012f8 <_end+0x17ffd130>
  std::cout << "calling foo" << std::endl;
    12d1:	47 18 7e 14          	rex.RXB sbb %r15b,0x14(%r14)
    12d5:	00 00                	add    %al,(%rax)
    12d7:	38 21                	cmp    %ah,(%rcx)
    12d9:	28 00                	sub    %al,(%rax)
    12db:	00 18                	add    %bl,(%rax)
    12dd:	4b 1b 72 14          	rex.WXB sbb 0x14(%r10),%rsi
    12e1:	00 00                	add    %al,(%rax)
    12e3:	38 d8                	cmp    %bl,%al
    12e5:	0c 00                	or     $0x0,%al
    12e7:	00 18                	add    %bl,(%rax)
    12e9:	4e 1b 72 14          	rex.WRX sbb 0x14(%rdx),%r14
    12ed:	00 00                	add    %al,(%rax)
    12ef:	28 83 08 00 00 6b    	sub    %al,0x6b000008(%rbx)
    12f5:	14 00                	adc    $0x0,%al
    12f7:	00 00                	add    %al,(%rax)
}
    12f9:	07                   	(bad)  
    12fa:	55                   	push   %rbp
    12fb:	28 00                	sub    %al,(%rax)
{
    12fd:	00 01                	add    %al,(%rcx)
    12ff:	18 3d 0c 40 13 00    	sbb    %bh,0x13400c(%rip)        # 135311 <_end+0x131149>
    1305:	00 38                	add    %bh,(%rax)
    1307:	5a                   	pop    %rdx
    1308:	0b 00                	or     (%rax),%eax
    130a:	00 18                	add    %bl,(%rax)
  pthread_mutex_lock(&lock);
    130c:	46 19 1e             	rex.RX sbb %r11d,(%rsi)
    130f:	1f                   	(bad)  
    1310:	00 00                	add    %al,(%rax)
    1312:	38 05 27 00 00 18    	cmp    %al,0x18000027(%rip)        # 1800133f <_end+0x17ffd177>
  foo();
    1318:	47 18 7e 14          	rex.RXB sbb %r15b,0x14(%r14)
    131c:	00 00                	add    %al,(%rax)
  pthread_mutex_unlock(&lock);
    131e:	38 21                	cmp    %ah,(%rcx)
    1320:	28 00                	sub    %al,(%rax)
    1322:	00 18                	add    %bl,(%rax)
    1324:	4b 1b 51 1f          	rex.WXB sbb 0x1f(%r9),%rdx
    1328:	00 00                	add    %al,(%rax)
  sleep(2);
    132a:	38 d8                	cmp    %bl,%al
    132c:	0c 00                	or     $0x0,%al
    132e:	00 18                	add    %bl,(%rax)
    1330:	4e 1b 51 1f          	rex.WRX sbb 0x1f(%rcx),%r10
  pthread_barrier_wait(&barrier);
    1334:	00 00                	add    %al,(%rax)
    1336:	28 83 08 00 00 4a    	sub    %al,0x4a000008(%rbx)
    133c:	1f                   	(bad)  
    133d:	00 00                	add    %al,(%rax)
  return NULL;
    133f:	00 39                	add    %bh,(%rcx)
    1341:	5e                   	pop    %rsi
    1342:	1d 00 00 01 18       	sbb    $0x18010000,%eax
{
    1347:	3d 0c 38 5a 0b       	cmp    $0xb5a380c,%eax
    134c:	00 00                	add    %al,(%rax)
    134e:	18 46 19             	sbb    %al,0x19(%rsi)
    1351:	1e                   	(bad)  
    1352:	1f                   	(bad)  
    1353:	00 00                	add    %al,(%rax)
    1355:	38 05 27 00 00 18    	cmp    %al,0x18000027(%rip)        # 18001382 <_end+0x17ffd1ba>
    135b:	47 18 7e 14          	rex.RXB sbb %r15b,0x14(%r14)
    135f:	00 00                	add    %al,(%rax)
    1361:	38 21                	cmp    %ah,(%rcx)
  pthread_barrier_init(&barrier, NULL, NUM_THREAD);
    1363:	28 00                	sub    %al,(%rax)
    1365:	00 18                	add    %bl,(%rax)
    1367:	4b 1b 2d 1c 00 00 38 	rex.WXB sbb 0x3800001c(%rip),%rbp        # 3800138a <_end+0x37ffd1c2>
    136e:	d8 0c 00             	fmuls  (%rax,%rax,1)
    1371:	00 18                	add    %bl,(%rax)
    1373:	4e 1b 2d 1c 00 00 28 	rex.WRX sbb 0x2800001c(%rip),%r13        # 28001396 <_end+0x27ffd1ce>
  for (int i = 0; i < NUM_THREAD; i++) {
    137a:	83 08 00             	orl    $0x0,(%rax)
    137d:	00 26                	add    %ah,(%rsi)
    137f:	1c 00                	sbb    $0x0,%al
    1381:	00 00                	add    %al,(%rax)
    1383:	00 3a                	add    %bh,(%rdx)
    int err = pthread_create(&threadId[i], NULL, &threadFunc, NULL);
    1385:	20 03                	and    %al,(%rbx)
    1387:	1e                   	(bad)  
    1388:	1c 00                	sbb    $0x0,%al
    138a:	00 3a                	add    %bh,(%rdx)
    138c:	10 04 e7             	adc    %al,(%rdi,%riz,8)
    138f:	14 00                	adc    $0x0,%al
    1391:	00 3a                	add    %bh,(%rdx)
    1393:	04 04                	add    $0x4,%al
    1395:	81 18 00 00 3a 08    	sbbl   $0x83a0000,(%rax)
    139b:	04 dd                	add    $0xdd,%al
    139d:	1c 00                	sbb    $0x0,%al
    139f:	00 3a                	add    %bh,(%rdx)
    13a1:	10 04 d8             	adc    %al,(%rax,%rbx,8)
    13a4:	1c 00                	sbb    $0x0,%al
    13a6:	00 1b                	add    %bl,(%rbx)
    13a8:	71 00                	jno    13aa <main+0x64>
    13aa:	00 00                	add    %al,(%rax)
    13ac:	19 d1                	sbb    %edx,%ecx
    13ae:	17                   	(bad)  
    13af:	b3 13                	mov    $0x13,%bl
    13b1:	00 00                	add    %al,(%rax)
    if (err)
    13b3:	3a 08                	cmp    (%rax),%cl
    13b5:	07                   	(bad)  
    13b6:	fb                   	sti    
    13b7:	1e                   	(bad)  
      std::cout << "Thread creation failed : " << strerror(err);
    13b8:	00 00                	add    %al,(%rax)
    13ba:	0a b3 13 00 00 3b    	or     0x3b000013(%rbx),%dh
    13c0:	b3 2c                	mov    $0x2c,%bl
    13c2:	00 00                	add    %al,(%rax)
    13c4:	18 1a                	sbb    %bl,(%rdx)
    13c6:	00 fc                	add    %bh,%ah
    13c8:	13 00                	adc    (%rax),%eax
    13ca:	00 3c 1c             	add    %bh,(%rsp,%rbx,1)
    13cd:	18 00                	sbb    %al,(%rax)
    13cf:	00 1a                	add    %bl,(%rdx)
    13d1:	00 fc                	add    %bh,%ah
    13d3:	13 00                	adc    (%rax),%eax
    13d5:	00 00                	add    %al,(%rax)
    13d7:	3c 57                	cmp    $0x57,%al
    13d9:	0d 00 00 1a 00       	or     $0x1a0000,%eax
    13de:	fc                   	cld    
    13df:	13 00                	adc    (%rax),%eax
    13e1:	00 04 3c             	add    %al,(%rsp,%rdi,1)
      return err;
    13e4:	0c 1b                	or     $0x1b,%al
    13e6:	00 00                	add    %al,(%rax)
  for (int i = 0; i < NUM_THREAD; i++) {
    13e8:	1a 00                	sbb    (%rax),%al
    13ea:	03 14 00             	add    (%rax,%rax,1),%edx
    13ed:	00 08                	add    %cl,(%rax)
  for (int i = 0; i < NUM_THREAD; i++) {
    13ef:	3c f6                	cmp    $0xf6,%al
    13f1:	07                   	(bad)  
    13f2:	00 00                	add    %al,(%rax)
    13f4:	1a 00                	sbb    (%rax),%al
    13f6:	03 14 00             	add    (%rax,%rax,1),%edx
    13f9:	00 10                	add    %dl,(%rax)
    pthread_join(threadId[i], NULL);
    13fb:	00 3a                	add    %bh,(%rdx)
    13fd:	04 07                	add    $0x7,%al
    13ff:	00 1f                	add    %bl,(%rdi)
    1401:	00 00                	add    %al,(%rax)
    1403:	3d 08 1b 4b 22       	cmp    $0x224b1b08,%eax
    1408:	00 00                	add    %al,(%rax)
    140a:	1b 14 17             	sbb    (%rdi,%rdx,1),%edx
    140d:	fc                   	cld    
    140e:	13 00                	adc    (%rax),%eax
    1410:	00 3e                	add    %bh,(%rsi)
  for (int i = 0; i < NUM_THREAD; i++) {
    1412:	08 1c 0e             	or     %bl,(%rsi,%rcx,1)
    1415:	01 f7                	add    %esi,%edi
    1417:	26 00 00             	add    %al,%es:(%rax)
  return 0;
    141a:	5b                   	pop    %rbx
    141b:	14 00                	adc    $0x0,%al
}
    141d:	00 3f                	add    %bh,(%rdi)
    141f:	04 1c                	add    $0x1c,%al
    1421:	11 03                	adc    %eax,(%rbx)
    1423:	40 14 00             	adc    $0x0,%al
    1426:	00 40 27             	add    %al,0x27(%rax)
    1429:	05 00 00 1c 12       	add    $0x121c0000,%eax
    142e:	13 fc                	adc    %esp,%edi
    1430:	13 00                	adc    (%rax),%eax
    1432:	00 40 f9             	add    %al,-0x7(%rax)
    1435:	1d 00 00 1c 13       	sbb    $0x131c0000,%eax
    143a:	0a 5b 14             	or     0x14(%rbx),%bl
    143d:	00 00                	add    %al,(%rax)
    143f:	00 0e                	add    %cl,(%rsi)
    1441:	a0 1b 00 00 1c 0f 07 	movabs 0x1477070f1c00001b,%al
    1448:	77 14 
    144a:	00 00                	add    %al,(%rax)
    144c:	00 0e                	add    %cl,(%rsi)
    144e:	97                   	xchg   %eax,%edi
    144f:	00 00                	add    %al,(%rax)
    1451:	00 1c 14             	add    %bl,(%rsp,%rdx,1)
    1454:	05 1e 14 00 00       	add    $0x141e,%eax
    1459:	04 00                	add    $0x0,%al
    145b:	41 6b 14 00 00       	imul   $0x0,(%r8,%rax,1),%edx
    1460:	6b 14 00 00          	imul   $0x0,(%rax,%rax,1),%edx
    1464:	42 b3 13             	rex.X mov $0x13,%bl
    1467:	00 00                	add    %al,(%rax)
    1469:	03 00                	add    (%rax),%eax
    146b:	3a 01                	cmp    (%rcx),%al
    146d:	06                   	(bad)  
    146e:	d6                   	(bad)  
    146f:	09 00                	or     %eax,(%rax)
    1471:	00 0a                	add    %cl,(%rdx)
    1473:	6b 14 00 00          	imul   $0x0,(%rax,%rax,1),%edx
    1477:	43 04 05             	rex.XB add $0x5,%al
    147a:	69 6e 74 00 0a 77 14 	imul   $0x14770a00,0x74(%rsi),%ebp
    1481:	00 00                	add    %al,(%rax)
    1483:	1b f9                	sbb    %ecx,%edi
    1485:	26 00 00             	add    %al,%es:(%rax)
    1488:	1c 15                	sbb    $0x15,%al
    148a:	03 11                	add    (%rcx),%edx
    148c:	14 00                	adc    $0x0,%al
    148e:	00 1b                	add    %bl,(%rbx)
    1490:	fb                   	sti    
    1491:	26 00 00             	add    %al,%es:(%rax)
    1494:	1d 06 15 83 14       	sbb    $0x14831506,%eax
    1499:	00 00                	add    %al,(%rax)
    149b:	0a 8f 14 00 00 1b    	or     0x1b000014(%rdi),%cl
    14a1:	97                   	xchg   %eax,%edi
    14a2:	21 00                	and    %eax,(%rax)
    14a4:	00 1e                	add    %bl,(%rsi)
    14a6:	05 19 ac 14 00       	add    $0x14ac19,%eax
    14ab:	00 07                	add    %al,(%rdi)
    14ad:	07                   	(bad)  
    14ae:	09 00                	or     %eax,(%rax)
    14b0:	00 d8                	add    %bl,%al
    14b2:	1f                   	(bad)  
    14b3:	31 08                	xor    %ecx,(%rax)
    14b5:	33 16                	xor    (%rsi),%edx
    14b7:	00 00                	add    %al,(%rax)
    14b9:	0e                   	(bad)  
    14ba:	3d 1b 00 00 1f       	cmp    $0x1f00001b,%eax
    14bf:	33 07                	xor    (%rdi),%eax
    14c1:	77 14                	ja     14d7 <__libc_csu_init+0x37>
    14c3:	00 00                	add    %al,(%rax)
    14c5:	00 0e                	add    %cl,(%rsi)
    14c7:	59                   	pop    %rcx
    14c8:	2b 00                	sub    (%rax),%eax
    14ca:	00 1f                	add    %bl,(%rdi)
    14cc:	36 09 90 19 00 00 08 	or     %edx,%ss:0x8000019(%rax)
    14d3:	0e                   	(bad)  
    14d4:	27                   	(bad)  
    14d5:	28 00                	sub    %al,(%rax)
    14d7:	00 1f                	add    %bl,(%rdi)
    14d9:	37                   	(bad)  
    14da:	09 90 19 00 00 10    	or     %edx,0x10000019(%rax)
    14e0:	0e                   	(bad)  
    14e1:	98                   	cwtl   
    14e2:	13 00                	adc    (%rax),%eax
    14e4:	00 1f                	add    %bl,(%rdi)
    14e6:	38 09                	cmp    %cl,(%rcx)
    14e8:	90                   	nop
    14e9:	19 00                	sbb    %eax,(%rax)
    14eb:	00 18                	add    %bl,(%rax)
    14ed:	0e                   	(bad)  
    14ee:	9c                   	pushfq 
    14ef:	02 00                	add    (%rax),%al
    14f1:	00 1f                	add    %bl,(%rdi)
    14f3:	39 09                	cmp    %ecx,(%rcx)
    14f5:	90                   	nop
    14f6:	19 00                	sbb    %eax,(%rax)
    14f8:	00 20                	add    %ah,(%rax)
    14fa:	0e                   	(bad)  
    14fb:	dc 2a                	fsubrl (%rdx)
    14fd:	00 00                	add    %al,(%rax)
    14ff:	1f                   	(bad)  
    1500:	3a 09                	cmp    (%rcx),%cl
    1502:	90                   	nop
    1503:	19 00                	sbb    %eax,(%rax)
    1505:	00 28                	add    %ch,(%rax)
    1507:	0e                   	(bad)  
    1508:	67 17                	addr32 (bad) 
    150a:	00 00                	add    %al,(%rax)
    150c:	1f                   	(bad)  
    150d:	3b 09                	cmp    (%rcx),%ecx
    150f:	90                   	nop
    1510:	19 00                	sbb    %eax,(%rax)
    1512:	00 30                	add    %dh,(%rax)
    1514:	0e                   	(bad)  
    1515:	cc                   	int3   
    1516:	18 00                	sbb    %al,(%rax)
    1518:	00 1f                	add    %bl,(%rdi)
    151a:	3c 09                	cmp    $0x9,%al
    151c:	90                   	nop
    151d:	19 00                	sbb    %eax,(%rax)
    151f:	00 38                	add    %bh,(%rax)
    1521:	0e                   	(bad)  
    1522:	51                   	push   %rcx
    1523:	23 00                	and    (%rax),%eax
    1525:	00 1f                	add    %bl,(%rdi)
    1527:	3d 09 90 19 00       	cmp    $0x199009,%eax
    152c:	00 40 0e             	add    %al,0xe(%rax)
    152f:	67 03 00             	add    (%eax),%eax
    1532:	00 1f                	add    %bl,(%rdi)
    1534:	40 09 90 19 00 00 48 	rex or %edx,0x48000019(%rax)
    153b:	0e                   	(bad)  
    153c:	f1                   	icebp  
    153d:	21 00                	and    %eax,(%rax)
    153f:	00 1f                	add    %bl,(%rdi)
    1541:	41 09 90 19 00 00 50 	or     %edx,0x50000019(%r8)
    1548:	0e                   	(bad)  
    1549:	8f 01                	popq   (%rcx)
    154b:	00 00                	add    %al,(%rax)
    154d:	1f                   	(bad)  
    154e:	42 09 90 19 00 00 58 	rex.X or %edx,0x58000019(%rax)
    1555:	0e                   	(bad)  
    1556:	40 0e                	rex (bad) 
    1558:	00 00                	add    %al,(%rax)
    155a:	1f                   	(bad)  
    155b:	44 16                	rex.R (bad) 
    155d:	4c 29 00             	sub    %r8,(%rax)
    1560:	00 60 0e             	add    %ah,0xe(%rax)
    1563:	af                   	scas   %es:(%rdi),%eax
    1564:	04 00                	add    $0x0,%al
    1566:	00 1f                	add    %bl,(%rdi)
    1568:	46 14 52             	rex.RX adc $0x52,%al
    156b:	29 00                	sub    %eax,(%rax)
    156d:	00 68 0e             	add    %ch,0xe(%rax)
    1570:	fe                   	(bad)  
    1571:	28 00                	sub    %al,(%rax)
    1573:	00 1f                	add    %bl,(%rdi)
    1575:	48 07                	rex.W (bad) 
    1577:	77 14                	ja     158d <_fini+0x75>
    1579:	00 00                	add    %al,(%rax)
    157b:	70 0e                	jo     158b <_fini+0x73>
    157d:	11 13                	adc    %edx,(%rbx)
    157f:	00 00                	add    %al,(%rax)
    1581:	1f                   	(bad)  
    1582:	49 07                	rex.WB (bad) 
    1584:	77 14                	ja     159a <_fini+0x82>
    1586:	00 00                	add    %al,(%rax)
    1588:	74 0e                	je     1598 <_fini+0x80>
    158a:	2b 15 00 00 1f 4a    	sub    0x4a1f0000(%rip),%edx        # 4a1f1590 <_end+0x4a1ed3c8>
    1590:	0b a4 20 00 00 78 0e 	or     0xe780000(%rax,%riz,1),%esp
    1597:	da 04 00             	fiaddl (%rax,%rax,1)
    159a:	00 1f                	add    %bl,(%rdi)
    159c:	4d 12 3f             	rex.WRB adc (%r15),%r15b
    159f:	16                   	(bad)  
    15a0:	00 00                	add    %al,(%rax)
    15a2:	80 0e 20             	orb    $0x20,(%rsi)
    15a5:	26 00 00             	add    %al,%es:(%rax)
    15a8:	1f                   	(bad)  
    15a9:	4e 0f 43 1f          	rex.WRX cmovae (%rdi),%r11
    15ad:	00 00                	add    %al,(%rax)
    15af:	82                   	(bad)  
    15b0:	0e                   	(bad)  
    15b1:	0b 22                	or     (%rdx),%esp
    15b3:	00 00                	add    %al,(%rax)
    15b5:	1f                   	(bad)  
    15b6:	4f 08 58 29          	rex.WRXB or %r11b,0x29(%r8)
    15ba:	00 00                	add    %al,(%rax)
    15bc:	83 0e 21             	orl    $0x21,(%rsi)
    15bf:	05 00 00 1f 51       	add    $0x511f0000,%eax
    15c4:	0f 68 29             	punpckhbw (%rcx),%mm5
    15c7:	00 00                	add    %al,(%rax)
    15c9:	88 0e                	mov    %cl,(%rsi)
    15cb:	2f                   	(bad)  
    15cc:	15 00 00 1f 59       	adc    $0x591f0000,%eax
    15d1:	0d b0 20 00 00       	or     $0x20b0,%eax
    15d6:	90                   	nop
    15d7:	0e                   	(bad)  
    15d8:	f8                   	clc    
    15d9:	00 00                	add    %al,(%rax)
    15db:	00 1f                	add    %bl,(%rdi)
    15dd:	5b                   	pop    %rbx
    15de:	17                   	(bad)  
    15df:	73 29                	jae    160a <_fini+0xf2>
    15e1:	00 00                	add    %al,(%rax)
    15e3:	98                   	cwtl   
    15e4:	0e                   	(bad)  
    15e5:	25 09 00 00 1f       	and    $0x1f000009,%eax
    15ea:	5c                   	pop    %rsp
    15eb:	19 7e 29             	sbb    %edi,0x29(%rsi)
    15ee:	00 00                	add    %al,(%rax)
    15f0:	a0 0e 0d 17 00 00 1f 	movabs 0x145d1f0000170d0e,%al
    15f7:	5d 14 
    15f9:	52                   	push   %rdx
    15fa:	29 00                	sub    %eax,(%rax)
    15fc:	00 a8 0e d0 20 00    	add    %ch,0x20d00e(%rax)
    1602:	00 1f                	add    %bl,(%rdi)
    1604:	5e                   	pop    %rsi
    1605:	09 03                	or     %eax,(%rbx)
    1607:	14 00                	adc    $0x0,%al
    1609:	00 b0 0e 1e 1a 00    	add    %dh,0x1a1e0e(%rax)
    160f:	00 1f                	add    %bl,(%rdi)
    1611:	5f                   	pop    %rdi
    1612:	0a a7 13 00 00 b8    	or     -0x47ffffed(%rdi),%ah
    1618:	0e                   	(bad)  
    1619:	62                   	(bad)  
    161a:	1b 00                	sbb    (%rax),%eax
    161c:	00 1f                	add    %bl,(%rdi)
    161e:	60                   	(bad)  
    161f:	07                   	(bad)  
    1620:	77 14                	ja     1636 <_fini+0x11e>
    1622:	00 00                	add    %al,(%rax)
    1624:	c0 0e 38             	rorb   $0x38,(%rsi)
    1627:	11 00                	adc    %eax,(%rax)
    1629:	00 1f                	add    %bl,(%rdi)
    162b:	62                   	(bad)  
    162c:	08 84 29 00 00 c4 00 	or     %al,0xc40000(%rcx,%rbp,1)
    1633:	1b 0b                	sbb    (%rbx),%ecx
    1635:	09 00                	or     %eax,(%rax)
    1637:	00 20                	add    %ah,(%rax)
    1639:	07                   	(bad)  
    163a:	19 ac 14 00 00 3a 02 	sbb    %ebp,0x23a0000(%rsp,%rdx,1)
    1641:	07                   	(bad)  
    1642:	54                   	push   %rsp
    1643:	2a 00                	sub    (%rax),%al
    1645:	00 44 08 72          	add    %al,0x72(%rax,%rcx,1)
    1649:	14 00                	adc    $0x0,%al
    164b:	00 0a                	add    %cl,(%rdx)
    164d:	46 16                	rex.RX (bad) 
    164f:	00 00                	add    %al,(%rax)
    1651:	45 61                	rex.RB (bad) 
    1653:	17                   	(bad)  
    1654:	00 00                	add    %al,(%rax)
    1656:	21 1c 01             	and    %ebx,(%rcx,%rax,1)
    1659:	0f 05                	syscall 
    165b:	14 00                	adc    $0x0,%al
    165d:	00 68 16             	add    %ch,0x16(%rax)
    1660:	00 00                	add    %al,(%rax)
    1662:	10 77 14             	adc    %dh,0x14(%rdi)
    1665:	00 00                	add    %al,(%rax)
    1667:	00 45 81             	add    %al,-0x7f(%rbp)
    166a:	09 00                	or     %eax,(%rax)
    166c:	00 21                	add    %ah,(%rcx)
    166e:	d6                   	(bad)  
    166f:	02 0f                	add    (%rdi),%cl
    1671:	05 14 00 00 7f       	add    $0x7f000014,%eax
    1676:	16                   	(bad)  
    1677:	00 00                	add    %al,(%rax)
    1679:	10 7f 16             	adc    %bh,0x16(%rdi)
    167c:	00 00                	add    %al,(%rax)
    167e:	00 44 08 a0          	add    %al,-0x60(%rax,%rcx,1)
    1682:	14 00                	adc    $0x0,%al
    1684:	00 45 b8             	add    %al,-0x48(%rbp)
    1687:	09 00                	or     %eax,(%rax)
    1689:	00 21                	add    %ah,(%rcx)
    168b:	f3 02 11             	repz add (%rcx),%dl
    168e:	a6                   	cmpsb  %es:(%rdi),%ds:(%rsi)
    168f:	16                   	(bad)  
    1690:	00 00                	add    %al,(%rax)
    1692:	a6                   	cmpsb  %es:(%rdi),%ds:(%rsi)
    1693:	16                   	(bad)  
    1694:	00 00                	add    %al,(%rax)
    1696:	10 a6 16 00 00 10    	adc    %ah,0x10000016(%rsi)
    169c:	77 14                	ja     16b2 <_fini+0x19a>
    169e:	00 00                	add    %al,(%rax)
    16a0:	10 7f 16             	adc    %bh,0x16(%rdi)
    16a3:	00 00                	add    %al,(%rax)
    16a5:	00 44 08 ac          	add    %al,-0x54(%rax,%rcx,1)
    16a9:	16                   	(bad)  
    16aa:	00 00                	add    %al,(%rax)
    16ac:	3a 04 05 ab 2c 00 00 	cmp    0x2cab(,%rax,1),%al
    16b3:	0a ac 16 00 00 45 ec 	or     -0x13bb0000(%rsi,%rdx,1),%ch
    16ba:	29 00                	sub    %eax,(%rax)
    16bc:	00 21                	add    %ah,(%rcx)
    16be:	e4 02                	in     $0x2,%al
    16c0:	0f 05                	syscall 
    16c2:	14 00                	adc    $0x0,%al
    16c4:	00 d4                	add    %dl,%ah
    16c6:	16                   	(bad)  
    16c7:	00 00                	add    %al,(%rax)
    16c9:	10 ac 16 00 00 10 7f 	adc    %ch,0x7f100000(%rsi,%rdx,1)
    16d0:	16                   	(bad)  
    16d1:	00 00                	add    %al,(%rax)
    16d3:	00 45 ea             	add    %al,-0x16(%rbp)
    16d6:	2a 00                	sub    (%rax),%al
    16d8:	00 21                	add    %ah,(%rcx)
    16da:	fa                   	cli    
    16db:	02 0c 77             	add    (%rdi,%rsi,2),%cl
    16de:	14 00                	adc    $0x0,%al
    16e0:	00 f0                	add    %dh,%al
    16e2:	16                   	(bad)  
    16e3:	00 00                	add    %al,(%rax)
    16e5:	10 f0                	adc    %dh,%al
    16e7:	16                   	(bad)  
    16e8:	00 00                	add    %al,(%rax)
    16ea:	10 7f 16             	adc    %bh,0x16(%rdi)
    16ed:	00 00                	add    %al,(%rax)
    16ef:	00 44 08 b3          	add    %al,-0x4d(%rax,%rcx,1)
    16f3:	16                   	(bad)  
    16f4:	00 00                	add    %al,(%rax)
    16f6:	45                   	rex.RB
    16f7:	67 10 00             	adc    %al,(%eax)
    16fa:	00 21                	add    %ah,(%rcx)
    16fc:	3d 02 0c 77 14       	cmp    $0x14770c02,%eax
    1701:	00 00                	add    %al,(%rax)
    1703:	12 17                	adc    (%rdi),%dl
    1705:	00 00                	add    %al,(%rax)
    1707:	10 7f 16             	adc    %bh,0x16(%rdi)
    170a:	00 00                	add    %al,(%rax)
    170c:	10 77 14             	adc    %dh,0x14(%rdi)
    170f:	00 00                	add    %al,(%rax)
    1711:	00 45 b8             	add    %al,-0x48(%rbp)
    1714:	18 00                	sbb    %al,(%rax)
    1716:	00 21                	add    %ah,(%rcx)
    1718:	44 02 0c 77          	add    (%rdi,%rsi,2),%r9b
    171c:	14 00                	adc    $0x0,%al
    171e:	00 2f                	add    %ch,(%rdi)
    1720:	17                   	(bad)  
    1721:	00 00                	add    %al,(%rax)
    1723:	10 7f 16             	adc    %bh,0x16(%rdi)
    1726:	00 00                	add    %al,(%rax)
    1728:	10 f0                	adc    %dh,%al
    172a:	16                   	(bad)  
    172b:	00 00                	add    %al,(%rax)
    172d:	46 00 26             	rex.RX add %r12b,(%rsi)
    1730:	87 0a                	xchg   %ecx,(%rdx)
    1732:	00 00                	add    %al,(%rax)
    1734:	21 80 02 0c 7e 0a    	and    %eax,0xa7e0c02(%rax)
    173a:	00 00                	add    %al,(%rax)
    173c:	77 14                	ja     1752 <_fini+0x23a>
    173e:	00 00                	add    %al,(%rax)
    1740:	50                   	push   %rax
    1741:	17                   	(bad)  
    1742:	00 00                	add    %al,(%rax)
    1744:	10 7f 16             	adc    %bh,0x16(%rdi)
    1747:	00 00                	add    %al,(%rax)
    1749:	10 f0                	adc    %dh,%al
    174b:	16                   	(bad)  
    174c:	00 00                	add    %al,(%rax)
    174e:	46 00 45 82          	rex.RX add %r8b,-0x7e(%rbp)
    1752:	09 00                	or     %eax,(%rax)
    1754:	00 21                	add    %ah,(%rcx)
    1756:	d7                   	xlat   %ds:(%rbx)
    1757:	02 0f                	add    (%rdi),%cl
    1759:	05 14 00 00 67       	add    $0x67000014,%eax
    175e:	17                   	(bad)  
    175f:	00 00                	add    %al,(%rax)
    1761:	10 7f 16             	adc    %bh,0x16(%rdi)
    1764:	00 00                	add    %al,(%rax)
    1766:	00 47 9e             	add    %al,-0x62(%rdi)
    1769:	09 00                	or     %eax,(%rax)
    176b:	00 21                	add    %ah,(%rcx)
    176d:	dd 02                	fldl   (%rdx)
    176f:	0f 05                	syscall 
    1771:	14 00                	adc    $0x0,%al
    1773:	00 45 c1             	add    %al,-0x3f(%rbp)
    1776:	0d 00 00 21 33       	or     $0x33210000,%eax
    177b:	01 0f                	add    %ecx,(%rdi)
    177d:	a7                   	cmpsl  %es:(%rdi),%ds:(%rsi)
    177e:	13 00                	adc    (%rax),%eax
    1780:	00 95 17 00 00 10    	add    %dl,0x10000017(%rbp)
    1786:	46 16                	rex.RX (bad) 
    1788:	00 00                	add    %al,(%rax)
    178a:	10 a7 13 00 00 10    	adc    %ah,0x10000013(%rdi)
    1790:	95                   	xchg   %eax,%ebp
    1791:	17                   	(bad)  
    1792:	00 00                	add    %al,(%rax)
    1794:	00 44 08 8f          	add    %al,-0x71(%rax,%rcx,1)
    1798:	14 00                	adc    $0x0,%al
    179a:	00 45 3b             	add    %al,0x3b(%rbp)
    179d:	1a 00                	sbb    (%rax),%al
    179f:	00 21                	add    %ah,(%rcx)
    17a1:	28 01                	sub    %al,(%rcx)
    17a3:	0f                   	xcrypt-cbc (bad)
    17a4:	a7                   	cmpsl  %es:(%rdi),%ds:(%rsi)
    17a5:	13 00                	adc    (%rax),%eax
    17a7:	00 c1                	add    %al,%cl
    17a9:	17                   	(bad)  
    17aa:	00 00                	add    %al,(%rax)
    17ac:	10 a6 16 00 00 10    	adc    %ah,0x10000016(%rsi)
    17b2:	46 16                	rex.RX (bad) 
    17b4:	00 00                	add    %al,(%rax)
    17b6:	10 a7 13 00 00 10    	adc    %ah,0x10000013(%rdi)
    17bc:	95                   	xchg   %eax,%ebp
    17bd:	17                   	(bad)  
    17be:	00 00                	add    %al,(%rax)
    17c0:	00 45 1f             	add    %al,0x1f(%rbp)
    17c3:	21 00                	and    %eax,(%rax)
    17c5:	00 21                	add    %ah,(%rcx)
    17c7:	24 01                	and    $0x1,%al
    17c9:	0c 77                	or     $0x77,%al
    17cb:	14 00                	adc    $0x0,%al
    17cd:	00 d8                	add    %bl,%al
    17cf:	17                   	(bad)  
    17d0:	00 00                	add    %al,(%rax)
    17d2:	10 d8                	adc    %bl,%al
    17d4:	17                   	(bad)  
    17d5:	00 00                	add    %al,(%rax)
    17d7:	00 44 08 9b          	add    %al,-0x65(%rax,%rcx,1)
    17db:	14 00                	adc    $0x0,%al
    17dd:	00 45 53             	add    %al,0x53(%rbp)
    17e0:	29 00                	sub    %eax,(%rax)
    17e2:	00 21                	add    %ah,(%rcx)
    17e4:	51                   	push   %rcx
    17e5:	01 0f                	add    %ecx,(%rdi)
    17e7:	a7                   	cmpsl  %es:(%rdi),%ds:(%rsi)
    17e8:	13 00                	adc    (%rax),%eax
    17ea:	00 04 18             	add    %al,(%rax,%rbx,1)
    17ed:	00 00                	add    %al,(%rax)
    17ef:	10 a6 16 00 00 10    	adc    %ah,0x10000016(%rsi)
    17f5:	04 18                	add    $0x18,%al
    17f7:	00 00                	add    %al,(%rax)
    17f9:	10 a7 13 00 00 10    	adc    %ah,0x10000013(%rdi)
    17ff:	95                   	xchg   %eax,%ebp
    1800:	17                   	(bad)  
    1801:	00 00                	add    %al,(%rax)
    1803:	00 44 08 46          	add    %al,0x46(%rax,%rcx,1)
    1807:	16                   	(bad)  
    1808:	00 00                	add    %al,(%rax)
    180a:	45 ed                	rex.RB in (%dx),%eax
    180c:	29 00                	sub    %eax,(%rax)
    180e:	00 21                	add    %ah,(%rcx)
    1810:	e5 02                	in     $0x2,%eax
    1812:	0f 05                	syscall 
    1814:	14 00                	adc    $0x0,%al
    1816:	00 26                	add    %ah,(%rsi)
    1818:	18 00                	sbb    %al,(%rax)
    181a:	00 10                	add    %dl,(%rax)
    181c:	ac                   	lods   %ds:(%rsi),%al
    181d:	16                   	(bad)  
    181e:	00 00                	add    %al,(%rax)
    1820:	10 7f 16             	adc    %bh,0x16(%rdi)
    1823:	00 00                	add    %al,(%rax)
    1825:	00 45 5d             	add    %al,0x5d(%rbp)
    1828:	11 00                	adc    %eax,(%rax)
    182a:	00 21                	add    %ah,(%rcx)
    182c:	eb 02                	jmp    1830 <_fini+0x318>
    182e:	0f 05                	syscall 
    1830:	14 00                	adc    $0x0,%al
    1832:	00 3d 18 00 00 10    	add    %bh,0x10000018(%rip)        # 10001850 <_end+0xfffd688>
    1838:	ac                   	lods   %ds:(%rsi),%al
    1839:	16                   	(bad)  
    183a:	00 00                	add    %al,(%rax)
    183c:	00 45 7f             	add    %al,0x7f(%rbp)
    183f:	0f 00 00             	sldt   (%rax)
    1842:	21 4e 02             	and    %ecx,0x2(%rsi)
    1845:	0c 77                	or     $0x77,%al
    1847:	14 00                	adc    $0x0,%al
    1849:	00 5f 18             	add    %bl,0x18(%rdi)
    184c:	00 00                	add    %al,(%rax)
    184e:	10 a6 16 00 00 10    	adc    %ah,0x10000016(%rsi)
    1854:	a7                   	cmpsl  %es:(%rdi),%ds:(%rsi)
    1855:	13 00                	adc    (%rax),%eax
    1857:	00 10                	add    %dl,(%rax)
    1859:	f0 16                	lock (bad) 
    185b:	00 00                	add    %al,(%rax)
    185d:	46 00 26             	rex.RX add %r12b,(%rsi)
    1860:	79 09                	jns    186b <_fini+0x353>
    1862:	00 00                	add    %al,(%rax)
    1864:	21 87 02 0c 70 09    	and    %eax,0x9700c02(%rdi)
    186a:	00 00                	add    %al,(%rax)
    186c:	77 14                	ja     1882 <_fini+0x36a>
    186e:	00 00                	add    %al,(%rax)
    1870:	80 18 00             	sbbb   $0x0,(%rax)
    1873:	00 10                	add    %dl,(%rax)
    1875:	f0 16                	lock (bad) 
    1877:	00 00                	add    %al,(%rax)
    1879:	10 f0                	adc    %dh,%al
    187b:	16                   	(bad)  
    187c:	00 00                	add    %al,(%rax)
    187e:	46 00 45 4f          	rex.RX add %r8b,0x4f(%rbp)
    1882:	0d 00 00 21 02       	or     $0x2210000,%eax
    1887:	03 0f                	add    (%rdi),%ecx
    1889:	05 14 00 00 9c       	add    $0x9c000014,%eax
    188e:	18 00                	sbb    %al,(%rax)
    1890:	00 10                	add    %dl,(%rax)
    1892:	05 14 00 00 10       	add    $0x10000014,%eax
    1897:	7f 16                	jg     18af <_fini+0x397>
    1899:	00 00                	add    %al,(%rax)
    189b:	00 45 b7             	add    %al,-0x49(%rbp)
    189e:	18 00                	sbb    %al,(%rax)
    18a0:	00 21                	add    %ah,(%rcx)
    18a2:	56                   	push   %rsi
    18a3:	02 0c 77             	add    (%rdi,%rsi,2),%cl
    18a6:	14 00                	adc    $0x0,%al
    18a8:	00 bd 18 00 00 10    	add    %bh,0x10000018(%rbp)
    18ae:	7f 16                	jg     18c6 <_fini+0x3ae>
    18b0:	00 00                	add    %al,(%rax)
    18b2:	10 f0                	adc    %dh,%al
    18b4:	16                   	(bad)  
    18b5:	00 00                	add    %al,(%rax)
    18b7:	10 bd 18 00 00 00    	adc    %bh,0x18(%rbp)
    18bd:	44 08 bf 13 00 00 26 	or     %r15b,0x26000013(%rdi)
    18c4:	19 23                	sbb    %esp,(%rbx)
    18c6:	00 00                	add    %al,(%rax)
    18c8:	21 b5 02 0c 10 23    	and    %esi,0x23100c02(%rbp)
    18ce:	00 00                	add    %al,(%rax)
    18d0:	77 14                	ja     18e6 <_fini+0x3ce>
    18d2:	00 00                	add    %al,(%rax)
    18d4:	e8 18 00 00 10       	callq  100018f1 <_end+0xfffd729>
    18d9:	7f 16                	jg     18f1 <_fini+0x3d9>
    18db:	00 00                	add    %al,(%rax)
    18dd:	10 f0                	adc    %dh,%al
    18df:	16                   	(bad)  
    18e0:	00 00                	add    %al,(%rax)
    18e2:	10 bd 18 00 00 00    	adc    %bh,0x18(%rbp)
    18e8:	45 7e 0f             	rex.RB jle 18fa <_fini+0x3e2>
    18eb:	00 00                	add    %al,(%rax)
    18ed:	21 63 02             	and    %esp,0x2(%rbx)
    18f0:	0c 77                	or     $0x77,%al
    18f2:	14 00                	adc    $0x0,%al
    18f4:	00 0e                	add    %cl,(%rsi)
    18f6:	19 00                	sbb    %eax,(%rax)
    18f8:	00 10                	add    %dl,(%rax)
    18fa:	a6                   	cmpsb  %es:(%rdi),%ds:(%rsi)
    18fb:	16                   	(bad)  
    18fc:	00 00                	add    %al,(%rax)
    18fe:	10 a7 13 00 00 10    	adc    %ah,0x10000013(%rdi)
    1904:	f0 16                	lock (bad) 
    1906:	00 00                	add    %al,(%rax)
    1908:	10 bd 18 00 00 00    	adc    %bh,0x18(%rbp)
    190e:	26 30 22             	xor    %ah,%es:(%rdx)
    1911:	00 00                	add    %al,(%rax)
    1913:	21 bc 02 0c 27 22 00 	and    %edi,0x22270c(%rdx,%rax,1)
    191a:	00 77 14             	add    %dh,0x14(%rdi)
    191d:	00 00                	add    %al,(%rax)
    191f:	33 19                	xor    (%rcx),%ebx
    1921:	00 00                	add    %al,(%rax)
    1923:	10 f0                	adc    %dh,%al
    1925:	16                   	(bad)  
    1926:	00 00                	add    %al,(%rax)
    1928:	10 f0                	adc    %dh,%al
    192a:	16                   	(bad)  
    192b:	00 00                	add    %al,(%rax)
    192d:	10 bd 18 00 00 00    	adc    %bh,0x18(%rbp)
    1933:	45 38 07             	cmp    %r8b,(%r15)
    1936:	00 00                	add    %al,(%rax)
    1938:	21 5e 02             	and    %ebx,0x2(%rsi)
    193b:	0c 77                	or     $0x77,%al
    193d:	14 00                	adc    $0x0,%al
    193f:	00 4f 19             	add    %cl,0x19(%rdi)
    1942:	00 00                	add    %al,(%rax)
    1944:	10 f0                	adc    %dh,%al
    1946:	16                   	(bad)  
    1947:	00 00                	add    %al,(%rax)
    1949:	10 bd 18 00 00 00    	adc    %bh,0x18(%rbp)
    194f:	26 48 10 00          	rex.W adc %al,%es:(%rax)
    1953:	00 21                	add    %ah,(%rcx)
    1955:	b9 02 0c 3f 10       	mov    $0x103f0c02,%ecx
    195a:	00 00                	add    %al,(%rax)
    195c:	77 14                	ja     1972 <_fini+0x45a>
    195e:	00 00                	add    %al,(%rax)
    1960:	6f                   	outsl  %ds:(%rsi),(%dx)
    1961:	19 00                	sbb    %eax,(%rax)
    1963:	00 10                	add    %dl,(%rax)
    1965:	f0 16                	lock (bad) 
    1967:	00 00                	add    %al,(%rax)
    1969:	10 bd 18 00 00 00    	adc    %bh,0x18(%rbp)
    196f:	45 c3                	rex.RB retq 
    1971:	27                   	(bad)  
    1972:	00 00                	add    %al,(%rax)
    1974:	21 2d 01 0f a7 13    	and    %ebp,0x13a70f01(%rip)        # 13a7287b <_end+0x13a6e6b3>
    197a:	00 00                	add    %al,(%rax)
    197c:	90                   	nop
    197d:	19 00                	sbb    %eax,(%rax)
    197f:	00 10                	add    %dl,(%rax)
    1981:	90                   	nop
    1982:	19 00                	sbb    %eax,(%rax)
    1984:	00 10                	add    %dl,(%rax)
    1986:	ac                   	lods   %ds:(%rsi),%al
    1987:	16                   	(bad)  
    1988:	00 00                	add    %al,(%rax)
    198a:	10 95 17 00 00 00    	adc    %dl,0x17(%rbp)
    1990:	44 08 6b 14          	or     %r13b,0x14(%rbx)
    1994:	00 00                	add    %al,(%rax)
    1996:	48 e8 26 00 00 21    	callq  210019c2 <_end+0x20ffd7fa>
    199c:	61                   	(bad)  
    199d:	11 a6 16 00 00 b1    	adc    %esp,-0x4effffea(%rsi)
    19a3:	19 00                	sbb    %eax,(%rax)
    19a5:	00 10                	add    %dl,(%rax)
    19a7:	a6                   	cmpsb  %es:(%rdi),%ds:(%rsi)
    19a8:	16                   	(bad)  
    19a9:	00 00                	add    %al,(%rax)
    19ab:	10 f0                	adc    %dh,%al
    19ad:	16                   	(bad)  
    19ae:	00 00                	add    %al,(%rax)
    19b0:	00 48 98             	add    %cl,-0x68(%rax)
    19b3:	0a 00                	or     (%rax),%al
    19b5:	00 21                	add    %ah,(%rcx)
    19b7:	6a 0c                	pushq  $0xc
    19b9:	77 14                	ja     19cf <_fini+0x4b7>
    19bb:	00 00                	add    %al,(%rax)
    19bd:	cc                   	int3   
    19be:	19 00                	sbb    %eax,(%rax)
    19c0:	00 10                	add    %dl,(%rax)
    19c2:	f0 16                	lock (bad) 
    19c4:	00 00                	add    %al,(%rax)
    19c6:	10 f0                	adc    %dh,%al
    19c8:	16                   	(bad)  
    19c9:	00 00                	add    %al,(%rax)
    19cb:	00 48 b6             	add    %cl,-0x4a(%rax)
    19ce:	04 00                	add    $0x0,%al
    19d0:	00 21                	add    %ah,(%rcx)
    19d2:	83 0c 77 14          	orl    $0x14,(%rdi,%rsi,2)
    19d6:	00 00                	add    %al,(%rax)
    19d8:	e7 19                	out    %eax,$0x19
    19da:	00 00                	add    %al,(%rax)
    19dc:	10 f0                	adc    %dh,%al
    19de:	16                   	(bad)  
    19df:	00 00                	add    %al,(%rax)
    19e1:	10 f0                	adc    %dh,%al
    19e3:	16                   	(bad)  
    19e4:	00 00                	add    %al,(%rax)
    19e6:	00 48 70             	add    %cl,0x70(%rax)
    19e9:	0f 00 00             	sldt   (%rax)
    19ec:	21 57 11             	and    %edx,0x11(%rdi)
    19ef:	a6                   	cmpsb  %es:(%rdi),%ds:(%rsi)
    19f0:	16                   	(bad)  
    19f1:	00 00                	add    %al,(%rax)
    19f3:	02 1a                	add    (%rdx),%bl
    19f5:	00 00                	add    %al,(%rax)
    19f7:	10 a6 16 00 00 10    	adc    %ah,0x10000016(%rsi)
    19fd:	f0 16                	lock (bad) 
    19ff:	00 00                	add    %al,(%rax)
    1a01:	00 48 14             	add    %cl,0x14(%rax)
    1a04:	02 00                	add    (%rax),%al
    1a06:	00 21                	add    %ah,(%rcx)
    1a08:	bb 0f a7 13 00       	mov    $0x13a70f,%ebx
    1a0d:	00 1d 1a 00 00 10    	add    %bl,0x1000001a(%rip)        # 10001a2d <_end+0xfffd865>
    1a13:	f0 16                	lock (bad) 
    1a15:	00 00                	add    %al,(%rax)
    1a17:	10 f0                	adc    %dh,%al
    1a19:	16                   	(bad)  
    1a1a:	00 00                	add    %al,(%rax)
    1a1c:	00 45 10             	add    %al,0x10(%rbp)
    1a1f:	25 00 00 21 42       	and    $0x42210000,%eax
    1a24:	03 0f                	add    (%rdi),%ecx
    1a26:	a7                   	cmpsl  %es:(%rdi),%ds:(%rsi)
    1a27:	13 00                	adc    (%rax),%eax
    1a29:	00 43 1a             	add    %al,0x1a(%rbx)
    1a2c:	00 00                	add    %al,(%rax)
    1a2e:	10 a6 16 00 00 10    	adc    %ah,0x10000016(%rsi)
    1a34:	a7                   	cmpsl  %es:(%rdi),%ds:(%rsi)
    1a35:	13 00                	adc    (%rax),%eax
    1a37:	00 10                	add    %dl,(%rax)
    1a39:	f0 16                	lock (bad) 
    1a3b:	00 00                	add    %al,(%rax)
    1a3d:	10 43 1a             	adc    %al,0x1a(%rbx)
    1a40:	00 00                	add    %al,(%rax)
    1a42:	00 44 08 e5          	add    %al,-0x1b(%rax,%rcx,1)
    1a46:	1a 00                	sbb    (%rax),%al
    1a48:	00 49 74             	add    %cl,0x74(%rcx)
    1a4b:	6d                   	insl   (%dx),%es:(%rdi)
    1a4c:	00 38                	add    %bh,(%rax)
    1a4e:	22 07                	and    (%rdi),%al
    1a50:	08 e5                	or     %ah,%ch
    1a52:	1a 00                	sbb    (%rax),%al
    1a54:	00 0e                	add    %cl,(%rsi)
    1a56:	75 20                	jne    1a78 <_fini+0x560>
    1a58:	00 00                	add    %al,(%rax)
    1a5a:	22 09                	and    (%rcx),%cl
    1a5c:	07                   	(bad)  
    1a5d:	77 14                	ja     1a73 <_fini+0x55b>
    1a5f:	00 00                	add    %al,(%rax)
    1a61:	00 0e                	add    %cl,(%rsi)
    1a63:	de 0c 00             	fimuls (%rax,%rax,1)
    1a66:	00 22                	add    %ah,(%rdx)
    1a68:	0a 07                	or     (%rdi),%al
    1a6a:	77 14                	ja     1a80 <_fini+0x568>
    1a6c:	00 00                	add    %al,(%rax)
    1a6e:	04 0e                	add    $0xe,%al
    1a70:	8f 00                	popq   (%rax)
    1a72:	00 00                	add    %al,(%rax)
    1a74:	22 0b                	and    (%rbx),%cl
    1a76:	07                   	(bad)  
    1a77:	77 14                	ja     1a8d <_fini+0x575>
    1a79:	00 00                	add    %al,(%rax)
    1a7b:	08 0e                	or     %cl,(%rsi)
    1a7d:	cf                   	iret   
    1a7e:	1d 00 00 22 0c       	sbb    $0xc220000,%eax
    1a83:	07                   	(bad)  
    1a84:	77 14                	ja     1a9a <_fini+0x582>
    1a86:	00 00                	add    %al,(%rax)
    1a88:	0c 0e                	or     $0xe,%al
    1a8a:	c2 16 00             	retq   $0x16
    1a8d:	00 22                	add    %ah,(%rdx)
    1a8f:	0d 07 77 14 00       	or     $0x147707,%eax
    1a94:	00 10                	add    %dl,(%rax)
    1a96:	0e                   	(bad)  
    1a97:	1f                   	(bad)  
    1a98:	2a 00                	sub    (%rax),%al
    1a9a:	00 22                	add    %ah,(%rdx)
    1a9c:	0e                   	(bad)  
    1a9d:	07                   	(bad)  
    1a9e:	77 14                	ja     1ab4 <_fini+0x59c>
    1aa0:	00 00                	add    %al,(%rax)
    1aa2:	14 0e                	adc    $0xe,%al
    1aa4:	dd 20                	frstor (%rax)
    1aa6:	00 00                	add    %al,(%rax)
    1aa8:	22 0f                	and    (%rdi),%cl
    1aaa:	07                   	(bad)  
    1aab:	77 14                	ja     1ac1 <_fini+0x5a9>
    1aad:	00 00                	add    %al,(%rax)
    1aaf:	18 0e                	sbb    %cl,(%rsi)
    1ab1:	bc 08 00 00 22       	mov    $0x22000008,%esp
    1ab6:	10 07                	adc    %al,(%rdi)
    1ab8:	77 14                	ja     1ace <_fini+0x5b6>
    1aba:	00 00                	add    %al,(%rax)
    1abc:	1c 0e                	sbb    $0xe,%al
    1abe:	c3                   	retq   
    1abf:	06                   	(bad)  
    1ac0:	00 00                	add    %al,(%rax)
    1ac2:	22 11                	and    (%rcx),%dl
    1ac4:	07                   	(bad)  
    1ac5:	77 14                	ja     1adb <_fini+0x5c3>
    1ac7:	00 00                	add    %al,(%rax)
    1ac9:	20 0e                	and    %cl,(%rsi)
    1acb:	39 14 00             	cmp    %edx,(%rax,%rax,1)
    1ace:	00 22                	add    %ah,(%rdx)
    1ad0:	14 0c                	adc    $0xc,%al
    1ad2:	26 1c 00             	es sbb $0x0,%al
    1ad5:	00 28                	add    %ch,(%rax)
    1ad7:	0e                   	(bad)  
    1ad8:	68 27 00 00 22       	pushq  $0x22000027
    1add:	15 0f 46 16 00       	adc    $0x16460f,%eax
    1ae2:	00 30                	add    %dh,(%rax)
    1ae4:	00 0a                	add    %cl,(%rdx)
    1ae6:	49 1a 00             	rex.WB sbb (%r8),%al
    1ae9:	00 48 7d             	add    %cl,0x7d(%rax)
    1aec:	23 00                	and    (%rax),%eax
    1aee:	00 21                	add    %ah,(%rcx)
    1af0:	de 0f                	fimuls (%rdi)
    1af2:	a7                   	cmpsl  %es:(%rdi),%ds:(%rsi)
    1af3:	13 00                	adc    (%rax),%eax
    1af5:	00 00                	add    %al,(%rax)
    1af7:	1b 00                	sbb    (%rax),%eax
    1af9:	00 10                	add    %dl,(%rax)
    1afb:	f0 16                	lock (bad) 
    1afd:	00 00                	add    %al,(%rax)
    1aff:	00 48 4d             	add    %cl,0x4d(%rax)
    1b02:	28 00                	sub    %al,(%rax)
    1b04:	00 21                	add    %ah,(%rcx)
    1b06:	65 11 a6 16 00 00 20 	adc    %esp,%gs:0x20000016(%rsi)
    1b0d:	1b 00                	sbb    (%rax),%eax
    1b0f:	00 10                	add    %dl,(%rax)
    1b11:	a6                   	cmpsb  %es:(%rdi),%ds:(%rsi)
    1b12:	16                   	(bad)  
    1b13:	00 00                	add    %al,(%rax)
    1b15:	10 f0                	adc    %dh,%al
    1b17:	16                   	(bad)  
    1b18:	00 00                	add    %al,(%rax)
    1b1a:	10 a7 13 00 00 00    	adc    %ah,0x13(%rdi)
    1b20:	48                   	rex.W
    1b21:	4a 0c 00             	rex.WX or $0x0,%al
    1b24:	00 21                	add    %ah,(%rcx)
    1b26:	6d                   	insl   (%dx),%es:(%rdi)
    1b27:	0c 77                	or     $0x77,%al
    1b29:	14 00                	adc    $0x0,%al
    1b2b:	00 40 1b             	add    %al,0x1b(%rax)
    1b2e:	00 00                	add    %al,(%rax)
    1b30:	10 f0                	adc    %dh,%al
    1b32:	16                   	(bad)  
    1b33:	00 00                	add    %al,(%rax)
    1b35:	10 f0                	adc    %dh,%al
    1b37:	16                   	(bad)  
    1b38:	00 00                	add    %al,(%rax)
    1b3a:	10 a7 13 00 00 00    	adc    %ah,0x13(%rdi)
    1b40:	48 d7                	rex.W xlat %ds:(%rbx)
    1b42:	1d 00 00 21 5c       	sbb    $0x5c210000,%eax
    1b47:	11 a6 16 00 00 60    	adc    %esp,0x60000016(%rsi)
    1b4d:	1b 00                	sbb    (%rax),%eax
    1b4f:	00 10                	add    %dl,(%rax)
    1b51:	a6                   	cmpsb  %es:(%rdi),%ds:(%rsi)
    1b52:	16                   	(bad)  
    1b53:	00 00                	add    %al,(%rax)
    1b55:	10 f0                	adc    %dh,%al
    1b57:	16                   	(bad)  
    1b58:	00 00                	add    %al,(%rax)
    1b5a:	10 a7 13 00 00 00    	adc    %ah,0x13(%rdi)
    1b60:	45 b6 20             	rex.RB mov $0x20,%r14b
    1b63:	00 00                	add    %al,(%rax)
    1b65:	21 57 01             	and    %edx,0x1(%rdi)
    1b68:	0f                   	xcrypt-cbc (bad)
    1b69:	a7                   	cmpsl  %es:(%rdi),%ds:(%rsi)
    1b6a:	13 00                	adc    (%rax),%eax
    1b6c:	00 86 1b 00 00 10    	add    %al,0x1000001b(%rsi)
    1b72:	90                   	nop
    1b73:	19 00                	sbb    %eax,(%rax)
    1b75:	00 10                	add    %dl,(%rax)
    1b77:	86 1b                	xchg   %bl,(%rbx)
    1b79:	00 00                	add    %al,(%rax)
    1b7b:	10 a7 13 00 00 10    	adc    %ah,0x10000013(%rdi)
    1b81:	95                   	xchg   %eax,%ebp
    1b82:	17                   	(bad)  
    1b83:	00 00                	add    %al,(%rax)
    1b85:	00 44 08 f0          	add    %al,-0x10(%rax,%rcx,1)
    1b89:	16                   	(bad)  
    1b8a:	00 00                	add    %al,(%rax)
    1b8c:	48 6a 19             	rex.W pushq $0x19
    1b8f:	00 00                	add    %al,(%rax)
    1b91:	21 bf 0f a7 13 00    	and    %edi,0x13a70f(%rdi)
    1b97:	00 a7 1b 00 00 10    	add    %ah,0x1000001b(%rdi)
    1b9d:	f0 16                	lock (bad) 
    1b9f:	00 00                	add    %al,(%rax)
    1ba1:	10 f0                	adc    %dh,%al
    1ba3:	16                   	(bad)  
    1ba4:	00 00                	add    %al,(%rax)
    1ba6:	00 45 3d             	add    %al,0x3d(%rbp)
    1ba9:	21 00                	and    %eax,(%rax)
    1bab:	00 21                	add    %ah,(%rcx)
    1bad:	79 01                	jns    1bb0 <_fini+0x698>
    1baf:	0f 99 13             	setns  (%rbx)
    1bb2:	00 00                	add    %al,(%rax)
    1bb4:	c3                   	retq   
    1bb5:	1b 00                	sbb    (%rax),%eax
    1bb7:	00 10                	add    %dl,(%rax)
    1bb9:	f0 16                	lock (bad) 
    1bbb:	00 00                	add    %al,(%rax)
    1bbd:	10 c3                	adc    %al,%bl
    1bbf:	1b 00                	sbb    (%rax),%eax
    1bc1:	00 00                	add    %al,(%rax)
    1bc3:	44 08 a6 16 00 00 45 	or     %r12b,0x45000016(%rsi)
    1bca:	f7 16                	notl   (%rsi)
    1bcc:	00 00                	add    %al,(%rax)
    1bce:	21 7e 01             	and    %edi,0x1(%rsi)
    1bd1:	0e                   	(bad)  
    1bd2:	92                   	xchg   %eax,%edx
    1bd3:	13 00                	adc    (%rax),%eax
    1bd5:	00 e5                	add    %ah,%ch
    1bd7:	1b 00                	sbb    (%rax),%eax
    1bd9:	00 10                	add    %dl,(%rax)
    1bdb:	f0 16                	lock (bad) 
    1bdd:	00 00                	add    %al,(%rax)
    1bdf:	10 c3                	adc    %al,%bl
    1be1:	1b 00                	sbb    (%rax),%eax
    1be3:	00 00                	add    %al,(%rax)
    1be5:	48 6f                	rex.W outsl %ds:(%rsi),(%dx)
    1be7:	21 00                	and    %eax,(%rax)
    1be9:	00 21                	add    %ah,(%rcx)
    1beb:	d9 11                	fsts   (%rcx)
    1bed:	a6                   	cmpsb  %es:(%rdi),%ds:(%rsi)
    1bee:	16                   	(bad)  
    1bef:	00 00                	add    %al,(%rax)
    1bf1:	05 1c 00 00 10       	add    $0x1000001c,%eax
    1bf6:	a6                   	cmpsb  %es:(%rdi),%ds:(%rsi)
    1bf7:	16                   	(bad)  
    1bf8:	00 00                	add    %al,(%rax)
    1bfa:	10 f0                	adc    %dh,%al
    1bfc:	16                   	(bad)  
    1bfd:	00 00                	add    %al,(%rax)
    1bff:	10 c3                	adc    %al,%bl
    1c01:	1b 00                	sbb    (%rax),%eax
    1c03:	00 00                	add    %al,(%rax)
    1c05:	45 35 17 00 00 21    	rex.RB xor $0x21000017,%eax
    1c0b:	ac                   	lods   %ds:(%rsi),%al
    1c0c:	01 11                	add    %edx,(%rcx)
    1c0e:	26 1c 00             	es sbb $0x0,%al
    1c11:	00 26                	add    %ah,(%rsi)
    1c13:	1c 00                	sbb    $0x0,%al
    1c15:	00 10                	add    %dl,(%rax)
    1c17:	f0 16                	lock (bad) 
    1c19:	00 00                	add    %al,(%rax)
    1c1b:	10 c3                	adc    %al,%bl
    1c1d:	1b 00                	sbb    (%rax),%eax
    1c1f:	00 10                	add    %dl,(%rax)
    1c21:	77 14                	ja     1c37 <_fini+0x71f>
    1c23:	00 00                	add    %al,(%rax)
    1c25:	00 3a                	add    %bh,(%rdx)
    1c27:	08 05 7e 16 00 00    	or     %al,0x167e(%rip)        # 32ab <__FRAME_END__+0x108f>
    1c2d:	0a 26                	or     (%rsi),%ah
    1c2f:	1c 00                	sbb    $0x0,%al
    1c31:	00 45 d7             	add    %al,-0x29(%rbp)
    1c34:	2c 00                	sub    $0x0,%al
    1c36:	00 21                	add    %ah,(%rcx)
    1c38:	b1 01                	mov    $0x1,%cl
    1c3a:	1a b3 13 00 00 53    	sbb    0x53000013(%rbx),%dh
    1c40:	1c 00                	sbb    $0x0,%al
    1c42:	00 10                	add    %dl,(%rax)
    1c44:	f0 16                	lock (bad) 
    1c46:	00 00                	add    %al,(%rax)
    1c48:	10 c3                	adc    %al,%bl
    1c4a:	1b 00                	sbb    (%rax),%eax
    1c4c:	00 10                	add    %dl,(%rax)
    1c4e:	77 14                	ja     1c64 <_fini+0x74c>
    1c50:	00 00                	add    %al,(%rax)
    1c52:	00 48 e2             	add    %cl,-0x1e(%rax)
    1c55:	03 00                	add    (%rax),%eax
    1c57:	00 21                	add    %ah,(%rcx)
    1c59:	87 0f                	xchg   %ecx,(%rdi)
    1c5b:	a7                   	cmpsl  %es:(%rdi),%ds:(%rsi)
    1c5c:	13 00                	adc    (%rax),%eax
    1c5e:	00 73 1c             	add    %dh,0x1c(%rbx)
    1c61:	00 00                	add    %al,(%rax)
    1c63:	10 a6 16 00 00 10    	adc    %ah,0x10000016(%rsi)
    1c69:	f0 16                	lock (bad) 
    1c6b:	00 00                	add    %al,(%rax)
    1c6d:	10 a7 13 00 00 00    	adc    %ah,0x13(%rdi)
    1c73:	45 e1 17             	rex.RB loope 1c8d <_fini+0x775>
    1c76:	00 00                	add    %al,(%rax)
    1c78:	21 20                	and    %esp,(%rax)
    1c7a:	01 0c 77             	add    %ecx,(%rdi,%rsi,2)
    1c7d:	14 00                	adc    $0x0,%al
    1c7f:	00 8a 1c 00 00 10    	add    %cl,0x1000001c(%rdx)
    1c85:	05 14 00 00 00       	add    $0x14,%eax
    1c8a:	45 d7                	rex.RB xlat %ds:(%rbx)
    1c8c:	11 00                	adc    %eax,(%rax)
    1c8e:	00 21                	add    %ah,(%rcx)
    1c90:	02 01                	add    (%rcx),%al
    1c92:	0c 77                	or     $0x77,%al
    1c94:	14 00                	adc    $0x0,%al
    1c96:	00 ab 1c 00 00 10    	add    %ch,0x1000001c(%rbx)
    1c9c:	f0 16                	lock (bad) 
    1c9e:	00 00                	add    %al,(%rax)
    1ca0:	10 f0                	adc    %dh,%al
    1ca2:	16                   	(bad)  
    1ca3:	00 00                	add    %al,(%rax)
    1ca5:	10 a7 13 00 00 00    	adc    %ah,0x13(%rdi)
    1cab:	45 ba 16 00 00 21    	rex.RB mov $0x21000016,%r10d
    1cb1:	06                   	(bad)  
    1cb2:	01 11                	add    %edx,(%rcx)
    1cb4:	a6                   	cmpsb  %es:(%rdi),%ds:(%rsi)
    1cb5:	16                   	(bad)  
    1cb6:	00 00                	add    %al,(%rax)
    1cb8:	cc                   	int3   
    1cb9:	1c 00                	sbb    $0x0,%al
    1cbb:	00 10                	add    %dl,(%rax)
    1cbd:	a6                   	cmpsb  %es:(%rdi),%ds:(%rsi)
    1cbe:	16                   	(bad)  
    1cbf:	00 00                	add    %al,(%rax)
    1cc1:	10 f0                	adc    %dh,%al
    1cc3:	16                   	(bad)  
    1cc4:	00 00                	add    %al,(%rax)
    1cc6:	10 a7 13 00 00 00    	adc    %ah,0x13(%rdi)
    1ccc:	45 a2 0c 00 00 21 0b 	rex.RB movabs %al,0xa611010b2100000c
    1cd3:	01 11 a6 
    1cd6:	16                   	(bad)  
    1cd7:	00 00                	add    %al,(%rax)
    1cd9:	ed                   	in     (%dx),%eax
    1cda:	1c 00                	sbb    $0x0,%al
    1cdc:	00 10                	add    %dl,(%rax)
    1cde:	a6                   	cmpsb  %es:(%rdi),%ds:(%rsi)
    1cdf:	16                   	(bad)  
    1ce0:	00 00                	add    %al,(%rax)
    1ce2:	10 f0                	adc    %dh,%al
    1ce4:	16                   	(bad)  
    1ce5:	00 00                	add    %al,(%rax)
    1ce7:	10 a7 13 00 00 00    	adc    %ah,0x13(%rdi)
    1ced:	45 fb                	rex.RB sti 
    1cef:	0f 00 00             	sldt   (%rax)
    1cf2:	21 0f                	and    %ecx,(%rdi)
    1cf4:	01 11                	add    %edx,(%rcx)
    1cf6:	a6                   	cmpsb  %es:(%rdi),%ds:(%rsi)
    1cf7:	16                   	(bad)  
    1cf8:	00 00                	add    %al,(%rax)
    1cfa:	0e                   	(bad)  
    1cfb:	1d 00 00 10 a6       	sbb    $0xa6100000,%eax
    1d00:	16                   	(bad)  
    1d01:	00 00                	add    %al,(%rax)
    1d03:	10 ac 16 00 00 10 a7 	adc    %ch,-0x58f00000(%rsi,%rdx,1)
    1d0a:	13 00                	adc    (%rax),%eax
    1d0c:	00 00                	add    %al,(%rax)
    1d0e:	45 b9 18 00 00 21    	rex.RB mov $0x21000018,%r9d
    1d14:	4b 02 0c 77          	rex.WXB add (%r15,%r14,2),%cl
    1d18:	14 00                	adc    $0x0,%al
    1d1a:	00 26                	add    %ah,(%rsi)
    1d1c:	1d 00 00 10 f0       	sbb    $0xf0100000,%eax
    1d21:	16                   	(bad)  
    1d22:	00 00                	add    %al,(%rax)
    1d24:	46 00 26             	rex.RX add %r12b,(%rsi)
    1d27:	bb 1c 00 00 21       	mov    $0x2100001c,%ebx
    1d2c:	84 02                	test   %al,(%rdx)
    1d2e:	0c b2                	or     $0xb2,%al
    1d30:	1c 00                	sbb    $0x0,%al
    1d32:	00 77 14             	add    %dh,0x14(%rdi)
    1d35:	00 00                	add    %al,(%rax)
    1d37:	42 1d 00 00 10 f0    	rex.X sbb $0xf0100000,%eax
    1d3d:	16                   	(bad)  
    1d3e:	00 00                	add    %al,(%rax)
    1d40:	46 00 4a 08          	rex.RX add %r9b,0x8(%rdx)
    1d44:	03 00                	add    (%rax),%eax
    1d46:	00 21                	add    %ah,(%rcx)
    1d48:	a1 1d 08 03 00 00 f0 	movabs 0x16f0000003081d,%eax
    1d4f:	16 00 
    1d51:	00 61 1d             	add    %ah,0x1d(%rcx)
    1d54:	00 00                	add    %al,(%rax)
    1d56:	10 f0                	adc    %dh,%al
    1d58:	16                   	(bad)  
    1d59:	00 00                	add    %al,(%rax)
    1d5b:	10 ac 16 00 00 00 4a 	adc    %ch,0x4a000000(%rsi,%rdx,1)
    1d62:	08 03                	or     %al,(%rbx)
    1d64:	00 00                	add    %al,(%rax)
    1d66:	21 9f 17 08 03 00    	and    %ebx,0x30817(%rdi)
    1d6c:	00 a6 16 00 00 80    	add    %ah,-0x7fffffea(%rsi)
    1d72:	1d 00 00 10 a6       	sbb    $0xa6100000,%eax
    1d77:	16                   	(bad)  
    1d78:	00 00                	add    %al,(%rax)
    1d7a:	10 ac 16 00 00 00 4a 	adc    %ch,0x4a000000(%rsi,%rdx,1)
    1d81:	2d 0b 00 00 21       	sub    $0x2100000b,%eax
    1d86:	c5 1d 2d             	(bad)
    1d89:	0b 00                	or     (%rax),%eax
    1d8b:	00 f0                	add    %dh,%al
    1d8d:	16                   	(bad)  
    1d8e:	00 00                	add    %al,(%rax)
    1d90:	9f                   	lahf   
    1d91:	1d 00 00 10 f0       	sbb    $0xf0100000,%eax
    1d96:	16                   	(bad)  
    1d97:	00 00                	add    %al,(%rax)
    1d99:	10 f0                	adc    %dh,%al
    1d9b:	16                   	(bad)  
    1d9c:	00 00                	add    %al,(%rax)
    1d9e:	00 4a 2d             	add    %cl,0x2d(%rdx)
    1da1:	0b 00                	or     (%rax),%eax
    1da3:	00 21                	add    %ah,(%rcx)
    1da5:	c3                   	retq   
    1da6:	17                   	(bad)  
    1da7:	2d 0b 00 00 a6       	sub    $0xa600000b,%eax
    1dac:	16                   	(bad)  
    1dad:	00 00                	add    %al,(%rax)
    1daf:	be 1d 00 00 10       	mov    $0x1000001d,%esi
    1db4:	a6                   	cmpsb  %es:(%rdi),%ds:(%rsi)
    1db5:	16                   	(bad)  
    1db6:	00 00                	add    %al,(%rax)
    1db8:	10 f0                	adc    %dh,%al
    1dba:	16                   	(bad)  
    1dbb:	00 00                	add    %al,(%rax)
    1dbd:	00 4a 17             	add    %cl,0x17(%rdx)
    1dc0:	06                   	(bad)  
    1dc1:	00 00                	add    %al,(%rax)
    1dc3:	21 ab 1d 17 06 00    	and    %ebp,0x6171d(%rbx)
    1dc9:	00 f0                	add    %dh,%al
    1dcb:	16                   	(bad)  
    1dcc:	00 00                	add    %al,(%rax)
    1dce:	dd 1d 00 00 10 f0    	fstpl  -0xff00000(%rip)        # fffffffff0101dd4 <_end+0xfffffffff00fdc0c>
    1dd4:	16                   	(bad)  
    1dd5:	00 00                	add    %al,(%rax)
    1dd7:	10 ac 16 00 00 00 4a 	adc    %ch,0x4a000000(%rsi,%rdx,1)
    1dde:	17                   	(bad)  
    1ddf:	06                   	(bad)  
    1de0:	00 00                	add    %al,(%rax)
    1de2:	21 a9 17 17 06 00    	and    %ebp,0x61717(%rcx)
    1de8:	00 a6 16 00 00 fc    	add    %ah,-0x3ffffea(%rsi)
    1dee:	1d 00 00 10 a6       	sbb    $0xa6100000,%eax
    1df3:	16                   	(bad)  
    1df4:	00 00                	add    %al,(%rax)
    1df6:	10 ac 16 00 00 00 4a 	adc    %ch,0x4a000000(%rsi,%rdx,1)
    1dfd:	a2 1f 00 00 21 d0 1d 	movabs %al,0x1fa21dd02100001f
    1e04:	a2 1f 
    1e06:	00 00                	add    %al,(%rax)
    1e08:	f0 16                	lock (bad) 
    1e0a:	00 00                	add    %al,(%rax)
    1e0c:	1b 1e                	sbb    (%rsi),%ebx
    1e0e:	00 00                	add    %al,(%rax)
    1e10:	10 f0                	adc    %dh,%al
    1e12:	16                   	(bad)  
    1e13:	00 00                	add    %al,(%rax)
    1e15:	10 f0                	adc    %dh,%al
    1e17:	16                   	(bad)  
    1e18:	00 00                	add    %al,(%rax)
    1e1a:	00 4a a2             	add    %cl,-0x5e(%rdx)
    1e1d:	1f                   	(bad)  
    1e1e:	00 00                	add    %al,(%rax)
    1e20:	21 ce                	and    %ecx,%esi
    1e22:	17                   	(bad)  
    1e23:	a2 1f 00 00 a6 16 00 	movabs %al,0x3a000016a600001f
    1e2a:	00 3a 
    1e2c:	1e                   	(bad)  
    1e2d:	00 00                	add    %al,(%rax)
    1e2f:	10 a6 16 00 00 10    	adc    %ah,0x10000016(%rsi)
    1e35:	f0 16                	lock (bad) 
    1e37:	00 00                	add    %al,(%rax)
    1e39:	00 4a 0d             	add    %cl,0xd(%rdx)
    1e3c:	0a 00                	or     (%rax),%al
    1e3e:	00 21                	add    %ah,(%rcx)
    1e40:	f9                   	stc    
    1e41:	1d 0d 0a 00 00       	sbb    $0xa0d,%eax
    1e46:	f0 16                	lock (bad) 
    1e48:	00 00                	add    %al,(%rax)
    1e4a:	5e                   	pop    %rsi
    1e4b:	1e                   	(bad)  
    1e4c:	00 00                	add    %al,(%rax)
    1e4e:	10 f0                	adc    %dh,%al
    1e50:	16                   	(bad)  
    1e51:	00 00                	add    %al,(%rax)
    1e53:	10 ac 16 00 00 10 a7 	adc    %ch,-0x58f00000(%rsi,%rdx,1)
    1e5a:	13 00                	adc    (%rax),%eax
    1e5c:	00 00                	add    %al,(%rax)
    1e5e:	4a 0d 0a 00 00 21    	rex.WX or $0x2100000a,%rax
    1e64:	f7 17                	notl   (%rdi)
    1e66:	0d 0a 00 00 a6       	or     $0xa600000a,%eax
    1e6b:	16                   	(bad)  
    1e6c:	00 00                	add    %al,(%rax)
    1e6e:	82                   	(bad)  
    1e6f:	1e                   	(bad)  
    1e70:	00 00                	add    %al,(%rax)
    1e72:	10 a6 16 00 00 10    	adc    %ah,0x10000016(%rsi)
    1e78:	ac                   	lods   %ds:(%rsi),%al
    1e79:	16                   	(bad)  
    1e7a:	00 00                	add    %al,(%rax)
    1e7c:	10 a7 13 00 00 00    	adc    %ah,0x13(%rdi)
    1e82:	45 3a 1f             	cmp    (%r15),%r11b
    1e85:	00 00                	add    %al,(%rax)
    1e87:	21 80 01 14 a0 13    	and    %eax,0x13a01401(%rax)
    1e8d:	00 00                	add    %al,(%rax)
    1e8f:	9e                   	sahf   
    1e90:	1e                   	(bad)  
    1e91:	00 00                	add    %al,(%rax)
    1e93:	10 f0                	adc    %dh,%al
    1e95:	16                   	(bad)  
    1e96:	00 00                	add    %al,(%rax)
    1e98:	10 c3                	adc    %al,%bl
    1e9a:	1b 00                	sbb    (%rax),%eax
    1e9c:	00 00                	add    %al,(%rax)
    1e9e:	45 82                	rex.RB (bad) 
    1ea0:	1f                   	(bad)  
    1ea1:	00 00                	add    %al,(%rax)
    1ea3:	21 b9 01 16 bf 1e    	and    %edi,0x1ebf1601(%rcx)
    1ea9:	00 00                	add    %al,(%rax)
    1eab:	bf 1e 00 00 10       	mov    $0x1000001e,%edi
    1eb0:	f0 16                	lock (bad) 
    1eb2:	00 00                	add    %al,(%rax)
    1eb4:	10 c3                	adc    %al,%bl
    1eb6:	1b 00                	sbb    (%rax),%eax
    1eb8:	00 10                	add    %dl,(%rax)
    1eba:	77 14                	ja     1ed0 <_fini+0x9b8>
    1ebc:	00 00                	add    %al,(%rax)
    1ebe:	00 3a                	add    %bh,(%rdx)
    1ec0:	08 05 79 16 00 00    	or     %al,0x1679(%rip)        # 353f <__FRAME_END__+0x1323>
    1ec6:	45                   	rex.RB
    1ec7:	49 0e                	rex.WB (bad) 
    1ec9:	00 00                	add    %al,(%rax)
    1ecb:	21 c0                	and    %eax,%eax
    1ecd:	01 1f                	add    %ebx,(%rdi)
    1ecf:	e7 1e                	out    %eax,$0x1e
    1ed1:	00 00                	add    %al,(%rax)
    1ed3:	e7 1e                	out    %eax,$0x1e
    1ed5:	00 00                	add    %al,(%rax)
    1ed7:	10 f0                	adc    %dh,%al
    1ed9:	16                   	(bad)  
    1eda:	00 00                	add    %al,(%rax)
    1edc:	10 c3                	adc    %al,%bl
    1ede:	1b 00                	sbb    (%rax),%eax
    1ee0:	00 10                	add    %dl,(%rax)
    1ee2:	77 14                	ja     1ef8 <_fini+0x9e0>
    1ee4:	00 00                	add    %al,(%rax)
    1ee6:	00 3a                	add    %bh,(%rdx)
    1ee8:	08 07                	or     %al,(%rdi)
    1eea:	f6 1e                	negb   (%rsi)
    1eec:	00 00                	add    %al,(%rax)
    1eee:	4b 87 18             	rex.WXB xchg %rbx,(%r8)
    1ef1:	00 00                	add    %al,(%rax)
    1ef3:	44 08 9c 02 00 00 44 	or     %r11b,0x8440000(%rdx,%rax,1)
    1efa:	08 
    1efb:	e2 02                	loop   1eff <_fini+0x9e7>
    1efd:	00 00                	add    %al,(%rax)
    1eff:	44 08 ab 04 00 00 4c 	or     %r13b,0x4c000004(%rbx)
    1f06:	08 ab 04 00 00 4d    	or     %ch,0x4d000004(%rbx)
    1f0c:	08 e2                	or     %ah,%dl
    1f0e:	02 00                	add    (%rax),%al
    1f10:	00 4c 08 e2          	add    %cl,-0x1e(%rax,%rcx,1)
    1f14:	02 00                	add    (%rax),%al
    1f16:	00 3a                	add    %bh,(%rdx)
    1f18:	01 02                	add    %eax,(%rdx)
    1f1a:	94                   	xchg   %eax,%esp
    1f1b:	19 00                	sbb    %eax,(%rax)
    1f1d:	00 0a                	add    %cl,(%rdx)
    1f1f:	17                   	(bad)  
    1f20:	1f                   	(bad)  
    1f21:	00 00                	add    %al,(%rax)
    1f23:	44 08 e9             	or     %r13b,%cl
    1f26:	04 00                	add    $0x0,%al
    1f28:	00 44 08 63          	add    %al,0x63(%rax,%rcx,1)
    1f2c:	05 00 00 44 08       	add    $0x8440000,%eax
    1f31:	dd 05 00 00 3a 01    	fldl   0x13a0000(%rip)        # 13a1f37 <_end+0x139dd6f>
    1f37:	08 cd                	or     %cl,%ch
    1f39:	09 00                	or     %eax,(%rax)
    1f3b:	00 3a                	add    %bh,(%rdx)
    1f3d:	10 07                	adc    %al,(%rdi)
    1f3f:	e3 09                	jrcxz  1f4a <_fini+0xa32>
    1f41:	00 00                	add    %al,(%rax)
    1f43:	3a 01                	cmp    (%rcx),%al
    1f45:	06                   	(bad)  
    1f46:	cf                   	iret   
    1f47:	09 00                	or     %eax,(%rax)
    1f49:	00 3a                	add    %bh,(%rdx)
    1f4b:	02 05 af 24 00 00    	add    0x24af(%rip),%al        # 4400 <_end+0x238>
    1f51:	0a 4a 1f             	or     0x1f(%rdx),%cl
    1f54:	00 00                	add    %al,(%rax)
    1f56:	3a 10                	cmp    (%rax),%dl
    1f58:	05 73 22 00 00       	add    $0x2273,%eax
    1f5d:	3a 02                	cmp    (%rdx),%al
    1f5f:	10 15 0a 00 00 3a    	adc    %dl,0x3a00000a(%rip)        # 3a001f6f <_end+0x39ffdda7>
    1f65:	04 10                	add    $0x10,%al
    1f67:	e9 13 00 00 44       	jmpq   44001f7f <_end+0x43ffddb7>
    1f6c:	08 85 06 00 00 4e    	or     %al,0x4e000006(%rbp)
    1f72:	af                   	scas   %es:(%rdi),%eax
    1f73:	06                   	(bad)  
    1f74:	00 00                	add    %al,(%rax)
    1f76:	0c 45                	or     $0x45,%al
    1f78:	13 00                	adc    (%rax),%eax
    1f7a:	00 0a                	add    %cl,(%rdx)
    1f7c:	38 0b                	cmp    %cl,(%rbx)
    1f7e:	8b 1f                	mov    (%rdi),%ebx
    1f80:	00 00                	add    %al,(%rax)
    1f82:	2b 0a                	sub    (%rdx),%ecx
    1f84:	3a 18                	cmp    (%rax),%bl
    1f86:	bd 06 00 00 00       	mov    $0x6,%ebp
    1f8b:	4c 08 ef             	rex.WR or %r13b,%dil
    1f8e:	06                   	(bad)  
    1f8f:	00 00                	add    %al,(%rax)
    1f91:	4c 08 fc             	rex.WR or %r15b,%spl
    1f94:	06                   	(bad)  
    1f95:	00 00                	add    %al,(%rax)
    1f97:	44 08 fc             	or     %r15b,%spl
    1f9a:	06                   	(bad)  
    1f9b:	00 00                	add    %al,(%rax)
    1f9d:	44 08 ef             	or     %r13b,%dil
    1fa0:	06                   	(bad)  
    1fa1:	00 00                	add    %al,(%rax)
    1fa3:	4c 08 3b             	rex.WR or %r15b,(%rbx)
    1fa6:	08 00                	or     %al,(%rax)
    1fa8:	00 4c 08 db          	add    %cl,-0x25(%rax,%rcx,1)
    1fac:	08 00                	or     %al,(%rax)
    1fae:	00 4c 08 e8          	add    %cl,-0x18(%rax,%rcx,1)
    1fb2:	08 00                	or     %al,(%rax)
    1fb4:	00 44 08 e8          	add    %al,-0x18(%rax,%rcx,1)
    1fb8:	08 00                	or     %al,(%rax)
    1fba:	00 44 08 db          	add    %al,-0x25(%rax,%rcx,1)
    1fbe:	08 00                	or     %al,(%rax)
    1fc0:	00 4c 08 27          	add    %cl,0x27(%rax,%rcx,1)
    1fc4:	0a 00                	or     (%rax),%al
    1fc6:	00 1b                	add    %bl,(%rbx)
    1fc8:	74 1e                	je     1fe8 <_fini+0xad0>
    1fca:	00 00                	add    %al,(%rax)
    1fcc:	23 25 15 43 1f 00    	and    0x1f4315(%rip),%esp        # 1f62e7 <_end+0x1f211f>
    1fd2:	00 1b                	add    %bl,(%rbx)
    1fd4:	66 05 00 00          	add    $0x0,%ax
    1fd8:	23 26                	and    (%rsi),%esp
    1fda:	17                   	(bad)  
    1fdb:	35 1f 00 00 1b       	xor    $0x1b00001f,%eax
    1fe0:	da 21                	fisubl (%rcx)
    1fe2:	00 00                	add    %al,(%rax)
    1fe4:	23 27                	and    (%rdi),%esp
    1fe6:	1a 4a 1f             	sbb    0x1f(%rdx),%cl
    1fe9:	00 00                	add    %al,(%rax)
    1feb:	1b 32                	sbb    (%rdx),%esi
    1fed:	21 00                	and    %eax,(%rax)
    1fef:	00 23                	add    %ah,(%rbx)
    1ff1:	28 1c 3f             	sub    %bl,(%rdi,%rdi,1)
    1ff4:	16                   	(bad)  
    1ff5:	00 00                	add    %al,(%rax)
    1ff7:	1b 4f 2b             	sbb    0x2b(%rdi),%ecx
    1ffa:	00 00                	add    %al,(%rax)
    1ffc:	23 29                	and    (%rcx),%ebp
    1ffe:	14 77                	adc    $0x77,%al
    2000:	14 00                	adc    $0x0,%al
    2002:	00 0a                	add    %cl,(%rdx)
    2004:	f7 1f                	negl   (%rdi)
    2006:	00 00                	add    %al,(%rax)
    2008:	1b 3d 16 00 00 23    	sbb    0x23000016(%rip),%edi        # 23002024 <_end+0x22ffde5c>
    200e:	2a 16                	sub    (%rsi),%dl
    2010:	fc                   	cld    
    2011:	13 00                	adc    (%rax),%eax
    2013:	00 1b                	add    %bl,(%rbx)
    2015:	a9 27 00 00 23       	test   $0x23000027,%eax
    201a:	2c 19                	sub    $0x19,%al
    201c:	26 1c 00             	es sbb $0x0,%al
    201f:	00 1b                	add    %bl,(%rbx)
    2021:	83 12 00             	adcl   $0x0,(%rdx)
    2024:	00 23                	add    %ah,(%rbx)
    2026:	2d 1b b3 13 00       	sub    $0x13b31b,%eax
    202b:	00 1b                	add    %bl,(%rbx)
    202d:	40 0d 00 00 23 34    	rex or $0x34230000,%eax
    2033:	12 c7                	adc    %bh,%al
    2035:	1f                   	(bad)  
    2036:	00 00                	add    %al,(%rax)
    2038:	1b 6e 01             	sbb    0x1(%rsi),%ebp
    203b:	00 00                	add    %al,(%rax)
    203d:	23 35 13 d3 1f 00    	and    0x1fd313(%rip),%esi        # 1ff356 <_end+0x1fb18e>
    2043:	00 1b                	add    %bl,(%rbx)
    2045:	c0 20 00             	shlb   $0x0,(%rax)
    2048:	00 23                	add    %ah,(%rbx)
    204a:	36 13 df             	ss adc %edi,%ebx
    204d:	1f                   	(bad)  
    204e:	00 00                	add    %al,(%rax)
    2050:	1b a7 09 00 00 23    	sbb    0x23000009(%rdi),%esp
    2056:	37                   	(bad)  
    2057:	14 eb                	adc    $0xeb,%al
    2059:	1f                   	(bad)  
    205a:	00 00                	add    %al,(%rax)
    205c:	1b b9 29 00 00 23    	sbb    0x23000029(%rcx),%edi
    2062:	38 13                	cmp    %dl,(%rbx)
    2064:	f7 1f                	negl   (%rdi)
    2066:	00 00                	add    %al,(%rax)
    2068:	1b 51 13             	sbb    0x13(%rcx),%edx
    206b:	00 00                	add    %al,(%rax)
    206d:	23 39                	and    (%rcx),%edi
    206f:	14 08                	adc    $0x8,%al
    2071:	20 00                	and    %al,(%rax)
    2073:	00 1b                	add    %bl,(%rbx)
    2075:	06                   	(bad)  
    2076:	26 00 00             	add    %al,%es:(%rax)
    2079:	23 3a                	and    (%rdx),%edi
    207b:	13 14 20             	adc    (%rax,%riz,1),%edx
    207e:	00 00                	add    %al,(%rax)
    2080:	1b 5f 0f             	sbb    0xf(%rdi),%ebx
    2083:	00 00                	add    %al,(%rax)
    2085:	23 3b                	and    (%rbx),%edi
    2087:	14 20                	adc    $0x20,%al
    2089:	20 00                	and    %al,(%rax)
    208b:	00 1b                	add    %bl,(%rbx)
    208d:	c1 18 00             	rcrl   $0x0,(%rax)
    2090:	00 23                	add    %ah,(%rbx)
    2092:	48 12 26             	rex.W adc (%rsi),%spl
    2095:	1c 00                	sbb    $0x0,%al
    2097:	00 1b                	add    %bl,(%rbx)
    2099:	86 26                	xchg   %ah,(%rsi)
    209b:	00 00                	add    %al,(%rax)
    209d:	23 49 1b             	and    0x1b(%rcx),%ecx
    20a0:	b3 13                	mov    $0x13,%bl
    20a2:	00 00                	add    %al,(%rax)
    20a4:	1b 8a 1f 00 00 23    	sbb    0x2300001f(%rdx),%ecx
    20aa:	98                   	cwtl   
    20ab:	19 26                	sbb    %esp,(%rsi)
    20ad:	1c 00                	sbb    $0x0,%al
    20af:	00 1b                	add    %bl,(%rbx)
    20b1:	8d 22                	lea    (%rdx),%esp
    20b3:	00 00                	add    %al,(%rax)
    20b5:	23 99 1b 26 1c 00    	and    0x1c261b(%rcx),%ebx
    20bb:	00 1b                	add    %bl,(%rbx)
    20bd:	76 1e                	jbe    20dd <__GNU_EH_FRAME_HDR+0xb1>
    20bf:	00 00                	add    %al,(%rax)
    20c1:	24 18                	and    $0x18,%al
    20c3:	12 c7                	adc    %bh,%al
    20c5:	1f                   	(bad)  
    20c6:	00 00                	add    %al,(%rax)
    20c8:	1b dc                	sbb    %esp,%ebx
    20ca:	21 00                	and    %eax,(%rax)
    20cc:	00 24 19             	add    %ah,(%rcx,%rbx,1)
    20cf:	13 df                	adc    %edi,%ebx
    20d1:	1f                   	(bad)  
    20d2:	00 00                	add    %al,(%rax)
    20d4:	1b 51 2b             	sbb    0x2b(%rcx),%edx
    20d7:	00 00                	add    %al,(%rax)
    20d9:	24 1a                	and    $0x1a,%al
    20db:	13 f7                	adc    %edi,%esi
    20dd:	1f                   	(bad)  
    20de:	00 00                	add    %al,(%rax)
    20e0:	1b ab 27 00 00 24    	sbb    0x24000027(%rbx),%ebp
    20e6:	1b 13                	sbb    (%rbx),%edx
    20e8:	14 20                	adc    $0x20,%al
    20ea:	00 00                	add    %al,(%rax)
    20ec:	1b 68 05             	sbb    0x5(%rax),%ebp
    20ef:	00 00                	add    %al,(%rax)
    20f1:	25 18 13 d3 1f       	and    $0x1fd31318,%eax
    20f6:	00 00                	add    %al,(%rax)
    20f8:	1b 34 21             	sbb    (%rcx,%riz,1),%esi
    20fb:	00 00                	add    %al,(%rax)
    20fd:	25 19 14 eb 1f       	and    $0x1feb1419,%eax
    2102:	00 00                	add    %al,(%rax)
    2104:	1b 3f                	sbb    (%rdi),%edi
    2106:	16                   	(bad)  
    2107:	00 00                	add    %al,(%rax)
    2109:	25 1a 14 08 20       	and    $0x2008141a,%eax
    210e:	00 00                	add    %al,(%rax)
    2110:	1b 85 12 00 00 25    	sbb    0x25000012(%rbp),%eax
    2116:	1b 14 20             	sbb    (%rax,%riz,1),%edx
    2119:	20 00                	and    %al,(%rax)
    211b:	00 1b                	add    %bl,(%rbx)
    211d:	42 0d 00 00 26 2b    	rex.X or $0x2b260000,%eax
    2123:	18 2c 20             	sbb    %ch,(%rax,%riz,1)
    2126:	00 00                	add    %al,(%rax)
    2128:	1b c2                	sbb    %edx,%eax
    212a:	20 00                	and    %al,(%rax)
    212c:	00 26                	add    %ah,(%rsi)
    212e:	2c 19                	sub    $0x19,%al
    2130:	44 20 00             	and    %r8b,(%rax)
    2133:	00 1b                	add    %bl,(%rbx)
    2135:	bb 29 00 00 26       	mov    $0x26000029,%ebx
    213a:	2d 19 5c 20 00       	sub    $0x205c19,%eax
    213f:	00 1b                	add    %bl,(%rbx)
    2141:	08 26                	or     %ah,(%rsi)
    2143:	00 00                	add    %al,(%rax)
    2145:	26 2e 19 74 20 00    	es sbb %esi,%cs:0x0(%rax,%riz,1)
    214b:	00 1b                	add    %bl,(%rbx)
    214d:	70 01                	jo     2150 <__GNU_EH_FRAME_HDR+0x124>
    214f:	00 00                	add    %al,(%rax)
    2151:	26 31 19             	xor    %ebx,%es:(%rcx)
    2154:	38 20                	cmp    %ah,(%rax)
    2156:	00 00                	add    %al,(%rax)
    2158:	1b a9 09 00 00 26    	sbb    0x26000009(%rcx),%ebp
    215e:	32 1a                	xor    (%rdx),%bl
    2160:	50                   	push   %rax
    2161:	20 00                	and    %al,(%rax)
    2163:	00 1b                	add    %bl,(%rbx)
    2165:	53                   	push   %rbx
    2166:	13 00                	adc    (%rax),%eax
    2168:	00 26                	add    %ah,(%rsi)
    216a:	33 1a                	xor    (%rdx),%ebx
    216c:	68 20 00 00 1b       	pushq  $0x1b000020
    2171:	61                   	(bad)  
    2172:	0f 00 00             	sldt   (%rax)
    2175:	26 34 1a             	es xor $0x1a,%al
    2178:	80 20 00             	andb   $0x0,(%rax)
    217b:	00 1b                	add    %bl,(%rbx)
    217d:	e5 21                	in     $0x21,%eax
    217f:	00 00                	add    %al,(%rax)
    2181:	26 3a 16             	cmp    %es:(%rsi),%dl
    2184:	43 1f                	rex.XB (bad) 
    2186:	00 00                	add    %al,(%rax)
    2188:	1b 30                	sbb    (%rax),%esi
    218a:	29 00                	sub    %eax,(%rax)
    218c:	00 26                	add    %ah,(%rsi)
    218e:	3c 13                	cmp    $0x13,%al
    2190:	26 1c 00             	es sbb $0x0,%al
    2193:	00 1b                	add    %bl,(%rbx)
    2195:	e7 04                	out    %eax,$0x4
    2197:	00 00                	add    %al,(%rax)
    2199:	26 3d 13 26 1c 00    	es cmp $0x1c2613,%eax
    219f:	00 1b                	add    %bl,(%rbx)
    21a1:	61                   	(bad)  
    21a2:	01 00                	add    %eax,(%rax)
    21a4:	00 26                	add    %ah,(%rsi)
    21a6:	3e 13 26             	adc    %ds:(%rsi),%esp
    21a9:	1c 00                	sbb    $0x0,%al
    21ab:	00 1b                	add    %bl,(%rbx)
    21ad:	e4 21                	in     $0x21,%al
    21af:	00 00                	add    %al,(%rax)
    21b1:	26 47 18 35 1f 00 00 	rex.RXB sbb %r14b,%es:0x1b00001f(%rip)        # 1b0021d8 <_end+0x1affe010>
    21b8:	1b 
    21b9:	2f                   	(bad)  
    21ba:	29 00                	sub    %eax,(%rax)
    21bc:	00 26                	add    %ah,(%rsi)
    21be:	49 1b b3 13 00 00 1b 	sbb    0x1b000013(%r11),%rsi
    21c5:	e6 04                	out    %al,$0x4
    21c7:	00 00                	add    %al,(%rax)
    21c9:	26 4a 1b b3 13 00 00 	rex.WX sbb %es:0x1b000013(%rbx),%rsi
    21d0:	1b 
    21d1:	60                   	(bad)  
    21d2:	01 00                	add    %eax,(%rax)
    21d4:	00 26                	add    %ah,(%rsi)
    21d6:	4b 1b b3 13 00 00 1b 	rex.WXB sbb 0x1b000013(%r11),%rsi
    21dd:	64 14 00             	fs adc $0x0,%al
    21e0:	00 26                	add    %ah,(%rsi)
    21e2:	57                   	push   %rdi
    21e3:	13 26                	adc    (%rsi),%esp
    21e5:	1c 00                	sbb    $0x0,%al
    21e7:	00 1b                	add    %bl,(%rbx)
    21e9:	63 14 00             	movslq (%rax,%rax,1),%edx
    21ec:	00 26                	add    %ah,(%rsi)
    21ee:	5a                   	pop    %rdx
    21ef:	1b b3 13 00 00 1b    	sbb    0x1b000013(%rbx),%esi
    21f5:	c3                   	retq   
    21f6:	18 00                	sbb    %al,(%rax)
    21f8:	00 26                	add    %ah,(%rsi)
    21fa:	65 15 8c 20 00 00    	gs adc $0x208c,%eax
    2200:	1b 88 26 00 00 26    	sbb    0x26000026(%rax),%ecx
    2206:	66 16                	data16 (bad) 
    2208:	98                   	cwtl   
    2209:	20 00                	and    %al,(%rax)
    220b:	00 07                	add    %al,(%rdi)
    220d:	cb                   	lret   
    220e:	27                   	(bad)  
    220f:	00 00                	add    %al,(%rax)
    2211:	60                   	(bad)  
    2212:	27                   	(bad)  
    2213:	33 08                	xor    (%rax),%ecx
    2215:	52                   	push   %rdx
    2216:	23 00                	and    (%rax),%eax
    2218:	00 0e                	add    %cl,(%rsi)
    221a:	fe                   	(bad)  
    221b:	1a 00                	sbb    (%rax),%al
    221d:	00 27                	add    %ah,(%rdi)
    221f:	37                   	(bad)  
    2220:	09 90 19 00 00 00    	or     %edx,0x19(%rax)
    2226:	0e                   	(bad)  
    2227:	32 0d 00 00 27 38    	xor    0x38270000(%rip),%cl        # 3827222d <_end+0x3826e065>
    222d:	09 90 19 00 00 08    	or     %edx,0x8000019(%rax)
    2233:	0e                   	(bad)  
    2234:	33 26                	xor    (%rsi),%esp
    2236:	00 00                	add    %al,(%rax)
    2238:	27                   	(bad)  
    2239:	3e 09 90 19 00 00 10 	or     %edx,%ds:0x10000019(%rax)
    2240:	0e                   	(bad)  
    2241:	ea                   	(bad)  
    2242:	02 00                	add    (%rax),%al
    2244:	00 27                	add    %ah,(%rdi)
    2246:	44 09 90 19 00 00 18 	or     %r10d,0x18000019(%rax)
    224d:	0e                   	(bad)  
    224e:	98                   	cwtl   
    224f:	24 00                	and    $0x0,%al
    2251:	00 27                	add    %ah,(%rdi)
    2253:	45 09 90 19 00 00 20 	or     %r10d,0x20000019(%r8)
    225a:	0e                   	(bad)  
    225b:	fa                   	cli    
    225c:	1a 00                	sbb    (%rax),%al
    225e:	00 27                	add    %ah,(%rdi)
    2260:	46 09 90 19 00 00 28 	rex.RX or %r10d,0x28000019(%rax)
    2267:	0e                   	(bad)  
    2268:	2e 0d 00 00 27 47    	cs or  $0x47270000,%eax
    226e:	09 90 19 00 00 30    	or     %edx,0x30000019(%rax)
    2274:	0e                   	(bad)  
    2275:	2f                   	(bad)  
    2276:	26 00 00             	add    %al,%es:(%rax)
    2279:	27                   	(bad)  
    227a:	48 09 90 19 00 00 38 	or     %rdx,0x38000019(%rax)
    2281:	0e                   	(bad)  
    2282:	05 05 00 00 27       	add    $0x27000005,%eax
    2287:	49 09 90 19 00 00 40 	or     %rdx,0x40000019(%r8)
    228e:	0e                   	(bad)  
    228f:	59                   	pop    %rcx
    2290:	10 00                	adc    %al,(%rax)
    2292:	00 27                	add    %ah,(%rdi)
    2294:	4a 09 90 19 00 00 48 	rex.WX or %rdx,0x48000019(%rax)
    229b:	0e                   	(bad)  
    229c:	12 04 00             	adc    (%rax,%rax,1),%al
    229f:	00 27                	add    %ah,(%rdi)
    22a1:	4b 08 6b 14          	rex.WXB or %bpl,0x14(%r11)
    22a5:	00 00                	add    %al,(%rax)
    22a7:	50                   	push   %rax
    22a8:	0e                   	(bad)  
    22a9:	16                   	(bad)  
    22aa:	04 00                	add    $0x0,%al
    22ac:	00 27                	add    %ah,(%rdi)
    22ae:	4c 08 6b 14          	rex.WR or %r13b,0x14(%rbx)
    22b2:	00 00                	add    %al,(%rax)
    22b4:	51                   	push   %rcx
    22b5:	0e                   	(bad)  
    22b6:	70 07                	jo     22bf <__FRAME_END__+0xa3>
    22b8:	00 00                	add    %al,(%rax)
    22ba:	27                   	(bad)  
    22bb:	4e 08 6b 14          	rex.WRX or %r13b,0x14(%rbx)
    22bf:	00 00                	add    %al,(%rax)
    22c1:	52                   	push   %rdx
    22c2:	0e                   	(bad)  
    22c3:	04 00                	add    $0x0,%al
    22c5:	00 00                	add    %al,(%rax)
    22c7:	27                   	(bad)  
    22c8:	50                   	push   %rax
    22c9:	08 6b 14             	or     %ch,0x14(%rbx)
    22cc:	00 00                	add    %al,(%rax)
    22ce:	53                   	push   %rbx
    22cf:	0e                   	(bad)  
    22d0:	ac                   	lods   %ds:(%rsi),%al
    22d1:	07                   	(bad)  
    22d2:	00 00                	add    %al,(%rax)
    22d4:	27                   	(bad)  
    22d5:	52                   	push   %rdx
    22d6:	08 6b 14             	or     %ch,0x14(%rbx)
    22d9:	00 00                	add    %al,(%rax)
    22db:	54                   	push   %rsp
    22dc:	0e                   	(bad)  
    22dd:	89 15 00 00 27 54    	mov    %edx,0x54270000(%rip)        # 542722e3 <_end+0x5426e11b>
    22e3:	08 6b 14             	or     %ch,0x14(%rbx)
    22e6:	00 00                	add    %al,(%rax)
    22e8:	55                   	push   %rbp
    22e9:	0e                   	(bad)  
    22ea:	1c 27                	sbb    $0x27,%al
    22ec:	00 00                	add    %al,(%rax)
    22ee:	27                   	(bad)  
    22ef:	5b                   	pop    %rbx
    22f0:	08 6b 14             	or     %ch,0x14(%rbx)
    22f3:	00 00                	add    %al,(%rax)
    22f5:	56                   	push   %rsi
    22f6:	0e                   	(bad)  
    22f7:	f2 28 00             	repnz sub %al,(%rax)
    22fa:	00 27                	add    %ah,(%rdi)
    22fc:	5c                   	pop    %rsp
    22fd:	08 6b 14             	or     %ch,0x14(%rbx)
    2300:	00 00                	add    %al,(%rax)
    2302:	57                   	push   %rdi
    2303:	0e                   	(bad)  
    2304:	6c                   	insb   (%dx),%es:(%rdi)
    2305:	07                   	(bad)  
    2306:	00 00                	add    %al,(%rax)
    2308:	27                   	(bad)  
    2309:	5f                   	pop    %rdi
    230a:	08 6b 14             	or     %ch,0x14(%rbx)
    230d:	00 00                	add    %al,(%rax)
    230f:	58                   	pop    %rax
    2310:	0e                   	(bad)  
    2311:	00 00                	add    %al,(%rax)
    2313:	00 00                	add    %al,(%rax)
    2315:	27                   	(bad)  
    2316:	61                   	(bad)  
    2317:	08 6b 14             	or     %ch,0x14(%rbx)
    231a:	00 00                	add    %al,(%rax)
    231c:	59                   	pop    %rcx
    231d:	0e                   	(bad)  
    231e:	a8 07                	test   $0x7,%al
    2320:	00 00                	add    %al,(%rax)
    2322:	27                   	(bad)  
    2323:	63 08                	movslq (%rax),%ecx
    2325:	6b 14 00 00          	imul   $0x0,(%rax,%rax,1),%edx
    2329:	5a                   	pop    %rdx
    232a:	0e                   	(bad)  
    232b:	85 15 00 00 27 65    	test   %edx,0x65270000(%rip)        # 65272331 <_end+0x6526e169>
    2331:	08 6b 14             	or     %ch,0x14(%rbx)
    2334:	00 00                	add    %al,(%rax)
    2336:	5b                   	pop    %rbx
    2337:	0e                   	(bad)  
    2338:	18 27                	sbb    %ah,(%rdi)
    233a:	00 00                	add    %al,(%rax)
    233c:	27                   	(bad)  
    233d:	6c                   	insb   (%dx),%es:(%rdi)
    233e:	08 6b 14             	or     %ch,0x14(%rbx)
    2341:	00 00                	add    %al,(%rax)
    2343:	5c                   	pop    %rsp
    2344:	0e                   	(bad)  
    2345:	ee                   	out    %al,(%dx)
    2346:	28 00                	sub    %al,(%rax)
    2348:	00 27                	add    %ah,(%rdi)
    234a:	6d                   	insl   (%dx),%es:(%rdi)
    234b:	08 6b 14             	or     %ch,0x14(%rbx)
    234e:	00 00                	add    %al,(%rax)
    2350:	5d                   	pop    %rbp
    2351:	00 48 01             	add    %cl,0x1(%rax)
    2354:	22 00                	and    (%rax),%al
    2356:	00 27                	add    %ah,(%rdi)
    2358:	7a 0e                	jp     2368 <__FRAME_END__+0x14c>
    235a:	90                   	nop
    235b:	19 00                	sbb    %eax,(%rax)
    235d:	00 6d 23             	add    %ch,0x23(%rbp)
    2360:	00 00                	add    %al,(%rax)
    2362:	10 77 14             	adc    %dh,0x14(%rdi)
    2365:	00 00                	add    %al,(%rax)
    2367:	10 46 16             	adc    %al,0x16(%rsi)
    236a:	00 00                	add    %al,(%rax)
    236c:	00 4f 29             	add    %cl,0x29(%rdi)
    236f:	02 00                	add    (%rax),%al
    2371:	00 27                	add    %ah,(%rdi)
    2373:	7d 16                	jge    238b <__FRAME_END__+0x16f>
    2375:	79 23                	jns    239a <__FRAME_END__+0x17e>
    2377:	00 00                	add    %al,(%rax)
    2379:	44 08 0c 22          	or     %r9b,(%rdx,%riz,1)
    237d:	00 00                	add    %al,(%rax)
    237f:	41 90                	xchg   %eax,%r8d
    2381:	19 00                	sbb    %eax,(%rax)
    2383:	00 8f 23 00 00 42    	add    %cl,0x42000023(%rdi)
    2389:	b3 13                	mov    $0x13,%bl
    238b:	00 00                	add    %al,(%rax)
    238d:	01 00                	add    %eax,(%rax)
    238f:	50                   	push   %rax
    2390:	24 0b                	and    $0xb,%al
    2392:	00 00                	add    %al,(%rax)
    2394:	28 9f 0e 7f 23 00    	sub    %bl,0x237f0e(%rdi)
    239a:	00 50 5d             	add    %dl,0x5d(%rax)
    239d:	27                   	(bad)  
    239e:	00 00                	add    %al,(%rax)
    23a0:	28 a0 0c 77 14 00    	sub    %ah,0x14770c(%rax)
    23a6:	00 50 10             	add    %dl,0x10(%rax)
    23a9:	09 00                	or     %eax,(%rax)
    23ab:	00 28                	add    %ch,(%rax)
    23ad:	a1 11 26 1c 00 00 50 	movabs 0xb265000001c2611,%eax
    23b4:	26 0b 
    23b6:	00 00                	add    %al,(%rax)
    23b8:	28 a6 0e 7f 23 00    	sub    %ah,0x237f0e(%rsi)
    23be:	00 50 5f             	add    %dl,0x5f(%rax)
    23c1:	27                   	(bad)  
    23c2:	00 00                	add    %al,(%rax)
    23c4:	28 ae 0c 77 14 00    	sub    %ch,0x14770c(%rsi)
    23ca:	00 50 12             	add    %dl,0x12(%rax)
    23cd:	09 00                	or     %eax,(%rax)
    23cf:	00 28                	add    %ch,(%rax)
    23d1:	af                   	scas   %es:(%rdi),%eax
    23d2:	11 26                	adc    %esp,(%rsi)
    23d4:	1c 00                	sbb    $0x0,%al
    23d6:	00 51 2d             	add    %dl,0x2d(%rcx)
    23d9:	1e                   	(bad)  
    23da:	00 00                	add    %al,(%rax)
    23dc:	28 12                	sub    %dl,(%rdx)
    23de:	01 0c 77             	add    %ecx,(%rdi,%rsi,2)
    23e1:	14 00                	adc    $0x0,%al
    23e3:	00 07                	add    %al,(%rdi)
    23e5:	1d 03 00 00 10       	sbb    $0x10000003,%eax
    23ea:	29 31                	sub    %esi,(%rcx)
    23ec:	10 0c 24             	adc    %cl,(%rsp)
    23ef:	00 00                	add    %al,(%rax)
    23f1:	0e                   	(bad)  
    23f2:	b9 02 00 00 29       	mov    $0x29000002,%ecx
    23f7:	33 23                	xor    (%rbx),%esp
    23f9:	0c 24                	or     $0x24,%al
    23fb:	00 00                	add    %al,(%rax)
    23fd:	00 0e                	add    %cl,(%rsi)
    23ff:	83 02 00             	addl   $0x0,(%rdx)
    2402:	00 29                	add    %ch,(%rcx)
    2404:	34 23                	xor    $0x23,%al
    2406:	0c 24                	or     $0x24,%al
    2408:	00 00                	add    %al,(%rax)
    240a:	08 00                	or     %al,(%rax)
    240c:	44 08 e4             	or     %r12b,%spl
    240f:	23 00                	and    (%rax),%eax
    2411:	00 1b                	add    %bl,(%rbx)
    2413:	7e 01                	jle    2416 <__FRAME_END__+0x1fa>
    2415:	00 00                	add    %al,(%rax)
    2417:	29 35 03 e4 23 00    	sub    %esi,0x23e403(%rip)        # 240820 <_end+0x23c658>
    241d:	00 07                	add    %al,(%rdi)
    241f:	85 2a                	test   %ebp,(%rdx)
    2421:	00 00                	add    %al,(%rax)
    2423:	28 2a                	sub    %ch,(%rdx)
    2425:	16                   	(bad)  
    2426:	08 94 24 00 00 0e 6d 	or     %dl,0x6d0e0000(%rsp)
    242d:	10 00                	adc    %al,(%rax)
    242f:	00 2a                	add    %ch,(%rdx)
    2431:	18 07                	sbb    %al,(%rdi)
    2433:	77 14                	ja     2449 <__FRAME_END__+0x22d>
    2435:	00 00                	add    %al,(%rax)
    2437:	00 0e                	add    %cl,(%rsi)
    2439:	a0 1b 00 00 2a 19 10 	movabs 0x13fc10192a00001b,%al
    2440:	fc 13 
    2442:	00 00                	add    %al,(%rax)
    2444:	04 0e                	add    $0xe,%al
    2446:	d0 1c 00             	rcrb   (%rax,%rax,1)
    2449:	00 2a                	add    %ch,(%rdx)
    244b:	1a 07                	sbb    (%rdi),%al
    244d:	77 14                	ja     2463 <__FRAME_END__+0x247>
    244f:	00 00                	add    %al,(%rax)
    2451:	08 0e                	or     %cl,(%rsi)
    2453:	54                   	push   %rsp
    2454:	08 00                	or     %al,(%rax)
    2456:	00 2a                	add    %ch,(%rdx)
    2458:	1c 10                	sbb    $0x10,%al
    245a:	fc                   	cld    
    245b:	13 00                	adc    (%rax),%eax
    245d:	00 0c 0e             	add    %cl,(%rsi,%rcx,1)
    2460:	b3 00                	mov    $0x0,%bl
    2462:	00 00                	add    %al,(%rax)
    2464:	2a 20                	sub    (%rax),%ah
    2466:	07                   	(bad)  
    2467:	77 14                	ja     247d <__FRAME_END__+0x261>
    2469:	00 00                	add    %al,(%rax)
    246b:	10 0e                	adc    %cl,(%rsi)
    246d:	db 09                	fisttpl (%rcx)
    246f:	00 00                	add    %al,(%rax)
    2471:	2a 22                	sub    (%rdx),%ah
    2473:	09 4a 1f             	or     %ecx,0x1f(%rdx)
    2476:	00 00                	add    %al,(%rax)
    2478:	14 0e                	adc    $0xe,%al
    247a:	0b 16                	or     (%rsi),%edx
    247c:	00 00                	add    %al,(%rax)
    247e:	2a 23                	sub    (%rbx),%ah
    2480:	09 4a 1f             	or     %ecx,0x1f(%rdx)
    2483:	00 00                	add    %al,(%rax)
    2485:	16                   	(bad)  
    2486:	0e                   	(bad)  
    2487:	33 1f                	xor    (%rdi),%ebx
    2489:	00 00                	add    %al,(%rax)
    248b:	2a 24 14             	sub    (%rsp,%rdx,1),%ah
    248e:	12 24 00             	adc    (%rax,%rax,1),%ah
    2491:	00 18                	add    %bl,(%rax)
    2493:	00 1b                	add    %bl,(%rbx)
    2495:	07                   	(bad)  
    2496:	13 00                	adc    (%rax),%eax
    2498:	00 2b                	add    %ch,(%rbx)
    249a:	1b 1b                	sbb    (%rbx),%ebx
    249c:	b3 13                	mov    $0x13,%bl
    249e:	00 00                	add    %al,(%rax)
    24a0:	52                   	push   %rdx
    24a1:	28 2b                	sub    %ch,(%rbx)
    24a3:	44 01 70 05          	add    %r14d,0x5(%rax)
    24a7:	00 00                	add    %al,(%rax)
    24a9:	d2 24 00             	shlb   %cl,(%rax,%rax,1)
    24ac:	00 40 97             	add    %al,-0x69(%rax)
    24af:	09 00                	or     %eax,(%rax)
    24b1:	00 2b                	add    %ch,(%rbx)
    24b3:	45 1c 1e             	rex.RB sbb $0x1e,%al
    24b6:	24 00                	and    $0x0,%al
    24b8:	00 40 6d             	add    %al,0x6d(%rax)
    24bb:	14 00                	adc    $0x0,%al
    24bd:	00 2b                	add    %ch,(%rbx)
    24bf:	46 08 d2             	rex.RX or %r10b,%dl
    24c2:	24 00                	and    $0x0,%al
    24c4:	00 40 7c             	add    %al,0x7c(%rax)
    24c7:	22 00                	and    (%rax),%al
    24c9:	00 2b                	add    %ch,(%rbx)
    24cb:	47 0c 26             	rex.RXB or $0x26,%al
    24ce:	1c 00                	sbb    $0x0,%al
    24d0:	00 00                	add    %al,(%rax)
    24d2:	41 6b 14 00 00       	imul   $0x0,(%r8,%rax,1),%edx
    24d7:	e2 24                	loop   24fd <__FRAME_END__+0x2e1>
    24d9:	00 00                	add    %al,(%rax)
    24db:	42 b3 13             	rex.X mov $0x13,%bl
    24de:	00 00                	add    %al,(%rax)
    24e0:	27                   	(bad)  
    24e1:	00 1b                	add    %bl,(%rbx)
    24e3:	72 05                	jb     24ea <__FRAME_END__+0x2ce>
    24e5:	00 00                	add    %al,(%rax)
    24e7:	2b 48 03             	sub    0x3(%rax),%ecx
    24ea:	a0 24 00 00 52 20 2b 	movabs 0x16d2b2052000024,%al
    24f1:	6d 01 
    24f3:	99                   	cltd   
    24f4:	18 00                	sbb    %al,(%rax)
    24f6:	00 14 25 00 00 40 6d 	add    %dl,0x6d400000
    24fd:	14 00                	adc    $0x0,%al
    24ff:	00 2b                	add    %ch,(%rbx)
    2501:	6e                   	outsb  %ds:(%rsi),(%dx)
    2502:	08 14 25 00 00 40 7c 	or     %dl,0x7c400000
    2509:	22 00                	and    (%rax),%al
    250b:	00 2b                	add    %ch,(%rbx)
    250d:	6f                   	outsl  %ds:(%rsi),(%dx)
    250e:	0c 26                	or     $0x26,%al
    2510:	1c 00                	sbb    $0x0,%al
    2512:	00 00                	add    %al,(%rax)
    2514:	41 6b 14 00 00       	imul   $0x0,(%r8,%rax,1),%edx
    2519:	24 25                	and    $0x25,%al
    251b:	00 00                	add    %al,(%rax)
    251d:	42 b3 13             	rex.X mov $0x13,%bl
    2520:	00 00                	add    %al,(%rax)
    2522:	1f                   	(bad)  
    2523:	00 1b                	add    %bl,(%rbx)
    2525:	9b                   	fwait
    2526:	18 00                	sbb    %al,(%rax)
    2528:	00 2b                	add    %ch,(%rbx)
    252a:	70 03                	jo     252f <__FRAME_END__+0x313>
    252c:	ee                   	out    %al,(%dx)
    252d:	24 00                	and    $0x0,%al
    252f:	00 1b                	add    %bl,(%rbx)
    2531:	fd                   	std    
    2532:	0d 00 00 2c 20       	or     $0x202c0000,%eax
    2537:	0d 77 14 00 00       	or     $0x1477,%eax
    253c:	44 08 42 25          	or     %r8b,0x25(%rdx)
    2540:	00 00                	add    %al,(%rax)
    2542:	53                   	push   %rbx
    2543:	3e 08 2d 3b 03 ba 0c 	or     %ch,%ds:0xcba033b(%rip)        # cba2885 <_end+0xcb9e6bd>
    254a:	00 00                	add    %al,(%rax)
    254c:	6b 25 00 00 0e 92 21 	imul   $0x21,-0x6df20000(%rip),%esp        # ffffffff920e2553 <_end+0xffffffff920de38b>
    2553:	00 00                	add    %al,(%rax)
    2555:	2d 3c 09 77 14       	sub    $0x1477093c,%eax
    255a:	00 00                	add    %al,(%rax)
    255c:	00 54 72 65          	add    %dl,0x65(%rdx,%rsi,2)
    2560:	6d                   	insl   (%dx),%es:(%rdi)
    2561:	00 2d 3d 09 77 14    	add    %ch,0x1477093d(%rip)        # 14772ea4 <_end+0x1476ecdc>
    2567:	00 00                	add    %al,(%rax)
    2569:	04 00                	add    $0x0,%al
    256b:	1b bb 0c 00 00 2d    	sbb    0x2d00000c(%rbx),%edi
    2571:	3e 05 43 25 00 00    	ds add $0x2543,%eax
    2577:	3e 10 2d 43 03 90 13 	adc    %ch,%ds:0x13900343(%rip)        # 139028c1 <_end+0x138fe6f9>
    257e:	00 00                	add    %al,(%rax)
    2580:	9f                   	lahf   
    2581:	25 00 00 0e 92       	and    $0x920e0000,%eax
    2586:	21 00                	and    %eax,(%rax)
    2588:	00 2d 44 0e 26 1c    	add    %ch,0x1c260e44(%rip)        # 1c2633d2 <_end+0x1c25f20a>
    258e:	00 00                	add    %al,(%rax)
    2590:	00 54 72 65          	add    %dl,0x65(%rdx,%rsi,2)
    2594:	6d                   	insl   (%dx),%es:(%rdi)
    2595:	00 2d 45 0e 26 1c    	add    %ch,0x1c260e45(%rip)        # 1c2633e0 <_end+0x1c25f218>
    259b:	00 00                	add    %al,(%rax)
    259d:	08 00                	or     %al,(%rax)
    259f:	1b 91 13 00 00 2d    	sbb    0x2d000013(%rcx),%edx
    25a5:	46 05 77 25 00 00    	rex.RX add $0x2577,%eax
    25ab:	3e 10 2d 4d 03 8f 0a 	adc    %ch,%ds:0xa8f034d(%rip)        # a8f28ff <_end+0xa8ee737>
    25b2:	00 00                	add    %al,(%rax)
    25b4:	d3 25 00 00 0e 92    	shll   %cl,-0x6df20000(%rip)        # ffffffff920e25ba <_end+0xffffffff920de3f2>
    25ba:	21 00                	and    %eax,(%rax)
    25bc:	00 2d 4e 13 bf 1e    	add    %ch,0x1ebf134e(%rip)        # 1ebf3910 <_end+0x1ebef748>
    25c2:	00 00                	add    %al,(%rax)
    25c4:	00 54 72 65          	add    %dl,0x65(%rdx,%rsi,2)
    25c8:	6d                   	insl   (%dx),%es:(%rdi)
    25c9:	00 2d 4f 13 bf 1e    	add    %ch,0x1ebf134f(%rip)        # 1ebf391e <_end+0x1ebef756>
    25cf:	00 00                	add    %al,(%rax)
    25d1:	08 00                	or     %al,(%rax)
    25d3:	1b 90 0a 00 00 2d    	sbb    0x2d00000a(%rax),%edx
    25d9:	50                   	push   %rax
    25da:	05 ab 25 00 00       	add    $0x25ab,%eax
    25df:	18 41 03             	sbb    %al,0x3(%rcx)
    25e2:	00 00                	add    %al,(%rax)
    25e4:	2d 28 03 0f ec       	sub    $0xec0f0328,%eax
    25e9:	25 00 00 44 08       	and    $0x8440000,%eax
    25ee:	f2 25 00 00 55 77    	repnz and $0x77550000,%eax
    25f4:	14 00                	adc    $0x0,%al
    25f6:	00 06                	add    %al,(%rsi)
    25f8:	26 00 00             	add    %al,%es:(%rax)
    25fb:	10 3c 25 00 00 10 3c 	adc    %bh,0x3c100000
    2602:	25 00 00 00 45       	and    $0x45000000,%eax
    2607:	c2 25 00             	retq   $0x25
    260a:	00 2d 53 02 0c 77    	add    %ch,0x770c0253(%rip)        # 770c2863 <_end+0x770be69b>
    2610:	14 00                	adc    $0x0,%al
    2612:	00 1d 26 00 00 10    	add    %bl,0x10000026(%rip)        # 1000263e <_end+0xfffe476>
    2618:	1d 26 00 00 00       	sbb    $0x26,%eax
    261d:	44 08 23             	or     %r12b,(%rbx)
    2620:	26 00 00             	add    %al,%es:(%rax)
    2623:	56                   	push   %rsi
    2624:	26 dc 02             	faddl  %es:(%rdx)
    2627:	00 00                	add    %al,(%rax)
    2629:	2d 58 02 12 dc       	sub    $0xdc120258,%eax
    262e:	02 00                	add    (%rax),%al
    2630:	00 77 14             	add    %dh,0x14(%rdi)
    2633:	00 00                	add    %al,(%rax)
    2635:	3f                   	(bad)  
    2636:	26 00 00             	add    %al,%es:(%rax)
    2639:	10 1d 26 00 00 00    	adc    %bl,0x26(%rip)        # 2665 <__FRAME_END__+0x449>
    263f:	48 8c 05 00 00 2d 65 	rex.W mov %es,0x652d0000(%rip)        # 652d2646 <_end+0x652ce47e>
    2646:	0f 99 13             	setns  (%rbx)
    2649:	00 00                	add    %al,(%rax)
    264b:	55                   	push   %rbp
    264c:	26 00 00             	add    %al,%es:(%rax)
    264f:	10 46 16             	adc    %al,0x16(%rsi)
    2652:	00 00                	add    %al,(%rax)
    2654:	00 48 bc             	add    %cl,-0x44(%rax)
    2657:	03 00                	add    (%rax),%eax
    2659:	00 2d 68 0c 77 14    	add    %ch,0x14770c68(%rip)        # 147732c7 <_end+0x1476f0ff>
    265f:	00 00                	add    %al,(%rax)
    2661:	6b 26 00             	imul   $0x0,(%rsi),%esp
    2664:	00 10                	add    %dl,(%rax)
    2666:	46 16                	rex.RX (bad) 
    2668:	00 00                	add    %al,(%rax)
    266a:	00 48 d0             	add    %cl,-0x30(%rax)
    266d:	05 00 00 2d 6b       	add    $0x6b2d0000,%eax
    2672:	11 26                	adc    %esp,(%rsi)
    2674:	1c 00                	sbb    $0x0,%al
    2676:	00 81 26 00 00 10    	add    %al,0x10000026(%rcx)
    267c:	46 16                	rex.RX (bad) 
    267e:	00 00                	add    %al,(%rax)
    2680:	00 45 00             	add    %al,0x0(%rbp)
    2683:	1e                   	(bad)  
    2684:	00 00                	add    %al,(%rax)
    2686:	2d 34 03 0e 03       	sub    $0x30e0334,%eax
    268b:	14 00                	adc    $0x0,%al
    268d:	00 ac 26 00 00 10 3c 	add    %ch,0x3c100000(%rsi,%riz,1)
    2694:	25 00 00 10 3c       	and    $0x3c100000,%eax
    2699:	25 00 00 10 a7       	and    $0xa7100000,%eax
    269e:	13 00                	adc    (%rax),%eax
    26a0:	00 10                	add    %dl,(%rax)
    26a2:	a7                   	cmpsl  %es:(%rdi),%ds:(%rsi)
    26a3:	13 00                	adc    (%rax),%eax
    26a5:	00 10                	add    %dl,(%rax)
    26a7:	df 25 00 00 00 57    	fbld   0x57000000(%rip)        # 570026ad <_end+0x56ffe4e5>
    26ad:	64 69 76 00 2d 54 03 	imul   $0xe03542d,%fs:0x0(%rsi),%esi
    26b4:	0e 
    26b5:	6b 25 00 00 c8 26 00 	imul   $0x0,0x26c80000(%rip),%esp        # 26c826bc <_end+0x26c7e4f4>
    26bc:	00 10                	add    %dl,(%rax)
    26be:	77 14                	ja     26d4 <__FRAME_END__+0x4b8>
    26c0:	00 00                	add    %al,(%rax)
    26c2:	10 77 14             	adc    %dh,0x14(%rdi)
    26c5:	00 00                	add    %al,(%rax)
    26c7:	00 45 4d             	add    %al,0x4d(%rbp)
    26ca:	06                   	(bad)  
    26cb:	00 00                	add    %al,(%rax)
    26cd:	2d 7a 02 0e 90       	sub    $0x900e027a,%eax
    26d2:	19 00                	sbb    %eax,(%rax)
    26d4:	00 df                	add    %bl,%bh
    26d6:	26 00 00             	add    %al,%es:(%rax)
    26d9:	10 46 16             	adc    %al,0x16(%rsi)
    26dc:	00 00                	add    %al,(%rax)
    26de:	00 45 d6             	add    %al,-0x2a(%rbp)
    26e1:	01 00                	add    %eax,(%rax)
    26e3:	00 2d 56 03 0f 9f    	add    %ch,-0x60f0fcaa(%rip)        # ffffffff9f0f2a3f <_end+0xffffffff9f0ee877>
    26e9:	25 00 00 fb 26       	and    $0x26fb0000,%eax
    26ee:	00 00                	add    %al,(%rax)
    26f0:	10 26                	adc    %ah,(%rsi)
    26f2:	1c 00                	sbb    $0x0,%al
    26f4:	00 10                	add    %dl,(%rax)
    26f6:	26 1c 00             	es sbb $0x0,%al
    26f9:	00 00                	add    %al,(%rax)
    26fb:	45                   	rex.RB
    26fc:	44 23 00             	and    (%rax),%r8d
    26ff:	00 2d 9a 03 0c 77    	add    %ch,0x770c039a(%rip)        # 770c2a9f <_end+0x770be8d7>
    2705:	14 00                	adc    $0x0,%al
    2707:	00 17                	add    %dl,(%rdi)
    2709:	27                   	(bad)  
    270a:	00 00                	add    %al,(%rax)
    270c:	10 46 16             	adc    %al,0x16(%rsi)
    270f:	00 00                	add    %al,(%rax)
    2711:	10 a7 13 00 00 00    	adc    %ah,0x13(%rdi)
    2717:	45 34 28             	rex.RB xor $0x28,%al
    271a:	00 00                	add    %al,(%rax)
    271c:	2d a5 03 0f a7       	sub    $0xa70f03a5,%eax
    2721:	13 00                	adc    (%rax),%eax
    2723:	00 38                	add    %bh,(%rax)
    2725:	27                   	(bad)  
    2726:	00 00                	add    %al,(%rax)
    2728:	10 a6 16 00 00 10    	adc    %ah,0x10000016(%rsi)
    272e:	46 16                	rex.RX (bad) 
    2730:	00 00                	add    %al,(%rax)
    2732:	10 a7 13 00 00 00    	adc    %ah,0x13(%rdi)
    2738:	45 60                	rex.RB (bad) 
    273a:	17                   	(bad)  
    273b:	00 00                	add    %al,(%rax)
    273d:	2d 9d 03 0c 77       	sub    $0x770c039d,%eax
    2742:	14 00                	adc    $0x0,%al
    2744:	00 59 27             	add    %bl,0x27(%rcx)
    2747:	00 00                	add    %al,(%rax)
    2749:	10 a6 16 00 00 10    	adc    %ah,0x10000016(%rsi)
    274f:	46 16                	rex.RX (bad) 
    2751:	00 00                	add    %al,(%rax)
    2753:	10 a7 13 00 00 00    	adc    %ah,0x13(%rdi)
    2759:	58                   	pop    %rax
    275a:	98                   	cwtl   
    275b:	1c 00                	sbb    $0x0,%al
    275d:	00 2d 3e 03 0d 7b    	add    %ch,0x7b0d033e(%rip)        # 7b0d2aa1 <_end+0x7b0ce8d9>
    2763:	27                   	(bad)  
    2764:	00 00                	add    %al,(%rax)
    2766:	10 03                	adc    %al,(%rbx)
    2768:	14 00                	adc    $0x0,%al
    276a:	00 10                	add    %dl,(%rax)
    276c:	a7                   	cmpsl  %es:(%rdi),%ds:(%rsi)
    276d:	13 00                	adc    (%rax),%eax
    276f:	00 10                	add    %dl,(%rax)
    2771:	a7                   	cmpsl  %es:(%rdi),%ds:(%rsi)
    2772:	13 00                	adc    (%rax),%eax
    2774:	00 10                	add    %dl,(%rax)
    2776:	df 25 00 00 00 59    	fbld   0x59000000(%rip)        # 5900277c <_end+0x58ffe5b4>
    277c:	df 02                	filds  (%rdx)
    277e:	00 00                	add    %al,(%rax)
    2780:	2d 6f 02 0d 8e       	sub    $0x8e0d026f,%eax
    2785:	27                   	(bad)  
    2786:	00 00                	add    %al,(%rax)
    2788:	10 77 14             	adc    %dh,0x14(%rdi)
    278b:	00 00                	add    %al,(%rax)
    278d:	00 47 a0             	add    %al,-0x60(%rdi)
    2790:	0a 00                	or     (%rax),%al
    2792:	00 2d c5 01 0c 77    	add    %ch,0x770c01c5(%rip)        # 770c295d <_end+0x770be795>
    2798:	14 00                	adc    $0x0,%al
    279a:	00 58 9f             	add    %bl,-0x61(%rax)
    279d:	0a 00                	or     (%rax),%al
    279f:	00 2d c7 01 0d ae    	add    %ch,-0x51f2fe39(%rip)        # ffffffffae0d296c <_end+0xffffffffae0ce7a4>
    27a5:	27                   	(bad)  
    27a6:	00 00                	add    %al,(%rax)
    27a8:	10 fc                	adc    %bh,%ah
    27aa:	13 00                	adc    (%rax),%eax
    27ac:	00 00                	add    %al,(%rax)
    27ae:	48 fc                	rex.W cld 
    27b0:	23 00                	and    (%rax),%eax
    27b2:	00 2d 75 0f 99 13    	add    %ch,0x13990f75(%rip)        # 1399372d <_end+0x1398f565>
    27b8:	00 00                	add    %al,(%rax)
    27ba:	c9                   	leaveq 
    27bb:	27                   	(bad)  
    27bc:	00 00                	add    %al,(%rax)
    27be:	10 46 16             	adc    %al,0x16(%rsi)
    27c1:	00 00                	add    %al,(%rax)
    27c3:	10 c9                	adc    %cl,%cl
    27c5:	27                   	(bad)  
    27c6:	00 00                	add    %al,(%rax)
    27c8:	00 44 08 90          	add    %al,-0x70(%rax,%rcx,1)
    27cc:	19 00                	sbb    %eax,(%rax)
    27ce:	00 48 6e             	add    %cl,0x6e(%rax)
    27d1:	24 00                	and    $0x0,%al
    27d3:	00 2d b0 11 26 1c    	add    %ch,0x1c2611b0(%rip)        # 1c263989 <_end+0x1c25f7c1>
    27d9:	00 00                	add    %al,(%rax)
    27db:	ef                   	out    %eax,(%dx)
    27dc:	27                   	(bad)  
    27dd:	00 00                	add    %al,(%rax)
    27df:	10 46 16             	adc    %al,0x16(%rsi)
    27e2:	00 00                	add    %al,(%rax)
    27e4:	10 c9                	adc    %cl,%cl
    27e6:	27                   	(bad)  
    27e7:	00 00                	add    %al,(%rax)
    27e9:	10 77 14             	adc    %dh,0x14(%rdi)
    27ec:	00 00                	add    %al,(%rax)
    27ee:	00 48 bb             	add    %cl,-0x45(%rax)
    27f1:	0f 00 00             	sldt   (%rax)
    27f4:	2d b4 1a b3 13       	sub    $0x13b31ab4,%eax
    27f9:	00 00                	add    %al,(%rax)
    27fb:	0f 28 00             	movaps (%rax),%xmm0
    27fe:	00 10                	add    %dl,(%rax)
    2800:	46 16                	rex.RX (bad) 
    2802:	00 00                	add    %al,(%rax)
    2804:	10 c9                	adc    %cl,%cl
    2806:	27                   	(bad)  
    2807:	00 00                	add    %al,(%rax)
    2809:	10 77 14             	adc    %dh,0x14(%rdi)
    280c:	00 00                	add    %al,(%rax)
    280e:	00 45 9c             	add    %al,-0x64(%rbp)
    2811:	1a 00                	sbb    (%rax),%al
    2813:	00 2d 10 03 0c 77    	add    %ch,0x770c0310(%rip)        # 770c2b29 <_end+0x770be961>
    2819:	14 00                	adc    $0x0,%al
    281b:	00 26                	add    %ah,(%rsi)
    281d:	28 00                	sub    %al,(%rax)
    281f:	00 10                	add    %dl,(%rax)
    2821:	46 16                	rex.RX (bad) 
    2823:	00 00                	add    %al,(%rax)
    2825:	00 45 30             	add    %al,0x30(%rbp)
    2828:	14 00                	adc    $0x0,%al
    282a:	00 2d a8 03 0f a7    	add    %ch,-0x58f0fc58(%rip)        # ffffffffa70f2bd8 <_end+0xffffffffa70eea10>
    2830:	13 00                	adc    (%rax),%eax
    2832:	00 47 28             	add    %al,0x28(%rdi)
    2835:	00 00                	add    %al,(%rax)
    2837:	10 90 19 00 00 10    	adc    %dl,0x10000019(%rax)
    283d:	f0 16                	lock (bad) 
    283f:	00 00                	add    %al,(%rax)
    2841:	10 a7 13 00 00 00    	adc    %ah,0x13(%rdi)
    2847:	45                   	rex.RB
    2848:	65 07                	gs (bad) 
    284a:	00 00                	add    %al,(%rax)
    284c:	2d a1 03 0c 77       	sub    $0x770c03a1,%eax
    2851:	14 00                	adc    $0x0,%al
    2853:	00 63 28             	add    %ah,0x28(%rbx)
    2856:	00 00                	add    %al,(%rax)
    2858:	10 90 19 00 00 10    	adc    %dl,0x10000019(%rax)
    285e:	ac                   	lods   %ds:(%rsi),%al
    285f:	16                   	(bad)  
    2860:	00 00                	add    %al,(%rax)
    2862:	00 45 d5             	add    %al,-0x2b(%rbp)
    2865:	01 00                	add    %eax,(%rax)
    2867:	00 2d 5a 03 1e d3    	add    %ch,-0x2ce1fca6(%rip)        # ffffffffd31e2bc7 <_end+0xffffffffd31de9ff>
    286d:	25 00 00 7f 28       	and    $0x287f0000,%eax
    2872:	00 00                	add    %al,(%rax)
    2874:	10 bf 1e 00 00 10    	adc    %bh,0x1000001e(%rdi)
    287a:	bf 1e 00 00 00       	mov    $0x1e,%edi
    287f:	48 0c 04             	rex.W or $0x4,%al
    2882:	00 00                	add    %al,(%rax)
    2884:	2d 70 24 bf 1e       	sub    $0x1ebf2470,%eax
    2889:	00 00                	add    %al,(%rax)
    288b:	95                   	xchg   %eax,%ebp
    288c:	28 00                	sub    %al,(%rax)
    288e:	00 10                	add    %dl,(%rax)
    2890:	46 16                	rex.RX (bad) 
    2892:	00 00                	add    %al,(%rax)
    2894:	00 48 5f             	add    %cl,0x5f(%rax)
    2897:	02 00                	add    (%rax),%al
    2899:	00 2d c8 16 bf 1e    	add    %ch,0x1ebf16c8(%rip)        # 1ebf3f67 <_end+0x1ebefd9f>
    289f:	00 00                	add    %al,(%rax)
    28a1:	b5 28                	mov    $0x28,%ch
    28a3:	00 00                	add    %al,(%rax)
    28a5:	10 46 16             	adc    %al,0x16(%rsi)
    28a8:	00 00                	add    %al,(%rax)
    28aa:	10 c9                	adc    %cl,%cl
    28ac:	27                   	(bad)  
    28ad:	00 00                	add    %al,(%rax)
    28af:	10 77 14             	adc    %dh,0x14(%rdi)
    28b2:	00 00                	add    %al,(%rax)
    28b4:	00 48 c4             	add    %cl,-0x3c(%rax)
    28b7:	08 00                	or     %al,(%rax)
    28b9:	00 2d cd 1f e7 1e    	add    %ch,0x1ee71fcd(%rip)        # 1ee7488c <_end+0x1ee706c4>
    28bf:	00 00                	add    %al,(%rax)
    28c1:	d5                   	(bad)  
    28c2:	28 00                	sub    %al,(%rax)
    28c4:	00 10                	add    %dl,(%rax)
    28c6:	46 16                	rex.RX (bad) 
    28c8:	00 00                	add    %al,(%rax)
    28ca:	10 c9                	adc    %cl,%cl
    28cc:	27                   	(bad)  
    28cd:	00 00                	add    %al,(%rax)
    28cf:	10 77 14             	adc    %dh,0x14(%rdi)
    28d2:	00 00                	add    %al,(%rax)
    28d4:	00 48 0f             	add    %cl,0xf(%rax)
    28d7:	24 00                	and    $0x0,%al
    28d9:	00 2d 7b 0e 92 13    	add    %ch,0x13920e7b(%rip)        # 1392375a <_end+0x1391f592>
    28df:	00 00                	add    %al,(%rax)
    28e1:	f0 28 00             	lock sub %al,(%rax)
    28e4:	00 10                	add    %dl,(%rax)
    28e6:	46 16                	rex.RX (bad) 
    28e8:	00 00                	add    %al,(%rax)
    28ea:	10 c9                	adc    %cl,%cl
    28ec:	27                   	(bad)  
    28ed:	00 00                	add    %al,(%rax)
    28ef:	00 48 45             	add    %cl,0x45(%rax)
    28f2:	02 00                	add    (%rax),%al
    28f4:	00 2d 7e 14 a0 13    	add    %ch,0x13a0147e(%rip)        # 13a03d78 <_end+0x139ffbb0>
    28fa:	00 00                	add    %al,(%rax)
    28fc:	0b 29                	or     (%rcx),%ebp
    28fe:	00 00                	add    %al,(%rax)
    2900:	10 46 16             	adc    %al,0x16(%rsi)
    2903:	00 00                	add    %al,(%rax)
    2905:	10 c9                	adc    %cl,%cl
    2907:	27                   	(bad)  
    2908:	00 00                	add    %al,(%rax)
    290a:	00 07                	add    %al,(%rdi)
    290c:	55                   	push   %rbp
    290d:	0f 00 00             	sldt   (%rax)
    2910:	10 2e                	adc    %ch,(%rsi)
    2912:	0a 10                	or     (%rax),%dl
    2914:	33 29                	xor    (%rcx),%ebp
    2916:	00 00                	add    %al,(%rax)
    2918:	0e                   	(bad)  
    2919:	a9 04 00 00 2e       	test   $0x2e000004,%eax
    291e:	0c 0b                	or     $0xb,%al
    2920:	a4                   	movsb  %ds:(%rsi),%es:(%rdi)
    2921:	20 00                	and    %al,(%rax)
    2923:	00 00                	add    %al,(%rax)
    2925:	0e                   	(bad)  
    2926:	91                   	xchg   %eax,%ecx
    2927:	25 00 00 2e 0d       	and    $0xd2e0000,%eax
    292c:	0f 83 14 00 00 08    	jae    8002946 <_end+0x7ffe77e>
    2932:	00 1b                	add    %bl,(%rbx)
    2934:	7e 21                	jle    2957 <__FRAME_END__+0x73b>
    2936:	00 00                	add    %al,(%rax)
    2938:	2e 0e                	cs (bad) 
    293a:	03 0b                	add    (%rbx),%ecx
    293c:	29 00                	sub    %eax,(%rax)
    293e:	00 5a 52             	add    %bl,0x52(%rdx)
    2941:	0c 00                	or     $0x0,%al
    2943:	00 1f                	add    %bl,(%rdi)
    2945:	2b 0e                	sub    (%rsi),%ecx
    2947:	5b                   	pop    %rbx
    2948:	89 07                	mov    %eax,(%rdi)
    294a:	00 00                	add    %al,(%rax)
    294c:	44 08 47 29          	or     %r8b,0x29(%rdi)
    2950:	00 00                	add    %al,(%rax)
    2952:	44 08 ac 14 00 00 41 	or     %r13b,0x6b410000(%rsp,%rdx,1)
    2959:	6b 
    295a:	14 00                	adc    $0x0,%al
    295c:	00 68 29             	add    %ch,0x29(%rax)
    295f:	00 00                	add    %al,(%rax)
    2961:	42 b3 13             	rex.X mov $0x13,%bl
    2964:	00 00                	add    %al,(%rax)
    2966:	00 00                	add    %al,(%rax)
    2968:	44 08 3f             	or     %r15b,(%rdi)
    296b:	29 00                	sub    %eax,(%rax)
    296d:	00 5b f5             	add    %bl,-0xb(%rbx)
    2970:	00 00                	add    %al,(%rax)
    2972:	00 44 08 6e          	add    %al,0x6e(%rax,%rcx,1)
    2976:	29 00                	sub    %eax,(%rax)
    2978:	00 5b 22             	add    %bl,0x22(%rbx)
    297b:	09 00                	or     %eax,(%rax)
    297d:	00 44 08 79          	add    %al,0x79(%rax,%rcx,1)
    2981:	29 00                	sub    %eax,(%rax)
    2983:	00 41 6b             	add    %al,0x6b(%rcx)
    2986:	14 00                	adc    $0x0,%al
    2988:	00 94 29 00 00 42 b3 	add    %dl,-0x4cbe0000(%rcx,%rbp,1)
    298f:	13 00                	adc    (%rax),%eax
    2991:	00 13                	add    %dl,(%rbx)
    2993:	00 1b                	add    %bl,(%rbx)
    2995:	58                   	pop    %rax
    2996:	0f 00 00             	sldt   (%rax)
    2999:	2f                   	(bad)  
    299a:	54                   	push   %rsp
    299b:	12 33                	adc    (%rbx),%dh
    299d:	29 00                	sub    %eax,(%rax)
    299f:	00 0a                	add    %cl,(%rdx)
    29a1:	94                   	xchg   %eax,%esp
    29a2:	29 00                	sub    %eax,(%rax)
    29a4:	00 50 d0             	add    %dl,-0x30(%rax)
    29a7:	0d 00 00 2f 89       	or     $0x892f0000,%eax
    29ac:	0e                   	(bad)  
    29ad:	b1 29                	mov    $0x29,%cl
    29af:	00 00                	add    %al,(%rax)
    29b1:	44 08 33             	or     %r14b,(%rbx)
    29b4:	16                   	(bad)  
    29b5:	00 00                	add    %al,(%rax)
    29b7:	50                   	push   %rax
    29b8:	67 2a 00             	sub    (%eax),%al
    29bb:	00 2f                	add    %ch,(%rdi)
    29bd:	8a 0e                	mov    (%rsi),%cl
    29bf:	b1 29                	mov    $0x29,%cl
    29c1:	00 00                	add    %al,(%rax)
    29c3:	50                   	push   %rax
    29c4:	a8 24                	test   $0x24,%al
    29c6:	00 00                	add    %al,(%rax)
    29c8:	2f                   	(bad)  
    29c9:	8b 0e                	mov    (%rsi),%ecx
    29cb:	b1 29                	mov    $0x29,%cl
    29cd:	00 00                	add    %al,(%rax)
    29cf:	50                   	push   %rax
    29d0:	49 16                	rex.WB (bad) 
    29d2:	00 00                	add    %al,(%rax)
    29d4:	30 1a                	xor    %bl,(%rdx)
    29d6:	0c 77                	or     $0x77,%al
    29d8:	14 00                	adc    $0x0,%al
    29da:	00 41 4c             	add    %al,0x4c(%rcx)
    29dd:	16                   	(bad)  
    29de:	00 00                	add    %al,(%rax)
    29e0:	e6 29                	out    %al,$0x29
    29e2:	00 00                	add    %al,(%rax)
    29e4:	5c                   	pop    %rsp
    29e5:	00 50 62             	add    %dl,0x62(%rax)
    29e8:	26 00 00             	add    %al,%es:(%rax)
    29eb:	30 1b                	xor    %bl,(%rbx)
    29ed:	1a db                	sbb    %bl,%bl
    29ef:	29 00                	sub    %eax,(%rax)
    29f1:	00 50 48             	add    %dl,0x48(%rax)
    29f4:	16                   	(bad)  
    29f5:	00 00                	add    %al,(%rax)
    29f7:	30 1e                	xor    %bl,(%rsi)
    29f9:	0c 77                	or     $0x77,%al
    29fb:	14 00                	adc    $0x0,%al
    29fd:	00 50 61             	add    %dl,0x61(%rax)
    2a00:	26 00 00             	add    %al,%es:(%rax)
    2a03:	30 1f                	xor    %bl,(%rdi)
    2a05:	1a db                	sbb    %bl,%bl
    2a07:	29 00                	sub    %eax,(%rax)
    2a09:	00 58 be             	add    %bl,-0x42(%rax)
    2a0c:	04 00                	add    $0x0,%al
    2a0e:	00 2f                	add    %ch,(%rdi)
    2a10:	f5                   	cmc    
    2a11:	02 0d 1d 2a 00 00    	add    0x2a1d(%rip),%cl        # 5434 <_end+0x126c>
    2a17:	10 b1 29 00 00 00    	adc    %dh,0x29(%rcx)
    2a1d:	48 06                	rex.W (bad) 
    2a1f:	0a 00                	or     (%rax),%al
    2a21:	00 2f                	add    %ch,(%rdi)
    2a23:	d5                   	(bad)  
    2a24:	0c 77                	or     $0x77,%al
    2a26:	14 00                	adc    $0x0,%al
    2a28:	00 33                	add    %dh,(%rbx)
    2a2a:	2a 00                	sub    (%rax),%al
    2a2c:	00 10                	add    %dl,(%rax)
    2a2e:	b1 29                	mov    $0x29,%cl
    2a30:	00 00                	add    %al,(%rax)
    2a32:	00 45 19             	add    %al,0x19(%rbp)
    2a35:	1c 00                	sbb    $0x0,%al
    2a37:	00 2f                	add    %ch,(%rdi)
    2a39:	f7 02 0c 77 14 00    	testl  $0x14770c,(%rdx)
    2a3f:	00 4a 2a             	add    %cl,0x2a(%rdx)
    2a42:	00 00                	add    %al,(%rax)
    2a44:	10 b1 29 00 00 00    	adc    %dh,0x29(%rcx)
    2a4a:	45 91                	rex.RB xchg %eax,%r9d
    2a4c:	24 00                	and    $0x0,%al
    2a4e:	00 2f                	add    %ch,(%rdi)
    2a50:	f9                   	stc    
    2a51:	02 0c 77             	add    (%rdi,%rsi,2),%cl
    2a54:	14 00                	adc    $0x0,%al
    2a56:	00 61 2a             	add    %ah,0x2a(%rcx)
    2a59:	00 00                	add    %al,(%rax)
    2a5b:	10 b1 29 00 00 00    	adc    %dh,0x29(%rcx)
    2a61:	48 96                	xchg   %rax,%rsi
    2a63:	2c 00                	sub    $0x0,%al
    2a65:	00 2f                	add    %ch,(%rdi)
    2a67:	da 0c 77             	fimull (%rdi,%rsi,2)
    2a6a:	14 00                	adc    $0x0,%al
    2a6c:	00 77 2a             	add    %dh,0x2a(%rdi)
    2a6f:	00 00                	add    %al,(%rax)
    2a71:	10 b1 29 00 00 00    	adc    %dh,0x29(%rcx)
    2a77:	45 fa                	rex.RB cli 
    2a79:	2a 00                	sub    (%rax),%al
    2a7b:	00 2f                	add    %ch,(%rdi)
    2a7d:	e5 01                	in     $0x1,%eax
    2a7f:	0c 77                	or     $0x77,%al
    2a81:	14 00                	adc    $0x0,%al
    2a83:	00 8e 2a 00 00 10    	add    %cl,0x1000002a(%rsi)
    2a89:	b1 29                	mov    $0x29,%cl
    2a8b:	00 00                	add    %al,(%rax)
    2a8d:	00 45 a1             	add    %al,-0x5f(%rbp)
    2a90:	04 00                	add    $0x0,%al
    2a92:	00 2f                	add    %ch,(%rdi)
    2a94:	db 02                	fildl  (%rdx)
    2a96:	0c 77                	or     $0x77,%al
    2a98:	14 00                	adc    $0x0,%al
    2a9a:	00 aa 2a 00 00 10    	add    %ch,0x1000002a(%rdx)
    2aa0:	b1 29                	mov    $0x29,%cl
    2aa2:	00 00                	add    %al,(%rax)
    2aa4:	10 aa 2a 00 00 00    	adc    %ch,0x2a(%rdx)
    2aaa:	44 08 94 29 00 00 45 	or     %r10b,0x78450000(%rcx,%rbp,1)
    2ab1:	78 
    2ab2:	00 00                	add    %al,(%rax)
    2ab4:	00 2f                	add    %ch,(%rdi)
    2ab6:	34 02                	xor    $0x2,%al
    2ab8:	0e                   	(bad)  
    2ab9:	90                   	nop
    2aba:	19 00                	sbb    %eax,(%rax)
    2abc:	00 d1                	add    %dl,%cl
    2abe:	2a 00                	sub    (%rax),%al
    2ac0:	00 10                	add    %dl,(%rax)
    2ac2:	90                   	nop
    2ac3:	19 00                	sbb    %eax,(%rax)
    2ac5:	00 10                	add    %dl,(%rax)
    2ac7:	77 14                	ja     2add <__FRAME_END__+0x8c1>
    2ac9:	00 00                	add    %al,(%rax)
    2acb:	10 b1 29 00 00 00    	adc    %dh,0x29(%rcx)
    2ad1:	48 b9 22 00 00 2f f6 	movabs $0x29b10ef62f000022,%rcx
    2ad8:	0e b1 29 
    2adb:	00 00                	add    %al,(%rax)
    2add:	ec                   	in     (%dx),%al
    2ade:	2a 00                	sub    (%rax),%al
    2ae0:	00 10                	add    %dl,(%rax)
    2ae2:	46 16                	rex.RX (bad) 
    2ae4:	00 00                	add    %al,(%rax)
    2ae6:	10 46 16             	adc    %al,0x16(%rsi)
    2ae9:	00 00                	add    %al,(%rax)
    2aeb:	00 45 ad             	add    %al,-0x53(%rbp)
    2aee:	2a 00                	sub    (%rax),%al
    2af0:	00 2f                	add    %ch,(%rdi)
    2af2:	86 02                	xchg   %al,(%rdx)
    2af4:	0f                   	xcrypt-cbc (bad)
    2af5:	a7                   	cmpsl  %es:(%rdi),%ds:(%rsi)
    2af6:	13 00                	adc    (%rax),%eax
    2af8:	00 12                	add    %dl,(%rdx)
    2afa:	2b 00                	sub    (%rax),%eax
    2afc:	00 10                	add    %dl,(%rax)
    2afe:	03 14 00             	add    (%rax,%rax,1),%edx
    2b01:	00 10                	add    %dl,(%rax)
    2b03:	a7                   	cmpsl  %es:(%rdi),%ds:(%rsi)
    2b04:	13 00                	adc    (%rax),%eax
    2b06:	00 10                	add    %dl,(%rax)
    2b08:	a7                   	cmpsl  %es:(%rdi),%ds:(%rsi)
    2b09:	13 00                	adc    (%rax),%eax
    2b0b:	00 10                	add    %dl,(%rax)
    2b0d:	b1 29                	mov    $0x29,%cl
    2b0f:	00 00                	add    %al,(%rax)
    2b11:	00 48 06             	add    %cl,0x6(%rax)
    2b14:	2d 00 00 2f fc       	sub    $0xfc2f0000,%eax
    2b19:	0e                   	(bad)  
    2b1a:	b1 29                	mov    $0x29,%cl
    2b1c:	00 00                	add    %al,(%rax)
    2b1e:	32 2b                	xor    (%rbx),%ch
    2b20:	00 00                	add    %al,(%rax)
    2b22:	10 46 16             	adc    %al,0x16(%rsi)
    2b25:	00 00                	add    %al,(%rax)
    2b27:	10 46 16             	adc    %al,0x16(%rsi)
    2b2a:	00 00                	add    %al,(%rax)
    2b2c:	10 b1 29 00 00 00    	adc    %dh,0x29(%rcx)
    2b32:	45 18 1a             	sbb    %r11b,(%r10)
    2b35:	00 00                	add    %al,(%rax)
    2b37:	2f                   	(bad)  
    2b38:	ac                   	lods   %ds:(%rsi),%al
    2b39:	02 0c 77             	add    (%rdi,%rsi,2),%cl
    2b3c:	14 00                	adc    $0x0,%al
    2b3e:	00 53 2b             	add    %dl,0x2b(%rbx)
    2b41:	00 00                	add    %al,(%rax)
    2b43:	10 b1 29 00 00 10    	adc    %dh,0x10000029(%rcx)
    2b49:	26 1c 00             	es sbb $0x0,%al
    2b4c:	00 10                	add    %dl,(%rax)
    2b4e:	77 14                	ja     2b64 <__FRAME_END__+0x948>
    2b50:	00 00                	add    %al,(%rax)
    2b52:	00 45 71             	add    %al,0x71(%rbp)
    2b55:	15 00 00 2f e0       	adc    $0xe02f0000,%eax
    2b5a:	02 0c 77             	add    (%rdi,%rsi,2),%cl
    2b5d:	14 00                	adc    $0x0,%al
    2b5f:	00 6f 2b             	add    %ch,0x2b(%rdi)
    2b62:	00 00                	add    %al,(%rax)
    2b64:	10 b1 29 00 00 10    	adc    %dh,0x10000029(%rcx)
    2b6a:	6f                   	outsl  %ds:(%rsi),(%dx)
    2b6b:	2b 00                	sub    (%rax),%eax
    2b6d:	00 00                	add    %al,(%rax)
    2b6f:	44 08 a0 29 00 00 45 	or     %r12b,0x45000029(%rax)
    2b76:	61                   	(bad)  
    2b77:	0d 00 00 2f b1       	or     $0xb12f0000,%eax
    2b7c:	02 11                	add    (%rcx),%dl
    2b7e:	26 1c 00             	es sbb $0x0,%al
    2b81:	00 8c 2b 00 00 10 b1 	add    %cl,-0x4ef00000(%rbx,%rbp,1)
    2b88:	29 00                	sub    %eax,(%rax)
    2b8a:	00 00                	add    %al,(%rax)
    2b8c:	45 fb                	rex.RB sti 
    2b8e:	2a 00                	sub    (%rax),%al
    2b90:	00 2f                	add    %ch,(%rdi)
    2b92:	e6 01                	out    %al,$0x1
    2b94:	0c 77                	or     $0x77,%al
    2b96:	14 00                	adc    $0x0,%al
    2b98:	00 a3 2b 00 00 10    	add    %ah,0x1000002b(%rbx)
    2b9e:	b1 29                	mov    $0x29,%cl
    2ba0:	00 00                	add    %al,(%rax)
    2ba2:	00 47 77             	add    %al,0x77(%rdi)
    2ba5:	1b 00                	sbb    (%rax),%eax
    2ba7:	00 2f                	add    %ch,(%rdi)
    2ba9:	ec                   	in     (%dx),%al
    2baa:	01 0c 77             	add    %ecx,(%rdi,%rsi,2)
    2bad:	14 00                	adc    $0x0,%al
    2baf:	00 58 63             	add    %bl,0x63(%rax)
    2bb2:	19 00                	sbb    %eax,(%rax)
    2bb4:	00 2f                	add    %ch,(%rdi)
    2bb6:	07                   	(bad)  
    2bb7:	03 0d c3 2b 00 00    	add    0x2bc3(%rip),%ecx        # 5780 <_end+0x15b8>
    2bbd:	10 46 16             	adc    %al,0x16(%rsi)
    2bc0:	00 00                	add    %al,(%rax)
    2bc2:	00 48 1b             	add    %cl,0x1b(%rax)
    2bc5:	09 00                	or     %eax,(%rax)
    2bc7:	00 2f                	add    %ch,(%rdi)
    2bc9:	92                   	xchg   %eax,%edx
    2bca:	0c 77                	or     $0x77,%al
    2bcc:	14 00                	adc    $0x0,%al
    2bce:	00 d9                	add    %bl,%cl
    2bd0:	2b 00                	sub    (%rax),%eax
    2bd2:	00 10                	add    %dl,(%rax)
    2bd4:	46 16                	rex.RX (bad) 
    2bd6:	00 00                	add    %al,(%rax)
    2bd8:	00 48 8e             	add    %cl,-0x72(%rax)
    2bdb:	12 00                	adc    (%rax),%al
    2bdd:	00 2f                	add    %ch,(%rdi)
    2bdf:	94                   	xchg   %eax,%esp
    2be0:	0c 77                	or     $0x77,%al
    2be2:	14 00                	adc    $0x0,%al
    2be4:	00 f4                	add    %dh,%ah
    2be6:	2b 00                	sub    (%rax),%eax
    2be8:	00 10                	add    %dl,(%rax)
    2bea:	46 16                	rex.RX (bad) 
    2bec:	00 00                	add    %al,(%rax)
    2bee:	10 46 16             	adc    %al,0x16(%rsi)
    2bf1:	00 00                	add    %al,(%rax)
    2bf3:	00 58 4a             	add    %bl,0x4a(%rax)
    2bf6:	23 00                	and    (%rax),%eax
    2bf8:	00 2f                	add    %ch,(%rdi)
    2bfa:	b6 02                	mov    $0x2,%dh
    2bfc:	0d 07 2c 00 00       	or     $0x2c07,%eax
    2c01:	10 b1 29 00 00 00    	adc    %dh,0x29(%rcx)
    2c07:	58                   	pop    %rax
    2c08:	6e                   	outsb  %ds:(%rsi),(%dx)
    2c09:	20 00                	and    %al,(%rax)
    2c0b:	00 2f                	add    %ch,(%rdi)
    2c0d:	30 01                	xor    %al,(%rcx)
    2c0f:	0d 1f 2c 00 00       	or     $0x2c1f,%eax
    2c14:	10 b1 29 00 00 10    	adc    %dh,0x10000029(%rcx)
    2c1a:	90                   	nop
    2c1b:	19 00                	sbb    %eax,(%rax)
    2c1d:	00 00                	add    %al,(%rax)
    2c1f:	45 06                	rex.RB (bad) 
    2c21:	11 00                	adc    %eax,(%rax)
    2c23:	00 2f                	add    %ch,(%rdi)
    2c25:	34 01                	xor    $0x1,%al
    2c27:	0c 77                	or     $0x77,%al
    2c29:	14 00                	adc    $0x0,%al
    2c2b:	00 45 2c             	add    %al,0x2c(%rbp)
    2c2e:	00 00                	add    %al,(%rax)
    2c30:	10 b1 29 00 00 10    	adc    %dh,0x10000029(%rcx)
    2c36:	90                   	nop
    2c37:	19 00                	sbb    %eax,(%rax)
    2c39:	00 10                	add    %dl,(%rax)
    2c3b:	77 14                	ja     2c51 <__FRAME_END__+0xa35>
    2c3d:	00 00                	add    %al,(%rax)
    2c3f:	10 a7 13 00 00 00    	adc    %ah,0x13(%rdi)
    2c45:	4f ef                	rex.WRXB out %eax,(%dx)
    2c47:	26 00 00             	add    %al,%es:(%rax)
    2c4a:	2f                   	(bad)  
    2c4b:	ad                   	lods   %ds:(%rsi),%eax
    2c4c:	0e                   	(bad)  
    2c4d:	b1 29                	mov    $0x29,%cl
    2c4f:	00 00                	add    %al,(%rax)
    2c51:	48 b2 02             	rex.W mov $0x2,%dl
    2c54:	00 00                	add    %al,(%rax)
    2c56:	2f                   	(bad)  
    2c57:	bb 0e 90 19 00       	mov    $0x19900e,%ebx
    2c5c:	00 67 2c             	add    %ah,0x2c(%rdi)
    2c5f:	00 00                	add    %al,(%rax)
    2c61:	10 90 19 00 00 00    	adc    %dl,0x19(%rax)
    2c67:	45 b3 27             	rex.RB mov $0x27,%r11b
    2c6a:	00 00                	add    %al,(%rax)
    2c6c:	2f                   	(bad)  
    2c6d:	7f 02                	jg     2c71 <__FRAME_END__+0xa55>
    2c6f:	0c 77                	or     $0x77,%al
    2c71:	14 00                	adc    $0x0,%al
    2c73:	00 83 2c 00 00 10    	add    %al,0x1000002c(%rbx)
    2c79:	77 14                	ja     2c8f <__FRAME_END__+0xa73>
    2c7b:	00 00                	add    %al,(%rax)
    2c7d:	10 b1 29 00 00 00    	adc    %dh,0x29(%rcx)
    2c83:	50                   	push   %rax
    2c84:	74 10                	je     2c96 <__FRAME_END__+0xa7a>
    2c86:	00 00                	add    %al,(%rax)
    2c88:	31 2d 0e 90 19 00    	xor    %ebp,0x19900e(%rip)        # 19bc9c <_end+0x197ad4>
    2c8e:	00 50 44             	add    %dl,0x44(%rax)
    2c91:	1b 00                	sbb    (%rax),%eax
    2c93:	00 31                	add    %dh,(%rcx)
    2c95:	2e 0e                	cs (bad) 
    2c97:	90                   	nop
    2c98:	19 00                	sbb    %eax,(%rax)
    2c9a:	00 44 08 bc          	add    %al,-0x44(%rax,%rcx,1)
    2c9e:	0d 00 00 4c 08       	or     $0x84c0000,%eax
    2ca3:	6b 0e 00             	imul   $0x0,(%rsi),%ecx
    2ca6:	00 4c 08 bc          	add    %cl,-0x44(%rax,%rcx,1)
    2caa:	0d 00 00 1b 5d       	or     $0x5d1b0000,%eax
    2caf:	09 00                	or     %eax,(%rax)
    2cb1:	00 32                	add    %dh,(%rdx)
    2cb3:	26 1b b3 13 00 00 1b 	sbb    %es:0x1b000013(%rbx),%esi
    2cba:	b9 06 00 00 33       	mov    $0x33000006,%ecx
    2cbf:	30 1a                	xor    %bl,(%rdx)
    2cc1:	c5 2c 00             	(bad)
    2cc4:	00 44 08 03          	add    %al,0x3(%rax,%rcx,1)
    2cc8:	20 00                	and    %al,(%rax)
    2cca:	00 48 f8             	add    %cl,-0x8(%rax)
    2ccd:	2b 00                	sub    (%rax),%eax
    2ccf:	00 32                	add    %dh,(%rdx)
    2cd1:	9f                   	lahf   
    2cd2:	0c 77                	or     $0x77,%al
    2cd4:	14 00                	adc    $0x0,%al
    2cd6:	00 e6                	add    %ah,%dh
    2cd8:	2c 00                	sub    $0x0,%al
    2cda:	00 10                	add    %dl,(%rax)
    2cdc:	05 14 00 00 10       	add    $0x10000014,%eax
    2ce1:	ad                   	lods   %ds:(%rsi),%eax
    2ce2:	2c 00                	sub    $0x0,%al
    2ce4:	00 00                	add    %al,(%rax)
    2ce6:	48 c0 07 00          	rex.W rolb $0x0,(%rdi)
    2cea:	00 33                	add    %dh,(%rbx)
    2cec:	37                   	(bad)  
    2ced:	0f 05                	syscall 
    2cef:	14 00                	adc    $0x0,%al
    2cf1:	00 01                	add    %al,(%rcx)
    2cf3:	2d 00 00 10 05       	sub    $0x5100000,%eax
    2cf8:	14 00                	adc    $0x0,%al
    2cfa:	00 10                	add    %dl,(%rax)
    2cfc:	b9 2c 00 00 00       	mov    $0x2c,%ecx
    2d01:	48 c2 07 00          	rex.W retq $0x7
    2d05:	00 33                	add    %dh,(%rbx)
    2d07:	34 12                	xor    $0x12,%al
    2d09:	b9 2c 00 00 17       	mov    $0x1700002c,%ecx
    2d0e:	2d 00 00 10 46       	sub    $0x46100000,%eax
    2d13:	16                   	(bad)  
    2d14:	00 00                	add    %al,(%rax)
    2d16:	00 48 fa             	add    %cl,-0x6(%rax)
    2d19:	2b 00                	sub    (%rax),%eax
    2d1b:	00 32                	add    %dh,(%rdx)
    2d1d:	9b                   	fwait
    2d1e:	11 ad 2c 00 00 2d    	adc    %ebp,0x2d00002c(%rbp)
    2d24:	2d 00 00 10 46       	sub    $0x46100000,%eax
    2d29:	16                   	(bad)  
    2d2a:	00 00                	add    %al,(%rax)
    2d2c:	00 5d c9             	add    %bl,-0x37(%rbp)
    2d2f:	0f 00 00             	sldt   (%rax)
    2d32:	09 03                	or     %eax,(%rbx)
    2d34:	c0 41 00 00          	rolb   $0x0,0x0(%rcx)
    2d38:	00 00                	add    %al,(%rax)
    2d3a:	00 00                	add    %al,(%rax)
    2d3c:	05 34 27 0c 06       	add    $0x60c2734,%eax
    2d41:	26 00 00             	add    %al,%es:(%rax)
    2d44:	05 34 2b 0e 24       	add    $0x240e2b34,%eax
    2d49:	26 00 00             	add    %al,%es:(%rax)
    2d4c:	05 34 2e 0e 7b       	add    $0x7b0e2e34,%eax
    2d51:	27                   	(bad)  
    2d52:	00 00                	add    %al,(%rax)
    2d54:	05 34 33 0c 6b       	add    $0x6b0c3334,%eax
    2d59:	25 00 00 05 34       	and    $0x34050000,%eax
    2d5e:	34 0c                	xor    $0xc,%al
    2d60:	9f                   	lahf   
    2d61:	25 00 00 05 34       	and    $0x34050000,%eax
    2d66:	36 0c d5             	ss or  $0xd5,%al
    2d69:	0f 00 00             	sldt   (%rax)
    2d6c:	05 34 36 0c ef       	add    $0xef0c3634,%eax
    2d71:	0f 00 00             	sldt   (%rax)
    2d74:	05 34 36 0c 09       	add    $0x90c3634,%eax
    2d79:	10 00                	adc    %al,(%rax)
    2d7b:	00 05 34 36 0c 23    	add    %al,0x230c3634(%rip)        # 230c63b5 <_end+0x230c21ed>
    2d81:	10 00                	adc    %al,(%rax)
    2d83:	00 05 34 36 0c 3d    	add    %al,0x3d0c3634(%rip)        # 3d0c63bd <_end+0x3d0c21f5>
    2d89:	10 00                	adc    %al,(%rax)
    2d8b:	00 05 34 36 0c 57    	add    %al,0x570c3634(%rip)        # 570c63c5 <_end+0x570c21fd>
    2d91:	10 00                	adc    %al,(%rax)
    2d93:	00 05 34 36 0c 71    	add    %al,0x710c3634(%rip)        # 710c63cd <_end+0x710c2205>
    2d99:	10 00                	adc    %al,(%rax)
    2d9b:	00 57 61             	add    %dl,0x61(%rdi)
    2d9e:	62 73                	(bad)  
    2da0:	00 2d 48 03 0c 77    	add    %ch,0x770c0348(%rip)        # 770c30ee <_end+0x770bef26>
    2da6:	14 00                	adc    $0x0,%al
    2da8:	00 b3 2d 00 00 10    	add    %dh,0x1000002d(%rbx)
    2dae:	77 14                	ja     2dc4 <__FRAME_END__+0xba8>
    2db0:	00 00                	add    %al,(%rax)
    2db2:	00 05 34 36 0c 9c    	add    %al,-0x63f3c9cc(%rip)        # ffffffff9c0c63ec <_end+0xffffffff9c0c2224>
    2db8:	2d 00 00 05 34       	sub    $0x34050000,%eax
    2dbd:	37                   	(bad)  
    2dbe:	0c 3f                	or     $0x3f,%al
    2dc0:	26 00 00             	add    %al,%es:(%rax)
    2dc3:	05 34 38 0c 55       	add    $0x550c3834,%eax
    2dc8:	26 00 00             	add    %al,%es:(%rax)
    2dcb:	05 34 39 0c 6b       	add    $0x6b0c3934,%eax
    2dd0:	26 00 00             	add    %al,%es:(%rax)
    2dd3:	05 34 3a 0c 81       	add    $0x810c3a34,%eax
    2dd8:	26 00 00             	add    %al,%es:(%rax)
    2ddb:	05 34 3c 0c 77       	add    $0x770c3c34,%eax
    2de0:	11 00                	adc    %eax,(%rax)
    2de2:	00 05 34 3c 0c 8b    	add    %al,-0x74f3c3cc(%rip)        # ffffffff8b0c6a1c <_end+0xffffffff8b0c2854>
    2de8:	10 00                	adc    %al,(%rax)
    2dea:	00 05 34 3c 0c ac    	add    %al,-0x53f3c3cc(%rip)        # ffffffffac0c6a24 <_end+0xffffffffac0c285c>
    2df0:	26 00 00             	add    %al,%es:(%rax)
    2df3:	05 34 3e 0c c8       	add    $0xc80c3e34,%eax
    2df8:	26 00 00             	add    %al,%es:(%rax)
    2dfb:	05 34 40 0c df       	add    $0xdf0c4034,%eax
    2e00:	26 00 00             	add    %al,%es:(%rax)
    2e03:	05 34 43 0c fb       	add    $0xfb0c4334,%eax
    2e08:	26 00 00             	add    %al,%es:(%rax)
    2e0b:	05 34 44 0c 17       	add    $0x170c4434,%eax
    2e10:	27                   	(bad)  
    2e11:	00 00                	add    %al,(%rax)
    2e13:	05 34 45 0c 38       	add    $0x380c4534,%eax
    2e18:	27                   	(bad)  
    2e19:	00 00                	add    %al,(%rax)
    2e1b:	05 34 47 0c 59       	add    $0x590c4734,%eax
    2e20:	27                   	(bad)  
    2e21:	00 00                	add    %al,(%rax)
    2e23:	05 34 48 0c 8e       	add    $0x8e0c4834,%eax
    2e28:	27                   	(bad)  
    2e29:	00 00                	add    %al,(%rax)
    2e2b:	05 34 4a 0c 9b       	add    $0x9b0c4a34,%eax
    2e30:	27                   	(bad)  
    2e31:	00 00                	add    %al,(%rax)
    2e33:	05 34 4b 0c ae       	add    $0xae0c4b34,%eax
    2e38:	27                   	(bad)  
    2e39:	00 00                	add    %al,(%rax)
    2e3b:	05 34 4c 0c cf       	add    $0xcf0c4c34,%eax
    2e40:	27                   	(bad)  
    2e41:	00 00                	add    %al,(%rax)
    2e43:	05 34 4d 0c ef       	add    $0xef0c4d34,%eax
    2e48:	27                   	(bad)  
    2e49:	00 00                	add    %al,(%rax)
    2e4b:	05 34 4e 0c 0f       	add    $0xf0c4e34,%eax
    2e50:	28 00                	sub    %al,(%rax)
    2e52:	00 05 34 50 0c 26    	add    %al,0x260c5034(%rip)        # 260c7e8c <_end+0x260c3cc4>
    2e58:	28 00                	sub    %al,(%rax)
    2e5a:	00 05 34 51 0c 47    	add    %al,0x470c5134(%rip)        # 470c7f94 <_end+0x470c3dcc>
    2e60:	28 00                	sub    %al,(%rax)
    2e62:	00 51 1f             	add    %dl,0x1f(%rcx)
    2e65:	06                   	(bad)  
    2e66:	00 00                	add    %al,(%rax)
    2e68:	35 1f 02 0f c9       	xor    $0xc90f021f,%eax
    2e6d:	27                   	(bad)  
    2e6e:	00 00                	add    %al,(%rax)
    2e70:	51                   	push   %rcx
    2e71:	21 06                	and    %eax,(%rsi)
    2e73:	00 00                	add    %al,(%rax)
    2e75:	35 21 02 0f c9       	xor    $0xc90f0221,%eax
    2e7a:	27                   	(bad)  
    2e7b:	00 00                	add    %al,(%rax)
    2e7d:	1f                   	(bad)  
    2e7e:	07                   	(bad)  
    2e7f:	04 fc                	add    $0xfc,%al
    2e81:	13 00                	adc    (%rax),%eax
    2e83:	00 36                	add    %dh,(%rsi)
    2e85:	48 03 96 33 00 00 20 	add    0x20000033(%rsi),%rdx
    2e8c:	35 03 00 00 00       	xor    $0x3,%eax
    2e91:	20 60 20             	and    %ah,0x20(%rax)
    2e94:	00 00                	add    %al,(%rax)
    2e96:	01 20                	add    %esp,(%rax)
    2e98:	ba 00 00 00 02       	mov    $0x2000000,%edx
    2e9d:	20 84 0c 00 00 03 20 	and    %al,0x20030000(%rsp,%rcx,1)
    2ea4:	0a 06                	or     (%rsi),%al
    2ea6:	00 00                	add    %al,(%rax)
    2ea8:	04 20                	add    $0x20,%al
    2eaa:	aa                   	stos   %al,%es:(%rdi)
    2eab:	22 00                	and    (%rax),%al
    2ead:	00 05 20 bf 22 00    	add    %al,0x22bf20(%rip)        # 22edd3 <_end+0x22ac0b>
    2eb3:	00 06                	add    %al,(%rsi)
    2eb5:	20 b3 01 00 00 07    	and    %dh,0x7000001(%rbx)
    2ebb:	20 fa                	and    %bh,%dl
    2ebd:	02 00                	add    (%rax),%al
    2ebf:	00 08                	add    %cl,(%rax)
    2ec1:	20 bf 1b 00 00 09    	and    %bh,0x900001b(%rdi)
    2ec7:	20 43 1a             	and    %al,0x1a(%rbx)
    2eca:	00 00                	add    %al,(%rax)
    2ecc:	0a 20                	or     (%rax),%ah
    2ece:	6e                   	outsb  %ds:(%rsi),(%dx)
    2ecf:	26 00 00             	add    %al,%es:(%rax)
    2ed2:	0b 20                	or     (%rax),%esp
    2ed4:	ea                   	(bad)  
    2ed5:	11 00                	adc    %eax,(%rax)
    2ed7:	00 0c 20             	add    %cl,(%rax,%riz,1)
    2eda:	60                   	(bad)  
    2edb:	22 00                	and    (%rax),%al
    2edd:	00 0d 20 da 28 00    	add    %cl,0x28da20(%rip)        # 290903 <_end+0x28c73b>
    2ee3:	00 0e                	add    %cl,(%rsi)
    2ee5:	20 a7 26 00 00 0f    	and    %ah,0xf000026(%rdi)
    2eeb:	20 7e 00             	and    %bh,0x0(%rsi)
    2eee:	00 00                	add    %al,(%rax)
    2ef0:	10 20                	adc    %ah,(%rax)
    2ef2:	e4 1c                	in     $0x1c,%al
    2ef4:	00 00                	add    %al,(%rax)
    2ef6:	11 20                	adc    %esp,(%rax)
    2ef8:	ed                   	in     (%dx),%eax
    2ef9:	22 00                	and    (%rax),%al
    2efb:	00 12                	add    %dl,(%rdx)
    2efd:	20 cc                	and    %cl,%ah
    2eff:	06                   	(bad)  
    2f00:	00 00                	add    %al,(%rax)
    2f02:	13 20                	adc    (%rax),%esp
    2f04:	66 2b 00             	sub    (%rax),%ax
    2f07:	00 14 20             	add    %dl,(%rax,%riz,1)
    2f0a:	ba 13 00 00 15       	mov    $0x15000013,%edx
    2f0f:	20 df                	and    %bl,%bh
    2f11:	1d 00 00 16 20       	sbb    $0x20160000,%eax
    2f16:	82                   	(bad)  
    2f17:	03 00                	add    (%rax),%eax
    2f19:	00 17                	add    %dl,(%rdi)
    2f1b:	20 52 1d             	and    %dl,0x1d(%rdx)
    2f1e:	00 00                	add    %al,(%rax)
    2f20:	18 20                	sbb    %ah,(%rax)
    2f22:	4f 05 00 00 19 20    	rex.WRXB add $0x20190000,%rax
    2f28:	fc                   	cld    
    2f29:	1c 00                	sbb    $0x0,%al
    2f2b:	00 1a                	add    %bl,(%rdx)
    2f2d:	20 7b 06             	and    %bh,0x6(%rbx)
    2f30:	00 00                	add    %al,(%rax)
    2f32:	1b 20                	sbb    (%rax),%esp
    2f34:	c1 03 00             	roll   $0x0,(%rbx)
    2f37:	00 1c 20             	add    %bl,(%rax,%riz,1)
    2f3a:	33 10                	xor    (%rax),%edx
    2f3c:	00 00                	add    %al,(%rax)
    2f3e:	1d 20 0c 07 00       	sbb    $0x70c20,%eax
    2f43:	00 1e                	add    %bl,(%rsi)
    2f45:	20 da                	and    %bl,%dl
    2f47:	15 00 00 1f 20       	adc    $0x201f0000,%eax
    2f4c:	39 22                	cmp    %esp,(%rdx)
    2f4e:	00 00                	add    %al,(%rax)
    2f50:	20 20                	and    %ah,(%rax)
    2f52:	3c 26                	cmp    $0x26,%al
    2f54:	00 00                	add    %al,(%rax)
    2f56:	21 20                	and    %esp,(%rax)
    2f58:	e4 00                	in     $0x0,%al
    2f5a:	00 00                	add    %al,(%rax)
    2f5c:	22 20                	and    (%rax),%ah
    2f5e:	ee                   	out    %al,(%dx)
    2f5f:	23 00                	and    (%rax),%eax
    2f61:	00 23                	add    %ah,(%rbx)
    2f63:	20 3d 28 00 00 24    	and    %bh,0x24000028(%rip)        # 24002f91 <_end+0x23ffedc9>
    2f69:	20 94 07 00 00 25 20 	and    %dl,0x20250000(%rdi,%rax,1)
    2f70:	ff 22                	jmpq   *(%rdx)
    2f72:	00 00                	add    %al,(%rax)
    2f74:	26 20 e8             	es and %ch,%al
    2f77:	1a 00                	sbb    (%rax),%al
    2f79:	00 27                	add    %ah,(%rdi)
    2f7b:	20 c3                	and    %al,%bl
    2f7d:	19 00                	sbb    %eax,(%rax)
    2f7f:	00 28                	add    %ch,(%rax)
    2f81:	20 c2                	and    %al,%dl
    2f83:	2a 00                	sub    (%rax),%al
    2f85:	00 29                	add    %ch,(%rcx)
    2f87:	20 a4 28 00 00 2a 20 	and    %ah,0x202a0000(%rax,%rbp,1)
    2f8e:	12 15 00 00 2b 20    	adc    0x202b0000(%rip),%dl        # 202b2f94 <_end+0x202aedcc>
    2f94:	ab                   	stos   %eax,%es:(%rdi)
    2f95:	0c 00                	or     $0x0,%al
    2f97:	00 2c 20             	add    %ch,(%rax,%riz,1)
    2f9a:	fe                   	(bad)  
    2f9b:	11 00                	adc    %eax,(%rax)
    2f9d:	00 2d 20 94 0c 00    	add    %ch,0xc9420(%rip)        # cc3c3 <_end+0xc81fb>
    2fa3:	00 2e                	add    %ch,(%rsi)
    2fa5:	20 d9                	and    %bl,%cl
    2fa7:	18 00                	sbb    %al,(%rax)
    2fa9:	00 2f                	add    %ch,(%rdi)
    2fab:	20 e6                	and    %ah,%dh
    2fad:	19 00                	sbb    %eax,(%rax)
    2faf:	00 30                	add    %dh,(%rax)
    2fb1:	20 e5                	and    %ah,%ch
    2fb3:	0c 00                	or     $0x0,%al
    2fb5:	00 31                	add    %dh,(%rcx)
    2fb7:	20 0f                	and    %cl,(%rdi)
    2fb9:	1d 00 00 32 20       	sbb    $0x20320000,%eax
    2fbe:	a8 1b                	test   $0x1b,%al
    2fc0:	00 00                	add    %al,(%rax)
    2fc2:	33 20                	xor    (%rax),%esp
    2fc4:	02 15 00 00 34 20    	add    0x20340000(%rip),%dl        # 20342fca <_end+0x2033ee02>
    2fca:	c8 0d 00 00          	enterq $0xd,$0x0
    2fce:	35 20 52 16 00       	xor    $0x165220,%eax
    2fd3:	00 36                	add    %dh,(%rsi)
    2fd5:	20 c0                	and    %al,%al
    2fd7:	02 00                	add    (%rax),%al
    2fd9:	00 37                	add    %dh,(%rdi)
    2fdb:	20 d1                	and    %dl,%cl
    2fdd:	03 00                	add    (%rax),%eax
    2fdf:	00 38                	add    %bh,(%rax)
    2fe1:	20 f0                	and    %dh,%al
    2fe3:	1c 00                	sbb    $0x0,%al
    2fe5:	00 39                	add    %bh,(%rcx)
    2fe7:	20 ba 27 00 00 3a    	and    %bh,0x3a000027(%rdx)
    2fed:	20 dd                	and    %bl,%ch
    2fef:	26 00 00             	add    %al,%es:(%rax)
    2ff2:	3b 20                	cmp    (%rax),%esp
    2ff4:	b3 2a                	mov    $0x2a,%bl
    2ff6:	00 00                	add    %al,(%rax)
    2ff8:	3c 20                	cmp    $0x20,%al
    2ffa:	67 0d 00 00 3c 20    	addr32 or $0x203c0000,%eax
    3000:	19 13                	sbb    %edx,(%rbx)
    3002:	00 00                	add    %al,(%rax)
    3004:	3d 20 0a 0e 00       	cmp    $0xe0a20,%eax
    3009:	00 3e                	add    %bh,(%rsi)
    300b:	20 c9                	and    %cl,%cl
    300d:	25 00 00 3f 20       	and    $0x203f0000,%eax
    3012:	f5                   	cmc    
    3013:	09 00                	or     %eax,(%rax)
    3015:	00 40 20             	add    %al,0x20(%rax)
    3018:	d8 19                	fcomps (%rcx)
    301a:	00 00                	add    %al,(%rax)
    301c:	41 20 52 22          	and    %dl,0x22(%r10)
    3020:	00 00                	add    %al,(%rax)
    3022:	42 20 51 11          	rex.X and %dl,0x11(%rcx)
    3026:	00 00                	add    %al,(%rax)
    3028:	43 20 66 11          	rex.XB and %spl,0x11(%r14)
    302c:	00 00                	add    %al,(%rax)
    302e:	44 20 7b 13          	and    %r15b,0x13(%rbx)
    3032:	00 00                	add    %al,(%rax)
    3034:	45 20 d2             	and    %r10b,%r10b
    3037:	2b 00                	sub    (%rax),%eax
    3039:	00 46 20             	add    %al,0x20(%rsi)
    303c:	09 18                	or     %ebx,(%rax)
    303e:	00 00                	add    %al,(%rax)
    3040:	47 20 f4             	rex.RXB and %r14b,%r12b
    3043:	04 00                	add    $0x0,%al
    3045:	00 48 20             	add    %cl,0x20(%rax)
    3048:	77 1c                	ja     3066 <__FRAME_END__+0xe4a>
    304a:	00 00                	add    %al,(%rax)
    304c:	49 20 26             	rex.WB and %spl,(%r14)
    304f:	18 00                	sbb    %al,(%rax)
    3051:	00 4a 20             	add    %cl,0x20(%rdx)
    3054:	6e                   	outsb  %ds:(%rsi),(%dx)
    3055:	12 00                	adc    (%rax),%al
    3057:	00 4b 20             	add    %cl,0x20(%rbx)
    305a:	b6 28                	mov    $0x28,%dh
    305c:	00 00                	add    %al,(%rax)
    305e:	4c 20 71 19          	rex.WR and %r14b,0x19(%rcx)
    3062:	00 00                	add    %al,(%rax)
    3064:	4d 20 19             	rex.WRB and %r11b,(%r9)
    3067:	25 00 00 4e 20       	and    $0x204e0000,%eax
    306c:	1e                   	(bad)  
    306d:	1b 00                	sbb    (%rax),%eax
    306f:	00 4f 20             	add    %cl,0x20(%rdi)
    3072:	01 2c 00             	add    %ebp,(%rax,%rax,1)
    3075:	00 50 20             	add    %dl,0x20(%rax)
    3078:	a4                   	movsb  %ds:(%rsi),%es:(%rdi)
    3079:	03 00                	add    (%rax),%eax
    307b:	00 51 20             	add    %dl,0x20(%rcx)
    307e:	16                   	(bad)  
    307f:	14 00                	adc    $0x0,%al
    3081:	00 52 20             	add    %dl,0x20(%rdx)
    3084:	30 1d 00 00 53 20    	xor    %bl,0x20530000(%rip)        # 2053308a <_end+0x2052eec2>
    308a:	88 0f                	mov    %cl,(%rdi)
    308c:	00 00                	add    %al,(%rax)
    308e:	54                   	push   %rsp
    308f:	20 fe                	and    %bh,%dh
    3091:	16                   	(bad)  
    3092:	00 00                	add    %al,(%rax)
    3094:	55                   	push   %rbp
    3095:	20 7c 20 00          	and    %bh,0x0(%rax,%riz,1)
    3099:	00 56 20             	add    %dl,0x20(%rsi)
    309c:	b3 25                	mov    $0x25,%bl
    309e:	00 00                	add    %al,(%rax)
    30a0:	57                   	push   %rdi
    30a1:	20 79 26             	and    %bh,0x26(%rcx)
    30a4:	00 00                	add    %al,(%rax)
    30a6:	58                   	pop    %rax
    30a7:	20 8a 02 00 00 59    	and    %cl,0x59000002(%rdx)
    30ad:	20 27                	and    %ah,(%rdi)
    30af:	16                   	(bad)  
    30b0:	00 00                	add    %al,(%rax)
    30b2:	5a                   	pop    %rdx
    30b3:	20 a7 12 00 00 5b    	and    %ah,0x5b000012(%rdi)
    30b9:	20 84 23 00 00 5c 20 	and    %al,0x205c0000(%rbx,%riz,1)
    30c0:	47 0b 00             	rex.RXB or (%r8),%r8d
    30c3:	00 5d 20             	add    %bl,0x20(%rbp)
    30c6:	8d 20                	lea    (%rax),%esp
    30c8:	00 00                	add    %al,(%rax)
    30ca:	5e                   	pop    %rsi
    30cb:	20 8e 0b 00 00 5f    	and    %cl,0x5f00000b(%rsi)
    30d1:	20 55 07             	and    %dl,0x7(%rbp)
    30d4:	00 00                	add    %al,(%rax)
    30d6:	60                   	(bad)  
    30d7:	20 9e 0b 00 00 61    	and    %bl,0x6100000b(%rsi)
    30dd:	20 b7 0a 00 00 62    	and    %dh,0x6200000a(%rdi)
    30e3:	20 c6                	and    %al,%dh
    30e5:	0a 00                	or     (%rax),%al
    30e7:	00 63 20             	add    %ah,0x20(%rbx)
    30ea:	d5                   	(bad)  
    30eb:	0a 00                	or     (%rax),%al
    30ed:	00 64 20 75          	add    %ah,0x75(%rax,%riz,1)
    30f1:	03 00                	add    (%rax),%eax
    30f3:	00 65 20             	add    %ah,0x20(%rbp)
    30f6:	1c 02                	sbb    $0x2,%al
    30f8:	00 00                	add    %al,(%rax)
    30fa:	66 20 21             	data16 and %ah,(%rcx)
    30fd:	0d 00 00 67 20       	or     $0x20670000,%eax
    3102:	65 00 00             	add    %al,%gs:(%rax)
    3105:	00 68 20             	add    %ch,0x20(%rax)
    3108:	82                   	(bad)  
    3109:	0b 00                	or     (%rax),%eax
    310b:	00 69 20             	add    %ch,0x20(%rcx)
    310e:	9c                   	pushfq 
    310f:	16                   	(bad)  
    3110:	00 00                	add    %al,(%rax)
    3112:	6a 20                	pushq  $0x20
    3114:	bf 11 00 00 6b       	mov    $0x6b000011,%edi
    3119:	20 95 03 00 00 6c    	and    %dl,0x6c000003(%rbp)
    311f:	20 ad 0a 00 00 6d    	and    %ch,0x6d00000a(%rbp)
    3125:	20 21                	and    %ah,(%rcx)
    3127:	0e                   	(bad)  
    3128:	00 00                	add    %al,(%rax)
    312a:	6e                   	outsb  %ds:(%rsi),(%dx)
    312b:	20 0f                	and    %cl,(%rdi)
    312d:	03 00                	add    (%rax),%eax
    312f:	00 6f 20             	add    %ch,0x20(%rdi)
    3132:	99                   	cltd   
    3133:	0e                   	(bad)  
    3134:	00 00                	add    %al,(%rax)
    3136:	70 20                	jo     3158 <__FRAME_END__+0xf3c>
    3138:	45 1d 00 00 71 20    	rex.RB sbb $0x20710000,%eax
    313e:	46 29 00             	rex.RX sub %r8d,(%rax)
    3141:	00 72 20             	add    %dh,0x20(%rdx)
    3144:	8d 17                	lea    (%rdi),%edx
    3146:	00 00                	add    %al,(%rax)
    3148:	73 20                	jae    316a <__FRAME_END__+0xf4e>
    314a:	e9 10 00 00 74       	jmpq   7400315f <_end+0x73ffef97>
    314f:	20 e4                	and    %ah,%ah
    3151:	0a 00                	or     (%rax),%al
    3153:	00 75 20             	add    %dh,0x20(%rbp)
    3156:	55                   	push   %rbp
    3157:	14 00                	adc    $0x0,%al
    3159:	00 76 20             	add    %dh,0x20(%rsi)
    315c:	74 1f                	je     317d <__FRAME_END__+0xf61>
    315e:	00 00                	add    %al,(%rax)
    3160:	77 20                	ja     3182 <__FRAME_END__+0xf66>
    3162:	88 09                	mov    %cl,(%rcx)
    3164:	00 00                	add    %al,(%rax)
    3166:	78 20                	js     3188 <__FRAME_END__+0xf6c>
    3168:	bf 09 00 00 79       	mov    $0x79000009,%edi
    316d:	20 44 21 00          	and    %al,0x0(%rcx,%riz,1)
    3171:	00 7a 20             	add    %bh,0x20(%rdx)
    3174:	9d                   	popfq  
    3175:	2c 00                	sub    $0x0,%al
    3177:	00 7b 20             	add    %bh,0x20(%rbx)
    317a:	4d 04 00             	rex.WRB add $0x0,%al
    317d:	00 7c 20 87          	add    %bh,-0x79(%rax,%riz,1)
    3181:	16                   	(bad)  
    3182:	00 00                	add    %al,(%rax)
    3184:	7d 20                	jge    31a6 <__FRAME_END__+0xf8a>
    3186:	97                   	xchg   %eax,%edi
    3187:	2a 00                	sub    (%rax),%al
    3189:	00 7e 20             	add    %bh,0x20(%rsi)
    318c:	e2 1e                	loop   31ac <__FRAME_END__+0xf90>
    318e:	00 00                	add    %al,(%rax)
    3190:	7f 20                	jg     31b2 <__FRAME_END__+0xf96>
    3192:	4c 1c 00             	rex.WR sbb $0x0,%al
    3195:	00 80 20 e7 2b 00    	add    %al,0x2be720(%rax)
    319b:	00 81 20 5e 15 00    	add    %al,0x155e20(%rcx)
    31a1:	00 82 20 5e 16 00    	add    %al,0x165e20(%rdx)
    31a7:	00 83 20 6f 18 00    	add    %al,0x186f20(%rbx)
    31ad:	00 84 20 cf 02 00 00 	add    %al,0x2cf(%rax,%riz,1)
    31b4:	85 20                	test   %esp,(%rax)
    31b6:	f1                   	icebp  
    31b7:	2a 00                	sub    (%rax),%al
    31b9:	00 86 20 4e 26 00    	add    %al,0x264e20(%rsi)
    31bf:	00 87 20 af 23 00    	add    %al,0x23af20(%rdi)
    31c5:	00 88 20 41 07 00    	add    %cl,0x74120(%rax)
    31cb:	00 89 20 55 24 00    	add    %cl,0x245520(%rcx)
    31d1:	00 8a 20 d6 0d 00    	add    %cl,0xdd620(%rdx)
    31d7:	00 8b 20 52 01 00    	add    %cl,0x15220(%rbx)
    31dd:	00 8c 20 9e 1c 00 00 	add    %cl,0x1c9e(%rax,%riz,1)
    31e4:	8d 20                	lea    (%rax),%esp
    31e6:	68 0a 00 00 8e       	pushq  $0xffffffff8e00000a
    31eb:	20 71 23             	and    %dh,0x23(%rcx)
    31ee:	00 00                	add    %al,(%rax)
    31f0:	8f                   	(bad)  
    31f1:	20 e2                	and    %ah,%dl
    31f3:	06                   	(bad)  
    31f4:	00 00                	add    %al,(%rax)
    31f6:	90                   	nop
    31f7:	20 e7                	and    %ah,%bh
    31f9:	17                   	(bad)  
    31fa:	00 00                	add    %al,(%rax)
    31fc:	91                   	xchg   %eax,%ecx
    31fd:	20 f7                	and    %dh,%bh
    31ff:	15 00 00 92 20       	adc    $0x20920000,%eax
    3204:	2f                   	(bad)  
    3205:	0e                   	(bad)  
    3206:	00 00                	add    %al,(%rax)
    3208:	93                   	xchg   %eax,%ebx
    3209:	20 3a                	and    %bh,(%rdx)
    320b:	0c 00                	or     $0x0,%al
    320d:	00 94 20 a0 15 00 00 	add    %dl,0x15a0(%rax,%riz,1)
    3214:	95                   	xchg   %eax,%ebp
    3215:	20 43 14             	and    %al,0x14(%rbx)
    3218:	00 00                	add    %al,(%rax)
    321a:	96                   	xchg   %eax,%esi
    321b:	20 e6                	and    %ah,%dh
    321d:	1f                   	(bad)  
    321e:	00 00                	add    %al,(%rax)
    3220:	97                   	xchg   %eax,%edi
    3221:	20 55 25             	and    %dl,0x25(%rbp)
    3224:	00 00                	add    %al,(%rax)
    3226:	98                   	cwtl   
    3227:	20 29                	and    %ch,(%rcx)
    3229:	06                   	(bad)  
    322a:	00 00                	add    %al,(%rax)
    322c:	99                   	cltd   
    322d:	20 8c 10 00 00 9a 20 	and    %cl,0x209a0000(%rax,%rdx,1)
    3234:	cc                   	int3   
    3235:	11 00                	adc    %eax,(%rax)
    3237:	00 9b 20 81 1d 00    	add    %bl,0x1d8120(%rbx)
    323d:	00 9c 20 24 08 00 00 	add    %bl,0x824(%rax,%riz,1)
    3244:	9d                   	popfq  
    3245:	20 79 15             	and    %bh,0x15(%rcx)
    3248:	00 00                	add    %al,(%rax)
    324a:	9e                   	sahf   
    324b:	20 e3                	and    %ah,%bl
    324d:	22 00                	and    (%rax),%al
    324f:	00 9f 20 7d 24 00    	add    %bl,0x247d20(%rdi)
    3255:	00 a0 20 9b 20 00    	add    %ah,0x209b20(%rax)
    325b:	00 a1 20 e9 0d 00    	add    %ah,0xde920(%rcx)
    3261:	00 a2 20 25 1a 00    	add    %ah,0x1a2520(%rdx)
    3267:	00 a3 20 5a 03 00    	add    %ah,0x35a20(%rbx)
    326d:	00 a4 20 f0 17 00 00 	add    %ah,0x17f0(%rax,%riz,1)
    3274:	a5                   	movsl  %ds:(%rsi),%es:(%rdi)
    3275:	20 f2                	and    %dh,%dl
    3277:	14 00                	adc    $0x0,%al
    3279:	00 a6 20 15 16 00    	add    %ah,0x161520(%rsi)
    327f:	00 a7 20 16 24 00    	add    %ah,0x241620(%rdi)
    3285:	00 a8 20 62 1c 00    	add    %ch,0x1c6220(%rax)
    328b:	00 a9 20 72 08 00    	add    %ch,0x87220(%rcx)
    3291:	00 aa 20 15 22 00    	add    %ch,0x221520(%rdx)
    3297:	00 ab 20 f6 10 00    	add    %ch,0x10f620(%rbx)
    329d:	00 ac 20 34 23 00 00 	add    %ch,0x2334(%rax,%riz,1)
    32a4:	ad                   	lods   %ds:(%rsi),%eax
    32a5:	20 41 06             	and    %al,0x6(%rcx)
    32a8:	00 00                	add    %al,(%rax)
    32aa:	ae                   	scas   %es:(%rdi),%al
    32ab:	20 ce                	and    %cl,%dh
    32ad:	22 00                	and    (%rax),%al
    32af:	00 af 20 97 22 00    	add    %ch,0x229720(%rdi)
    32b5:	00 b0 20 31 13 00    	add    %dh,0x133120(%rax)
    32bb:	00 b1 20 c3 01 00    	add    %dh,0x1c320(%rcx)
    32c1:	00 b2 20 c9 29 00    	add    %dh,0x29c920(%rdx)
    32c7:	00 b3 20 d6 1a 00    	add    %dh,0x1ad620(%rbx)
    32cd:	00 b4 20 6a 2c 00 00 	add    %dh,0x2c6a(%rax,%riz,1)
    32d4:	b5 20                	mov    $0x20,%ch
    32d6:	f5                   	cmc    
    32d7:	06                   	(bad)  
    32d8:	00 00                	add    %al,(%rax)
    32da:	b6 20                	mov    $0x20,%dh
    32dc:	4d 02 00             	rex.WRB add (%r8),%r8b
    32df:	00 b7 20 c2 1c 00    	add    %dh,0x1cc220(%rdi)
    32e5:	00 b8 20 6e 2a 00    	add    %bh,0x2a6e20(%rax)
    32eb:	00 b9 20 1e 0a 00    	add    %bh,0xa1e20(%rcx)
    32f1:	00 ba 20 94 23 00    	add    %bh,0x239420(%rdx)
    32f7:	00 bb 20 18 29 00    	add    %bh,0x291820(%rbx)
    32fd:	00 bc 20 37 12 00 00 	add    %bh,0x1237(%rax,%riz,1)
    3304:	bd 20 e1 08 00       	mov    $0x8e120,%ebp
    3309:	00 be 20 79 28 00    	add    %bh,0x287920(%rsi)
    330f:	00 bf 20 0a 28 00    	add    %bh,0x280a20(%rdi)
    3315:	00 c0                	add    %al,%al
    3317:	20 93 1d 00 00 c1    	and    %dl,-0x3effffe3(%rbx)
    331d:	20 3b                	and    %bh,(%rbx)
    331f:	00 00                	add    %al,(%rax)
    3321:	00 c2                	add    %al,%dl
    3323:	20 c1                	and    %al,%cl
    3325:	0c 00                	or     $0x0,%al
    3327:	00 c3                	add    %al,%bl
    3329:	20 54 12 00          	and    %dl,0x0(%rdx,%rdx,1)
    332d:	00 c4                	add    %al,%ah
    332f:	20 c9                	and    %cl,%cl
    3331:	13 00                	adc    (%rax),%eax
    3333:	00 c5                	add    %al,%ch
    3335:	20 9c 01 00 00 c6 20 	and    %bl,0x20c60000(%rcx,%rax,1)
    333c:	99                   	cltd   
    333d:	25 00 00 c7 20       	and    $0x20c70000,%eax
    3342:	cd 1a                	int    $0x1a
    3344:	00 00                	add    %al,(%rax)
    3346:	eb 20                	jmp    3368 <__FRAME_END__+0x114c>
    3348:	41 11 00             	adc    %eax,(%r8)
    334b:	00 ec                	add    %ch,%ah
    334d:	20 37                	and    %dh,(%rdi)
    334f:	08 00                	or     %al,(%rax)
    3351:	00 ed                	add    %ch,%ch
    3353:	20 a6 13 00 00 ee    	and    %ah,-0x11ffffed(%rsi)
    3359:	20 1e                	and    %bl,(%rsi)
    335b:	1d 00 00 ef 20       	sbb    $0x20ef0000,%eax
    3360:	1f                   	(bad)  
    3361:	1f                   	(bad)  
    3362:	00 00                	add    %al,(%rax)
    3364:	f0 20 0f             	lock and %cl,(%rdi)
    3367:	21 00                	and    %eax,(%rax)
    3369:	00 f1                	add    %dh,%cl
    336b:	20 83 1a 00 00 f2    	and    %al,-0xdffffe6(%rbx)
    3371:	20 c7                	and    %al,%bh
    3373:	04 00                	add    $0x0,%al
    3375:	00 f3                	add    %dh,%bl
    3377:	20 22                	and    %ah,(%rdx)
    3379:	23 00                	and    (%rax),%eax
    337b:	00 f4                	add    %dh,%ah
    337d:	20 62 13             	and    %ah,0x13(%rdx)
    3380:	00 00                	add    %al,(%rax)
    3382:	f5                   	cmc    
    3383:	20 06                	and    %al,(%rsi)
    3385:	29 00                	sub    %eax,(%rax)
    3387:	00 f6                	add    %dh,%dh
    3389:	20 01                	and    %al,(%rcx)
    338b:	01 00                	add    %eax,(%rax)
    338d:	00 f7                	add    %dh,%bh
    338f:	20 36                	and    %dh,(%rsi)
    3391:	0f 00 00             	sldt   (%rax)
    3394:	f8                   	clc    
    3395:	00 50 b2             	add    %dl,-0x4e(%rax)
    3398:	29 00                	sub    %eax,(%rax)
    339a:	00 37                	add    %dh,(%rdi)
    339c:	24 0e                	and    $0xe,%al
    339e:	90                   	nop
    339f:	19 00                	sbb    %eax,(%rax)
    33a1:	00 50 a0             	add    %dl,-0x60(%rax)
    33a4:	12 00                	adc    (%rax),%al
    33a6:	00 37                	add    %dh,(%rdi)
    33a8:	32 0c 77             	xor    (%rdi,%rsi,2),%cl
    33ab:	14 00                	adc    $0x0,%al
    33ad:	00 50 ab             	add    %dl,-0x55(%rax)
    33b0:	02 00                	add    (%rax),%al
    33b2:	00 37                	add    %dh,(%rdi)
    33b4:	37                   	(bad)  
    33b5:	0c 77                	or     $0x77,%al
    33b7:	14 00                	adc    $0x0,%al
    33b9:	00 50 4a             	add    %dl,0x4a(%rax)
    33bc:	1e                   	(bad)  
    33bd:	00 00                	add    %al,(%rax)
    33bf:	37                   	(bad)  
    33c0:	3b 0c 77             	cmp    (%rdi,%rsi,2),%ecx
    33c3:	14 00                	adc    $0x0,%al
    33c5:	00 5e 22             	add    %bl,0x22(%rsi)
    33c8:	05 00 00 01 09       	add    $0x9010000,%eax
    33cd:	11 e2                	adc    %esp,%edx
    33cf:	24 00                	and    $0x0,%al
    33d1:	00 09                	add    %cl,(%rcx)
    33d3:	03 60 41             	add    0x41(%rax),%esp
    33d6:	00 00                	add    %al,(%rax)
    33d8:	00 00                	add    %al,(%rax)
    33da:	00 00                	add    %al,(%rax)
    33dc:	5e                   	pop    %rsi
    33dd:	c4 23 00 00          	(bad)
    33e1:	01 0a                	add    %ecx,(%rdx)
    33e3:	13 24 25 00 00 09 03 	adc    0x3090000,%esp
    33ea:	a0 41 00 00 00 00 00 	movabs 0x5f00000000000041,%al
    33f1:	00 5f 
    33f3:	cd 28                	int    $0x28
    33f5:	00 00                	add    %al,(%rax)
    33f7:	03 14 00             	add    (%rax,%rax,1),%edx
    33fa:	00 60 37             	add    %ah,0x37(%rax)
    33fd:	15 00 00 fb 04       	adc    $0x4fb0000,%eax
    3402:	00 00                	add    %al,(%rax)
    3404:	00 60 5d             	add    %ah,0x5d(%rax)
    3407:	0c 00                	or     $0x0,%al
    3409:	00 75 05             	add    %dh,0x5(%rbp)
    340c:	00 00                	add    %al,(%rax)
    340e:	01 60 db             	add    %esp,-0x25(%rax)
    3411:	01 00                	add    %eax,(%rax)
    3413:	00 05 11 00 00 01    	add    %al,0x1000011(%rip)        # 100342a <_end+0xfff262>
    3419:	60                   	(bad)  
    341a:	d5                   	(bad)  
    341b:	05 00 00 11 11       	add    $0x11110000,%eax
    3420:	00 00                	add    %al,(%rax)
    3422:	1f                   	(bad)  
    3423:	61                   	(bad)  
    3424:	20 01                	and    %al,(%rcx)
    3426:	00 00                	add    %al,(%rax)
    3428:	1d 11 00 00 ff       	sbb    $0xff000011,%eax
    342d:	ff                   	(bad)  
    342e:	ff                   	(bad)  
    342f:	7f 62                	jg     3493 <__FRAME_END__+0x1277>
    3431:	73 0d                	jae    3440 <__FRAME_END__+0x1224>
    3433:	00 00                	add    %al,(%rax)
    3435:	29 11                	sub    %edx,(%rcx)
    3437:	00 00                	add    %al,(%rax)
    3439:	80 80 80 80 78 60 80 	addb   $0x80,0x60788080(%rax)
    3440:	11 00                	adc    %eax,(%rax)
    3442:	00 c7                	add    %al,%bh
    3444:	11 00                	adc    %eax,(%rax)
    3446:	00 26                	add    %ah,(%rsi)
    3448:	63 91 05 00 00 0e    	movslq 0xe000005(%rcx),%edx
    344e:	12 00                	adc    (%rax),%al
    3450:	00 34 01             	add    %dh,(%rcx,%rax,1)
    3453:	63 52 0e             	movslq 0xe(%rdx),%edx
    3456:	00 00                	add    %al,(%rax)
    3458:	55                   	push   %rbp
    3459:	12 00                	adc    (%rax),%al
    345b:	00 44 13 60          	add    %al,0x60(%rbx,%rdx,1)
    345f:	b0 10                	mov    $0x10,%al
    3461:	00 00                	add    %al,(%rax)
    3463:	78 12                	js     3477 <__FRAME_END__+0x125b>
    3465:	00 00                	add    %al,(%rax)
    3467:	00 60 3a             	add    %ah,0x3a(%rax)
    346a:	18 00                	sbb    %al,(%rax)
    346c:	00 84 12 00 00 40 60 	add    %al,0x60400000(%rdx,%rdx,1)
    3473:	70 27                	jo     349c <__FRAME_END__+0x1280>
    3475:	00 00                	add    %al,(%rax)
    3477:	bf 12 00 00 01       	mov    $0x1000012,%edi
    347c:	60                   	(bad)  
    347d:	28 27                	sub    %ah,(%rdi)
    347f:	00 00                	add    %al,(%rax)
    3481:	cb                   	lret   
    3482:	12 00                	adc    (%rax),%al
    3484:	00 07                	add    %al,(%rdi)
    3486:	60                   	(bad)  
    3487:	b4 1f                	mov    $0x1f,%ah
    3489:	00 00                	add    %al,(%rax)
    348b:	d7                   	xlat   %ds:(%rbx)
    348c:	12 00                	adc    (%rax),%al
    348e:	00 7f 60             	add    %bh,0x60(%rdi)
    3491:	d1 27                	shll   (%rdi)
    3493:	00 00                	add    %al,(%rax)
    3495:	06                   	(bad)  
    3496:	13 00                	adc    (%rax),%eax
    3498:	00 01                	add    %al,(%rcx)
    349a:	60                   	(bad)  
    349b:	20 24 00             	and    %ah,(%rax,%rax,1)
    349e:	00 12                	add    %dl,(%rdx)
    34a0:	13 00                	adc    (%rax),%eax
    34a2:	00 0f                	add    %cl,(%rdi)
    34a4:	63 36                	movslq (%rsi),%esi
    34a6:	0a 00                	or     (%rax),%al
    34a8:	00 1e                	add    %bl,(%rsi)
    34aa:	13 00                	adc    (%rax),%eax
    34ac:	00 ff                	add    %bh,%bh
    34ae:	7f 62                	jg     3512 <__FRAME_END__+0x12f6>
    34b0:	9b                   	fwait
    34b1:	17                   	(bad)  
    34b2:	00 00                	add    %al,(%rax)
    34b4:	2a 13                	sub    (%rbx),%dl
    34b6:	00 00                	add    %al,(%rax)
    34b8:	80 80 7e 60 18 19 00 	addb   $0x0,0x1918607e(%rax)
    34bf:	00 49 13             	add    %cl,0x13(%rcx)
    34c2:	00 00                	add    %al,(%rax)
    34c4:	01 60 6c             	add    %esp,0x6c(%rax)
    34c7:	04 00                	add    $0x0,%al
    34c9:	00 55 13             	add    %dl,0x13(%rbp)
    34cc:	00 00                	add    %al,(%rax)
    34ce:	3f                   	(bad)  
    34cf:	64 42 1f             	fs rex.X (bad) 
    34d2:	00 00                	add    %al,(%rax)
    34d4:	61                   	(bad)  
    34d5:	13 00                	adc    (%rax),%eax
    34d7:	00 ff                	add    %bh,%bh
    34d9:	ff                   	(bad)  
    34da:	ff                   	(bad)  
    34db:	ff                   	(bad)  
    34dc:	ff                   	(bad)  
    34dd:	ff                   	(bad)  
    34de:	ff                   	(bad)  
    34df:	7f 62                	jg     3543 <__FRAME_END__+0x1327>
    34e1:	e6 18                	out    %al,$0x18
    34e3:	00 00                	add    %al,(%rax)
    34e5:	6d                   	insl   (%dx),%es:(%rdi)
    34e6:	13 00                	adc    (%rax),%eax
    34e8:	00 80 80 80 80 80    	add    %al,-0x7f7f7f80(%rax)
    34ee:	80 80 80 80 7f 65 13 	addb   $0x13,0x657f8080(%rax)
    34f5:	05 00 00 85 14       	add    $0x14850000,%eax
    34fa:	00 00                	add    %al,(%rax)
    34fc:	00 00                	add    %al,(%rax)
    34fe:	00 00                	add    %al,(%rax)
    3500:	19 00                	sbb    %eax,(%rax)
    3502:	00 00                	add    %al,(%rax)
    3504:	00 00                	add    %al,(%rax)
    3506:	00 00                	add    %al,(%rax)
    3508:	01 9c 66 92 1e 00 00 	add    %ebx,0x1e92(%rsi,%riz,2)
    350f:	38 14 00             	cmp    %dl,(%rax,%rax,1)
    3512:	00 00                	add    %al,(%rax)
    3514:	00 00                	add    %al,(%rax)
    3516:	00 4d 00             	add    %cl,0x0(%rbp)
    3519:	00 00                	add    %al,(%rax)
    351b:	00 00                	add    %al,(%rax)
    351d:	00 00                	add    %al,(%rax)
    351f:	01 9c 44 35 00 00 67 	add    %ebx,0x67000035(%rsp,%rax,2)
    3526:	e8 15 00 00 01       	callq  1003540 <_end+0xfff378>
    352b:	2e 01 77 14          	add    %esi,%cs:0x14(%rdi)
    352f:	00 00                	add    %al,(%rax)
    3531:	02 91 6c 67 95 12    	add    0x1295676c(%rcx),%dl
    3537:	00 00                	add    %al,(%rax)
    3539:	01 2e                	add    %ebp,(%rsi)
    353b:	01 77 14             	add    %esi,0x14(%rdi)
    353e:	00 00                	add    %al,(%rax)
    3540:	02 91 68 00 68 a3    	add    -0x5c97ff98(%rcx),%dl
    3546:	07                   	(bad)  
    3547:	00 00                	add    %al,(%rax)
    3549:	01 1c 05 77 14 00 00 	add    %ebx,0x1477(,%rax,1)
    3550:	46 13 00             	rex.RX adc (%rax),%r8d
    3553:	00 00                	add    %al,(%rax)
    3555:	00 00                	add    %al,(%rax)
    3557:	00 f2                	add    %dh,%dl
    3559:	00 00                	add    %al,(%rax)
    355b:	00 00                	add    %al,(%rax)
    355d:	00 00                	add    %al,(%rax)
    355f:	00 01                	add    %al,(%rcx)
    3561:	9c                   	pushfq 
    3562:	dc 35 00 00 69 3d    	fdivl  0x3d690000(%rip)        # 3d693568 <_end+0x3d68f3a0>
    3568:	29 00                	sub    %eax,(%rax)
    356a:	00 01                	add    %al,(%rcx)
    356c:	1f                   	(bad)  
    356d:	0d dc 35 00 00       	or     $0x35dc,%eax
    3572:	02 91 40 6a 78 13    	add    0x13786a40(%rcx),%dl
    3578:	00 00                	add    %al,(%rax)
    357a:	00 00                	add    %al,(%rax)
    357c:	00 00                	add    %al,(%rax)
    357e:	76 00                	jbe    3580 <__FRAME_END__+0x1364>
    3580:	00 00                	add    %al,(%rax)
    3582:	00 00                	add    %al,(%rax)
    3584:	00 00                	add    %al,(%rax)
    3586:	bb 35 00 00 6b       	mov    $0x6b000035,%ebx
    358b:	69 00 01 20 0c 77    	imul   $0x770c2001,(%rax),%eax
    3591:	14 00                	adc    $0x0,%al
    3593:	00 03                	add    %al,(%rbx)
    3595:	91                   	xchg   %eax,%ecx
    3596:	b4 7f                	mov    $0x7f,%ah
    3598:	6c                   	insb   (%dx),%es:(%rdi)
    3599:	85 13                	test   %edx,(%rbx)
    359b:	00 00                	add    %al,(%rax)
    359d:	00 00                	add    %al,(%rax)
    359f:	00 00                	add    %al,(%rax)
    35a1:	63 00                	movslq (%rax),%eax
    35a3:	00 00                	add    %al,(%rax)
    35a5:	00 00                	add    %al,(%rax)
    35a7:	00 00                	add    %al,(%rax)
    35a9:	6b 65 72 72          	imul   $0x72,0x72(%rbp),%esp
    35ad:	00 01                	add    %al,(%rcx)
    35af:	21 09                	and    %ecx,(%rcx)
    35b1:	77 14                	ja     35c7 <__FRAME_END__+0x13ab>
    35b3:	00 00                	add    %al,(%rax)
    35b5:	03 91 bc 7f 00 00    	add    0x7fbc(%rcx),%edx
    35bb:	6c                   	insb   (%dx),%es:(%rdi)
    35bc:	ee                   	out    %al,(%dx)
    35bd:	13 00                	adc    (%rax),%eax
    35bf:	00 00                	add    %al,(%rax)
    35c1:	00 00                	add    %al,(%rax)
    35c3:	00 2a                	add    %ch,(%rdx)
    35c5:	00 00                	add    %al,(%rax)
    35c7:	00 00                	add    %al,(%rax)
    35c9:	00 00                	add    %al,(%rax)
    35cb:	00 6b 69             	add    %ch,0x69(%rbx)
    35ce:	00 01                	add    %al,(%rcx)
    35d0:	29 0c 77             	sub    %ecx,(%rdi,%rsi,2)
    35d3:	14 00                	adc    $0x0,%al
    35d5:	00 03                	add    %al,(%rbx)
    35d7:	91                   	xchg   %eax,%ecx
    35d8:	b8 7f 00 00 41       	mov    $0x4100007f,%eax
    35dd:	94                   	xchg   %eax,%esp
    35de:	24 00                	and    $0x0,%al
    35e0:	00 ec                	add    %ch,%ah
    35e2:	35 00 00 42 b3       	xor    $0xb3420000,%eax
    35e7:	13 00                	adc    (%rax),%eax
    35e9:	00 01                	add    %al,(%rcx)
    35eb:	00 6d a9             	add    %ch,-0x57(%rbp)
    35ee:	1f                   	(bad)  
    35ef:	00 00                	add    %al,(%rax)
    35f1:	01 12                	add    %edx,(%rdx)
    35f3:	08 39                	or     %bh,(%rcx)
    35f5:	1e                   	(bad)  
    35f6:	00 00                	add    %al,(%rax)
    35f8:	03 14 00             	add    (%rax,%rax,1),%edx
    35fb:	00 fc                	add    %bh,%ah
    35fd:	12 00                	adc    (%rax),%al
    35ff:	00 00                	add    %al,(%rax)
    3601:	00 00                	add    %al,(%rax)
    3603:	00 4a 00             	add    %cl,0x0(%rdx)
    3606:	00 00                	add    %al,(%rax)
    3608:	00 00                	add    %al,(%rax)
    360a:	00 00                	add    %al,(%rax)
    360c:	01 9c 22 36 00 00 6e 	add    %ebx,0x6e000036(%rdx,%riz,1)
    3613:	61                   	(bad)  
    3614:	72 67                	jb     367d <__FRAME_END__+0x1461>
    3616:	00 01                	add    %al,(%rcx)
    3618:	12 1a                	adc    (%rdx),%bl
    361a:	03 14 00             	add    (%rax,%rax,1),%edx
    361d:	00 02                	add    %al,(%rdx)
    361f:	91                   	xchg   %eax,%ecx
    3620:	68 00 6f 66 6f       	pushq  $0x6f666f00
    3625:	6f                   	outsl  %ds:(%rsi),(%dx)
    3626:	00 01                	add    %al,(%rcx)
    3628:	0d 06 9a 1f 00       	or     $0x1f9a06,%eax
    362d:	00 c9                	add    %cl,%cl
    362f:	12 00                	adc    (%rax),%al
    3631:	00 00                	add    %al,(%rax)
    3633:	00 00                	add    %al,(%rax)
    3635:	00 33                	add    %dh,(%rbx)
    3637:	00 00                	add    %al,(%rax)
    3639:	00 00                	add    %al,(%rax)
    363b:	00 00                	add    %al,(%rax)
    363d:	00 01                	add    %al,(%rcx)
    363f:	9c                   	pushfq 
	...

Disassembly of section .debug_abbrev:

0000000000000000 <.debug_abbrev>:
   0:	01 11                	add    %edx,(%rcx)
   2:	01 25 0e 13 0b 03    	add    %esp,0x30b130e(%rip)        # 30b1316 <_end+0x30ad14e>
   8:	0e                   	(bad)  
   9:	1b 0e                	sbb    (%rsi),%ecx
   b:	11 01                	adc    %eax,(%rcx)
   d:	12 07                	adc    (%rdi),%al
   f:	10 17                	adc    %dl,(%rdi)
  11:	00 00                	add    %al,(%rax)
  13:	02 39                	add    (%rcx),%bh
  15:	01 03                	add    %eax,(%rbx)
  17:	08 3a                	or     %bh,(%rdx)
  19:	0b 3b                	or     (%rbx),%edi
  1b:	0b 01                	or     (%rcx),%eax
  1d:	13 00                	adc    (%rax),%eax
  1f:	00 03                	add    %al,(%rbx)
  21:	39 00                	cmp    %eax,(%rax)
  23:	03 0e                	add    (%rsi),%ecx
  25:	3a 0b                	cmp    (%rbx),%cl
  27:	3b 05 39 0b 89 01    	cmp    0x1890b39(%rip),%eax        # 1890b66 <_end+0x188c99e>
  2d:	19 00                	sbb    %eax,(%rax)
  2f:	00 04 3a             	add    %al,(%rdx,%rdi,1)
  32:	00 3a                	add    %bh,(%rdx)
  34:	0b 3b                	or     (%rbx),%edi
  36:	05 39 0b 18 13       	add    $0x13180b39,%eax
  3b:	00 00                	add    %al,(%rax)
  3d:	05 08 00 3a 0b       	add    $0xb3a0008,%eax
  42:	3b 0b                	cmp    (%rbx),%ecx
  44:	39 0b                	cmp    %ecx,(%rbx)
  46:	18 13                	sbb    %dl,(%rbx)
  48:	00 00                	add    %al,(%rax)
  4a:	06                   	(bad)  
  4b:	08 00                	or     %al,(%rax)
  4d:	3a 0b                	cmp    (%rbx),%cl
  4f:	3b 05 39 0b 18 13    	cmp    0x13180b39(%rip),%eax        # 13180b8e <_end+0x1317c9c6>
  55:	00 00                	add    %al,(%rax)
  57:	07                   	(bad)  
  58:	13 01                	adc    (%rcx),%eax
  5a:	03 0e                	add    (%rsi),%ecx
  5c:	0b 0b                	or     (%rbx),%ecx
  5e:	3a 0b                	cmp    (%rbx),%cl
  60:	3b 0b                	cmp    (%rbx),%ecx
  62:	39 0b                	cmp    %ecx,(%rbx)
  64:	01 13                	add    %edx,(%rbx)
  66:	00 00                	add    %al,(%rax)
  68:	08 2e                	or     %ch,(%rsi)
  6a:	01 3f                	add    %edi,(%rdi)
  6c:	19 03                	sbb    %eax,(%rbx)
  6e:	0e                   	(bad)  
  6f:	3a 0b                	cmp    (%rbx),%cl
  71:	3b 0b                	cmp    (%rbx),%ecx
  73:	39 0b                	cmp    %ecx,(%rbx)
  75:	6e                   	outsb  %ds:(%rsi),(%dx)
  76:	0e                   	(bad)  
  77:	3c 19                	cmp    $0x19,%al
  79:	63 19                	movslq (%rcx),%ebx
  7b:	8b 01                	mov    (%rcx),%eax
  7d:	0b 64 13 00          	or     0x0(%rbx,%rdx,1),%esp
  81:	00 09                	add    %cl,(%rcx)
  83:	05 00 49 13 34       	add    $0x34134900,%eax
  88:	19 00                	sbb    %eax,(%rax)
  8a:	00 0a                	add    %cl,(%rdx)
  8c:	26 00 49 13          	add    %cl,%es:0x13(%rcx)
  90:	00 00                	add    %al,(%rax)
  92:	0b 34 00             	or     (%rax,%rax,1),%esi
  95:	03 0e                	add    (%rsi),%ecx
  97:	3a 0b                	cmp    (%rbx),%cl
  99:	3b 0b                	cmp    (%rbx),%ecx
  9b:	39 0b                	cmp    %ecx,(%rbx)
  9d:	6e                   	outsb  %ds:(%rsi),(%dx)
  9e:	0e                   	(bad)  
  9f:	49 13 3f             	adc    (%r15),%rdi
  a2:	19 3c 19             	sbb    %edi,(%rcx,%rbx,1)
  a5:	00 00                	add    %al,(%rax)
  a7:	0c 39                	or     $0x39,%al
  a9:	01 03                	add    %eax,(%rbx)
  ab:	0e                   	(bad)  
  ac:	3a 0b                	cmp    (%rbx),%cl
  ae:	3b 0b                	cmp    (%rbx),%ecx
  b0:	39 0b                	cmp    %ecx,(%rbx)
  b2:	01 13                	add    %edx,(%rbx)
  b4:	00 00                	add    %al,(%rax)
  b6:	0d 02 01 03 0e       	or     $0xe030102,%eax
  bb:	0b 0b                	or     (%rbx),%ecx
  bd:	3a 0b                	cmp    (%rbx),%cl
  bf:	3b 0b                	cmp    (%rbx),%ecx
  c1:	39 0b                	cmp    %ecx,(%rbx)
  c3:	01 13                	add    %edx,(%rbx)
  c5:	00 00                	add    %al,(%rax)
  c7:	0e                   	(bad)  
  c8:	0d 00 03 0e 3a       	or     $0x3a0e0300,%eax
  cd:	0b 3b                	or     (%rbx),%edi
  cf:	0b 39                	or     (%rcx),%edi
  d1:	0b 49 13             	or     0x13(%rcx),%ecx
  d4:	38 0b                	cmp    %cl,(%rbx)
  d6:	00 00                	add    %al,(%rax)
  d8:	0f 2e 01             	ucomiss (%rcx),%xmm0
  db:	3f                   	(bad)  
  dc:	19 03                	sbb    %eax,(%rbx)
  de:	0e                   	(bad)  
  df:	3a 0b                	cmp    (%rbx),%cl
  e1:	3b 0b                	cmp    (%rbx),%ecx
  e3:	39 0b                	cmp    %ecx,(%rbx)
  e5:	6e                   	outsb  %ds:(%rsi),(%dx)
  e6:	0e                   	(bad)  
  e7:	3c 19                	cmp    $0x19,%al
  e9:	63 19                	movslq (%rcx),%ebx
  eb:	64 13 01             	adc    %fs:(%rcx),%eax
  ee:	13 00                	adc    (%rax),%eax
  f0:	00 10                	add    %dl,(%rax)
  f2:	05 00 49 13 00       	add    $0x134900,%eax
  f7:	00 11                	add    %dl,(%rcx)
  f9:	2e 01 3f             	add    %edi,%cs:(%rdi)
  fc:	19 03                	sbb    %eax,(%rbx)
  fe:	0e                   	(bad)  
  ff:	3a 0b                	cmp    (%rbx),%cl
 101:	3b 0b                	cmp    (%rbx),%ecx
 103:	39 0b                	cmp    %ecx,(%rbx)
 105:	6e                   	outsb  %ds:(%rsi),(%dx)
 106:	0e                   	(bad)  
 107:	3c 19                	cmp    $0x19,%al
 109:	64 13 01             	adc    %fs:(%rcx),%eax
 10c:	13 00                	adc    (%rax),%eax
 10e:	00 12                	add    %dl,(%rdx)
 110:	2e 01 3f             	add    %edi,%cs:(%rdi)
 113:	19 03                	sbb    %eax,(%rbx)
 115:	0e                   	(bad)  
 116:	3a 0b                	cmp    (%rbx),%cl
 118:	3b 0b                	cmp    (%rbx),%ecx
 11a:	39 0b                	cmp    %ecx,(%rbx)
 11c:	6e                   	outsb  %ds:(%rsi),(%dx)
 11d:	0e                   	(bad)  
 11e:	49 13 3c 19          	adc    (%r9,%rbx,1),%rdi
 122:	64 13 01             	adc    %fs:(%rcx),%eax
 125:	13 00                	adc    (%rax),%eax
 127:	00 13                	add    %dl,(%rbx)
 129:	2e 01 3f             	add    %edi,%cs:(%rdi)
 12c:	19 03                	sbb    %eax,(%rbx)
 12e:	0e                   	(bad)  
 12f:	3a 0b                	cmp    (%rbx),%cl
 131:	3b 0b                	cmp    (%rbx),%ecx
 133:	39 0b                	cmp    %ecx,(%rbx)
 135:	6e                   	outsb  %ds:(%rsi),(%dx)
 136:	0e                   	(bad)  
 137:	32 0b                	xor    (%rbx),%cl
 139:	3c 19                	cmp    $0x19,%al
 13b:	64 13 01             	adc    %fs:(%rcx),%eax
 13e:	13 00                	adc    (%rax),%eax
 140:	00 14 2e             	add    %dl,(%rsi,%rbp,1)
 143:	01 3f                	add    %edi,(%rdi)
 145:	19 03                	sbb    %eax,(%rbx)
 147:	0e                   	(bad)  
 148:	3a 0b                	cmp    (%rbx),%cl
 14a:	3b 0b                	cmp    (%rbx),%ecx
 14c:	39 0b                	cmp    %ecx,(%rbx)
 14e:	6e                   	outsb  %ds:(%rsi),(%dx)
 14f:	0e                   	(bad)  
 150:	49 13 32             	adc    (%r10),%rsi
 153:	0b 3c 19             	or     (%rcx,%rbx,1),%edi
 156:	64 13 01             	adc    %fs:(%rcx),%eax
 159:	13 00                	adc    (%rax),%eax
 15b:	00 15 2e 01 3f 19    	add    %dl,0x193f012e(%rip)        # 193f028f <_end+0x193ec0c7>
 161:	03 0e                	add    (%rsi),%ecx
 163:	3a 0b                	cmp    (%rbx),%cl
 165:	3b 0b                	cmp    (%rbx),%ecx
 167:	39 0b                	cmp    %ecx,(%rbx)
 169:	6e                   	outsb  %ds:(%rsi),(%dx)
 16a:	0e                   	(bad)  
 16b:	49 13 32             	adc    (%r10),%rsi
 16e:	0b 3c 19             	or     (%rcx,%rbx,1),%edi
 171:	63 19                	movslq (%rcx),%ebx
 173:	64 13 01             	adc    %fs:(%rcx),%eax
 176:	13 00                	adc    (%rax),%eax
 178:	00 16                	add    %dl,(%rsi)
 17a:	2e 01 3f             	add    %edi,%cs:(%rdi)
 17d:	19 03                	sbb    %eax,(%rbx)
 17f:	0e                   	(bad)  
 180:	3a 0b                	cmp    (%rbx),%cl
 182:	3b 0b                	cmp    (%rbx),%ecx
 184:	39 0b                	cmp    %ecx,(%rbx)
 186:	6e                   	outsb  %ds:(%rsi),(%dx)
 187:	0e                   	(bad)  
 188:	49 13 32             	adc    (%r10),%rsi
 18b:	0b 3c 19             	or     (%rcx,%rbx,1),%edi
 18e:	64 13 00             	adc    %fs:(%rax),%eax
 191:	00 17                	add    %dl,(%rdi)
 193:	2e 01 3f             	add    %edi,%cs:(%rdi)
 196:	19 03                	sbb    %eax,(%rbx)
 198:	0e                   	(bad)  
 199:	3a 0b                	cmp    (%rbx),%cl
 19b:	3b 0b                	cmp    (%rbx),%ecx
 19d:	39 0b                	cmp    %ecx,(%rbx)
 19f:	6e                   	outsb  %ds:(%rsi),(%dx)
 1a0:	0e                   	(bad)  
 1a1:	87 01                	xchg   %eax,(%rcx)
 1a3:	19 3c 19             	sbb    %edi,(%rcx,%rbx,1)
 1a6:	01 13                	add    %edx,(%rbx)
 1a8:	00 00                	add    %al,(%rax)
 1aa:	18 16                	sbb    %dl,(%rsi)
 1ac:	00 03                	add    %al,(%rbx)
 1ae:	0e                   	(bad)  
 1af:	3a 0b                	cmp    (%rbx),%cl
 1b1:	3b 05 39 0b 49 13    	cmp    0x13490b39(%rip),%eax        # 13490cf0 <_end+0x1348cb28>
 1b7:	00 00                	add    %al,(%rax)
 1b9:	19 02                	sbb    %eax,(%rdx)
 1bb:	00 03                	add    %al,(%rbx)
 1bd:	0e                   	(bad)  
 1be:	3c 19                	cmp    $0x19,%al
 1c0:	00 00                	add    %al,(%rax)
 1c2:	1a 0d 00 03 0e 3a    	sbb    0x3a0e0300(%rip),%cl        # 3a0e04c8 <_end+0x3a0dc300>
 1c8:	0b 3b                	or     (%rbx),%edi
 1ca:	0b 39                	or     (%rcx),%edi
 1cc:	0b 49 13             	or     0x13(%rcx),%ecx
 1cf:	3f                   	(bad)  
 1d0:	19 3c 19             	sbb    %edi,(%rcx,%rbx,1)
 1d3:	6c                   	insb   (%dx),%es:(%rdi)
 1d4:	19 00                	sbb    %eax,(%rax)
 1d6:	00 1b                	add    %bl,(%rbx)
 1d8:	16                   	(bad)  
 1d9:	00 03                	add    %al,(%rbx)
 1db:	0e                   	(bad)  
 1dc:	3a 0b                	cmp    (%rbx),%cl
 1de:	3b 0b                	cmp    (%rbx),%ecx
 1e0:	39 0b                	cmp    %ecx,(%rbx)
 1e2:	49 13 00             	adc    (%r8),%rax
 1e5:	00 1c 2f             	add    %bl,(%rdi,%rbp,1)
 1e8:	00 03                	add    %al,(%rbx)
 1ea:	08 49 13             	or     %cl,0x13(%rcx)
 1ed:	00 00                	add    %al,(%rax)
 1ef:	1d 30 00 03 08       	sbb    $0x8030030,%eax
 1f4:	49 13 1c 0b          	adc    (%r11,%rcx,1),%rbx
 1f8:	00 00                	add    %al,(%rax)
 1fa:	1e                   	(bad)  
 1fb:	39 00                	cmp    %eax,(%rax)
 1fd:	03 0e                	add    (%rsi),%ecx
 1ff:	3a 0b                	cmp    (%rbx),%cl
 201:	3b 05 39 0b 00 00    	cmp    0xb39(%rip),%eax        # d40 <_init-0x2c0>
 207:	1f                   	(bad)  
 208:	04 01                	add    $0x1,%al
 20a:	3e 0b 0b             	or     %ds:(%rbx),%ecx
 20d:	0b 49 13             	or     0x13(%rcx),%ecx
 210:	3a 0b                	cmp    (%rbx),%cl
 212:	3b 0b                	cmp    (%rbx),%ecx
 214:	39 0b                	cmp    %ecx,(%rbx)
 216:	01 13                	add    %edx,(%rbx)
 218:	00 00                	add    %al,(%rax)
 21a:	20 28                	and    %ch,(%rax)
 21c:	00 03                	add    %al,(%rbx)
 21e:	0e                   	(bad)  
 21f:	1c 0b                	sbb    $0xb,%al
 221:	00 00                	add    %al,(%rax)
 223:	21 34 00             	and    %esi,(%rax,%rax,1)
 226:	03 0e                	add    (%rsi),%ecx
 228:	3a 0b                	cmp    (%rbx),%cl
 22a:	3b 0b                	cmp    (%rbx),%ecx
 22c:	39 0b                	cmp    %ecx,(%rbx)
 22e:	49 13 3c 19          	adc    (%r9,%rbx,1),%rdi
 232:	1c 0a                	sbb    $0xa,%al
 234:	6c                   	insb   (%dx),%es:(%rdi)
 235:	19 00                	sbb    %eax,(%rax)
 237:	00 22                	add    %ah,(%rdx)
 239:	39 00                	cmp    %eax,(%rax)
 23b:	03 0e                	add    (%rsi),%ecx
 23d:	3a 0b                	cmp    (%rbx),%cl
 23f:	3b 0b                	cmp    (%rbx),%ecx
 241:	39 0b                	cmp    %ecx,(%rbx)
 243:	00 00                	add    %al,(%rax)
 245:	23 13                	and    (%rbx),%edx
 247:	01 03                	add    %eax,(%rbx)
 249:	0e                   	(bad)  
 24a:	0b 0b                	or     (%rbx),%ecx
 24c:	3a 0b                	cmp    (%rbx),%cl
 24e:	3b 05 39 0b 01 13    	cmp    0x13010b39(%rip),%eax        # 13010d8d <_end+0x1300cbc5>
 254:	00 00                	add    %al,(%rax)
 256:	24 2e                	and    $0x2e,%al
 258:	01 3f                	add    %edi,(%rdi)
 25a:	19 03                	sbb    %eax,(%rbx)
 25c:	0e                   	(bad)  
 25d:	3a 0b                	cmp    (%rbx),%cl
 25f:	3b 05 39 0b 6e 0e    	cmp    0xe6e0b39(%rip),%eax        # e6e0d9e <_end+0xe6dcbd6>
 265:	3c 19                	cmp    $0x19,%al
 267:	01 13                	add    %edx,(%rbx)
 269:	00 00                	add    %al,(%rax)
 26b:	25 2e 01 3f 19       	and    $0x193f012e,%eax
 270:	03 08                	add    (%rax),%ecx
 272:	3a 0b                	cmp    (%rbx),%cl
 274:	3b 05 39 0b 6e 0e    	cmp    0xe6e0b39(%rip),%eax        # e6e0db3 <_end+0xe6dcbeb>
 27a:	49 13 3c 19          	adc    (%r9,%rbx,1),%rdi
 27e:	01 13                	add    %edx,(%rbx)
 280:	00 00                	add    %al,(%rax)
 282:	26 2e 01 3f          	es add %edi,%cs:(%rdi)
 286:	19 03                	sbb    %eax,(%rbx)
 288:	0e                   	(bad)  
 289:	3a 0b                	cmp    (%rbx),%cl
 28b:	3b 05 39 0b 6e 0e    	cmp    0xe6e0b39(%rip),%eax        # e6e0dca <_end+0xe6dcc02>
 291:	49 13 3c 19          	adc    (%r9,%rbx,1),%rdi
 295:	01 13                	add    %edx,(%rbx)
 297:	00 00                	add    %al,(%rax)
 299:	27                   	(bad)  
 29a:	2e 00 3f             	add    %bh,%cs:(%rdi)
 29d:	19 03                	sbb    %eax,(%rbx)
 29f:	08 3a                	or     %bh,(%rdx)
 2a1:	0b 3b                	or     (%rbx),%edi
 2a3:	05 39 0b 6e 0e       	add    $0xe6e0b39,%eax
 2a8:	49 13 3c 19          	adc    (%r9,%rbx,1),%rdi
 2ac:	00 00                	add    %al,(%rax)
 2ae:	28 2f                	sub    %ch,(%rdi)
 2b0:	00 03                	add    %al,(%rbx)
 2b2:	0e                   	(bad)  
 2b3:	49 13 00             	adc    (%r8),%rax
 2b6:	00 29                	add    %ch,(%rcx)
 2b8:	39 01                	cmp    %eax,(%rcx)
 2ba:	03 0e                	add    (%rsi),%ecx
 2bc:	3a 0b                	cmp    (%rbx),%cl
 2be:	3b 05 39 0b 89 01    	cmp    0x1890b39(%rip),%eax        # 1890dfd <_end+0x188cc35>
 2c4:	19 01                	sbb    %eax,(%rcx)
 2c6:	13 00                	adc    (%rax),%eax
 2c8:	00 2a                	add    %ch,(%rdx)
 2ca:	39 00                	cmp    %eax,(%rax)
 2cc:	03 08                	add    (%rax),%ecx
 2ce:	3a 0b                	cmp    (%rbx),%cl
 2d0:	3b 0b                	cmp    (%rbx),%ecx
 2d2:	39 0b                	cmp    %ecx,(%rbx)
 2d4:	89 01                	mov    %eax,(%rcx)
 2d6:	19 00                	sbb    %eax,(%rax)
 2d8:	00 2b                	add    %ch,(%rbx)
 2da:	3a 00                	cmp    (%rax),%al
 2dc:	3a 0b                	cmp    (%rbx),%cl
 2de:	3b 0b                	cmp    (%rbx),%ecx
 2e0:	39 0b                	cmp    %ecx,(%rbx)
 2e2:	18 13                	sbb    %dl,(%rbx)
 2e4:	00 00                	add    %al,(%rax)
 2e6:	2c 02                	sub    $0x2,%al
 2e8:	01 03                	add    %eax,(%rbx)
 2ea:	0e                   	(bad)  
 2eb:	3c 19                	cmp    $0x19,%al
 2ed:	01 13                	add    %edx,(%rbx)
 2ef:	00 00                	add    %al,(%rax)
 2f1:	2d 02 01 03 0e       	sub    $0xe030102,%eax
 2f6:	0b 0b                	or     (%rbx),%ecx
 2f8:	3a 0b                	cmp    (%rbx),%cl
 2fa:	3b 05 39 0b 32 0b    	cmp    0xb320b39(%rip),%eax        # b320e39 <_end+0xb31cc71>
 300:	01 13                	add    %edx,(%rbx)
 302:	00 00                	add    %al,(%rax)
 304:	2e 2e 01 3f          	cs add %edi,%cs:(%rdi)
 308:	19 03                	sbb    %eax,(%rbx)
 30a:	0e                   	(bad)  
 30b:	3a 0b                	cmp    (%rbx),%cl
 30d:	3b 05 39 0b 6e 0e    	cmp    0xe6e0b39(%rip),%eax        # e6e0e4c <_end+0xe6dcc84>
 313:	32 0b                	xor    (%rbx),%cl
 315:	3c 19                	cmp    $0x19,%al
 317:	64 13 01             	adc    %fs:(%rcx),%eax
 31a:	13 00                	adc    (%rax),%eax
 31c:	00 2f                	add    %ch,(%rdi)
 31e:	2e 01 3f             	add    %edi,%cs:(%rdi)
 321:	19 03                	sbb    %eax,(%rbx)
 323:	0e                   	(bad)  
 324:	3a 0b                	cmp    (%rbx),%cl
 326:	3b 05 39 0b 6e 0e    	cmp    0xe6e0b39(%rip),%eax        # e6e0e65 <_end+0xe6dcc9d>
 32c:	32 0b                	xor    (%rbx),%cl
 32e:	3c 19                	cmp    $0x19,%al
 330:	8b 01                	mov    (%rcx),%eax
 332:	0b 64 13 01          	or     0x1(%rbx,%rdx,1),%esp
 336:	13 00                	adc    (%rax),%eax
 338:	00 30                	add    %dh,(%rax)
 33a:	2e 01 3f             	add    %edi,%cs:(%rdi)
 33d:	19 03                	sbb    %eax,(%rbx)
 33f:	0e                   	(bad)  
 340:	3a 0b                	cmp    (%rbx),%cl
 342:	3b 05 39 0b 6e 0e    	cmp    0xe6e0b39(%rip),%eax        # e6e0e81 <_end+0xe6dccb9>
 348:	49 13 32             	adc    (%r10),%rsi
 34b:	0b 3c 19             	or     (%rcx,%rbx,1),%edi
 34e:	8b 01                	mov    (%rcx),%eax
 350:	0b 64 13 01          	or     0x1(%rbx,%rdx,1),%esp
 354:	13 00                	adc    (%rax),%eax
 356:	00 31                	add    %dh,(%rcx)
 358:	0d 00 03 0e 3a       	or     $0x3a0e0300,%eax
 35d:	0b 3b                	or     (%rbx),%edi
 35f:	05 39 0b 49 13       	add    $0x13490b39,%eax
 364:	3f                   	(bad)  
 365:	19 3c 19             	sbb    %edi,(%rcx,%rbx,1)
 368:	00 00                	add    %al,(%rax)
 36a:	32 2f                	xor    (%rdi),%ch
 36c:	00 03                	add    %al,(%rbx)
 36e:	0e                   	(bad)  
 36f:	49 13 1e             	adc    (%r14),%rbx
 372:	19 00                	sbb    %eax,(%rax)
 374:	00 33                	add    %dh,(%rbx)
 376:	34 00                	xor    $0x0,%al
 378:	03 08                	add    (%rax),%ecx
 37a:	3a 0b                	cmp    (%rbx),%cl
 37c:	3b 0b                	cmp    (%rbx),%ecx
 37e:	39 0b                	cmp    %ecx,(%rbx)
 380:	6e                   	outsb  %ds:(%rsi),(%dx)
 381:	0e                   	(bad)  
 382:	49 13 3f             	adc    (%r15),%rdi
 385:	19 3c 19             	sbb    %edi,(%rcx,%rbx,1)
 388:	00 00                	add    %al,(%rax)
 38a:	34 34                	xor    $0x34,%al
 38c:	00 03                	add    %al,(%rbx)
 38e:	0e                   	(bad)  
 38f:	3a 0b                	cmp    (%rbx),%cl
 391:	3b 0b                	cmp    (%rbx),%ecx
 393:	39 0b                	cmp    %ecx,(%rbx)
 395:	49 13 3c 19          	adc    (%r9,%rbx,1),%rdi
 399:	00 00                	add    %al,(%rax)
 39b:	35 2e 01 3f 19       	xor    $0x193f012e,%eax
 3a0:	03 08                	add    (%rax),%ecx
 3a2:	3a 0b                	cmp    (%rbx),%cl
 3a4:	3b 0b                	cmp    (%rbx),%ecx
 3a6:	39 0b                	cmp    %ecx,(%rbx)
 3a8:	6e                   	outsb  %ds:(%rsi),(%dx)
 3a9:	0e                   	(bad)  
 3aa:	49 13 3c 19          	adc    (%r9,%rbx,1),%rdi
 3ae:	01 13                	add    %edx,(%rbx)
 3b0:	00 00                	add    %al,(%rax)
 3b2:	36 2e 01 3f          	ss add %edi,%cs:(%rdi)
 3b6:	19 03                	sbb    %eax,(%rbx)
 3b8:	08 3a                	or     %bh,(%rdx)
 3ba:	0b 3b                	or     (%rbx),%edi
 3bc:	0b 39                	or     (%rcx),%edi
 3be:	0b 6e 0e             	or     0xe(%rsi),%ebp
 3c1:	49 13 3c 19          	adc    (%r9,%rbx,1),%rdi
 3c5:	00 00                	add    %al,(%rax)
 3c7:	37                   	(bad)  
 3c8:	39 01                	cmp    %eax,(%rcx)
 3ca:	03 0e                	add    (%rsi),%ecx
 3cc:	3a 0b                	cmp    (%rbx),%cl
 3ce:	3b 05 39 0b 01 13    	cmp    0x13010b39(%rip),%eax        # 13010f0d <_end+0x1300cd45>
 3d4:	00 00                	add    %al,(%rax)
 3d6:	38 0d 00 03 0e 3a    	cmp    %cl,0x3a0e0300(%rip)        # 3a0e06dc <_end+0x3a0dc514>
 3dc:	0b 3b                	or     (%rbx),%edi
 3de:	0b 39                	or     (%rcx),%edi
 3e0:	0b 49 13             	or     0x13(%rcx),%ecx
 3e3:	3f                   	(bad)  
 3e4:	19 3c 19             	sbb    %edi,(%rcx,%rbx,1)
 3e7:	00 00                	add    %al,(%rax)
 3e9:	39 13                	cmp    %edx,(%rbx)
 3eb:	01 03                	add    %eax,(%rbx)
 3ed:	0e                   	(bad)  
 3ee:	0b 0b                	or     (%rbx),%ecx
 3f0:	3a 0b                	cmp    (%rbx),%cl
 3f2:	3b 0b                	cmp    (%rbx),%ecx
 3f4:	39 0b                	cmp    %ecx,(%rbx)
 3f6:	00 00                	add    %al,(%rax)
 3f8:	3a 24 00             	cmp    (%rax,%rax,1),%ah
 3fb:	0b 0b                	or     (%rbx),%ecx
 3fd:	3e 0b 03             	or     %ds:(%rbx),%eax
 400:	0e                   	(bad)  
 401:	00 00                	add    %al,(%rax)
 403:	3b 13                	cmp    (%rbx),%edx
 405:	01 03                	add    %eax,(%rbx)
 407:	0e                   	(bad)  
 408:	0b 0b                	or     (%rbx),%ecx
 40a:	3a 0b                	cmp    (%rbx),%cl
 40c:	3b 0b                	cmp    (%rbx),%ecx
 40e:	01 13                	add    %edx,(%rbx)
 410:	00 00                	add    %al,(%rax)
 412:	3c 0d                	cmp    $0xd,%al
 414:	00 03                	add    %al,(%rbx)
 416:	0e                   	(bad)  
 417:	3a 0b                	cmp    (%rbx),%cl
 419:	3b 0b                	cmp    (%rbx),%ecx
 41b:	49 13 38             	adc    (%r8),%rdi
 41e:	0b 00                	or     (%rax),%eax
 420:	00 3d 0f 00 0b 0b    	add    %bh,0xb0b000f(%rip)        # b0b0435 <_end+0xb0ac26d>
 426:	00 00                	add    %al,(%rax)
 428:	3e 13 01             	adc    %ds:(%rcx),%eax
 42b:	0b 0b                	or     (%rbx),%ecx
 42d:	3a 0b                	cmp    (%rbx),%cl
 42f:	3b 0b                	cmp    (%rbx),%ecx
 431:	39 0b                	cmp    %ecx,(%rbx)
 433:	6e                   	outsb  %ds:(%rsi),(%dx)
 434:	0e                   	(bad)  
 435:	01 13                	add    %edx,(%rbx)
 437:	00 00                	add    %al,(%rax)
 439:	3f                   	(bad)  
 43a:	17                   	(bad)  
 43b:	01 0b                	add    %ecx,(%rbx)
 43d:	0b 3a                	or     (%rdx),%edi
 43f:	0b 3b                	or     (%rbx),%edi
 441:	0b 39                	or     (%rcx),%edi
 443:	0b 01                	or     (%rcx),%eax
 445:	13 00                	adc    (%rax),%eax
 447:	00 40 0d             	add    %al,0xd(%rax)
 44a:	00 03                	add    %al,(%rbx)
 44c:	0e                   	(bad)  
 44d:	3a 0b                	cmp    (%rbx),%cl
 44f:	3b 0b                	cmp    (%rbx),%ecx
 451:	39 0b                	cmp    %ecx,(%rbx)
 453:	49 13 00             	adc    (%r8),%rax
 456:	00 41 01             	add    %al,0x1(%rcx)
 459:	01 49 13             	add    %ecx,0x13(%rcx)
 45c:	01 13                	add    %edx,(%rbx)
 45e:	00 00                	add    %al,(%rax)
 460:	42 21 00             	rex.X and %eax,(%rax)
 463:	49 13 2f             	adc    (%r15),%rbp
 466:	0b 00                	or     (%rax),%eax
 468:	00 43 24             	add    %al,0x24(%rbx)
 46b:	00 0b                	add    %cl,(%rbx)
 46d:	0b 3e                	or     (%rsi),%edi
 46f:	0b 03                	or     (%rbx),%eax
 471:	08 00                	or     %al,(%rax)
 473:	00 44 0f 00          	add    %al,0x0(%rdi,%rcx,1)
 477:	0b 0b                	or     (%rbx),%ecx
 479:	49 13 00             	adc    (%r8),%rax
 47c:	00 45 2e             	add    %al,0x2e(%rbp)
 47f:	01 3f                	add    %edi,(%rdi)
 481:	19 03                	sbb    %eax,(%rbx)
 483:	0e                   	(bad)  
 484:	3a 0b                	cmp    (%rbx),%cl
 486:	3b 05 39 0b 49 13    	cmp    0x13490b39(%rip),%eax        # 13490fc5 <_end+0x1348cdfd>
 48c:	3c 19                	cmp    $0x19,%al
 48e:	01 13                	add    %edx,(%rbx)
 490:	00 00                	add    %al,(%rax)
 492:	46 18 00             	rex.RX sbb %r8b,(%rax)
 495:	00 00                	add    %al,(%rax)
 497:	47                   	rex.RXB
 498:	2e 00 3f             	add    %bh,%cs:(%rdi)
 49b:	19 03                	sbb    %eax,(%rbx)
 49d:	0e                   	(bad)  
 49e:	3a 0b                	cmp    (%rbx),%cl
 4a0:	3b 05 39 0b 49 13    	cmp    0x13490b39(%rip),%eax        # 13490fdf <_end+0x1348ce17>
 4a6:	3c 19                	cmp    $0x19,%al
 4a8:	00 00                	add    %al,(%rax)
 4aa:	48                   	rex.W
 4ab:	2e 01 3f             	add    %edi,%cs:(%rdi)
 4ae:	19 03                	sbb    %eax,(%rbx)
 4b0:	0e                   	(bad)  
 4b1:	3a 0b                	cmp    (%rbx),%cl
 4b3:	3b 0b                	cmp    (%rbx),%ecx
 4b5:	39 0b                	cmp    %ecx,(%rbx)
 4b7:	49 13 3c 19          	adc    (%r9,%rbx,1),%rdi
 4bb:	01 13                	add    %edx,(%rbx)
 4bd:	00 00                	add    %al,(%rax)
 4bf:	49 13 01             	adc    (%r9),%rax
 4c2:	03 08                	add    (%rax),%ecx
 4c4:	0b 0b                	or     (%rbx),%ecx
 4c6:	3a 0b                	cmp    (%rbx),%cl
 4c8:	3b 0b                	cmp    (%rbx),%ecx
 4ca:	39 0b                	cmp    %ecx,(%rbx)
 4cc:	01 13                	add    %edx,(%rbx)
 4ce:	00 00                	add    %al,(%rax)
 4d0:	4a                   	rex.WX
 4d1:	2e 01 3f             	add    %edi,%cs:(%rdi)
 4d4:	19 03                	sbb    %eax,(%rbx)
 4d6:	0e                   	(bad)  
 4d7:	3a 0b                	cmp    (%rbx),%cl
 4d9:	3b 0b                	cmp    (%rbx),%ecx
 4db:	39 0b                	cmp    %ecx,(%rbx)
 4dd:	6e                   	outsb  %ds:(%rsi),(%dx)
 4de:	0e                   	(bad)  
 4df:	49 13 3c 19          	adc    (%r9,%rbx,1),%rdi
 4e3:	01 13                	add    %edx,(%rbx)
 4e5:	00 00                	add    %al,(%rax)
 4e7:	4b 3b 00             	rex.WXB cmp (%r8),%rax
 4ea:	03 0e                	add    (%rsi),%ecx
 4ec:	00 00                	add    %al,(%rax)
 4ee:	4c 10 00             	rex.WR adc %r8b,(%rax)
 4f1:	0b 0b                	or     (%rbx),%ecx
 4f3:	49 13 00             	adc    (%r8),%rax
 4f6:	00 4d 42             	add    %cl,0x42(%rbp)
 4f9:	00 0b                	add    %cl,(%rbx)
 4fb:	0b 49 13             	or     0x13(%rcx),%ecx
 4fe:	00 00                	add    %al,(%rax)
 500:	4e 34 00             	rex.WRX xor $0x0,%al
 503:	47 13 00             	rex.RXB adc (%r8),%r8d
 506:	00 4f 2e             	add    %cl,0x2e(%rdi)
 509:	00 3f                	add    %bh,(%rdi)
 50b:	19 03                	sbb    %eax,(%rbx)
 50d:	0e                   	(bad)  
 50e:	3a 0b                	cmp    (%rbx),%cl
 510:	3b 0b                	cmp    (%rbx),%ecx
 512:	39 0b                	cmp    %ecx,(%rbx)
 514:	49 13 3c 19          	adc    (%r9,%rbx,1),%rdi
 518:	00 00                	add    %al,(%rax)
 51a:	50                   	push   %rax
 51b:	34 00                	xor    $0x0,%al
 51d:	03 0e                	add    (%rsi),%ecx
 51f:	3a 0b                	cmp    (%rbx),%cl
 521:	3b 0b                	cmp    (%rbx),%ecx
 523:	39 0b                	cmp    %ecx,(%rbx)
 525:	49 13 3f             	adc    (%r15),%rdi
 528:	19 3c 19             	sbb    %edi,(%rcx,%rbx,1)
 52b:	00 00                	add    %al,(%rax)
 52d:	51                   	push   %rcx
 52e:	34 00                	xor    $0x0,%al
 530:	03 0e                	add    (%rsi),%ecx
 532:	3a 0b                	cmp    (%rbx),%cl
 534:	3b 05 39 0b 49 13    	cmp    0x13490b39(%rip),%eax        # 13491073 <_end+0x1348ceab>
 53a:	3f                   	(bad)  
 53b:	19 3c 19             	sbb    %edi,(%rcx,%rbx,1)
 53e:	00 00                	add    %al,(%rax)
 540:	52                   	push   %rdx
 541:	17                   	(bad)  
 542:	01 0b                	add    %ecx,(%rbx)
 544:	0b 3a                	or     (%rdx),%edi
 546:	0b 3b                	or     (%rbx),%edi
 548:	0b 39                	or     (%rcx),%edi
 54a:	0b 6e 0e             	or     0xe(%rsi),%ebp
 54d:	01 13                	add    %edx,(%rbx)
 54f:	00 00                	add    %al,(%rax)
 551:	53                   	push   %rbx
 552:	26 00 00             	add    %al,%es:(%rax)
 555:	00 54 0d 00          	add    %dl,0x0(%rbp,%rcx,1)
 559:	03 08                	add    (%rax),%ecx
 55b:	3a 0b                	cmp    (%rbx),%cl
 55d:	3b 0b                	cmp    (%rbx),%ecx
 55f:	39 0b                	cmp    %ecx,(%rbx)
 561:	49 13 38             	adc    (%r8),%rdi
 564:	0b 00                	or     (%rax),%eax
 566:	00 55 15             	add    %dl,0x15(%rbp)
 569:	01 49 13             	add    %ecx,0x13(%rcx)
 56c:	01 13                	add    %edx,(%rbx)
 56e:	00 00                	add    %al,(%rax)
 570:	56                   	push   %rsi
 571:	15 00 00 00 57       	adc    $0x57000000,%eax
 576:	2e 01 3f             	add    %edi,%cs:(%rdi)
 579:	19 03                	sbb    %eax,(%rbx)
 57b:	08 3a                	or     %bh,(%rdx)
 57d:	0b 3b                	or     (%rbx),%edi
 57f:	05 39 0b 49 13       	add    $0x13490b39,%eax
 584:	3c 19                	cmp    $0x19,%al
 586:	01 13                	add    %edx,(%rbx)
 588:	00 00                	add    %al,(%rax)
 58a:	58                   	pop    %rax
 58b:	2e 01 3f             	add    %edi,%cs:(%rdi)
 58e:	19 03                	sbb    %eax,(%rbx)
 590:	0e                   	(bad)  
 591:	3a 0b                	cmp    (%rbx),%cl
 593:	3b 05 39 0b 3c 19    	cmp    0x193c0b39(%rip),%eax        # 193c10d2 <_end+0x193bcf0a>
 599:	01 13                	add    %edx,(%rbx)
 59b:	00 00                	add    %al,(%rax)
 59d:	59                   	pop    %rcx
 59e:	2e 01 3f             	add    %edi,%cs:(%rdi)
 5a1:	19 03                	sbb    %eax,(%rbx)
 5a3:	0e                   	(bad)  
 5a4:	3a 0b                	cmp    (%rbx),%cl
 5a6:	3b 05 39 0b 87 01    	cmp    0x1870b39(%rip),%eax        # 18710e5 <_end+0x186cf1d>
 5ac:	19 3c 19             	sbb    %edi,(%rcx,%rbx,1)
 5af:	01 13                	add    %edx,(%rbx)
 5b1:	00 00                	add    %al,(%rax)
 5b3:	5a                   	pop    %rdx
 5b4:	16                   	(bad)  
 5b5:	00 03                	add    %al,(%rbx)
 5b7:	0e                   	(bad)  
 5b8:	3a 0b                	cmp    (%rbx),%cl
 5ba:	3b 0b                	cmp    (%rbx),%ecx
 5bc:	39 0b                	cmp    %ecx,(%rbx)
 5be:	00 00                	add    %al,(%rax)
 5c0:	5b                   	pop    %rbx
 5c1:	13 00                	adc    (%rax),%eax
 5c3:	03 0e                	add    (%rsi),%ecx
 5c5:	3c 19                	cmp    $0x19,%al
 5c7:	00 00                	add    %al,(%rax)
 5c9:	5c                   	pop    %rsp
 5ca:	21 00                	and    %eax,(%rax)
 5cc:	00 00                	add    %al,(%rax)
 5ce:	5d                   	pop    %rbp
 5cf:	34 00                	xor    $0x0,%al
 5d1:	47 13 02             	rex.RXB adc (%r10),%r8d
 5d4:	18 00                	sbb    %al,(%rax)
 5d6:	00 5e 34             	add    %bl,0x34(%rsi)
 5d9:	00 03                	add    %al,(%rbx)
 5db:	0e                   	(bad)  
 5dc:	3a 0b                	cmp    (%rbx),%cl
 5de:	3b 0b                	cmp    (%rbx),%ecx
 5e0:	39 0b                	cmp    %ecx,(%rbx)
 5e2:	49 13 3f             	adc    (%r15),%rdi
 5e5:	19 02                	sbb    %eax,(%rdx)
 5e7:	18 00                	sbb    %al,(%rax)
 5e9:	00 5f 34             	add    %bl,0x34(%rdi)
 5ec:	00 03                	add    %al,(%rbx)
 5ee:	0e                   	(bad)  
 5ef:	49 13 3f             	adc    (%r15),%rdi
 5f2:	19 34 19             	sbb    %esi,(%rcx,%rbx,1)
 5f5:	3c 19                	cmp    $0x19,%al
 5f7:	00 00                	add    %al,(%rax)
 5f9:	60                   	(bad)  
 5fa:	34 00                	xor    $0x0,%al
 5fc:	6e                   	outsb  %ds:(%rsi),(%dx)
 5fd:	0e                   	(bad)  
 5fe:	47 13 1c 0b          	adc    (%r11,%r9,1),%r11d
 602:	00 00                	add    %al,(%rax)
 604:	61                   	(bad)  
 605:	34 00                	xor    $0x0,%al
 607:	6e                   	outsb  %ds:(%rsi),(%dx)
 608:	0e                   	(bad)  
 609:	47 13 1c 06          	adc    (%r14,%r8,1),%r11d
 60d:	00 00                	add    %al,(%rax)
 60f:	62                   	(bad)  
 610:	34 00                	xor    $0x0,%al
 612:	6e                   	outsb  %ds:(%rsi),(%dx)
 613:	0e                   	(bad)  
 614:	47 13 1c 0d 00 00 63 	adc    0x34630000(,%r9,1),%r11d
 61b:	34 
 61c:	00 6e 0e             	add    %ch,0xe(%rsi)
 61f:	47 13 1c 05 00 00 64 	adc    0x34640000(,%r8,1),%r11d
 626:	34 
 627:	00 6e 0e             	add    %ch,0xe(%rsi)
 62a:	47 13 1c 07          	adc    (%r15,%r8,1),%r11d
 62e:	00 00                	add    %al,(%rax)
 630:	65 2e 00 03          	gs add %al,%cs:(%rbx)
 634:	0e                   	(bad)  
 635:	34 19                	xor    $0x19,%al
 637:	11 01                	adc    %eax,(%rcx)
 639:	12 07                	adc    (%rdi),%al
 63b:	40 18 96 42 19 00 00 	sbb    %dl,0x1942(%rsi)
 642:	66 2e 01 03          	add    %ax,%cs:(%rbx)
 646:	0e                   	(bad)  
 647:	34 19                	xor    $0x19,%al
 649:	11 01                	adc    %eax,(%rcx)
 64b:	12 07                	adc    (%rdi),%al
 64d:	40 18 96 42 19 01 13 	sbb    %dl,0x13011942(%rsi)
 654:	00 00                	add    %al,(%rax)
 656:	67 05 00 03 0e 3a    	addr32 add $0x3a0e0300,%eax
 65c:	0b 3b                	or     (%rbx),%edi
 65e:	0b 39                	or     (%rcx),%edi
 660:	0b 49 13             	or     0x13(%rcx),%ecx
 663:	02 18                	add    (%rax),%bl
 665:	00 00                	add    %al,(%rax)
 667:	68 2e 01 3f 19       	pushq  $0x193f012e
 66c:	03 0e                	add    (%rsi),%ecx
 66e:	3a 0b                	cmp    (%rbx),%cl
 670:	3b 0b                	cmp    (%rbx),%ecx
 672:	39 0b                	cmp    %ecx,(%rbx)
 674:	49 13 11             	adc    (%r9),%rdx
 677:	01 12                	add    %edx,(%rdx)
 679:	07                   	(bad)  
 67a:	40 18 96 42 19 01 13 	sbb    %dl,0x13011942(%rsi)
 681:	00 00                	add    %al,(%rax)
 683:	69 34 00 03 0e 3a 0b 	imul   $0xb3a0e03,(%rax,%rax,1),%esi
 68a:	3b 0b                	cmp    (%rbx),%ecx
 68c:	39 0b                	cmp    %ecx,(%rbx)
 68e:	49 13 02             	adc    (%r10),%rax
 691:	18 00                	sbb    %al,(%rax)
 693:	00 6a 0b             	add    %ch,0xb(%rdx)
 696:	01 11                	add    %edx,(%rcx)
 698:	01 12                	add    %edx,(%rdx)
 69a:	07                   	(bad)  
 69b:	01 13                	add    %edx,(%rbx)
 69d:	00 00                	add    %al,(%rax)
 69f:	6b 34 00 03          	imul   $0x3,(%rax,%rax,1),%esi
 6a3:	08 3a                	or     %bh,(%rdx)
 6a5:	0b 3b                	or     (%rbx),%edi
 6a7:	0b 39                	or     (%rcx),%edi
 6a9:	0b 49 13             	or     0x13(%rcx),%ecx
 6ac:	02 18                	add    (%rax),%bl
 6ae:	00 00                	add    %al,(%rax)
 6b0:	6c                   	insb   (%dx),%es:(%rdi)
 6b1:	0b 01                	or     (%rcx),%eax
 6b3:	11 01                	adc    %eax,(%rcx)
 6b5:	12 07                	adc    (%rdi),%al
 6b7:	00 00                	add    %al,(%rax)
 6b9:	6d                   	insl   (%dx),%es:(%rdi)
 6ba:	2e 01 3f             	add    %edi,%cs:(%rdi)
 6bd:	19 03                	sbb    %eax,(%rbx)
 6bf:	0e                   	(bad)  
 6c0:	3a 0b                	cmp    (%rbx),%cl
 6c2:	3b 0b                	cmp    (%rbx),%ecx
 6c4:	39 0b                	cmp    %ecx,(%rbx)
 6c6:	6e                   	outsb  %ds:(%rsi),(%dx)
 6c7:	0e                   	(bad)  
 6c8:	49 13 11             	adc    (%r9),%rdx
 6cb:	01 12                	add    %edx,(%rdx)
 6cd:	07                   	(bad)  
 6ce:	40 18 96 42 19 01 13 	sbb    %dl,0x13011942(%rsi)
 6d5:	00 00                	add    %al,(%rax)
 6d7:	6e                   	outsb  %ds:(%rsi),(%dx)
 6d8:	05 00 03 08 3a       	add    $0x3a080300,%eax
 6dd:	0b 3b                	or     (%rbx),%edi
 6df:	0b 39                	or     (%rcx),%edi
 6e1:	0b 49 13             	or     0x13(%rcx),%ecx
 6e4:	02 18                	add    (%rax),%bl
 6e6:	00 00                	add    %al,(%rax)
 6e8:	6f                   	outsl  %ds:(%rsi),(%dx)
 6e9:	2e 00 3f             	add    %bh,%cs:(%rdi)
 6ec:	19 03                	sbb    %eax,(%rbx)
 6ee:	08 3a                	or     %bh,(%rdx)
 6f0:	0b 3b                	or     (%rbx),%edi
 6f2:	0b 39                	or     (%rcx),%edi
 6f4:	0b 6e 0e             	or     0xe(%rsi),%ebp
 6f7:	11 01                	adc    %eax,(%rcx)
 6f9:	12 07                	adc    (%rdi),%al
 6fb:	40 18 96 42 19 00 00 	sbb    %dl,0x1942(%rsi)
	...

Disassembly of section .debug_line:

0000000000000000 <.debug_line>:
   0:	c6 04 00 00          	movb   $0x0,(%rax,%rax,1)
   4:	03 00                	add    (%rax),%eax
   6:	23 04 00             	and    (%rax,%rax,1),%eax
   9:	00 01                	add    %al,(%rcx)
   b:	01 fb                	add    %edi,%ebx
   d:	0e                   	(bad)  
   e:	0d 00 01 01 01       	or     $0x1010100,%eax
  13:	01 00                	add    %eax,(%rax)
  15:	00 00                	add    %al,(%rax)
  17:	01 00                	add    %eax,(%rax)
  19:	00 01                	add    %al,(%rcx)
  1b:	2f                   	(bad)  
  1c:	75 73                	jne    91 <_init-0xf6f>
  1e:	72 2f                	jb     4f <_init-0xfb1>
  20:	69 6e 63 6c 75 64 65 	imul   $0x6564756c,0x63(%rsi),%ebp
  27:	2f                   	(bad)  
  28:	63 2b                	movslq (%rbx),%ebp
  2a:	2b 2f                	sub    (%rdi),%ebp
  2c:	39 00                	cmp    %eax,(%rax)
  2e:	2f                   	(bad)  
  2f:	75 73                	jne    a4 <_init-0xf5c>
  31:	72 2f                	jb     62 <_init-0xf9e>
  33:	69 6e 63 6c 75 64 65 	imul   $0x6564756c,0x63(%rsi),%ebp
  3a:	2f                   	(bad)  
  3b:	63 2b                	movslq (%rbx),%ebp
  3d:	2b 2f                	sub    (%rdi),%ebp
  3f:	39 2f                	cmp    %ebp,(%rdi)
  41:	62                   	(bad)  
  42:	69 74 73 00 2f 75 73 	imul   $0x7273752f,0x0(%rbx,%rsi,2),%esi
  49:	72 
  4a:	2f                   	(bad)  
  4b:	69 6e 63 6c 75 64 65 	imul   $0x6564756c,0x63(%rsi),%ebp
  52:	2f                   	(bad)  
  53:	78 38                	js     8d <_init-0xf73>
  55:	36 5f                	ss pop %rdi
  57:	36 34 2d             	ss xor $0x2d,%al
  5a:	6c                   	insb   (%dx),%es:(%rdi)
  5b:	69 6e 75 78 2d 67 6e 	imul   $0x6e672d78,0x75(%rsi),%ebp
  62:	75 2f                	jne    93 <_init-0xf6d>
  64:	63 2b                	movslq (%rbx),%ebp
  66:	2b 2f                	sub    (%rdi),%ebp
  68:	39 2f                	cmp    %ebp,(%rdi)
  6a:	62                   	(bad)  
  6b:	69 74 73 00 2f 75 73 	imul   $0x7273752f,0x0(%rbx,%rsi,2),%esi
  72:	72 
  73:	2f                   	(bad)  
  74:	69 6e 63 6c 75 64 65 	imul   $0x6564756c,0x63(%rsi),%ebp
  7b:	2f                   	(bad)  
  7c:	63 2b                	movslq (%rbx),%ebp
  7e:	2b 2f                	sub    (%rdi),%ebp
  80:	39 2f                	cmp    %ebp,(%rdi)
  82:	64 65 62             	fs gs (bad) 
  85:	75 67                	jne    ee <_init-0xf12>
  87:	00 2f                	add    %ch,(%rdi)
  89:	75 73                	jne    fe <_init-0xf02>
  8b:	72 2f                	jb     bc <_init-0xf44>
  8d:	69 6e 63 6c 75 64 65 	imul   $0x6564756c,0x63(%rsi),%ebp
  94:	2f                   	(bad)  
  95:	63 2b                	movslq (%rbx),%ebp
  97:	2b 2f                	sub    (%rdi),%ebp
  99:	39 2f                	cmp    %ebp,(%rdi)
  9b:	65 78 74             	gs js  112 <_init-0xeee>
  9e:	00 2f                	add    %ch,(%rdi)
  a0:	75 73                	jne    115 <_init-0xeeb>
  a2:	72 2f                	jb     d3 <_init-0xf2d>
  a4:	6c                   	insb   (%dx),%es:(%rdi)
  a5:	69 62 2f 67 63 63 2f 	imul   $0x2f636367,0x2f(%rdx),%esp
  ac:	78 38                	js     e6 <_init-0xf1a>
  ae:	36 5f                	ss pop %rdi
  b0:	36 34 2d             	ss xor $0x2d,%al
  b3:	6c                   	insb   (%dx),%es:(%rdi)
  b4:	69 6e 75 78 2d 67 6e 	imul   $0x6e672d78,0x75(%rsi),%ebp
  bb:	75 2f                	jne    ec <_init-0xf14>
  bd:	39 2f                	cmp    %ebp,(%rdi)
  bf:	69 6e 63 6c 75 64 65 	imul   $0x6564756c,0x63(%rsi),%ebp
  c6:	00 2f                	add    %ch,(%rdi)
  c8:	75 73                	jne    13d <_init-0xec3>
  ca:	72 2f                	jb     fb <_init-0xf05>
  cc:	69 6e 63 6c 75 64 65 	imul   $0x6564756c,0x63(%rsi),%ebp
  d3:	2f                   	(bad)  
  d4:	78 38                	js     10e <_init-0xef2>
  d6:	36 5f                	ss pop %rdi
  d8:	36 34 2d             	ss xor $0x2d,%al
  db:	6c                   	insb   (%dx),%es:(%rdi)
  dc:	69 6e 75 78 2d 67 6e 	imul   $0x6e672d78,0x75(%rsi),%ebp
  e3:	75 2f                	jne    114 <_init-0xeec>
  e5:	62                   	(bad)  
  e6:	69 74 73 2f 74 79 70 	imul   $0x65707974,0x2f(%rbx,%rsi,2),%esi
  ed:	65 
  ee:	73 00                	jae    f0 <_init-0xf10>
  f0:	2f                   	(bad)  
  f1:	75 73                	jne    166 <_init-0xe9a>
  f3:	72 2f                	jb     124 <_init-0xedc>
  f5:	69 6e 63 6c 75 64 65 	imul   $0x6564756c,0x63(%rsi),%ebp
  fc:	00 2f                	add    %ch,(%rdi)
  fe:	75 73                	jne    173 <_init-0xe8d>
 100:	72 2f                	jb     131 <_init-0xecf>
 102:	69 6e 63 6c 75 64 65 	imul   $0x6564756c,0x63(%rsi),%ebp
 109:	2f                   	(bad)  
 10a:	78 38                	js     144 <_init-0xebc>
 10c:	36 5f                	ss pop %rdi
 10e:	36 34 2d             	ss xor $0x2d,%al
 111:	6c                   	insb   (%dx),%es:(%rdi)
 112:	69 6e 75 78 2d 67 6e 	imul   $0x6e672d78,0x75(%rsi),%ebp
 119:	75 2f                	jne    14a <_init-0xeb6>
 11b:	62                   	(bad)  
 11c:	69 74 73 00 00 74 65 	imul   $0x73657400,0x0(%rbx,%rsi,2),%esi
 123:	73 
 124:	74 2e                	je     154 <_init-0xeac>
 126:	63 63 00             	movslq 0x0(%rbx),%esp
 129:	00 00                	add    %al,(%rax)
 12b:	00 69 6f             	add    %ch,0x6f(%rcx)
 12e:	73 74                	jae    1a4 <_init-0xe5c>
 130:	72 65                	jb     197 <_init-0xe69>
 132:	61                   	(bad)  
 133:	6d                   	insl   (%dx),%es:(%rdi)
 134:	00 01                	add    %al,(%rcx)
 136:	00 00                	add    %al,(%rax)
 138:	63 77 63             	movslq 0x63(%rdi),%esi
 13b:	68 61 72 00 01       	pushq  $0x1007261
 140:	00 00                	add    %al,(%rax)
 142:	6e                   	outsb  %ds:(%rsi),(%dx)
 143:	65 77 00             	gs ja  146 <_init-0xeba>
 146:	01 00                	add    %eax,(%rax)
 148:	00 65 78             	add    %ah,0x78(%rbp)
 14b:	63 65 70             	movslq 0x70(%rbp),%esp
 14e:	74 69                	je     1b9 <_init-0xe47>
 150:	6f                   	outsl  %ds:(%rsi),(%dx)
 151:	6e                   	outsb  %ds:(%rsi),(%dx)
 152:	5f                   	pop    %rdi
 153:	70 74                	jo     1c9 <_init-0xe37>
 155:	72 2e                	jb     185 <_init-0xe7b>
 157:	68 00 02 00 00       	pushq  $0x200
 15c:	74 79                	je     1d7 <_init-0xe29>
 15e:	70 65                	jo     1c5 <_init-0xe3b>
 160:	5f                   	pop    %rdi
 161:	74 72                	je     1d5 <_init-0xe2b>
 163:	61                   	(bad)  
 164:	69 74 73 00 01 00 00 	imul   $0x63000001,0x0(%rbx,%rsi,2),%esi
 16b:	63 
 16c:	2b 2b                	sub    (%rbx),%ebp
 16e:	63 6f 6e             	movslq 0x6e(%rdi),%ebp
 171:	66 69 67 2e 68 00    	imul   $0x68,0x2e(%rdi),%sp
 177:	03 00                	add    (%rax),%eax
 179:	00 63 70             	add    %ah,0x70(%rbx)
 17c:	70 5f                	jo     1dd <_init-0xe23>
 17e:	74 79                	je     1f9 <_init-0xe07>
 180:	70 65                	jo     1e7 <_init-0xe19>
 182:	5f                   	pop    %rdi
 183:	74 72                	je     1f7 <_init-0xe09>
 185:	61                   	(bad)  
 186:	69 74 73 2e 68 00 02 	imul   $0x20068,0x2e(%rbx,%rsi,2),%esi
 18d:	00 
 18e:	00 73 74             	add    %dh,0x74(%rbx)
 191:	6c                   	insb   (%dx),%es:(%rdi)
 192:	5f                   	pop    %rdi
 193:	70 61                	jo     1f6 <_init-0xe0a>
 195:	69 72 2e 68 00 02 00 	imul   $0x20068,0x2e(%rdx),%esi
 19c:	00 64 65 62          	add    %ah,0x62(%rbp,%riz,2)
 1a0:	75 67                	jne    209 <_init-0xdf7>
 1a2:	2e 68 00 04 00 00    	cs pushq $0x400
 1a8:	63 68 61             	movslq 0x61(%rax),%ebp
 1ab:	72 5f                	jb     20c <_init-0xdf4>
 1ad:	74 72                	je     221 <_init-0xddf>
 1af:	61                   	(bad)  
 1b0:	69 74 73 2e 68 00 02 	imul   $0x20068,0x2e(%rbx,%rsi,2),%esi
 1b7:	00 
 1b8:	00 63 73             	add    %ah,0x73(%rbx)
 1bb:	74 64                	je     221 <_init-0xddf>
 1bd:	69 6e 74 00 01 00 00 	imul   $0x100,0x74(%rsi),%ebp
 1c4:	63 6c 6f 63          	movslq 0x63(%rdi,%rbp,2),%ebp
 1c8:	61                   	(bad)  
 1c9:	6c                   	insb   (%dx),%es:(%rdi)
 1ca:	65 00 01             	add    %al,%gs:(%rcx)
 1cd:	00 00                	add    %al,(%rax)
 1cf:	63 73 74             	movslq 0x74(%rbx),%esi
 1d2:	64 6c                	fs insb (%dx),%es:(%rdi)
 1d4:	69 62 00 01 00 00 63 	imul   $0x63000001,0x0(%rdx),%esp
 1db:	73 74                	jae    251 <_init-0xdaf>
 1dd:	64 69 6f 00 01 00 00 	imul   $0x62000001,%fs:0x0(%rdi),%ebp
 1e4:	62 
 1e5:	61                   	(bad)  
 1e6:	73 69                	jae    251 <_init-0xdaf>
 1e8:	63 5f 73             	movslq 0x73(%rdi),%ebx
 1eb:	74 72                	je     25f <_init-0xda1>
 1ed:	69 6e 67 2e 68 00 02 	imul   $0x200682e,0x67(%rsi),%ebp
 1f4:	00 00                	add    %al,(%rax)
 1f6:	73 79                	jae    271 <_init-0xd8f>
 1f8:	73 74                	jae    26e <_init-0xd92>
 1fa:	65 6d                	gs insl (%dx),%es:(%rdi)
 1fc:	5f                   	pop    %rdi
 1fd:	65 72 72             	gs jb  272 <_init-0xd8e>
 200:	6f                   	outsl  %ds:(%rsi),(%dx)
 201:	72 00                	jb     203 <_init-0xdfd>
 203:	01 00                	add    %eax,(%rax)
 205:	00 69 6f             	add    %ch,0x6f(%rcx)
 208:	73 5f                	jae    269 <_init-0xd97>
 20a:	62 61                	(bad)  
 20c:	73 65                	jae    273 <_init-0xd8d>
 20e:	2e 68 00 02 00 00    	cs pushq $0x200
 214:	63 77 63             	movslq 0x63(%rdi),%esi
 217:	74 79                	je     292 <_init-0xd6e>
 219:	70 65                	jo     280 <_init-0xd80>
 21b:	00 01                	add    %al,(%rcx)
 21d:	00 00                	add    %al,(%rax)
 21f:	69 6f 73 66 77 64 00 	imul   $0x647766,0x73(%rdi),%ebp
 226:	01 00                	add    %eax,(%rax)
 228:	00 73 74             	add    %dh,0x74(%rbx)
 22b:	64 5f                	fs pop %rdi
 22d:	61                   	(bad)  
 22e:	62 73 2e 68 00       	(bad)
 233:	02 00                	add    (%rax),%al
 235:	00 70 72             	add    %dh,0x72(%rax)
 238:	65 64 65 66 69 6e 65 	gs fs imul $0x5f64,%gs:0x65(%rsi),%bp
 23f:	64 5f 
 241:	6f                   	outsl  %ds:(%rsi),(%dx)
 242:	70 73                	jo     2b7 <_init-0xd49>
 244:	2e 68 00 02 00 00    	cs pushq $0x200
 24a:	6e                   	outsb  %ds:(%rsi),(%dx)
 24b:	65 77 5f             	gs ja  2ad <_init-0xd53>
 24e:	61                   	(bad)  
 24f:	6c                   	insb   (%dx),%es:(%rdi)
 250:	6c                   	insb   (%dx),%es:(%rdi)
 251:	6f                   	outsl  %ds:(%rsi),(%dx)
 252:	63 61 74             	movslq 0x74(%rcx),%esp
 255:	6f                   	outsl  %ds:(%rsi),(%dx)
 256:	72 2e                	jb     286 <_init-0xd7a>
 258:	68 00 05 00 00       	pushq  $0x500
 25d:	6e                   	outsb  %ds:(%rsi),(%dx)
 25e:	75 6d                	jne    2cd <_init-0xd33>
 260:	65 72 69             	gs jb  2cc <_init-0xd34>
 263:	63 5f 74             	movslq 0x74(%rdi),%ebx
 266:	72 61                	jb     2c9 <_init-0xd37>
 268:	69 74 73 2e 68 00 05 	imul   $0x50068,0x2e(%rbx,%rsi,2),%esi
 26f:	00 
 270:	00 73 74             	add    %dh,0x74(%rbx)
 273:	64 64 65 66 2e 68 00 	fs fs gs cs pushw $0x600
 27a:	06 
 27b:	00 00                	add    %al,(%rax)
 27d:	3c 62                	cmp    $0x62,%al
 27f:	75 69                	jne    2ea <_init-0xd16>
 281:	6c                   	insb   (%dx),%es:(%rdi)
 282:	74 2d                	je     2b1 <_init-0xd4f>
 284:	69 6e 3e 00 00 00 00 	imul   $0x0,0x3e(%rsi),%ebp
 28b:	77 69                	ja     2f6 <_init-0xd0a>
 28d:	6e                   	outsb  %ds:(%rsi),(%dx)
 28e:	74 5f                	je     2ef <_init-0xd11>
 290:	74 2e                	je     2c0 <_init-0xd40>
 292:	68 00 07 00 00       	pushq  $0x700
 297:	5f                   	pop    %rdi
 298:	5f                   	pop    %rdi
 299:	6d                   	insl   (%dx),%es:(%rdi)
 29a:	62 73 74 61 74       	(bad)
 29f:	65 5f                	gs pop %rdi
 2a1:	74 2e                	je     2d1 <_init-0xd2f>
 2a3:	68 00 07 00 00       	pushq  $0x700
 2a8:	6d                   	insl   (%dx),%es:(%rdi)
 2a9:	62 73 74 61 74       	(bad)
 2ae:	65 5f                	gs pop %rdi
 2b0:	74 2e                	je     2e0 <_init-0xd20>
 2b2:	68 00 07 00 00       	pushq  $0x700
 2b7:	5f                   	pop    %rdi
 2b8:	5f                   	pop    %rdi
 2b9:	46                   	rex.RX
 2ba:	49                   	rex.WB
 2bb:	4c                   	rex.WR
 2bc:	45                   	rex.RB
 2bd:	2e 68 00 07 00 00    	cs pushq $0x700
 2c3:	73 74                	jae    339 <_init-0xcc7>
 2c5:	72 75                	jb     33c <_init-0xcc4>
 2c7:	63 74 5f 46          	movslq 0x46(%rdi,%rbx,2),%esi
 2cb:	49                   	rex.WB
 2cc:	4c                   	rex.WR
 2cd:	45                   	rex.RB
 2ce:	2e 68 00 07 00 00    	cs pushq $0x700
 2d4:	46                   	rex.RX
 2d5:	49                   	rex.WB
 2d6:	4c                   	rex.WR
 2d7:	45                   	rex.RB
 2d8:	2e 68 00 07 00 00    	cs pushq $0x700
 2de:	77 63                	ja     343 <_init-0xcbd>
 2e0:	68 61 72 2e 68       	pushq  $0x682e7261
 2e5:	00 08                	add    %cl,(%rax)
 2e7:	00 00                	add    %al,(%rax)
 2e9:	73 74                	jae    35f <_init-0xca1>
 2eb:	72 75                	jb     362 <_init-0xc9e>
 2ed:	63 74 5f 74          	movslq 0x74(%rdi,%rbx,2),%esi
 2f1:	6d                   	insl   (%dx),%es:(%rdi)
 2f2:	2e 68 00 07 00 00    	cs pushq $0x700
 2f8:	74 79                	je     373 <_init-0xc8d>
 2fa:	70 65                	jo     361 <_init-0xc9f>
 2fc:	73 2e                	jae    32c <_init-0xcd4>
 2fe:	68 00 09 00 00       	pushq  $0x900
 303:	73 74                	jae    379 <_init-0xc87>
 305:	64 69 6e 74 2d 69 6e 	imul   $0x746e692d,%fs:0x74(%rsi),%ebp
 30c:	74 
 30d:	6e                   	outsb  %ds:(%rsi),(%dx)
 30e:	2e 68 00 09 00 00    	cs pushq $0x900
 314:	73 74                	jae    38a <_init-0xc76>
 316:	64 69 6e 74 2d 75 69 	imul   $0x6e69752d,%fs:0x74(%rsi),%ebp
 31d:	6e 
 31e:	74 6e                	je     38e <_init-0xc72>
 320:	2e 68 00 09 00 00    	cs pushq $0x900
 326:	73 74                	jae    39c <_init-0xc64>
 328:	64 69 6e 74 2e 68 00 	imul   $0x800682e,%fs:0x74(%rsi),%ebp
 32f:	08 
 330:	00 00                	add    %al,(%rax)
 332:	6c                   	insb   (%dx),%es:(%rdi)
 333:	6f                   	outsl  %ds:(%rsi),(%dx)
 334:	63 61 6c             	movslq 0x6c(%rcx),%esp
 337:	65 2e 68 00 08 00 00 	gs cs pushq $0x800
 33e:	74 69                	je     3a9 <_init-0xc57>
 340:	6d                   	insl   (%dx),%es:(%rdi)
 341:	65 2e 68 00 08 00 00 	gs cs pushq $0x800
 348:	74 68                	je     3b2 <_init-0xc4e>
 34a:	72 65                	jb     3b1 <_init-0xc4f>
 34c:	61                   	(bad)  
 34d:	64 2d 73 68 61 72    	fs sub $0x72616873,%eax
 353:	65 64 2d 74 79 70 65 	gs fs sub $0x65707974,%eax
 35a:	73 2e                	jae    38a <_init-0xc76>
 35c:	68 00 09 00 00       	pushq  $0x900
 361:	73 74                	jae    3d7 <_init-0xc29>
 363:	72 75                	jb     3da <_init-0xc26>
 365:	63 74 5f 6d          	movslq 0x6d(%rdi,%rbx,2),%esi
 369:	75 74                	jne    3df <_init-0xc21>
 36b:	65 78 2e             	gs js  39c <_init-0xc64>
 36e:	68 00 09 00 00       	pushq  $0x900
 373:	70 74                	jo     3e9 <_init-0xc17>
 375:	68 72 65 61 64       	pushq  $0x64616572
 37a:	74 79                	je     3f5 <_init-0xc0b>
 37c:	70 65                	jo     3e3 <_init-0xc1d>
 37e:	73 2e                	jae    3ae <_init-0xc52>
 380:	68 00 09 00 00       	pushq  $0x900
 385:	61                   	(bad)  
 386:	74 6f                	je     3f7 <_init-0xc09>
 388:	6d                   	insl   (%dx),%es:(%rdi)
 389:	69 63 5f 77 6f 72 64 	imul   $0x64726f77,0x5f(%rbx),%esp
 390:	2e 68 00 03 00 00    	cs pushq $0x300
 396:	73 74                	jae    40c <_init-0xbf4>
 398:	64 6c                	fs insb (%dx),%es:(%rdi)
 39a:	69 62 2e 68 00 08 00 	imul   $0x80068,0x2e(%rdx),%esp
 3a1:	00 5f 5f             	add    %bl,0x5f(%rdi)
 3a4:	66 70 6f             	data16 jo 416 <_init-0xbea>
 3a7:	73 5f                	jae    408 <_init-0xbf8>
 3a9:	74 2e                	je     3d9 <_init-0xc27>
 3ab:	68 00 07 00 00       	pushq  $0x700
 3b0:	73 74                	jae    426 <_init-0xbda>
 3b2:	64 69 6f 2e 68 00 08 	imul   $0x80068,%fs:0x2e(%rdi),%ebp
 3b9:	00 
 3ba:	00 73 79             	add    %dh,0x79(%rbx)
 3bd:	73 5f                	jae    41e <_init-0xbe2>
 3bf:	65 72 72             	gs jb  434 <_init-0xbcc>
 3c2:	6c                   	insb   (%dx),%es:(%rdi)
 3c3:	69 73 74 2e 68 00 09 	imul   $0x900682e,0x74(%rbx),%esi
 3ca:	00 00                	add    %al,(%rax)
 3cc:	65 72 72             	gs jb  441 <_init-0xbbf>
 3cf:	6e                   	outsb  %ds:(%rsi),(%dx)
 3d0:	6f                   	outsl  %ds:(%rsi),(%dx)
 3d1:	2e 68 00 08 00 00    	cs pushq $0x800
 3d7:	77 63                	ja     43c <_init-0xbc4>
 3d9:	74 79                	je     454 <_init-0xbac>
 3db:	70 65                	jo     442 <_init-0xbbe>
 3dd:	2d 77 63 68 61       	sub    $0x61686377,%eax
 3e2:	72 2e                	jb     412 <_init-0xbee>
 3e4:	68 00 09 00 00       	pushq  $0x900
 3e9:	77 63                	ja     44e <_init-0xbb2>
 3eb:	74 79                	je     466 <_init-0xb9a>
 3ed:	70 65                	jo     454 <_init-0xbac>
 3ef:	2e 68 00 08 00 00    	cs pushq $0x800
 3f5:	73 74                	jae    46b <_init-0xb95>
 3f7:	64 6c                	fs insb (%dx),%es:(%rdi)
 3f9:	69 62 2e 68 00 01 00 	imul   $0x10068,0x2e(%rdx),%esp
 400:	00 75 6e             	add    %dh,0x6e(%rbp)
 403:	69 73 74 64 2e 68 00 	imul   $0x682e64,0x74(%rbx),%esi
 40a:	08 00                	or     %al,(%rax)
 40c:	00 63 6f             	add    %ah,0x6f(%rbx)
 40f:	6e                   	outsb  %ds:(%rsi),(%dx)
 410:	66 6e                	data16 outsb %ds:(%rsi),(%dx)
 412:	61                   	(bad)  
 413:	6d                   	insl   (%dx),%es:(%rdi)
 414:	65 2e 68 00 09 00 00 	gs cs pushq $0x900
 41b:	67 65 74 6f          	addr32 gs je 48e <_init-0xb72>
 41f:	70 74                	jo     495 <_init-0xb6b>
 421:	5f                   	pop    %rdi
 422:	63 6f 72             	movslq 0x72(%rdi),%ebp
 425:	65 2e 68 00 09 00 00 	gs cs pushq $0x900
 42c:	00 05 01 00 09 02    	add    %al,0x2090001(%rip)        # 2090433 <_end+0x208c26b>
 432:	c9                   	leaveq 
 433:	12 00                	adc    (%rax),%al
 435:	00 00                	add    %al,(%rax)
 437:	00 00                	add    %al,(%rax)
 439:	00 03                	add    %al,(%rbx)
 43b:	0d 01 05 10 83       	or     $0x83100501,%eax
 440:	05 26 08 58 05       	add    $0x5580826,%eax
 445:	01 08                	add    %ecx,(%rax)
 447:	21 3f                	and    %edi,(%rdi)
 449:	05 15 f3 05 06       	add    $0x605f315,%eax
 44e:	bb 05 17 59 05       	mov    $0x5591705,%ebx
 453:	08 bb 05 17 9f 05    	or     %bh,0x59f1705(%rbx)
 459:	0a bb 05 01 59 31    	or     0x31590105(%rbx),%bh
 45f:	c8 05 17 e5          	enterq $0x1705,$0xe5
 463:	05 0c 08 5a 05       	add    $0x55a080c,%eax
 468:	15 00 02 04 01       	adc    $0x1040200,%eax
 46d:	74 05                	je     474 <_init-0xb8c>
 46f:	1d 67 05 05 02       	sbb    $0x2050567,%eax
 474:	2d 13 05 3f 68       	sub    $0x683f0513,%eax
 479:	05 3b 08 58 05       	add    $0x558083b,%eax
 47e:	3f                   	(bad)  
 47f:	9e                   	sahf   
 480:	05 0e ad 05 03       	add    $0x305ad0e,%eax
 485:	00 02                	add    %al,(%rdx)
 487:	04 02                	add    $0x2,%al
 489:	53                   	push   %rbx
 48a:	05 0c 03 09 66       	add    $0x6609030c,%eax
 48f:	05 15 00 02 04       	add    $0x4020015,%eax
 494:	01 74 05 11          	add    %esi,0x11(%rbp,%rax,1)
 498:	67 05 03 08 65 05    	addr32 add $0x5650803,%eax
 49e:	0a 6a 05             	or     0x5(%rdx),%ch
 4a1:	01 00                	add    %eax,(%rax)
 4a3:	02 04 01             	add    (%rcx,%rax,1),%al
 4a6:	59                   	pop    %rcx
 4a7:	06                   	(bad)  
 4a8:	e4 06                	in     $0x6,%al
 4aa:	ba 08 20 00 02       	mov    $0x2002008,%edx
 4af:	04 01                	add    $0x1,%al
 4b1:	06                   	(bad)  
 4b2:	66 04 02             	data16 add $0x2,%al
 4b5:	05 19 06 03 1c       	add    $0x1c030619,%eax
 4ba:	90                   	nop
 4bb:	04 01                	add    $0x1,%al
 4bd:	05 01 03 64 02       	add    $0x2640301,%eax
 4c2:	29 01                	sub    %eax,(%rcx)
 4c4:	3c 82                	cmp    $0x82,%al
 4c6:	08 00                	or     %al,(%rax)
 4c8:	01 01                	add    %eax,(%rcx)

Disassembly of section .debug_str:

0000000000000000 <.debug_str>:
       0:	69 6e 74 5f 70 5f 73 	imul   $0x735f705f,0x74(%rsi),%ebp
       7:	65 70 5f             	gs jo  69 <_init-0xf97>
       a:	62                   	(bad)  
       b:	79 5f                	jns    6c <_init-0xf94>
       d:	73 70                	jae    7f <_init-0xf81>
       f:	61                   	(bad)  
      10:	63 65 00             	movslq 0x0(%rbp),%esp
      13:	5f                   	pop    %rdi
      14:	5a                   	pop    %rdx
      15:	53                   	push   %rbx
      16:	74 33                	je     4b <_init-0xfb5>
      18:	61                   	(bad)  
      19:	62 73 64 00 5f       	(bad)
      1e:	5a                   	pop    %rdx
      1f:	53                   	push   %rbx
      20:	74 33                	je     55 <_init-0xfab>
      22:	61                   	(bad)  
      23:	62 73 65 00 5f       	(bad)
      28:	5a                   	pop    %rdx
      29:	53                   	push   %rbx
      2a:	74 33                	je     5f <_init-0xfa1>
      2c:	61                   	(bad)  
      2d:	62 73 66 00 5f       	(bad)
      32:	5a                   	pop    %rdx
      33:	53                   	push   %rbx
      34:	74 33                	je     69 <_init-0xf97>
      36:	61                   	(bad)  
      37:	62 73 67 00 5f       	(bad)
      3c:	53                   	push   %rbx
      3d:	43 5f                	rex.XB pop %r15
      3f:	4c                   	rex.WR
      40:	45 56                	rex.RB push %r14
      42:	45                   	rex.RB
      43:	4c 33 5f 43          	xor    0x43(%rdi),%r11
      47:	41                   	rex.B
      48:	43                   	rex.XB
      49:	48                   	rex.W
      4a:	45 5f                	rex.RB pop %r15
      4c:	53                   	push   %rbx
      4d:	49 5a                	rex.WB pop %r10
      4f:	45 00 5f 5a          	add    %r11b,0x5a(%r15)
      53:	53                   	push   %rbx
      54:	74 33                	je     89 <_init-0xf77>
      56:	61                   	(bad)  
      57:	62 73 6c 00 5f       	(bad)
      5c:	5a                   	pop    %rdx
      5d:	53                   	push   %rbx
      5e:	74 33                	je     93 <_init-0xf6d>
      60:	61                   	(bad)  
      61:	62 73 6e 00 5f       	(bad)
      66:	53                   	push   %rbx
      67:	43 5f                	rex.XB pop %r15
      69:	49                   	rex.WB
      6a:	4e 54                	rex.WRX push %rsp
      6c:	5f                   	pop    %rdi
      6d:	4d                   	rex.WRB
      6e:	41 58                	pop    %r8
      70:	00 73 69             	add    %dh,0x69(%rbx)
      73:	7a 65                	jp     da <_init-0xf26>
      75:	5f                   	pop    %rdi
      76:	74 00                	je     78 <_init-0xf88>
      78:	66 67 65 74 73       	data16 addr32 gs je f0 <_init-0xf10>
      7d:	00 5f 53             	add    %bl,0x53(%rdi)
      80:	43 5f                	rex.XB pop %r15
      82:	4d                   	rex.WRB
      83:	41 50                	push   %r8
      85:	50                   	push   %rax
      86:	45                   	rex.RB
      87:	44 5f                	rex.R pop %rdi
      89:	46                   	rex.RX
      8a:	49                   	rex.WB
      8b:	4c                   	rex.WR
      8c:	45 53                	rex.RB push %r11
      8e:	00 74 6d 5f          	add    %dh,0x5f(%rbp,%rbp,2)
      92:	68 6f 75 72 00       	pushq  $0x72756f
      97:	5f                   	pop    %rdi
      98:	5f                   	pop    %rdi
      99:	76 61                	jbe    fc <_init-0xf04>
      9b:	6c                   	insb   (%dx),%es:(%rdi)
      9c:	75 65                	jne    103 <_init-0xefd>
      9e:	00 5f 5f             	add    %bl,0x5f(%rdi)
      a1:	69 73 5f 69 6e 74 65 	imul   $0x65746e69,0x5f(%rbx),%esi
      a8:	67 65 72 3c          	addr32 gs jb e8 <_init-0xf18>
      ac:	66 6c                	data16 insb (%dx),%es:(%rdi)
      ae:	6f                   	outsl  %ds:(%rsi),(%dx)
      af:	61                   	(bad)  
      b0:	74 3e                	je     f0 <_init-0xf10>
      b2:	00 5f 5f             	add    %bl,0x5f(%rdi)
      b5:	6b 69 6e 64          	imul   $0x64,0x6e(%rcx),%ebp
      b9:	00 5f 53             	add    %bl,0x53(%rdi)
      bc:	43 5f                	rex.XB pop %r15
      be:	43                   	rex.XB
      bf:	4c                   	rex.WR
      c0:	4b 5f                	rex.WXB pop %r15
      c2:	54                   	push   %rsp
      c3:	43                   	rex.XB
      c4:	4b 00 5f 5f          	rex.WXB add %bl,0x5f(%r15)
      c8:	6e                   	outsb  %ds:(%rsi),(%dx)
      c9:	75 6d                	jne    138 <_init-0xec8>
      cb:	65 72 69             	gs jb  137 <_init-0xec9>
      ce:	63 5f 74             	movslq 0x74(%rdi),%ebx
      d1:	72 61                	jb     134 <_init-0xecc>
      d3:	69 74 73 5f 69 6e 74 	imul   $0x65746e69,0x5f(%rbx,%rsi,2),%esi
      da:	65 
      db:	67 65 72 3c          	addr32 gs jb 11b <_init-0xee5>
      df:	69 6e 74 3e 00 5f 53 	imul   $0x535f003e,0x74(%rsi),%ebp
      e6:	43 5f                	rex.XB pop %r15
      e8:	53                   	push   %rbx
      e9:	49                   	rex.WB
      ea:	47 51                	rex.RXB push %r9
      ec:	55                   	push   %rbp
      ed:	45 55                	rex.RB push %r13
      ef:	45 5f                	rex.RB pop %r15
      f1:	4d                   	rex.WRB
      f2:	41 58                	pop    %r8
      f4:	00 5f 49             	add    %bl,0x49(%rdi)
      f7:	4f 5f                	rex.WRXB pop %r15
      f9:	63 6f 64             	movslq 0x64(%rdi),%ebp
      fc:	65 63 76 74          	movslq %gs:0x74(%rsi),%esi
     100:	00 5f 53             	add    %bl,0x53(%rdi)
     103:	43 5f                	rex.XB pop %r15
     105:	54                   	push   %rsp
     106:	48 52                	rex.W push %rdx
     108:	45                   	rex.RB
     109:	41                   	rex.B
     10a:	44 5f                	rex.R pop %rdi
     10c:	52                   	push   %rdx
     10d:	4f                   	rex.WRXB
     10e:	42 55                	rex.X push %rbp
     110:	53                   	push   %rbx
     111:	54                   	push   %rsp
     112:	5f                   	pop    %rdi
     113:	50                   	push   %rax
     114:	52                   	push   %rdx
     115:	49                   	rex.WB
     116:	4f 5f                	rex.WRXB pop %r15
     118:	49                   	rex.WB
     119:	4e                   	rex.WRX
     11a:	48                   	rex.W
     11b:	45 52                	rex.RB push %r10
     11d:	49 54                	rex.WB push %r12
     11f:	00 5f 5a             	add    %bl,0x5a(%rdi)
     122:	4e 39 5f 5f          	rex.WRX cmp %r11,0x5f(%rdi)
     126:	67 6e                	outsb  %ds:(%esi),(%dx)
     128:	75 5f                	jne    189 <_init-0xe77>
     12a:	63 78 78             	movslq 0x78(%rax),%edi
     12d:	32 34 5f             	xor    (%rdi,%rbx,2),%dh
     130:	5f                   	pop    %rdi
     131:	6e                   	outsb  %ds:(%rsi),(%dx)
     132:	75 6d                	jne    1a1 <_init-0xe5f>
     134:	65 72 69             	gs jb  1a0 <_init-0xe60>
     137:	63 5f 74             	movslq 0x74(%rdi),%ebx
     13a:	72 61                	jb     19d <_init-0xe63>
     13c:	69 74 73 5f 69 6e 74 	imul   $0x65746e69,0x5f(%rbx,%rsi,2),%esi
     143:	65 
     144:	67 65 72 49          	addr32 gs jb 191 <_init-0xe6f>
     148:	69 45 35 5f 5f 6d 61 	imul   $0x616d5f5f,0x35(%rbp),%eax
     14f:	78 45                	js     196 <_init-0xe6a>
     151:	00 5f 53             	add    %bl,0x53(%rdi)
     154:	43 5f                	rex.XB pop %r15
     156:	44                   	rex.R
     157:	45 56                	rex.RB push %r14
     159:	49                   	rex.WB
     15a:	43                   	rex.XB
     15b:	45 5f                	rex.RB pop %r15
     15d:	49                   	rex.WB
     15e:	4f 00 75 69          	rex.WRXB add %r14b,0x69(%r13)
     162:	6e                   	outsb  %ds:(%rsi),(%dx)
     163:	74 5f                	je     1c4 <_init-0xe3c>
     165:	66 61                	data16 (bad) 
     167:	73 74                	jae    1dd <_init-0xe23>
     169:	36 34 5f             	ss xor $0x5f,%al
     16c:	74 00                	je     16e <_init-0xe92>
     16e:	5f                   	pop    %rdi
     16f:	5f                   	pop    %rdi
     170:	75 69                	jne    1db <_init-0xe25>
     172:	6e                   	outsb  %ds:(%rsi),(%dx)
     173:	74 5f                	je     1d4 <_init-0xe2c>
     175:	6c                   	insb   (%dx),%es:(%rdi)
     176:	65 61                	gs (bad) 
     178:	73 74                	jae    1ee <_init-0xe12>
     17a:	38 5f 74             	cmp    %bl,0x74(%rdi)
     17d:	00 5f 5f             	add    %bl,0x5f(%rdi)
     180:	70 74                	jo     1f6 <_init-0xe0a>
     182:	68 72 65 61 64       	pushq  $0x64616572
     187:	5f                   	pop    %rdi
     188:	6c                   	insb   (%dx),%es:(%rdi)
     189:	69 73 74 5f 74 00 5f 	imul   $0x5f00745f,0x74(%rbx),%esi
     190:	49                   	rex.WB
     191:	4f 5f                	rex.WRXB pop %r15
     193:	73 61                	jae    1f6 <_init-0xe0a>
     195:	76 65                	jbe    1fc <_init-0xe04>
     197:	5f                   	pop    %rdi
     198:	65 6e                	outsb  %gs:(%rsi),(%dx)
     19a:	64 00 5f 53          	add    %bl,%fs:0x53(%rdi)
     19e:	43 5f                	rex.XB pop %r15
     1a0:	4c                   	rex.WR
     1a1:	45 56                	rex.RB push %r14
     1a3:	45                   	rex.RB
     1a4:	4c 34 5f             	rex.WR xor $0x5f,%al
     1a7:	43                   	rex.XB
     1a8:	41                   	rex.B
     1a9:	43                   	rex.XB
     1aa:	48                   	rex.W
     1ab:	45 5f                	rex.RB pop %r15
     1ad:	41 53                	push   %r11
     1af:	53                   	push   %rbx
     1b0:	4f                   	rex.WRXB
     1b1:	43 00 5f 53          	rex.XB add %bl,0x53(%r15)
     1b5:	43 5f                	rex.XB pop %r15
     1b7:	4a                   	rex.WX
     1b8:	4f                   	rex.WRXB
     1b9:	42 5f                	rex.X pop %rdi
     1bb:	43                   	rex.XB
     1bc:	4f                   	rex.WRXB
     1bd:	4e 54                	rex.WRX push %rsp
     1bf:	52                   	push   %rdx
     1c0:	4f                   	rex.WRXB
     1c1:	4c 00 5f 53          	rex.WR add %r11b,0x53(%rdi)
     1c5:	43 5f                	rex.XB pop %r15
     1c7:	56                   	push   %rsi
     1c8:	36 5f                	ss pop %rdi
     1ca:	4c 50                	rex.WR push %rax
     1cc:	36 34 5f             	ss xor $0x5f,%al
     1cf:	4f                   	rex.WRXB
     1d0:	46                   	rex.RX
     1d1:	46                   	rex.RX
     1d2:	36 34 00             	ss xor $0x0,%al
     1d5:	6c                   	insb   (%dx),%es:(%rdi)
     1d6:	6c                   	insb   (%dx),%es:(%rdi)
     1d7:	64 69 76 00 5f 5a 4e 	imul   $0x394e5a5f,%fs:0x0(%rsi),%esi
     1de:	39 
     1df:	5f                   	pop    %rdi
     1e0:	5f                   	pop    %rdi
     1e1:	67 6e                	outsb  %ds:(%esi),(%dx)
     1e3:	75 5f                	jne    244 <_init-0xdbc>
     1e5:	63 78 78             	movslq 0x78(%rax),%edi
     1e8:	32 34 5f             	xor    (%rdi,%rbx,2),%dh
     1eb:	5f                   	pop    %rdi
     1ec:	6e                   	outsb  %ds:(%rsi),(%dx)
     1ed:	75 6d                	jne    25c <_init-0xda4>
     1ef:	65 72 69             	gs jb  25b <_init-0xda5>
     1f2:	63 5f 74             	movslq 0x74(%rdi),%ebx
     1f5:	72 61                	jb     258 <_init-0xda8>
     1f7:	69 74 73 5f 69 6e 74 	imul   $0x65746e69,0x5f(%rbx,%rsi,2),%esi
     1fe:	65 
     1ff:	67 65 72 49          	addr32 gs jb 24c <_init-0xdb4>
     203:	69 45 31 31 5f 5f 69 	imul   $0x695f5f31,0x31(%rbp),%eax
     20a:	73 5f                	jae    26b <_init-0xd95>
     20c:	73 69                	jae    277 <_init-0xd89>
     20e:	67 6e                	outsb  %ds:(%esi),(%dx)
     210:	65 64 45 00 77 63    	gs add %r14b,%fs:0x63(%r15)
     216:	73 63                	jae    27b <_init-0xd85>
     218:	73 70                	jae    28a <_init-0xd76>
     21a:	6e                   	outsb  %ds:(%rsi),(%dx)
     21b:	00 5f 53             	add    %bl,0x53(%rdi)
     21e:	43 5f                	rex.XB pop %r15
     220:	43                   	rex.XB
     221:	48                   	rex.W
     222:	41 52                	push   %r10
     224:	5f                   	pop    %rdi
     225:	4d                   	rex.WRB
     226:	41 58                	pop    %r8
     228:	00 6c 6f 63          	add    %ch,0x63(%rdi,%rbp,2)
     22c:	61                   	(bad)  
     22d:	6c                   	insb   (%dx),%es:(%rdi)
     22e:	65 63 6f 6e          	movslq %gs:0x6e(%rdi),%ebp
     232:	76 00                	jbe    234 <_init-0xdcc>
     234:	5f                   	pop    %rdi
     235:	4d 5f                	rex.WRB pop %r15
     237:	61                   	(bad)  
     238:	64 64 72 65          	fs fs jb 2a1 <_init-0xd5f>
     23c:	66 00 5f 4d          	data16 add %bl,0x4d(%rdi)
     240:	5f                   	pop    %rdi
     241:	67 65 74 00          	addr32 gs je 245 <_init-0xdbb>
     245:	73 74                	jae    2bb <_init-0xd45>
     247:	72 74                	jb     2bd <_init-0xd43>
     249:	6f                   	outsl  %ds:(%rsi),(%dx)
     24a:	6c                   	insb   (%dx),%es:(%rdi)
     24b:	64 00 5f 53          	add    %bl,%fs:0x53(%rdi)
     24f:	43 5f                	rex.XB pop %r15
     251:	54                   	push   %rsp
     252:	52                   	push   %rdx
     253:	41                   	rex.B
     254:	43                   	rex.XB
     255:	45 5f                	rex.RB pop %r15
     257:	49                   	rex.WB
     258:	4e                   	rex.WRX
     259:	48                   	rex.W
     25a:	45 52                	rex.RB push %r10
     25c:	49 54                	rex.WB push %r12
     25e:	00 73 74             	add    %dh,0x74(%rbx)
     261:	72 74                	jb     2d7 <_init-0xd29>
     263:	6f                   	outsl  %ds:(%rsi),(%dx)
     264:	6c                   	insb   (%dx),%es:(%rdi)
     265:	6c                   	insb   (%dx),%es:(%rdi)
     266:	00 5f 5a             	add    %bl,0x5a(%rdi)
     269:	4e 53                	rex.WRX push %rbx
     26b:	74 38                	je     2a5 <_init-0xd5b>
     26d:	69 6f 73 5f 62 61 73 	imul   $0x7361625f,0x73(%rdi),%ebp
     274:	65 34 49             	gs xor $0x49,%al
     277:	6e                   	outsb  %ds:(%rsi),(%dx)
     278:	69 74 43 34 45 52 4b 	imul   $0x534b5245,0x34(%rbx,%rax,2),%esi
     27f:	53 
     280:	30 5f 00             	xor    %bl,0x0(%rdi)
     283:	5f                   	pop    %rdi
     284:	5f                   	pop    %rdi
     285:	6e                   	outsb  %ds:(%rsi),(%dx)
     286:	65 78 74             	gs js  2fd <_init-0xd03>
     289:	00 5f 53             	add    %bl,0x53(%rdi)
     28c:	43 5f                	rex.XB pop %r15
     28e:	58                   	pop    %rax
     28f:	4f 50                	rex.WRXB push %r8
     291:	45                   	rex.RB
     292:	4e 5f                	rex.WRX pop %rdi
     294:	56                   	push   %rsi
     295:	45 52                	rex.RB push %r10
     297:	53                   	push   %rbx
     298:	49                   	rex.WB
     299:	4f                   	rex.WRXB
     29a:	4e 00 5f 49          	rex.WRX add %r11b,0x49(%rdi)
     29e:	4f 5f                	rex.WRXB pop %r15
     2a0:	77 72                	ja     314 <_init-0xcec>
     2a2:	69 74 65 5f 62 61 73 	imul   $0x65736162,0x5f(%rbp,%riz,2),%esi
     2a9:	65 
     2aa:	00 6f 70             	add    %ch,0x70(%rdi)
     2ad:	74 65                	je     314 <_init-0xcec>
     2af:	72 72                	jb     323 <_init-0xcdd>
     2b1:	00 74 6d 70          	add    %dh,0x70(%rbp,%rbp,2)
     2b5:	6e                   	outsb  %ds:(%rsi),(%dx)
     2b6:	61                   	(bad)  
     2b7:	6d                   	insl   (%dx),%es:(%rdi)
     2b8:	00 5f 5f             	add    %bl,0x5f(%rdi)
     2bb:	70 72                	jo     32f <_init-0xcd1>
     2bd:	65 76 00             	gs jbe 2c0 <_init-0xd40>
     2c0:	5f                   	pop    %rdi
     2c1:	53                   	push   %rbx
     2c2:	43 5f                	rex.XB pop %r15
     2c4:	50                   	push   %rax
     2c5:	49                   	rex.WB
     2c6:	49 5f                	rex.WB pop %r15
     2c8:	53                   	push   %rbx
     2c9:	4f                   	rex.WRXB
     2ca:	43                   	rex.XB
     2cb:	4b                   	rex.WXB
     2cc:	45 54                	rex.RB push %r12
     2ce:	00 5f 53             	add    %bl,0x53(%rdi)
     2d1:	43 5f                	rex.XB pop %r15
     2d3:	42                   	rex.X
     2d4:	41 52                	push   %r10
     2d6:	52                   	push   %rdx
     2d7:	49                   	rex.WB
     2d8:	45 52                	rex.RB push %r10
     2da:	53                   	push   %rbx
     2db:	00 61 74             	add    %ah,0x74(%rcx)
     2de:	5f                   	pop    %rdi
     2df:	71 75                	jno    356 <_init-0xcaa>
     2e1:	69 63 6b 5f 65 78 69 	imul   $0x6978655f,0x6b(%rbx),%esp
     2e8:	74 00                	je     2ea <_init-0xd16>
     2ea:	69 6e 74 5f 63 75 72 	imul   $0x7275635f,0x74(%rsi),%ebp
     2f1:	72 5f                	jb     352 <_init-0xcae>
     2f3:	73 79                	jae    36e <_init-0xc92>
     2f5:	6d                   	insl   (%dx),%es:(%rdi)
     2f6:	62                   	(bad)  
     2f7:	6f                   	outsl  %ds:(%rsi),(%dx)
     2f8:	6c                   	insb   (%dx),%es:(%rdi)
     2f9:	00 5f 53             	add    %bl,0x53(%rdi)
     2fc:	43 5f                	rex.XB pop %r15
     2fe:	53                   	push   %rbx
     2ff:	41 56                	push   %r14
     301:	45                   	rex.RB
     302:	44 5f                	rex.R pop %rdi
     304:	49                   	rex.WB
     305:	44 53                	rex.R push %rbx
     307:	00 77 63             	add    %dh,0x63(%rdi)
     30a:	73 63                	jae    36f <_init-0xc91>
     30c:	68 72 00 5f 53       	pushq  $0x535f0072
     311:	43 5f                	rex.XB pop %r15
     313:	53                   	push   %rbx
     314:	43                   	rex.XB
     315:	48                   	rex.W
     316:	41 52                	push   %r10
     318:	5f                   	pop    %rdi
     319:	4d                   	rex.WRB
     31a:	41 58                	pop    %r8
     31c:	00 5f 5f             	add    %bl,0x5f(%rdi)
     31f:	70 74                	jo     395 <_init-0xc6b>
     321:	68 72 65 61 64       	pushq  $0x64616572
     326:	5f                   	pop    %rdi
     327:	69 6e 74 65 72 6e 61 	imul   $0x616e7265,0x74(%rsi),%ebp
     32e:	6c                   	insb   (%dx),%es:(%rdi)
     32f:	5f                   	pop    %rdi
     330:	6c                   	insb   (%dx),%es:(%rdi)
     331:	69 73 74 00 5f 53 43 	imul   $0x43535f00,0x74(%rbx),%esi
     338:	5f                   	pop    %rdi
     339:	41 52                	push   %r10
     33b:	47 5f                	rex.RXB pop %r15
     33d:	4d                   	rex.WRB
     33e:	41 58                	pop    %r8
     340:	00 5f 5f             	add    %bl,0x5f(%rdi)
     343:	63 6f 6d             	movslq 0x6d(%rdi),%ebp
     346:	70 61                	jo     3a9 <_init-0xc57>
     348:	72 5f                	jb     3a9 <_init-0xc57>
     34a:	66 6e                	data16 outsb %ds:(%rsi),(%dx)
     34c:	5f                   	pop    %rdi
     34d:	74 00                	je     34f <_init-0xcb1>
     34f:	5f                   	pop    %rdi
     350:	5a                   	pop    %rdx
     351:	53                   	push   %rbx
     352:	74 35                	je     389 <_init-0xc77>
     354:	77 63                	ja     3b9 <_init-0xc47>
     356:	65 72 72             	gs jb  3cb <_init-0xc35>
     359:	00 5f 53             	add    %bl,0x53(%rdi)
     35c:	43 5f                	rex.XB pop %r15
     35e:	54                   	push   %rsp
     35f:	49                   	rex.WB
     360:	4d                   	rex.WRB
     361:	45                   	rex.RB
     362:	4f 55                	rex.WRXB push %r13
     364:	54                   	push   %rsp
     365:	53                   	push   %rbx
     366:	00 5f 49             	add    %bl,0x49(%rdi)
     369:	4f 5f                	rex.WRXB pop %r15
     36b:	73 61                	jae    3ce <_init-0xc32>
     36d:	76 65                	jbe    3d4 <_init-0xc2c>
     36f:	5f                   	pop    %rdi
     370:	62 61                	(bad)  
     372:	73 65                	jae    3d9 <_init-0xc27>
     374:	00 5f 53             	add    %bl,0x53(%rdi)
     377:	43 5f                	rex.XB pop %r15
     379:	43                   	rex.XB
     37a:	48                   	rex.W
     37b:	41 52                	push   %r10
     37d:	5f                   	pop    %rdi
     37e:	42                   	rex.X
     37f:	49 54                	rex.WB push %r12
     381:	00 5f 53             	add    %bl,0x53(%rdi)
     384:	43 5f                	rex.XB pop %r15
     386:	41                   	rex.B
     387:	49                   	rex.WB
     388:	4f 5f                	rex.WRXB pop %r15
     38a:	4c                   	rex.WR
     38b:	49 53                	rex.WB push %r11
     38d:	54                   	push   %rsp
     38e:	49                   	rex.WB
     38f:	4f 5f                	rex.WRXB pop %r15
     391:	4d                   	rex.WRB
     392:	41 58                	pop    %r8
     394:	00 5f 53             	add    %bl,0x53(%rdi)
     397:	43 5f                	rex.XB pop %r15
     399:	4d                   	rex.WRB
     39a:	42 5f                	rex.X pop %rdi
     39c:	4c                   	rex.WR
     39d:	45                   	rex.RB
     39e:	4e 5f                	rex.WRX pop %rdi
     3a0:	4d                   	rex.WRB
     3a1:	41 58                	pop    %r8
     3a3:	00 5f 53             	add    %bl,0x53(%rdi)
     3a6:	43 5f                	rex.XB pop %r15
     3a8:	54                   	push   %rsp
     3a9:	48 52                	rex.W push %rdx
     3ab:	45                   	rex.RB
     3ac:	41                   	rex.B
     3ad:	44 5f                	rex.R pop %rdi
     3af:	50                   	push   %rax
     3b0:	52                   	push   %rdx
     3b1:	49                   	rex.WB
     3b2:	4f 5f                	rex.WRXB pop %r15
     3b4:	50                   	push   %rax
     3b5:	52                   	push   %rdx
     3b6:	4f 54                	rex.WRXB push %r12
     3b8:	45                   	rex.RB
     3b9:	43 54                	rex.XB push %r12
     3bb:	00 61 74             	add    %ah,0x74(%rcx)
     3be:	6f                   	outsl  %ds:(%rsi),(%dx)
     3bf:	69 00 5f 53 43 5f    	imul   $0x5f43535f,(%rax),%eax
     3c5:	4d 51                	rex.WRB push %r9
     3c7:	5f                   	pop    %rdi
     3c8:	50                   	push   %rax
     3c9:	52                   	push   %rdx
     3ca:	49                   	rex.WB
     3cb:	4f 5f                	rex.WRXB pop %r15
     3cd:	4d                   	rex.WRB
     3ce:	41 58                	pop    %r8
     3d0:	00 5f 53             	add    %bl,0x53(%rdi)
     3d3:	43 5f                	rex.XB pop %r15
     3d5:	50                   	push   %rax
     3d6:	49                   	rex.WB
     3d7:	49 5f                	rex.WB pop %r15
     3d9:	49                   	rex.WB
     3da:	4e 54                	rex.WRX push %rsp
     3dc:	45 52                	rex.RB push %r10
     3de:	4e                   	rex.WRX
     3df:	45 54                	rex.RB push %r12
     3e1:	00 77 63             	add    %dh,0x63(%rdi)
     3e4:	73 78                	jae    45e <_init-0xba2>
     3e6:	66 72 6d             	data16 jb 456 <_init-0xbaa>
     3e9:	00 5f 5a             	add    %bl,0x5a(%rdi)
     3ec:	4e 53                	rex.WRX push %rbx
     3ee:	74 31                	je     421 <_init-0xbdf>
     3f0:	31 63 68             	xor    %esp,0x68(%rbx)
     3f3:	61                   	(bad)  
     3f4:	72 5f                	jb     455 <_init-0xbab>
     3f6:	74 72                	je     46a <_init-0xb96>
     3f8:	61                   	(bad)  
     3f9:	69 74 73 49 77 45 34 	imul   $0x63344577,0x49(%rbx,%rsi,2),%esi
     400:	63 
     401:	6f                   	outsl  %ds:(%rsi),(%dx)
     402:	70 79                	jo     47d <_init-0xb83>
     404:	45 50                	rex.RB push %r8
     406:	77 50                	ja     458 <_init-0xba8>
     408:	4b 77 6d             	rex.WXB ja 478 <_init-0xb88>
     40b:	00 61 74             	add    %ah,0x74(%rcx)
     40e:	6f                   	outsl  %ds:(%rsi),(%dx)
     40f:	6c                   	insb   (%dx),%es:(%rdi)
     410:	6c                   	insb   (%dx),%es:(%rdi)
     411:	00 69 6e             	add    %ch,0x6e(%rcx)
     414:	74 5f                	je     475 <_init-0xb8b>
     416:	66 72 61             	data16 jb 47a <_init-0xb86>
     419:	63 5f 64             	movslq 0x64(%rdi),%ebx
     41c:	69 67 69 74 73 00 5f 	imul   $0x5f007374,0x69(%rdi),%esp
     423:	5a                   	pop    %rdx
     424:	4e 53                	rex.WRX push %rbx
     426:	74 31                	je     459 <_init-0xba7>
     428:	35 5f 5f 65 78       	xor    $0x78655f5f,%eax
     42d:	63 65 70             	movslq 0x70(%rbp),%esp
     430:	74 69                	je     49b <_init-0xb65>
     432:	6f                   	outsl  %ds:(%rsi),(%dx)
     433:	6e                   	outsb  %ds:(%rsi),(%dx)
     434:	5f                   	pop    %rdi
     435:	70 74                	jo     4ab <_init-0xb55>
     437:	72 31                	jb     46a <_init-0xb96>
     439:	33 65 78             	xor    0x78(%rbp),%esp
     43c:	63 65 70             	movslq 0x70(%rbp),%esp
     43f:	74 69                	je     4aa <_init-0xb56>
     441:	6f                   	outsl  %ds:(%rsi),(%dx)
     442:	6e                   	outsb  %ds:(%rsi),(%dx)
     443:	5f                   	pop    %rdi
     444:	70 74                	jo     4ba <_init-0xb46>
     446:	72 43                	jb     48b <_init-0xb75>
     448:	34 45                	xor    $0x45,%al
     44a:	50                   	push   %rax
     44b:	76 00                	jbe    44d <_init-0xbb3>
     44d:	5f                   	pop    %rdi
     44e:	53                   	push   %rbx
     44f:	43 5f                	rex.XB pop %r15
     451:	4e                   	rex.WRX
     452:	4c 5f                	rex.WR pop %rdi
     454:	54                   	push   %rsp
     455:	45 58                	rex.RB pop %r8
     457:	54                   	push   %rsp
     458:	4d                   	rex.WRB
     459:	41 58                	pop    %r8
     45b:	00 73 74             	add    %dh,0x74(%rbx)
     45e:	72 69                	jb     4c9 <_init-0xb37>
     460:	6e                   	outsb  %ds:(%rsi),(%dx)
     461:	67 5f                	addr32 pop %rdi
     463:	6c                   	insb   (%dx),%es:(%rdi)
     464:	69 74 65 72 61 6c 73 	imul   $0x736c61,0x72(%rbp,%riz,2),%esi
     46b:	00 
     46c:	5f                   	pop    %rdi
     46d:	5a                   	pop    %rdx
     46e:	4e 39 5f 5f          	rex.WRX cmp %r11,0x5f(%rdi)
     472:	67 6e                	outsb  %ds:(%esi),(%dx)
     474:	75 5f                	jne    4d5 <_init-0xb2b>
     476:	63 78 78             	movslq 0x78(%rax),%edi
     479:	32 34 5f             	xor    (%rdi,%rbx,2),%dh
     47c:	5f                   	pop    %rdi
     47d:	6e                   	outsb  %ds:(%rsi),(%dx)
     47e:	75 6d                	jne    4ed <_init-0xb13>
     480:	65 72 69             	gs jb  4ec <_init-0xb14>
     483:	63 5f 74             	movslq 0x74(%rdi),%ebx
     486:	72 61                	jb     4e9 <_init-0xb17>
     488:	69 74 73 5f 69 6e 74 	imul   $0x65746e69,0x5f(%rbx,%rsi,2),%esi
     48f:	65 
     490:	67 65 72 49          	addr32 gs jb 4dd <_init-0xb23>
     494:	6c                   	insb   (%dx),%es:(%rdi)
     495:	45 38 5f 5f          	cmp    %r11b,0x5f(%r15)
     499:	64 69 67 69 74 73 45 	imul   $0x457374,%fs:0x69(%rdi),%esp
     4a0:	00 
     4a1:	66 67 65 74 70       	data16 addr32 gs je 516 <_init-0xaea>
     4a6:	6f                   	outsl  %ds:(%rsi),(%dx)
     4a7:	73 00                	jae    4a9 <_init-0xb57>
     4a9:	5f                   	pop    %rdi
     4aa:	5f                   	pop    %rdi
     4ab:	70 6f                	jo     51c <_init-0xae4>
     4ad:	73 00                	jae    4af <_init-0xb51>
     4af:	5f                   	pop    %rdi
     4b0:	63 68 61             	movslq 0x61(%rax),%ebp
     4b3:	69 6e 00 77 63 73 63 	imul   $0x63736377,0x0(%rsi),%ebp
     4ba:	6f                   	outsl  %ds:(%rsi),(%dx)
     4bb:	6c                   	insb   (%dx),%es:(%rdi)
     4bc:	6c                   	insb   (%dx),%es:(%rdi)
     4bd:	00 63 6c             	add    %ah,0x6c(%rbx)
     4c0:	65 61                	gs (bad) 
     4c2:	72 65                	jb     529 <_init-0xad7>
     4c4:	72 72                	jb     538 <_init-0xac8>
     4c6:	00 5f 53             	add    %bl,0x53(%rdi)
     4c9:	43 5f                	rex.XB pop %r15
     4cb:	54                   	push   %rsp
     4cc:	52                   	push   %rdx
     4cd:	41                   	rex.B
     4ce:	43                   	rex.XB
     4cf:	45 5f                	rex.RB pop %r15
     4d1:	4e                   	rex.WRX
     4d2:	41                   	rex.B
     4d3:	4d                   	rex.WRB
     4d4:	45 5f                	rex.RB pop %r15
     4d6:	4d                   	rex.WRB
     4d7:	41 58                	pop    %r8
     4d9:	00 5f 63             	add    %bl,0x63(%rdi)
     4dc:	75 72                	jne    550 <_init-0xab0>
     4de:	5f                   	pop    %rdi
     4df:	63 6f 6c             	movslq 0x6c(%rdi),%ebp
     4e2:	75 6d                	jne    551 <_init-0xaaf>
     4e4:	6e                   	outsb  %ds:(%rsi),(%dx)
     4e5:	00 75 69             	add    %dh,0x69(%rbp)
     4e8:	6e                   	outsb  %ds:(%rsi),(%dx)
     4e9:	74 5f                	je     54a <_init-0xab6>
     4eb:	66 61                	data16 (bad) 
     4ed:	73 74                	jae    563 <_init-0xa9d>
     4ef:	33 32                	xor    (%rdx),%esi
     4f1:	5f                   	pop    %rdi
     4f2:	74 00                	je     4f4 <_init-0xb0c>
     4f4:	5f                   	pop    %rdi
     4f5:	53                   	push   %rbx
     4f6:	43 5f                	rex.XB pop %r15
     4f8:	54                   	push   %rsp
     4f9:	54                   	push   %rsp
     4fa:	59                   	pop    %rcx
     4fb:	5f                   	pop    %rdi
     4fc:	4e                   	rex.WRX
     4fd:	41                   	rex.B
     4fe:	4d                   	rex.WRB
     4ff:	45 5f                	rex.RB pop %r15
     501:	4d                   	rex.WRB
     502:	41 58                	pop    %r8
     504:	00 70 6f             	add    %dh,0x6f(%rax)
     507:	73 69                	jae    572 <_init-0xa8e>
     509:	74 69                	je     574 <_init-0xa8c>
     50b:	76 65                	jbe    572 <_init-0xa8e>
     50d:	5f                   	pop    %rdi
     50e:	73 69                	jae    579 <_init-0xa87>
     510:	67 6e                	outsb  %ds:(%esi),(%dx)
     512:	00 5f 47             	add    %bl,0x47(%rdi)
     515:	4c                   	rex.WR
     516:	4f                   	rex.WRXB
     517:	42                   	rex.X
     518:	41                   	rex.B
     519:	4c 5f                	rex.WR pop %rdi
     51b:	5f                   	pop    %rdi
     51c:	73 75                	jae    593 <_init-0xa6d>
     51e:	62                   	(bad)  
     51f:	5f                   	pop    %rdi
     520:	49 5f                	rex.WB pop %r15
     522:	6c                   	insb   (%dx),%es:(%rdi)
     523:	6f                   	outsl  %ds:(%rsi),(%dx)
     524:	63 6b 00             	movslq 0x0(%rbx),%ebp
     527:	5f                   	pop    %rdi
     528:	5f                   	pop    %rdi
     529:	77 63                	ja     58e <_init-0xa72>
     52b:	68 00 5f 5a 4e       	pushq  $0x4e5a5f00
     530:	53                   	push   %rbx
     531:	74 31                	je     564 <_init-0xa9c>
     533:	31 63 68             	xor    %esp,0x68(%rbx)
     536:	61                   	(bad)  
     537:	72 5f                	jb     598 <_init-0xa68>
     539:	74 72                	je     5ad <_init-0xa53>
     53b:	61                   	(bad)  
     53c:	69 74 73 49 63 45 34 	imul   $0x6d344563,0x49(%rbx,%rsi,2),%esi
     543:	6d 
     544:	6f                   	outsl  %ds:(%rsi),(%dx)
     545:	76 65                	jbe    5ac <_init-0xa54>
     547:	45 50                	rex.RB push %r8
     549:	63 50 4b             	movslq 0x4b(%rax),%edx
     54c:	63 6d 00             	movslq 0x0(%rbp),%ebp
     54f:	5f                   	pop    %rdi
     550:	53                   	push   %rbx
     551:	43 5f                	rex.XB pop %r15
     553:	41                   	rex.B
     554:	49                   	rex.WB
     555:	4f 5f                	rex.WRXB pop %r15
     557:	50                   	push   %rax
     558:	52                   	push   %rdx
     559:	49                   	rex.WB
     55a:	4f 5f                	rex.WRXB pop %r15
     55c:	44                   	rex.R
     55d:	45                   	rex.RB
     55e:	4c 54                	rex.WR push %rsp
     560:	41 5f                	pop    %r15
     562:	4d                   	rex.WRB
     563:	41 58                	pop    %r8
     565:	00 5f 5f             	add    %bl,0x5f(%rdi)
     568:	75 69                	jne    5d3 <_init-0xa2d>
     56a:	6e                   	outsb  %ds:(%rsi),(%dx)
     56b:	74 38                	je     5a5 <_init-0xa5b>
     56d:	5f                   	pop    %rdi
     56e:	74 00                	je     570 <_init-0xa90>
     570:	31 35 70 74 68 72    	xor    %esi,0x72687470(%rip)        # 726879e6 <_end+0x7268381e>
     576:	65 61                	gs (bad) 
     578:	64 5f                	fs pop %rdi
     57a:	6d                   	insl   (%dx),%es:(%rdi)
     57b:	75 74                	jne    5f1 <_init-0xa0f>
     57d:	65 78 5f             	gs js  5df <_init-0xa21>
     580:	74 00                	je     582 <_init-0xa7e>
     582:	74 79                	je     5fd <_init-0xa03>
     584:	70 65                	jo     5eb <_init-0xa15>
     586:	5f                   	pop    %rdi
     587:	69 6e 66 6f 00 61 74 	imul   $0x7461006f,0x66(%rsi),%ebp
     58e:	6f                   	outsl  %ds:(%rsi),(%dx)
     58f:	66 00 5f 5a          	data16 add %bl,0x5a(%rdi)
     593:	4e 39 5f 5f          	rex.WRX cmp %r11,0x5f(%rdi)
     597:	67 6e                	outsb  %ds:(%esi),(%dx)
     599:	75 5f                	jne    5fa <_init-0xa06>
     59b:	63 78 78             	movslq 0x78(%rax),%edi
     59e:	32 35 5f 5f 6e 75    	xor    0x756e5f5f(%rip),%dh        # 756e6503 <_end+0x756e233b>
     5a4:	6d                   	insl   (%dx),%es:(%rdi)
     5a5:	65 72 69             	gs jb  611 <_init-0x9ef>
     5a8:	63 5f 74             	movslq 0x74(%rdi),%ebx
     5ab:	72 61                	jb     60e <_init-0x9f2>
     5ad:	69 74 73 5f 66 6c 6f 	imul   $0x616f6c66,0x5f(%rbx,%rsi,2),%esi
     5b4:	61 
     5b5:	74 69                	je     620 <_init-0x9e0>
     5b7:	6e                   	outsb  %ds:(%rsi),(%dx)
     5b8:	67 49                	addr32 rex.WB
     5ba:	64 45 31 36          	xor    %r14d,%fs:(%r14)
     5be:	5f                   	pop    %rdi
     5bf:	5f                   	pop    %rdi
     5c0:	6d                   	insl   (%dx),%es:(%rdi)
     5c1:	61                   	(bad)  
     5c2:	78 5f                	js     623 <_init-0x9dd>
     5c4:	65 78 70             	gs js  637 <_init-0x9c9>
     5c7:	6f                   	outsl  %ds:(%rsi),(%dx)
     5c8:	6e                   	outsb  %ds:(%rsi),(%dx)
     5c9:	65 6e                	outsb  %gs:(%rsi),(%dx)
     5cb:	74 31                	je     5fe <_init-0xa02>
     5cd:	30 45 00             	xor    %al,0x0(%rbp)
     5d0:	61                   	(bad)  
     5d1:	74 6f                	je     642 <_init-0x9be>
     5d3:	6c                   	insb   (%dx),%es:(%rdi)
     5d4:	00 5f 5a             	add    %bl,0x5a(%rdi)
     5d7:	4e 39 5f 5f          	rex.WRX cmp %r11,0x5f(%rdi)
     5db:	67 6e                	outsb  %ds:(%esi),(%dx)
     5dd:	75 5f                	jne    63e <_init-0x9c2>
     5df:	63 78 78             	movslq 0x78(%rax),%edi
     5e2:	32 34 5f             	xor    (%rdi,%rbx,2),%dh
     5e5:	5f                   	pop    %rdi
     5e6:	6e                   	outsb  %ds:(%rsi),(%dx)
     5e7:	75 6d                	jne    656 <_init-0x9aa>
     5e9:	65 72 69             	gs jb  655 <_init-0x9ab>
     5ec:	63 5f 74             	movslq 0x74(%rdi),%ebx
     5ef:	72 61                	jb     652 <_init-0x9ae>
     5f1:	69 74 73 5f 69 6e 74 	imul   $0x65746e69,0x5f(%rbx,%rsi,2),%esi
     5f8:	65 
     5f9:	67 65 72 49          	addr32 gs jb 646 <_init-0x9ba>
     5fd:	69 45 38 5f 5f 64 69 	imul   $0x69645f5f,0x38(%rbp),%eax
     604:	67 69 74 73 45 00 5f 	imul   $0x43535f00,0x45(%ebx,%esi,2),%esi
     60b:	53 43 
     60d:	5f                   	pop    %rdi
     60e:	4f 50                	rex.WRXB push %r8
     610:	45                   	rex.RB
     611:	4e 5f                	rex.WRX pop %rdi
     613:	4d                   	rex.WRB
     614:	41 58                	pop    %r8
     616:	00 77 63             	add    %dh,0x63(%rdi)
     619:	73 72                	jae    68d <_init-0x973>
     61b:	63 68 72             	movslq 0x72(%rax),%ebp
     61e:	00 5f 5f             	add    %bl,0x5f(%rdi)
     621:	65 6e                	outsb  %gs:(%rsi),(%dx)
     623:	76 69                	jbe    68e <_init-0x972>
     625:	72 6f                	jb     696 <_init-0x96a>
     627:	6e                   	outsb  %ds:(%rsi),(%dx)
     628:	00 5f 53             	add    %bl,0x53(%rdi)
     62b:	43 5f                	rex.XB pop %r15
     62d:	52                   	push   %rdx
     62e:	45                   	rex.RB
     62f:	41                   	rex.B
     630:	44                   	rex.R
     631:	45 52                	rex.RB push %r10
     633:	5f                   	pop    %rdi
     634:	57                   	push   %rdi
     635:	52                   	push   %rdx
     636:	49 54                	rex.WB push %r12
     638:	45 52                	rex.RB push %r10
     63a:	5f                   	pop    %rdi
     63b:	4c                   	rex.WR
     63c:	4f                   	rex.WRXB
     63d:	43                   	rex.XB
     63e:	4b 53                	rex.WXB push %r11
     640:	00 5f 53             	add    %bl,0x53(%rdi)
     643:	43 5f                	rex.XB pop %r15
     645:	53                   	push   %rbx
     646:	54                   	push   %rsp
     647:	52                   	push   %rdx
     648:	45                   	rex.RB
     649:	41                   	rex.B
     64a:	4d 53                	rex.WRB push %r11
     64c:	00 67 65             	add    %ah,0x65(%rdi)
     64f:	74 65                	je     6b6 <_init-0x94a>
     651:	6e                   	outsb  %ds:(%rsi),(%dx)
     652:	76 00                	jbe    654 <_init-0x9ac>
     654:	5f                   	pop    %rdi
     655:	5f                   	pop    %rdi
     656:	6e                   	outsb  %ds:(%rsi),(%dx)
     657:	75 6d                	jne    6c6 <_init-0x93a>
     659:	65 72 69             	gs jb  6c5 <_init-0x93b>
     65c:	63 5f 74             	movslq 0x74(%rdi),%ebx
     65f:	72 61                	jb     6c2 <_init-0x93e>
     661:	69 74 73 5f 66 6c 6f 	imul   $0x616f6c66,0x5f(%rbx,%rsi,2),%esi
     668:	61 
     669:	74 69                	je     6d4 <_init-0x92c>
     66b:	6e                   	outsb  %ds:(%rsi),(%dx)
     66c:	67 3c 6c             	addr32 cmp $0x6c,%al
     66f:	6f                   	outsl  %ds:(%rsi),(%dx)
     670:	6e                   	outsb  %ds:(%rsi),(%dx)
     671:	67 20 64 6f 75       	and    %ah,0x75(%edi,%ebp,2)
     676:	62                   	(bad)  
     677:	6c                   	insb   (%dx),%es:(%rdi)
     678:	65 3e 00 5f 53       	gs add %bl,%ds:0x53(%rdi)
     67d:	43 5f                	rex.XB pop %r15
     67f:	4d 51                	rex.WRB push %r9
     681:	5f                   	pop    %rdi
     682:	4f 50                	rex.WRXB push %r8
     684:	45                   	rex.RB
     685:	4e 5f                	rex.WRX pop %rdi
     687:	4d                   	rex.WRB
     688:	41 58                	pop    %r8
     68a:	00 5f 5a             	add    %bl,0x5a(%rdi)
     68d:	4e 53                	rex.WRX push %rbx
     68f:	74 31                	je     6c2 <_init-0x93e>
     691:	35 5f 5f 65 78       	xor    $0x78655f5f,%eax
     696:	63 65 70             	movslq 0x70(%rbp),%esp
     699:	74 69                	je     704 <_init-0x8fc>
     69b:	6f                   	outsl  %ds:(%rsi),(%dx)
     69c:	6e                   	outsb  %ds:(%rsi),(%dx)
     69d:	5f                   	pop    %rdi
     69e:	70 74                	jo     714 <_init-0x8ec>
     6a0:	72 31                	jb     6d3 <_init-0x92d>
     6a2:	33 65 78             	xor    0x78(%rbp),%esp
     6a5:	63 65 70             	movslq 0x70(%rbp),%esp
     6a8:	74 69                	je     713 <_init-0x8ed>
     6aa:	6f                   	outsl  %ds:(%rsi),(%dx)
     6ab:	6e                   	outsb  %ds:(%rsi),(%dx)
     6ac:	5f                   	pop    %rdi
     6ad:	70 74                	jo     723 <_init-0x8dd>
     6af:	72 61                	jb     712 <_init-0x8ee>
     6b1:	53                   	push   %rbx
     6b2:	45 52                	rex.RB push %r10
     6b4:	4b 53                	rex.WXB push %r11
     6b6:	30 5f 00             	xor    %bl,0x0(%rdi)
     6b9:	77 63                	ja     71e <_init-0x8e2>
     6bb:	74 72                	je     72f <_init-0x8d1>
     6bd:	61                   	(bad)  
     6be:	6e                   	outsb  %ds:(%rsi),(%dx)
     6bf:	73 5f                	jae    720 <_init-0x8e0>
     6c1:	74 00                	je     6c3 <_init-0x93d>
     6c3:	74 6d                	je     732 <_init-0x8ce>
     6c5:	5f                   	pop    %rdi
     6c6:	69 73 64 73 74 00 5f 	imul   $0x5f007473,0x64(%rbx),%esi
     6cd:	53                   	push   %rbx
     6ce:	43 5f                	rex.XB pop %r15
     6d0:	4d                   	rex.WRB
     6d1:	45                   	rex.RB
     6d2:	4d                   	rex.WRB
     6d3:	4f 52                	rex.WRXB push %r10
     6d5:	59                   	pop    %rcx
     6d6:	5f                   	pop    %rdi
     6d7:	50                   	push   %rax
     6d8:	52                   	push   %rdx
     6d9:	4f 54                	rex.WRXB push %r12
     6db:	45                   	rex.RB
     6dc:	43 54                	rex.XB push %r12
     6de:	49                   	rex.WB
     6df:	4f                   	rex.WRXB
     6e0:	4e 00 5f 53          	rex.WRX add %r11b,0x53(%rdi)
     6e4:	43 5f                	rex.XB pop %r15
     6e6:	46                   	rex.RX
     6e7:	49                   	rex.WB
     6e8:	46                   	rex.RX
     6e9:	4f 00 6e 6f          	rex.WRXB add %r13b,0x6f(%r14)
     6ed:	74 68                	je     757 <_init-0x8a9>
     6ef:	72 6f                	jb     760 <_init-0x8a0>
     6f1:	77 5f                	ja     752 <_init-0x8ae>
     6f3:	74 00                	je     6f5 <_init-0x90b>
     6f5:	5f                   	pop    %rdi
     6f6:	53                   	push   %rbx
     6f7:	43 5f                	rex.XB pop %r15
     6f9:	54                   	push   %rsp
     6fa:	52                   	push   %rdx
     6fb:	41                   	rex.B
     6fc:	43                   	rex.XB
     6fd:	45 5f                	rex.RB pop %r15
     6ff:	45 56                	rex.RB push %r14
     701:	45                   	rex.RB
     702:	4e 54                	rex.WRX push %rsp
     704:	5f                   	pop    %rdi
     705:	46                   	rex.RX
     706:	49                   	rex.WB
     707:	4c 54                	rex.WR push %rsp
     709:	45 52                	rex.RB push %r10
     70b:	00 5f 53             	add    %bl,0x53(%rdi)
     70e:	43 5f                	rex.XB pop %r15
     710:	50                   	push   %rax
     711:	41                   	rex.B
     712:	47                   	rex.RXB
     713:	45 53                	rex.RB push %r11
     715:	49 5a                	rex.WB pop %r10
     717:	45 00 5f 5f          	add    %r11b,0x5f(%r15)
     71b:	6e                   	outsb  %ds:(%rsi),(%dx)
     71c:	75 6d                	jne    78b <_init-0x875>
     71e:	65 72 69             	gs jb  78a <_init-0x876>
     721:	63 5f 74             	movslq 0x74(%rdi),%ebx
     724:	72 61                	jb     787 <_init-0x879>
     726:	69 74 73 5f 69 6e 74 	imul   $0x65746e69,0x5f(%rbx,%rsi,2),%esi
     72d:	65 
     72e:	67 65 72 3c          	addr32 gs jb 76e <_init-0x892>
     732:	63 68 61             	movslq 0x61(%rax),%ebp
     735:	72 3e                	jb     775 <_init-0x88b>
     737:	00 76 77             	add    %dh,0x77(%rsi)
     73a:	70 72                	jo     7ae <_init-0x852>
     73c:	69 6e 74 66 00 5f 53 	imul   $0x535f0066,0x74(%rsi),%ebp
     743:	43 5f                	rex.XB pop %r15
     745:	43                   	rex.XB
     746:	4c                   	rex.WR
     747:	4f                   	rex.WRXB
     748:	43                   	rex.XB
     749:	4b 5f                	rex.WXB pop %r15
     74b:	53                   	push   %rbx
     74c:	45                   	rex.RB
     74d:	4c                   	rex.WR
     74e:	45                   	rex.RB
     74f:	43 54                	rex.XB push %r12
     751:	49                   	rex.WB
     752:	4f                   	rex.WRXB
     753:	4e 00 5f 53          	rex.WRX add %r11b,0x53(%rdi)
     757:	43 5f                	rex.XB pop %r15
     759:	32 5f 43             	xor    0x43(%rdi),%bl
     75c:	5f                   	pop    %rdi
     75d:	56                   	push   %rsi
     75e:	45 52                	rex.RB push %r10
     760:	53                   	push   %rbx
     761:	49                   	rex.WB
     762:	4f                   	rex.WRXB
     763:	4e 00 77 63          	rex.WRX add %r14b,0x63(%rdi)
     767:	74 6f                	je     7d8 <_init-0x828>
     769:	6d                   	insl   (%dx),%es:(%rdi)
     76a:	62                   	(bad)  
     76b:	00 69 6e             	add    %ch,0x6e(%rcx)
     76e:	74 5f                	je     7cf <_init-0x831>
     770:	70 5f                	jo     7d1 <_init-0x82f>
     772:	63 73 5f             	movslq 0x5f(%rbx),%esi
     775:	70 72                	jo     7e9 <_init-0x817>
     777:	65 63 65 64          	movslq %gs:0x64(%rbp),%esp
     77b:	65 73 00             	gs jae 77e <_init-0x882>
     77e:	5f                   	pop    %rdi
     77f:	5f                   	pop    %rdi
     780:	64 69 67 69 74 73 31 	imul   $0x30317374,%fs:0x69(%rdi),%esp
     787:	30 
     788:	00 5f 49             	add    %bl,0x49(%rdi)
     78b:	4f 5f                	rex.WRXB pop %r15
     78d:	6d                   	insl   (%dx),%es:(%rdi)
     78e:	61                   	(bad)  
     78f:	72 6b                	jb     7fc <_init-0x804>
     791:	65 72 00             	gs jb  794 <_init-0x86c>
     794:	5f                   	pop    %rdi
     795:	53                   	push   %rbx
     796:	43 5f                	rex.XB pop %r15
     798:	42                   	rex.X
     799:	43 5f                	rex.XB pop %r15
     79b:	44                   	rex.R
     79c:	49                   	rex.WB
     79d:	4d 5f                	rex.WRB pop %r15
     79f:	4d                   	rex.WRB
     7a0:	41 58                	pop    %r8
     7a2:	00 6d 61             	add    %ch,0x61(%rbp)
     7a5:	69 6e 00 69 6e 74 5f 	imul   $0x5f746e69,0x0(%rsi),%ebp
     7ac:	6e                   	outsb  %ds:(%rsi),(%dx)
     7ad:	5f                   	pop    %rdi
     7ae:	63 73 5f             	movslq 0x5f(%rbx),%esi
     7b1:	70 72                	jo     825 <_init-0x7db>
     7b3:	65 63 65 64          	movslq %gs:0x64(%rbp),%esp
     7b7:	65 73 00             	gs jae 7ba <_init-0x846>
     7ba:	7e 49                	jle    805 <_init-0x7fb>
     7bc:	6e                   	outsb  %ds:(%rsi),(%dx)
     7bd:	69 74 00 74 6f 77 63 	imul   $0x7463776f,0x74(%rax,%rax,1),%esi
     7c4:	74 
     7c5:	72 61                	jb     828 <_init-0x7d8>
     7c7:	6e                   	outsb  %ds:(%rsi),(%dx)
     7c8:	73 00                	jae    7ca <_init-0x836>
     7ca:	5f                   	pop    %rdi
     7cb:	5a                   	pop    %rdx
     7cc:	4e 53                	rex.WRX push %rbx
     7ce:	74 31                	je     801 <_init-0x7ff>
     7d0:	31 63 68             	xor    %esp,0x68(%rbx)
     7d3:	61                   	(bad)  
     7d4:	72 5f                	jb     835 <_init-0x7cb>
     7d6:	74 72                	je     84a <_init-0x7b6>
     7d8:	61                   	(bad)  
     7d9:	69 74 73 49 77 45 32 	imul   $0x65324577,0x49(%rbx,%rsi,2),%esi
     7e0:	65 
     7e1:	71 45                	jno    828 <_init-0x7d8>
     7e3:	52                   	push   %rdx
     7e4:	4b 77 53             	rex.WXB ja 83a <_init-0x7c6>
     7e7:	32 5f 00             	xor    0x0(%rdi),%bl
     7ea:	63 6f 70             	movslq 0x70(%rdi),%ebp
     7ed:	79 00                	jns    7ef <_init-0x811>
     7ef:	6c                   	insb   (%dx),%es:(%rdi)
     7f0:	65 6e                	outsb  %gs:(%rsi),(%dx)
     7f2:	67 74 68             	addr32 je 85d <_init-0x7a3>
     7f5:	00 72 65             	add    %dh,0x65(%rdx)
     7f8:	67 5f                	addr32 pop %rdi
     7fa:	73 61                	jae    85d <_init-0x7a3>
     7fc:	76 65                	jbe    863 <_init-0x79d>
     7fe:	5f                   	pop    %rdi
     7ff:	61                   	(bad)  
     800:	72 65                	jb     867 <_init-0x799>
     802:	61                   	(bad)  
     803:	00 5f 5a             	add    %bl,0x5a(%rdi)
     806:	4e 53                	rex.WRX push %rbx
     808:	74 31                	je     83b <_init-0x7c5>
     80a:	31 63 68             	xor    %esp,0x68(%rbx)
     80d:	61                   	(bad)  
     80e:	72 5f                	jb     86f <_init-0x791>
     810:	74 72                	je     884 <_init-0x77c>
     812:	61                   	(bad)  
     813:	69 74 73 49 63 45 32 	imul   $0x6c324563,0x49(%rbx,%rsi,2),%esi
     81a:	6c 
     81b:	74 45                	je     862 <_init-0x79e>
     81d:	52                   	push   %rdx
     81e:	4b 63 53 32          	rex.WXB movslq 0x32(%r11),%rdx
     822:	5f                   	pop    %rdi
     823:	00 5f 53             	add    %bl,0x53(%rdi)
     826:	43 5f                	rex.XB pop %r15
     828:	53                   	push   %rbx
     829:	48                   	rex.W
     82a:	45                   	rex.RB
     82b:	4c                   	rex.WR
     82c:	4c 00 5f 5f          	rex.WR add %r11b,0x5f(%rdi)
     830:	69 6f 69 6e 69 74 00 	imul   $0x74696e,0x69(%rdi),%ebp
     837:	5f                   	pop    %rdi
     838:	53                   	push   %rbx
     839:	43 5f                	rex.XB pop %r15
     83b:	56                   	push   %rsi
     83c:	37                   	(bad)  
     83d:	5f                   	pop    %rdi
     83e:	49                   	rex.WB
     83f:	4c 50                	rex.WR push %rax
     841:	33 32                	xor    (%rdx),%esi
     843:	5f                   	pop    %rdi
     844:	4f                   	rex.WRXB
     845:	46                   	rex.RX
     846:	46 33 32             	rex.RX xor (%rdx),%r14d
     849:	00 6e 75             	add    %ch,0x75(%rsi)
     84c:	6c                   	insb   (%dx),%es:(%rdi)
     84d:	6c                   	insb   (%dx),%es:(%rdi)
     84e:	70 74                	jo     8c4 <_init-0x73c>
     850:	72 5f                	jb     8b1 <_init-0x74f>
     852:	74 00                	je     854 <_init-0x7ac>
     854:	5f                   	pop    %rdi
     855:	5f                   	pop    %rdi
     856:	6e                   	outsb  %ds:(%rsi),(%dx)
     857:	75 73                	jne    8cc <_init-0x734>
     859:	65 72 73             	gs jb  8cf <_init-0x731>
     85c:	00 5f 53             	add    %bl,0x53(%rdi)
     85f:	5f                   	pop    %rdi
     860:	73 79                	jae    8db <_init-0x725>
     862:	6e                   	outsb  %ds:(%rsi),(%dx)
     863:	63 65 64             	movslq 0x64(%rbp),%esp
     866:	5f                   	pop    %rdi
     867:	77 69                	ja     8d2 <_init-0x72e>
     869:	74 68                	je     8d3 <_init-0x72d>
     86b:	5f                   	pop    %rdi
     86c:	73 74                	jae    8e2 <_init-0x71e>
     86e:	64 69 6f 00 5f 53 43 	imul   $0x5f43535f,%fs:0x0(%rdi),%ebp
     875:	5f 
     876:	32 5f 50             	xor    0x50(%rdi),%bl
     879:	42 53                	rex.X push %rbx
     87b:	5f                   	pop    %rdi
     87c:	4c                   	rex.WR
     87d:	4f                   	rex.WRXB
     87e:	43                   	rex.XB
     87f:	41 54                	push   %r12
     881:	45 00 5f 56          	add    %r11b,0x56(%r15)
     885:	61                   	(bad)  
     886:	6c                   	insb   (%dx),%es:(%rdi)
     887:	75 65                	jne    8ee <_init-0x712>
     889:	00 5f 5a             	add    %bl,0x5a(%rdi)
     88c:	4e 53                	rex.WRX push %rbx
     88e:	74 31                	je     8c1 <_init-0x73f>
     890:	31 63 68             	xor    %esp,0x68(%rbx)
     893:	61                   	(bad)  
     894:	72 5f                	jb     8f5 <_init-0x70b>
     896:	74 72                	je     90a <_init-0x6f6>
     898:	61                   	(bad)  
     899:	69 74 73 49 77 45 31 	imul   $0x32314577,0x49(%rbx,%rsi,2),%esi
     8a0:	32 
     8a1:	74 6f                	je     912 <_init-0x6ee>
     8a3:	5f                   	pop    %rdi
     8a4:	63 68 61             	movslq 0x61(%rax),%ebp
     8a7:	72 5f                	jb     908 <_init-0x6f8>
     8a9:	74 79                	je     924 <_init-0x6dc>
     8ab:	70 65                	jo     912 <_init-0x6ee>
     8ad:	45 52                	rex.RB push %r10
     8af:	4b 6a 00             	rex.WXB pushq $0x0
     8b2:	5f                   	pop    %rdi
     8b3:	5a                   	pop    %rdx
     8b4:	53                   	push   %rbx
     8b5:	74 34                	je     8eb <_init-0x715>
     8b7:	63 6c 6f 67          	movslq 0x67(%rdi,%rbp,2),%ebp
     8bb:	00 74 6d 5f          	add    %dh,0x5f(%rbp,%rbp,2)
     8bf:	79 64                	jns    925 <_init-0x6db>
     8c1:	61                   	(bad)  
     8c2:	79 00                	jns    8c4 <_init-0x73c>
     8c4:	73 74                	jae    93a <_init-0x6c6>
     8c6:	72 74                	jb     93c <_init-0x6c4>
     8c8:	6f                   	outsl  %ds:(%rsi),(%dx)
     8c9:	75 6c                	jne    937 <_init-0x6c9>
     8cb:	6c                   	insb   (%dx),%es:(%rdi)
     8cc:	00 5f 5f             	add    %bl,0x5f(%rdi)
     8cf:	73 77                	jae    948 <_init-0x6b8>
     8d1:	61                   	(bad)  
     8d2:	70 70                	jo     944 <_init-0x6bc>
     8d4:	61                   	(bad)  
     8d5:	62                   	(bad)  
     8d6:	6c                   	insb   (%dx),%es:(%rdi)
     8d7:	65 5f                	gs pop %rdi
     8d9:	64 65 74 61          	fs gs je 93e <_init-0x6c2>
     8dd:	69 6c 73 00 5f 53 43 	imul   $0x5f43535f,0x0(%rbx,%rsi,2),%ebp
     8e4:	5f 
     8e5:	4c                   	rex.WR
     8e6:	45 56                	rex.RB push %r14
     8e8:	45                   	rex.RB
     8e9:	4c 31 5f 44          	xor    %r11,0x44(%rdi)
     8ed:	43                   	rex.XB
     8ee:	41                   	rex.B
     8ef:	43                   	rex.XB
     8f0:	48                   	rex.W
     8f1:	45 5f                	rex.RB pop %r15
     8f3:	4c                   	rex.WR
     8f4:	49                   	rex.WB
     8f5:	4e                   	rex.WRX
     8f6:	45 53                	rex.RB push %r11
     8f8:	49 5a                	rex.WB pop %r10
     8fa:	45 00 5f 5a          	add    %r11b,0x5a(%r15)
     8fe:	53                   	push   %rbx
     8ff:	74 35                	je     936 <_init-0x6ca>
     901:	77 63                	ja     966 <_init-0x69a>
     903:	6f                   	outsl  %ds:(%rsi),(%dx)
     904:	75 74                	jne    97a <_init-0x686>
     906:	00 5f 49             	add    %bl,0x49(%rdi)
     909:	4f 5f                	rex.WRXB pop %r15
     90b:	46                   	rex.RX
     90c:	49                   	rex.WB
     90d:	4c                   	rex.WR
     90e:	45 00 5f 5f          	add    %r11b,0x5f(%r15)
     912:	74 69                	je     97d <_init-0x683>
     914:	6d                   	insl   (%dx),%es:(%rdi)
     915:	65 7a 6f             	gs jp  987 <_init-0x679>
     918:	6e                   	outsb  %ds:(%rsi),(%dx)
     919:	65 00 72 65          	add    %dh,%gs:0x65(%rdx)
     91d:	6d                   	insl   (%dx),%es:(%rdi)
     91e:	6f                   	outsl  %ds:(%rsi),(%dx)
     91f:	76 65                	jbe    986 <_init-0x67a>
     921:	00 5f 49             	add    %bl,0x49(%rdi)
     924:	4f 5f                	rex.WRXB pop %r15
     926:	77 69                	ja     991 <_init-0x66f>
     928:	64 65 5f             	fs gs pop %rdi
     92b:	64 61                	fs (bad) 
     92d:	74 61                	je     990 <_init-0x670>
     92f:	00 62 61             	add    %ah,0x61(%rdx)
     932:	73 69                	jae    99d <_init-0x663>
     934:	63 5f 6f             	movslq 0x6f(%rdi),%ebx
     937:	73 74                	jae    9ad <_init-0x653>
     939:	72 65                	jb     9a0 <_init-0x660>
     93b:	61                   	(bad)  
     93c:	6d                   	insl   (%dx),%es:(%rdi)
     93d:	3c 63                	cmp    $0x63,%al
     93f:	68 61 72 2c 20       	pushq  $0x202c7261
     944:	73 74                	jae    9ba <_init-0x646>
     946:	64 3a 3a             	cmp    %fs:(%rdx),%bh
     949:	63 68 61             	movslq 0x61(%rax),%ebp
     94c:	72 5f                	jb     9ad <_init-0x653>
     94e:	74 72                	je     9c2 <_init-0x63e>
     950:	61                   	(bad)  
     951:	69 74 73 3c 63 68 61 	imul   $0x72616863,0x3c(%rbx,%rsi,2),%esi
     958:	72 
     959:	3e 20 3e             	and    %bh,%ds:(%rsi)
     95c:	00 77 63             	add    %dh,0x63(%rdi)
     95f:	74 79                	je     9da <_init-0x626>
     961:	70 65                	jo     9c8 <_init-0x638>
     963:	5f                   	pop    %rdi
     964:	74 00                	je     966 <_init-0x69a>
     966:	6f                   	outsl  %ds:(%rsi),(%dx)
     967:	70 65                	jo     9ce <_init-0x632>
     969:	72 61                	jb     9cc <_init-0x634>
     96b:	74 6f                	je     9dc <_init-0x624>
     96d:	72 3d                	jb     9ac <_init-0x654>
     96f:	00 5f 5f             	add    %bl,0x5f(%rdi)
     972:	69 73 6f 63 39 39 5f 	imul   $0x5f393963,0x6f(%rbx),%esi
     979:	73 77                	jae    9f2 <_init-0x60e>
     97b:	73 63                	jae    9e0 <_init-0x620>
     97d:	61                   	(bad)  
     97e:	6e                   	outsb  %ds:(%rsi),(%dx)
     97f:	66 00 66 67          	data16 add %ah,0x67(%rsi)
     983:	65 74 77             	gs je  9fd <_init-0x603>
     986:	63 00                	movslq (%rax),%eax
     988:	5f                   	pop    %rdi
     989:	53                   	push   %rbx
     98a:	43 5f                	rex.XB pop %r15
     98c:	4e                   	rex.WRX
     98d:	4c 5f                	rex.WR pop %rdi
     98f:	4c                   	rex.WR
     990:	41                   	rex.B
     991:	4e                   	rex.WRX
     992:	47                   	rex.RXB
     993:	4d                   	rex.WRB
     994:	41 58                	pop    %r8
     996:	00 5f 5f             	add    %bl,0x5f(%rdi)
     999:	64 61                	fs (bad) 
     99b:	74 61                	je     9fe <_init-0x602>
     99d:	00 67 65             	add    %ah,0x65(%rdi)
     9a0:	74 77                	je     a19 <_init-0x5e7>
     9a2:	63 68 61             	movslq 0x61(%rax),%ebp
     9a5:	72 00                	jb     9a7 <_init-0x659>
     9a7:	5f                   	pop    %rdi
     9a8:	5f                   	pop    %rdi
     9a9:	75 69                	jne    a14 <_init-0x5ec>
     9ab:	6e                   	outsb  %ds:(%rsi),(%dx)
     9ac:	74 5f                	je     a0d <_init-0x5f3>
     9ae:	6c                   	insb   (%dx),%es:(%rdi)
     9af:	65 61                	gs (bad) 
     9b1:	73 74                	jae    a27 <_init-0x5d9>
     9b3:	31 36                	xor    %esi,(%rsi)
     9b5:	5f                   	pop    %rdi
     9b6:	74 00                	je     9b8 <_init-0x648>
     9b8:	66 67 65 74 77       	data16 addr32 gs je a34 <_init-0x5cc>
     9bd:	73 00                	jae    9bf <_init-0x641>
     9bf:	5f                   	pop    %rdi
     9c0:	53                   	push   %rbx
     9c1:	43 5f                	rex.XB pop %r15
     9c3:	4e                   	rex.WRX
     9c4:	4c 5f                	rex.WR pop %rdi
     9c6:	4d 53                	rex.WRB push %r11
     9c8:	47                   	rex.RXB
     9c9:	4d                   	rex.WRB
     9ca:	41 58                	pop    %r8
     9cc:	00 75 6e             	add    %dh,0x6e(%rbp)
     9cf:	73 69                	jae    a3a <_init-0x5c6>
     9d1:	67 6e                	outsb  %ds:(%esi),(%dx)
     9d3:	65 64 20 63 68       	gs and %ah,%fs:0x68(%rbx)
     9d8:	61                   	(bad)  
     9d9:	72 00                	jb     9db <_init-0x625>
     9db:	5f                   	pop    %rdi
     9dc:	5f                   	pop    %rdi
     9dd:	73 70                	jae    a4f <_init-0x5b1>
     9df:	69 6e 73 00 5f 5f 69 	imul   $0x695f5f00,0x73(%rsi),%ebp
     9e6:	6e                   	outsb  %ds:(%rsi),(%dx)
     9e7:	74 31                	je     a1a <_init-0x5e6>
     9e9:	32 38                	xor    (%rax),%bh
     9eb:	20 75 6e             	and    %dh,0x6e(%rbp)
     9ee:	73 69                	jae    a59 <_init-0x5a7>
     9f0:	67 6e                	outsb  %ds:(%esi),(%dx)
     9f2:	65 64 00 5f 53       	gs add %bl,%fs:0x53(%rdi)
     9f7:	43 5f                	rex.XB pop %r15
     9f9:	50                   	push   %rax
     9fa:	49                   	rex.WB
     9fb:	49 5f                	rex.WB pop %r15
     9fd:	4f 53                	rex.WRXB push %r11
     9ff:	49 5f                	rex.WB pop %r15
     a01:	43                   	rex.XB
     a02:	4c 54                	rex.WR push %rsp
     a04:	53                   	push   %rbx
     a05:	00 66 63             	add    %ah,0x63(%rsi)
     a08:	6c                   	insb   (%dx),%es:(%rdi)
     a09:	6f                   	outsl  %ds:(%rsi),(%dx)
     a0a:	73 65                	jae    a71 <_init-0x58f>
     a0c:	00 77 6d             	add    %dh,0x6d(%rdi)
     a0f:	65 6d                	gs insl (%dx),%es:(%rdi)
     a11:	63 68 72             	movslq 0x72(%rax),%ebp
     a14:	00 63 68             	add    %ah,0x68(%rbx)
     a17:	61                   	(bad)  
     a18:	72 31                	jb     a4b <_init-0x5b5>
     a1a:	36 5f                	ss pop %rdi
     a1c:	74 00                	je     a1e <_init-0x5e2>
     a1e:	5f                   	pop    %rdi
     a1f:	53                   	push   %rbx
     a20:	43 5f                	rex.XB pop %r15
     a22:	4c                   	rex.WR
     a23:	45 56                	rex.RB push %r14
     a25:	45                   	rex.RB
     a26:	4c 31 5f 49          	xor    %r11,0x49(%rdi)
     a2a:	43                   	rex.XB
     a2b:	41                   	rex.B
     a2c:	43                   	rex.XB
     a2d:	48                   	rex.W
     a2e:	45 5f                	rex.RB pop %r15
     a30:	41 53                	push   %r11
     a32:	53                   	push   %rbx
     a33:	4f                   	rex.WRXB
     a34:	43 00 5f 5a          	rex.XB add %bl,0x5a(%r15)
     a38:	4e 39 5f 5f          	rex.WRX cmp %r11,0x5f(%rdi)
     a3c:	67 6e                	outsb  %ds:(%esi),(%dx)
     a3e:	75 5f                	jne    a9f <_init-0x561>
     a40:	63 78 78             	movslq 0x78(%rax),%edi
     a43:	32 34 5f             	xor    (%rdi,%rbx,2),%dh
     a46:	5f                   	pop    %rdi
     a47:	6e                   	outsb  %ds:(%rsi),(%dx)
     a48:	75 6d                	jne    ab7 <_init-0x549>
     a4a:	65 72 69             	gs jb  ab6 <_init-0x54a>
     a4d:	63 5f 74             	movslq 0x74(%rdi),%ebx
     a50:	72 61                	jb     ab3 <_init-0x54d>
     a52:	69 74 73 5f 69 6e 74 	imul   $0x65746e69,0x5f(%rbx,%rsi,2),%esi
     a59:	65 
     a5a:	67 65 72 49          	addr32 gs jb aa7 <_init-0x559>
     a5e:	73 45                	jae    aa5 <_init-0x55b>
     a60:	35 5f 5f 6d 61       	xor    $0x616d5f5f,%eax
     a65:	78 45                	js     aac <_init-0x554>
     a67:	00 5f 53             	add    %bl,0x53(%rdi)
     a6a:	43 5f                	rex.XB pop %r15
     a6c:	44                   	rex.R
     a6d:	45 56                	rex.RB push %r14
     a6f:	49                   	rex.WB
     a70:	43                   	rex.XB
     a71:	45 5f                	rex.RB pop %r15
     a73:	53                   	push   %rbx
     a74:	50                   	push   %rax
     a75:	45                   	rex.RB
     a76:	43                   	rex.XB
     a77:	49                   	rex.WB
     a78:	46                   	rex.RX
     a79:	49                   	rex.WB
     a7a:	43 5f                	rex.XB pop %r15
     a7c:	52                   	push   %rdx
     a7d:	00 5f 5f             	add    %bl,0x5f(%rdi)
     a80:	69 73 6f 63 39 39 5f 	imul   $0x5f393963,0x6f(%rbx),%esi
     a87:	66 77 73             	data16 ja afd <_init-0x503>
     a8a:	63 61 6e             	movslq 0x6e(%rcx),%esp
     a8d:	66 00 37             	data16 add %dh,(%rdi)
     a90:	6c                   	insb   (%dx),%es:(%rdi)
     a91:	6c                   	insb   (%dx),%es:(%rdi)
     a92:	64 69 76 5f 74 00 77 	imul   $0x63770074,%fs:0x5f(%rsi),%esi
     a99:	63 
     a9a:	73 63                	jae    aff <_init-0x501>
     a9c:	6d                   	insl   (%dx),%es:(%rdi)
     a9d:	70 00                	jo     a9f <_init-0x561>
     a9f:	73 72                	jae    b13 <_init-0x4ed>
     aa1:	61                   	(bad)  
     aa2:	6e                   	outsb  %ds:(%rsi),(%dx)
     aa3:	64 00 6e 6f          	add    %ch,%fs:0x6f(%rsi)
     aa7:	74 5f                	je     b08 <_init-0x4f8>
     aa9:	65 6f                	outsl  %gs:(%rsi),(%dx)
     aab:	66 00 5f 53          	data16 add %bl,0x53(%rdi)
     aaf:	43 5f                	rex.XB pop %r15
     ab1:	4e 5a                	rex.WRX pop %rdx
     ab3:	45 52                	rex.RB push %r10
     ab5:	4f 00 5f 53          	rex.WRXB add %r11b,0x53(%r15)
     ab9:	43 5f                	rex.XB pop %r15
     abb:	58                   	pop    %rax
     abc:	4f 50                	rex.WRXB push %r8
     abe:	45                   	rex.RB
     abf:	4e 5f                	rex.WRX pop %rdi
     ac1:	58                   	pop    %rax
     ac2:	50                   	push   %rax
     ac3:	47 32 00             	rex.RXB xor (%r8),%r8b
     ac6:	5f                   	pop    %rdi
     ac7:	53                   	push   %rbx
     ac8:	43 5f                	rex.XB pop %r15
     aca:	58                   	pop    %rax
     acb:	4f 50                	rex.WRXB push %r8
     acd:	45                   	rex.RB
     ace:	4e 5f                	rex.WRX pop %rdi
     ad0:	58                   	pop    %rax
     ad1:	50                   	push   %rax
     ad2:	47 33 00             	rex.RXB xor (%r8),%r8d
     ad5:	5f                   	pop    %rdi
     ad6:	53                   	push   %rbx
     ad7:	43 5f                	rex.XB pop %r15
     ad9:	58                   	pop    %rax
     ada:	4f 50                	rex.WRXB push %r8
     adc:	45                   	rex.RB
     add:	4e 5f                	rex.WRX pop %rdi
     adf:	58                   	pop    %rax
     ae0:	50                   	push   %rax
     ae1:	47 34 00             	rex.RXB xor $0x0,%al
     ae4:	5f                   	pop    %rdi
     ae5:	53                   	push   %rbx
     ae6:	43 5f                	rex.XB pop %r15
     ae8:	55                   	push   %rbp
     ae9:	4c                   	rex.WR
     aea:	4f                   	rex.WRXB
     aeb:	4e                   	rex.WRX
     aec:	47 5f                	rex.RXB pop %r15
     aee:	4d                   	rex.WRB
     aef:	41 58                	pop    %r8
     af1:	00 5f 5a             	add    %bl,0x5a(%rdi)
     af4:	4e 53                	rex.WRX push %rbx
     af6:	74 31                	je     b29 <_init-0x4d7>
     af8:	35 5f 5f 65 78       	xor    $0x78655f5f,%eax
     afd:	63 65 70             	movslq 0x70(%rbp),%esp
     b00:	74 69                	je     b6b <_init-0x495>
     b02:	6f                   	outsl  %ds:(%rsi),(%dx)
     b03:	6e                   	outsb  %ds:(%rsi),(%dx)
     b04:	5f                   	pop    %rdi
     b05:	70 74                	jo     b7b <_init-0x485>
     b07:	72 31                	jb     b3a <_init-0x4c6>
     b09:	33 65 78             	xor    0x78(%rbp),%esp
     b0c:	63 65 70             	movslq 0x70(%rbp),%esp
     b0f:	74 69                	je     b7a <_init-0x486>
     b11:	6f                   	outsl  %ds:(%rsi),(%dx)
     b12:	6e                   	outsb  %ds:(%rsi),(%dx)
     b13:	5f                   	pop    %rdi
     b14:	70 74                	jo     b8a <_init-0x476>
     b16:	72 39                	jb     b51 <_init-0x4af>
     b18:	5f                   	pop    %rdi
     b19:	4d 5f                	rex.WRB pop %r15
     b1b:	61                   	(bad)  
     b1c:	64 64 72 65          	fs fs jb b85 <_init-0x47b>
     b20:	66 45 76 00          	data16 rex.RB jbe b24 <_init-0x4dc>
     b24:	5f                   	pop    %rdi
     b25:	5f                   	pop    %rdi
     b26:	74 7a                	je     ba2 <_init-0x45e>
     b28:	6e                   	outsb  %ds:(%rsi),(%dx)
     b29:	61                   	(bad)  
     b2a:	6d                   	insl   (%dx),%es:(%rdi)
     b2b:	65 00 77 63          	add    %dh,%gs:0x63(%rdi)
     b2f:	73 70                	jae    ba1 <_init-0x45f>
     b31:	62 72                	(bad)  
     b33:	6b 00 72             	imul   $0x72,(%rax),%eax
     b36:	65 74 68             	gs je  ba1 <_init-0x45f>
     b39:	72 6f                	jb     baa <_init-0x456>
     b3b:	77 5f                	ja     b9c <_init-0x464>
     b3d:	65 78 63             	gs js  ba3 <_init-0x45d>
     b40:	65 70 74             	gs jo  bb7 <_init-0x449>
     b43:	69 6f 6e 00 5f 53 43 	imul   $0x43535f00,0x6e(%rdi),%ebp
     b4a:	5f                   	pop    %rdi
     b4b:	58                   	pop    %rax
     b4c:	4f 50                	rex.WRXB push %r8
     b4e:	45                   	rex.RB
     b4f:	4e 5f                	rex.WRX pop %rdi
     b51:	45                   	rex.RB
     b52:	4e                   	rex.WRX
     b53:	48 5f                	rex.W pop %rdi
     b55:	49 31 38             	xor    %rdi,(%r8)
     b58:	4e 00 5f 5f          	rex.WRX add %r11b,0x5f(%rdi)
     b5c:	69 73 5f 73 69 67 6e 	imul   $0x6e676973,0x5f(%rbx),%esi
     b63:	65 64 00 5f 5a       	gs add %bl,%fs:0x5a(%rdi)
     b68:	4e 53                	rex.WRX push %rbx
     b6a:	74 31                	je     b9d <_init-0x463>
     b6c:	31 63 68             	xor    %esp,0x68(%rbx)
     b6f:	61                   	(bad)  
     b70:	72 5f                	jb     bd1 <_init-0x42f>
     b72:	74 72                	je     be6 <_init-0x41a>
     b74:	61                   	(bad)  
     b75:	69 74 73 49 77 45 33 	imul   $0x65334577,0x49(%rbx,%rsi,2),%esi
     b7c:	65 
     b7d:	6f                   	outsl  %ds:(%rsi),(%dx)
     b7e:	66 45 76 00          	data16 rex.RB jbe b82 <_init-0x47e>
     b82:	5f                   	pop    %rdi
     b83:	53                   	push   %rbx
     b84:	43 5f                	rex.XB pop %r15
     b86:	49                   	rex.WB
     b87:	4e 54                	rex.WRX push %rsp
     b89:	5f                   	pop    %rdi
     b8a:	4d                   	rex.WRB
     b8b:	49                   	rex.WB
     b8c:	4e 00 5f 53          	rex.WRX add %r11b,0x53(%rdi)
     b90:	43 5f                	rex.XB pop %r15
     b92:	32 5f 43             	xor    0x43(%rdi),%bl
     b95:	48                   	rex.W
     b96:	41 52                	push   %r10
     b98:	5f                   	pop    %rdi
     b99:	54                   	push   %rsp
     b9a:	45 52                	rex.RB push %r10
     b9c:	4d 00 5f 53          	rex.WRB add %r11b,0x53(%r15)
     ba0:	43 5f                	rex.XB pop %r15
     ba2:	32 5f 55             	xor    0x55(%rdi),%bl
     ba5:	50                   	push   %rax
     ba6:	45 00 62 61          	add    %r12b,0x61(%r10)
     baa:	73 69                	jae    c15 <_init-0x3eb>
     bac:	63 5f 6f             	movslq 0x6f(%rdi),%ebx
     baf:	73 74                	jae    c25 <_init-0x3db>
     bb1:	72 65                	jb     c18 <_init-0x3e8>
     bb3:	61                   	(bad)  
     bb4:	6d                   	insl   (%dx),%es:(%rdi)
     bb5:	3c 77                	cmp    $0x77,%al
     bb7:	63 68 61             	movslq 0x61(%rax),%ebp
     bba:	72 5f                	jb     c1b <_init-0x3e5>
     bbc:	74 2c                	je     bea <_init-0x416>
     bbe:	20 73 74             	and    %dh,0x74(%rbx)
     bc1:	64 3a 3a             	cmp    %fs:(%rdx),%bh
     bc4:	63 68 61             	movslq 0x61(%rax),%ebp
     bc7:	72 5f                	jb     c28 <_init-0x3d8>
     bc9:	74 72                	je     c3d <_init-0x3c3>
     bcb:	61                   	(bad)  
     bcc:	69 74 73 3c 77 63 68 	imul   $0x61686377,0x3c(%rbx,%rsi,2),%esi
     bd3:	61 
     bd4:	72 5f                	jb     c35 <_init-0x3cb>
     bd6:	74 3e                	je     c16 <_init-0x3ea>
     bd8:	20 3e                	and    %bh,(%rsi)
     bda:	00 6f 70             	add    %ch,0x70(%rdi)
     bdd:	65 72 61             	gs jb  c41 <_init-0x3bf>
     be0:	74 6f                	je     c51 <_init-0x3af>
     be2:	72 20                	jb     c04 <_init-0x3fc>
     be4:	73 74                	jae    c5a <_init-0x3a6>
     be6:	64 3a 3a             	cmp    %fs:(%rdx),%bh
     be9:	69 6e 74 65 67 72 61 	imul   $0x61726765,0x74(%rsi),%ebp
     bf0:	6c                   	insb   (%dx),%es:(%rdi)
     bf1:	5f                   	pop    %rdi
     bf2:	63 6f 6e             	movslq 0x6e(%rdi),%ebp
     bf5:	73 74                	jae    c6b <_init-0x395>
     bf7:	61                   	(bad)  
     bf8:	6e                   	outsb  %ds:(%rsi),(%dx)
     bf9:	74 3c                	je     c37 <_init-0x3c9>
     bfb:	62                   	(bad)  
     bfc:	6f                   	outsl  %ds:(%rsi),(%dx)
     bfd:	6f                   	outsl  %ds:(%rsi),(%dx)
     bfe:	6c                   	insb   (%dx),%es:(%rdi)
     bff:	2c 20                	sub    $0x20,%al
     c01:	66 61                	data16 (bad) 
     c03:	6c                   	insb   (%dx),%es:(%rdi)
     c04:	73 65                	jae    c6b <_init-0x395>
     c06:	3e 3a 3a             	cmp    %ds:(%rdx),%bh
     c09:	76 61                	jbe    c6c <_init-0x394>
     c0b:	6c                   	insb   (%dx),%es:(%rdi)
     c0c:	75 65                	jne    c73 <_init-0x38d>
     c0e:	5f                   	pop    %rdi
     c0f:	74 79                	je     c8a <_init-0x376>
     c11:	70 65                	jo     c78 <_init-0x388>
     c13:	00 5f 5a             	add    %bl,0x5a(%rdi)
     c16:	4e 53                	rex.WRX push %rbx
     c18:	74 31                	je     c4b <_init-0x3b5>
     c1a:	31 63 68             	xor    %esp,0x68(%rbx)
     c1d:	61                   	(bad)  
     c1e:	72 5f                	jb     c7f <_init-0x381>
     c20:	74 72                	je     c94 <_init-0x36c>
     c22:	61                   	(bad)  
     c23:	69 74 73 49 77 45 37 	imul   $0x63374577,0x49(%rbx,%rsi,2),%esi
     c2a:	63 
     c2b:	6f                   	outsl  %ds:(%rsi),(%dx)
     c2c:	6d                   	insl   (%dx),%es:(%rdi)
     c2d:	70 61                	jo     c90 <_init-0x370>
     c2f:	72 65                	jb     c96 <_init-0x36a>
     c31:	45 50                	rex.RB push %r8
     c33:	4b 77 53             	rex.WXB ja c89 <_init-0x377>
     c36:	32 5f 6d             	xor    0x6d(%rdi),%bl
     c39:	00 5f 53             	add    %bl,0x53(%rdi)
     c3c:	43 5f                	rex.XB pop %r15
     c3e:	46                   	rex.RX
     c3f:	49                   	rex.WB
     c40:	4c                   	rex.WR
     c41:	45 5f                	rex.RB pop %r15
     c43:	53                   	push   %rbx
     c44:	59                   	pop    %rcx
     c45:	53                   	push   %rbx
     c46:	54                   	push   %rsp
     c47:	45                   	rex.RB
     c48:	4d 00 77 63          	rex.WRB add %r14b,0x63(%r15)
     c4c:	73 6e                	jae    cbc <_init-0x344>
     c4e:	63 6d 70             	movslq 0x70(%rbp),%ebp
     c51:	00 5f 49             	add    %bl,0x49(%rdi)
     c54:	4f 5f                	rex.WRXB pop %r15
     c56:	6c                   	insb   (%dx),%es:(%rdi)
     c57:	6f                   	outsl  %ds:(%rsi),(%dx)
     c58:	63 6b 5f             	movslq 0x5f(%rbx),%ebp
     c5b:	74 00                	je     c5d <_init-0x3a3>
     c5d:	5f                   	pop    %rdi
     c5e:	5a                   	pop    %rdx
     c5f:	4e 53                	rex.WRX push %rbx
     c61:	74 31                	je     c94 <_init-0x36c>
     c63:	37                   	(bad)  
     c64:	69 6e 74 65 67 72 61 	imul   $0x61726765,0x74(%rsi),%ebp
     c6b:	6c                   	insb   (%dx),%es:(%rdi)
     c6c:	5f                   	pop    %rdi
     c6d:	63 6f 6e             	movslq 0x6e(%rdi),%ebp
     c70:	73 74                	jae    ce6 <_init-0x31a>
     c72:	61                   	(bad)  
     c73:	6e                   	outsb  %ds:(%rsi),(%dx)
     c74:	74 49                	je     cbf <_init-0x341>
     c76:	62                   	(bad)  
     c77:	4c 62 31 45 45 35    	(bad)
     c7d:	76 61                	jbe    ce0 <_init-0x320>
     c7f:	6c                   	insb   (%dx),%es:(%rdi)
     c80:	75 65                	jne    ce7 <_init-0x319>
     c82:	45 00 5f 53          	add    %r11b,0x53(%r15)
     c86:	43 5f                	rex.XB pop %r15
     c88:	4e                   	rex.WRX
     c89:	47 52                	rex.RXB push %r10
     c8b:	4f 55                	rex.WRXB push %r13
     c8d:	50                   	push   %rax
     c8e:	53                   	push   %rbx
     c8f:	5f                   	pop    %rdi
     c90:	4d                   	rex.WRB
     c91:	41 58                	pop    %r8
     c93:	00 5f 53             	add    %bl,0x53(%rdi)
     c96:	43 5f                	rex.XB pop %r15
     c98:	32 5f 56             	xor    0x56(%rdi),%bl
     c9b:	45 52                	rex.RB push %r10
     c9d:	53                   	push   %rbx
     c9e:	49                   	rex.WB
     c9f:	4f                   	rex.WRXB
     ca0:	4e 00 77 6d          	rex.WRX add %r14b,0x6d(%rdi)
     ca4:	65 6d                	gs insl (%dx),%es:(%rdi)
     ca6:	6d                   	insl   (%dx),%es:(%rdi)
     ca7:	6f                   	outsl  %ds:(%rsi),(%dx)
     ca8:	76 65                	jbe    d0f <_init-0x2f1>
     caa:	00 5f 53             	add    %bl,0x53(%rdi)
     cad:	43 5f                	rex.XB pop %r15
     caf:	52                   	push   %rdx
     cb0:	45 5f                	rex.RB pop %r15
     cb2:	44 55                	rex.R push %rbp
     cb4:	50                   	push   %rax
     cb5:	5f                   	pop    %rdi
     cb6:	4d                   	rex.WRB
     cb7:	41 58                	pop    %r8
     cb9:	00 35 64 69 76 5f    	add    %dh,0x5f766964(%rip)        # 5f767623 <_end+0x5f76345b>
     cbf:	74 00                	je     cc1 <_init-0x33f>
     cc1:	5f                   	pop    %rdi
     cc2:	53                   	push   %rbx
     cc3:	43 5f                	rex.XB pop %r15
     cc5:	4c                   	rex.WR
     cc6:	45 56                	rex.RB push %r14
     cc8:	45                   	rex.RB
     cc9:	4c 33 5f 43          	xor    0x43(%rdi),%r11
     ccd:	41                   	rex.B
     cce:	43                   	rex.XB
     ccf:	48                   	rex.W
     cd0:	45 5f                	rex.RB pop %r15
     cd2:	41 53                	push   %r11
     cd4:	53                   	push   %rbx
     cd5:	4f                   	rex.WRXB
     cd6:	43 00 5f 5f          	rex.XB add %bl,0x5f(%r15)
     cda:	6d                   	insl   (%dx),%es:(%rdi)
     cdb:	69 6e 00 74 6d 5f 6d 	imul   $0x6d5f6d74,0x0(%rsi),%ebp
     ce2:	69 6e 00 5f 53 43 5f 	imul   $0x5f43535f,0x0(%rsi),%ebp
     ce9:	32 5f 46             	xor    0x46(%rdi),%bl
     cec:	4f 52                	rex.WRXB push %r10
     cee:	54                   	push   %rsp
     cef:	5f                   	pop    %rdi
     cf0:	44                   	rex.R
     cf1:	45 56                	rex.RB push %r14
     cf3:	00 62 61             	add    %ah,0x61(%rdx)
     cf6:	73 69                	jae    d61 <_init-0x29f>
     cf8:	63 5f 69             	movslq 0x69(%rdi),%ebx
     cfb:	73 74                	jae    d71 <_init-0x28f>
     cfd:	72 65                	jb     d64 <_init-0x29c>
     cff:	61                   	(bad)  
     d00:	6d                   	insl   (%dx),%es:(%rdi)
     d01:	3c 63                	cmp    $0x63,%al
     d03:	68 61 72 2c 20       	pushq  $0x202c7261
     d08:	73 74                	jae    d7e <_init-0x282>
     d0a:	64 3a 3a             	cmp    %fs:(%rdx),%bh
     d0d:	63 68 61             	movslq 0x61(%rax),%ebp
     d10:	72 5f                	jb     d71 <_init-0x28f>
     d12:	74 72                	je     d86 <_init-0x27a>
     d14:	61                   	(bad)  
     d15:	69 74 73 3c 63 68 61 	imul   $0x72616863,0x3c(%rbx,%rsi,2),%esi
     d1c:	72 
     d1d:	3e 20 3e             	and    %bh,%ds:(%rsi)
     d20:	00 5f 53             	add    %bl,0x53(%rdi)
     d23:	43 5f                	rex.XB pop %r15
     d25:	43                   	rex.XB
     d26:	48                   	rex.W
     d27:	41 52                	push   %r10
     d29:	5f                   	pop    %rdi
     d2a:	4d                   	rex.WRB
     d2b:	49                   	rex.WB
     d2c:	4e 00 6d 6f          	rex.WRX add %r13b,0x6f(%rbp)
     d30:	6e                   	outsb  %ds:(%rsi),(%dx)
     d31:	5f                   	pop    %rdi
     d32:	74 68                	je     d9c <_init-0x264>
     d34:	6f                   	outsl  %ds:(%rsi),(%dx)
     d35:	75 73                	jne    daa <_init-0x256>
     d37:	61                   	(bad)  
     d38:	6e                   	outsb  %ds:(%rsi),(%dx)
     d39:	64 73 5f             	fs jae d9b <_init-0x265>
     d3c:	73 65                	jae    da3 <_init-0x25d>
     d3e:	70 00                	jo     d40 <_init-0x2c0>
     d40:	5f                   	pop    %rdi
     d41:	5f                   	pop    %rdi
     d42:	69 6e 74 5f 6c 65 61 	imul   $0x61656c5f,0x74(%rsi),%ebp
     d49:	73 74                	jae    dbf <_init-0x241>
     d4b:	38 5f 74             	cmp    %bl,0x74(%rdi)
     d4e:	00 75 6e             	add    %dh,0x6e(%rbp)
     d51:	67 65 74 77          	addr32 gs je dcc <_init-0x234>
     d55:	63 00                	movslq (%rax),%eax
     d57:	66 70 5f             	data16 jo db9 <_init-0x247>
     d5a:	6f                   	outsl  %ds:(%rsi),(%dx)
     d5b:	66 66 73 65          	data16 data16 jae dc4 <_init-0x23c>
     d5f:	74 00                	je     d61 <_init-0x29f>
     d61:	66 74 65             	data16 je dc9 <_init-0x237>
     d64:	6c                   	insb   (%dx),%es:(%rdi)
     d65:	6c                   	insb   (%dx),%es:(%rdi)
     d66:	00 5f 53             	add    %bl,0x53(%rdi)
     d69:	43 5f                	rex.XB pop %r15
     d6b:	49                   	rex.WB
     d6c:	4f 56                	rex.WRXB push %r14
     d6e:	5f                   	pop    %rdi
     d6f:	4d                   	rex.WRB
     d70:	41 58                	pop    %r8
     d72:	00 5f 5a             	add    %bl,0x5a(%rdi)
     d75:	4e 39 5f 5f          	rex.WRX cmp %r11,0x5f(%rdi)
     d79:	67 6e                	outsb  %ds:(%esi),(%dx)
     d7b:	75 5f                	jne    ddc <_init-0x224>
     d7d:	63 78 78             	movslq 0x78(%rax),%edi
     d80:	32 34 5f             	xor    (%rdi,%rbx,2),%dh
     d83:	5f                   	pop    %rdi
     d84:	6e                   	outsb  %ds:(%rsi),(%dx)
     d85:	75 6d                	jne    df4 <_init-0x20c>
     d87:	65 72 69             	gs jb  df3 <_init-0x20d>
     d8a:	63 5f 74             	movslq 0x74(%rdi),%ebx
     d8d:	72 61                	jb     df0 <_init-0x210>
     d8f:	69 74 73 5f 69 6e 74 	imul   $0x65746e69,0x5f(%rbx,%rsi,2),%esi
     d96:	65 
     d97:	67 65 72 49          	addr32 gs jb de4 <_init-0x21c>
     d9b:	69 45 35 5f 5f 6d 69 	imul   $0x696d5f5f,0x35(%rbp),%eax
     da2:	6e                   	outsb  %ds:(%rsi),(%dx)
     da3:	45 00 5f 5a          	add    %r11b,0x5a(%r15)
     da7:	4e 53                	rex.WRX push %rbx
     da9:	74 38                	je     de3 <_init-0x21d>
     dab:	69 6f 73 5f 62 61 73 	imul   $0x7361625f,0x73(%rdi),%ebp
     db2:	65 34 49             	gs xor $0x49,%al
     db5:	6e                   	outsb  %ds:(%rsi),(%dx)
     db6:	69 74 61 53 45 52 4b 	imul   $0x534b5245,0x53(%rcx,%riz,2),%esi
     dbd:	53 
     dbe:	30 5f 00             	xor    %bl,0x0(%rdi)
     dc1:	6d                   	insl   (%dx),%es:(%rdi)
     dc2:	62 72 6c 65 6e       	(bad)
     dc7:	00 5f 53             	add    %bl,0x53(%rdi)
     dca:	43 5f                	rex.XB pop %r15
     dcc:	50                   	push   %rax
     dcd:	49                   	rex.WB
     dce:	49 00 73 74          	rex.WB add %sil,0x74(%r11)
     dd2:	64 69 6e 00 5f 53 43 	imul   $0x5f43535f,%fs:0x0(%rsi),%ebp
     dd9:	5f 
     dda:	54                   	push   %rsp
     ddb:	48 52                	rex.W push %rdx
     ddd:	45                   	rex.RB
     dde:	41                   	rex.B
     ddf:	44 5f                	rex.R pop %rdi
     de1:	43 50                	rex.XB push %r8
     de3:	55                   	push   %rbp
     de4:	54                   	push   %rsp
     de5:	49                   	rex.WB
     de6:	4d                   	rex.WRB
     de7:	45 00 5f 53          	add    %r11b,0x53(%r15)
     deb:	43 5f                	rex.XB pop %r15
     ded:	53                   	push   %rbx
     dee:	59                   	pop    %rcx
     def:	53                   	push   %rbx
     df0:	54                   	push   %rsp
     df1:	45                   	rex.RB
     df2:	4d 5f                	rex.WRB pop %r15
     df4:	44                   	rex.R
     df5:	41 54                	push   %r12
     df7:	41                   	rex.B
     df8:	42                   	rex.X
     df9:	41 53                	push   %r11
     dfb:	45 00 5f 41          	add    %r11b,0x41(%r15)
     dff:	74 6f                	je     e70 <_init-0x190>
     e01:	6d                   	insl   (%dx),%es:(%rdi)
     e02:	69 63 5f 77 6f 72 64 	imul   $0x64726f77,0x5f(%rbx),%esp
     e09:	00 5f 53             	add    %bl,0x53(%rdi)
     e0c:	43 5f                	rex.XB pop %r15
     e0e:	50                   	push   %rax
     e0f:	49                   	rex.WB
     e10:	49 5f                	rex.WB pop %r15
     e12:	49                   	rex.WB
     e13:	4e 54                	rex.WRX push %rsp
     e15:	45 52                	rex.RB push %r10
     e17:	4e                   	rex.WRX
     e18:	45 54                	rex.RB push %r12
     e1a:	5f                   	pop    %rdi
     e1b:	44                   	rex.R
     e1c:	47 52                	rex.RXB push %r10
     e1e:	41                   	rex.B
     e1f:	4d 00 5f 53          	rex.WRB add %r11b,0x53(%r15)
     e23:	43 5f                	rex.XB pop %r15
     e25:	53                   	push   %rbx
     e26:	53                   	push   %rbx
     e27:	49 5a                	rex.WB pop %r10
     e29:	45 5f                	rex.RB pop %r15
     e2b:	4d                   	rex.WRB
     e2c:	41 58                	pop    %r8
     e2e:	00 5f 53             	add    %bl,0x53(%rdi)
     e31:	43 5f                	rex.XB pop %r15
     e33:	46                   	rex.RX
     e34:	49                   	rex.WB
     e35:	4c                   	rex.WR
     e36:	45 5f                	rex.RB pop %r15
     e38:	4c                   	rex.WR
     e39:	4f                   	rex.WRXB
     e3a:	43                   	rex.XB
     e3b:	4b                   	rex.WXB
     e3c:	49                   	rex.WB
     e3d:	4e                   	rex.WRX
     e3e:	47 00 5f 6d          	rex.RXB add %r11b,0x6d(%r15)
     e42:	61                   	(bad)  
     e43:	72 6b                	jb     eb0 <_init-0x150>
     e45:	65 72 73             	gs jb  ebb <_init-0x145>
     e48:	00 77 63             	add    %dh,0x63(%rdi)
     e4b:	73 74                	jae    ec1 <_init-0x13f>
     e4d:	6f                   	outsl  %ds:(%rsi),(%dx)
     e4e:	75 6c                	jne    ebc <_init-0x144>
     e50:	6c                   	insb   (%dx),%es:(%rdi)
     e51:	00 5f 5a             	add    %bl,0x5a(%rdi)
     e54:	4e 39 5f 5f          	rex.WRX cmp %r11,0x5f(%rdi)
     e58:	67 6e                	outsb  %ds:(%esi),(%dx)
     e5a:	75 5f                	jne    ebb <_init-0x145>
     e5c:	63 78 78             	movslq 0x78(%rax),%edi
     e5f:	32 35 5f 5f 6e 75    	xor    0x756e5f5f(%rip),%dh        # 756e6dc4 <_end+0x756e2bfc>
     e65:	6d                   	insl   (%dx),%es:(%rdi)
     e66:	65 72 69             	gs jb  ed2 <_init-0x12e>
     e69:	63 5f 74             	movslq 0x74(%rdi),%ebx
     e6c:	72 61                	jb     ecf <_init-0x131>
     e6e:	69 74 73 5f 66 6c 6f 	imul   $0x616f6c66,0x5f(%rbx,%rsi,2),%esi
     e75:	61 
     e76:	74 69                	je     ee1 <_init-0x11f>
     e78:	6e                   	outsb  %ds:(%rsi),(%dx)
     e79:	67 49                	addr32 rex.WB
     e7b:	65 45 31 36          	xor    %r14d,%gs:(%r14)
     e7f:	5f                   	pop    %rdi
     e80:	5f                   	pop    %rdi
     e81:	6d                   	insl   (%dx),%es:(%rdi)
     e82:	61                   	(bad)  
     e83:	78 5f                	js     ee4 <_init-0x11c>
     e85:	65 78 70             	gs js  ef8 <_init-0x108>
     e88:	6f                   	outsl  %ds:(%rsi),(%dx)
     e89:	6e                   	outsb  %ds:(%rsi),(%dx)
     e8a:	65 6e                	outsb  %gs:(%rsi),(%dx)
     e8c:	74 31                	je     ebf <_init-0x141>
     e8e:	30 45 00             	xor    %al,0x0(%rbp)
     e91:	63 6f 6d             	movslq 0x6d(%rdi),%ebp
     e94:	70 61                	jo     ef7 <_init-0x109>
     e96:	72 65                	jb     efd <_init-0x103>
     e98:	00 5f 53             	add    %bl,0x53(%rdi)
     e9b:	43 5f                	rex.XB pop %r15
     e9d:	53                   	push   %rbx
     e9e:	43                   	rex.XB
     e9f:	48                   	rex.W
     ea0:	41 52                	push   %r10
     ea2:	5f                   	pop    %rdi
     ea3:	4d                   	rex.WRB
     ea4:	49                   	rex.WB
     ea5:	4e 00 47 4e          	rex.WRX add %r8b,0x4e(%rdi)
     ea9:	55                   	push   %rbp
     eaa:	20 43 2b             	and    %al,0x2b(%rbx)
     ead:	2b 31                	sub    (%rcx),%esi
     eaf:	34 20                	xor    $0x20,%al
     eb1:	39 2e                	cmp    %ebp,(%rsi)
     eb3:	34 2e                	xor    $0x2e,%al
     eb5:	30 20                	xor    %ah,(%rax)
     eb7:	2d 6d 74 75 6e       	sub    $0x6e75746d,%eax
     ebc:	65 3d 67 65 6e 65    	gs cmp $0x656e6567,%eax
     ec2:	72 69                	jb     f2d <_init-0xd3>
     ec4:	63 20                	movslq (%rax),%esp
     ec6:	2d 6d 61 72 63       	sub    $0x6372616d,%eax
     ecb:	68 3d 78 38 36       	pushq  $0x3638783d
     ed0:	2d 36 34 20 2d       	sub    $0x2d203436,%eax
     ed5:	67 20 2d 66 61 73 79 	and    %ch,0x79736166(%eip)        # 79737042 <_end+0x79732e7a>
     edc:	6e                   	outsb  %ds:(%rsi),(%dx)
     edd:	63 68 72             	movslq 0x72(%rax),%ebp
     ee0:	6f                   	outsl  %ds:(%rsi),(%dx)
     ee1:	6e                   	outsb  %ds:(%rsi),(%dx)
     ee2:	6f                   	outsl  %ds:(%rsi),(%dx)
     ee3:	75 73                	jne    f58 <_init-0xa8>
     ee5:	2d 75 6e 77 69       	sub    $0x69776e75,%eax
     eea:	6e                   	outsb  %ds:(%rsi),(%dx)
     eeb:	64 2d 74 61 62 6c    	fs sub $0x6c626174,%eax
     ef1:	65 73 20             	gs jae f14 <_init-0xec>
     ef4:	2d 66 73 74 61       	sub    $0x61747366,%eax
     ef9:	63 6b 2d             	movslq 0x2d(%rbx),%ebp
     efc:	70 72                	jo     f70 <_init-0x90>
     efe:	6f                   	outsl  %ds:(%rsi),(%dx)
     eff:	74 65                	je     f66 <_init-0x9a>
     f01:	63 74 6f 72          	movslq 0x72(%rdi,%rbp,2),%esi
     f05:	2d 73 74 72 6f       	sub    $0x6f727473,%eax
     f0a:	6e                   	outsb  %ds:(%rsi),(%dx)
     f0b:	67 20 2d 66 73 74 61 	and    %ch,0x61747366(%eip)        # 61748278 <_end+0x617440b0>
     f12:	63 6b 2d             	movslq 0x2d(%rbx),%ebp
     f15:	63 6c 61 73          	movslq 0x73(%rcx,%riz,2),%ebp
     f19:	68 2d 70 72 6f       	pushq  $0x6f72702d
     f1e:	74 65                	je     f85 <_init-0x7b>
     f20:	63 74 69 6f          	movslq 0x6f(%rcx,%rbp,2),%esi
     f24:	6e                   	outsb  %ds:(%rsi),(%dx)
     f25:	20 2d 66 63 66 2d    	and    %ch,0x2d666366(%rip)        # 2d667291 <_end+0x2d6630c9>
     f2b:	70 72                	jo     f9f <_init-0x61>
     f2d:	6f                   	outsl  %ds:(%rsi),(%dx)
     f2e:	74 65                	je     f95 <_init-0x6b>
     f30:	63 74 69 6f          	movslq 0x6f(%rcx,%rbp,2),%esi
     f34:	6e                   	outsb  %ds:(%rsi),(%dx)
     f35:	00 5f 53             	add    %bl,0x53(%rdi)
     f38:	43 5f                	rex.XB pop %r15
     f3a:	54                   	push   %rsp
     f3b:	48 52                	rex.W push %rdx
     f3d:	45                   	rex.RB
     f3e:	41                   	rex.B
     f3f:	44 5f                	rex.R pop %rdi
     f41:	52                   	push   %rdx
     f42:	4f                   	rex.WRXB
     f43:	42 55                	rex.X push %rbp
     f45:	53                   	push   %rbx
     f46:	54                   	push   %rsp
     f47:	5f                   	pop    %rdi
     f48:	50                   	push   %rax
     f49:	52                   	push   %rdx
     f4a:	49                   	rex.WB
     f4b:	4f 5f                	rex.WRXB pop %r15
     f4d:	50                   	push   %rax
     f4e:	52                   	push   %rdx
     f4f:	4f 54                	rex.WRXB push %r12
     f51:	45                   	rex.RB
     f52:	43 54                	rex.XB push %r12
     f54:	00 5f 47             	add    %bl,0x47(%rdi)
     f57:	5f                   	pop    %rdi
     f58:	66 70 6f             	data16 jo fca <_init-0x36>
     f5b:	73 5f                	jae    fbc <_init-0x44>
     f5d:	74 00                	je     f5f <_init-0xa1>
     f5f:	5f                   	pop    %rdi
     f60:	5f                   	pop    %rdi
     f61:	75 69                	jne    fcc <_init-0x34>
     f63:	6e                   	outsb  %ds:(%rsi),(%dx)
     f64:	74 5f                	je     fc5 <_init-0x3b>
     f66:	6c                   	insb   (%dx),%es:(%rdi)
     f67:	65 61                	gs (bad) 
     f69:	73 74                	jae    fdf <_init-0x21>
     f6b:	36 34 5f             	ss xor $0x5f,%al
     f6e:	74 00                	je     f70 <_init-0x90>
     f70:	77 63                	ja     fd5 <_init-0x2b>
     f72:	73 63                	jae    fd7 <_init-0x29>
     f74:	70 79                	jo     fef <_init-0x11>
     f76:	00 5f 43             	add    %bl,0x43(%rdi)
     f79:	68 61 72 54 00       	pushq  $0x547261
     f7e:	76 73                	jbe    ff3 <_init-0xd>
     f80:	77 70                	ja     ff2 <_init-0xe>
     f82:	72 69                	jb     fed <_init-0x13>
     f84:	6e                   	outsb  %ds:(%rsi),(%dx)
     f85:	74 66                	je     fed <_init-0x13>
     f87:	00 5f 53             	add    %bl,0x53(%rdi)
     f8a:	43 5f                	rex.XB pop %r15
     f8c:	4e 50                	rex.WRX push %rax
     f8e:	52                   	push   %rdx
     f8f:	4f                   	rex.WRXB
     f90:	43                   	rex.XB
     f91:	45 53                	rex.RB push %r11
     f93:	53                   	push   %rbx
     f94:	4f 52                	rex.WRXB push %r10
     f96:	53                   	push   %rbx
     f97:	5f                   	pop    %rdi
     f98:	4f                   	rex.WRXB
     f99:	4e                   	rex.WRX
     f9a:	4c                   	rex.WR
     f9b:	4e 00 69 6e          	rex.WRX add %r13b,0x6e(%rcx)
     f9f:	74 65                	je     1006 <_init+0x6>
     fa1:	67 72 61             	addr32 jb 1005 <_init+0x5>
     fa4:	6c                   	insb   (%dx),%es:(%rdi)
     fa5:	5f                   	pop    %rdi
     fa6:	63 6f 6e             	movslq 0x6e(%rdi),%ebp
     fa9:	73 74                	jae    101f <_init+0x1f>
     fab:	61                   	(bad)  
     fac:	6e                   	outsb  %ds:(%rsi),(%dx)
     fad:	74 3c                	je     feb <_init-0x15>
     faf:	62                   	(bad)  
     fb0:	6f                   	outsl  %ds:(%rsi),(%dx)
     fb1:	6f                   	outsl  %ds:(%rsi),(%dx)
     fb2:	6c                   	insb   (%dx),%es:(%rdi)
     fb3:	2c 20                	sub    $0x20,%al
     fb5:	74 72                	je     1029 <.plt+0x9>
     fb7:	75 65                	jne    101e <_init+0x1e>
     fb9:	3e 00 73 74          	add    %dh,%ds:0x74(%rbx)
     fbd:	72 74                	jb     1033 <.plt+0x13>
     fbf:	6f                   	outsl  %ds:(%rsi),(%dx)
     fc0:	75 6c                	jne    102e <.plt+0xe>
     fc2:	00 6f 70             	add    %ch,0x70(%rdi)
     fc5:	65 72 61             	gs jb  1029 <.plt+0x9>
     fc8:	74 6f                	je     1039 <.plt+0x19>
     fca:	72 20                	jb     fec <_init-0x14>
     fcc:	73 74                	jae    1042 <.plt+0x22>
     fce:	64 3a 3a             	cmp    %fs:(%rdx),%bh
     fd1:	69 6e 74 65 67 72 61 	imul   $0x61726765,0x74(%rsi),%ebp
     fd8:	6c                   	insb   (%dx),%es:(%rdi)
     fd9:	5f                   	pop    %rdi
     fda:	63 6f 6e             	movslq 0x6e(%rdi),%ebp
     fdd:	73 74                	jae    1053 <.plt+0x33>
     fdf:	61                   	(bad)  
     fe0:	6e                   	outsb  %ds:(%rsi),(%dx)
     fe1:	74 3c                	je     101f <_init+0x1f>
     fe3:	62                   	(bad)  
     fe4:	6f                   	outsl  %ds:(%rsi),(%dx)
     fe5:	6f                   	outsl  %ds:(%rsi),(%dx)
     fe6:	6c                   	insb   (%dx),%es:(%rdi)
     fe7:	2c 20                	sub    $0x20,%al
     fe9:	74 72                	je     105d <.plt+0x3d>
     feb:	75 65                	jne    1052 <.plt+0x32>
     fed:	3e 3a 3a             	cmp    %ds:(%rdx),%bh
     ff0:	76 61                	jbe    1053 <.plt+0x33>
     ff2:	6c                   	insb   (%dx),%es:(%rdi)
     ff3:	75 65                	jne    105a <.plt+0x3a>
     ff5:	5f                   	pop    %rdi
     ff6:	74 79                	je     1071 <.plt+0x51>
     ff8:	70 65                	jo     105f <.plt+0x3f>
     ffa:	00 77 6d             	add    %dh,0x6d(%rdi)
     ffd:	65 6d                	gs insl (%dx),%es:(%rdi)
     fff:	73 65                	jae    1066 <.plt+0x46>
    1001:	74 00                	je     1003 <_init+0x3>
    1003:	5f                   	pop    %rdi
    1004:	5a                   	pop    %rdx
    1005:	4e 53                	rex.WRX push %rbx
    1007:	74 31                	je     103a <.plt+0x1a>
    1009:	35 5f 5f 65 78       	xor    $0x78655f5f,%eax
    100e:	63 65 70             	movslq 0x70(%rbp),%esp
    1011:	74 69                	je     107c <.plt+0x5c>
    1013:	6f                   	outsl  %ds:(%rsi),(%dx)
    1014:	6e                   	outsb  %ds:(%rsi),(%dx)
    1015:	5f                   	pop    %rdi
    1016:	70 74                	jo     108c <.plt+0x6c>
    1018:	72 31                	jb     104b <.plt+0x2b>
    101a:	33 65 78             	xor    0x78(%rbp),%esp
    101d:	63 65 70             	movslq 0x70(%rbp),%esp
    1020:	74 69                	je     108b <.plt+0x6b>
    1022:	6f                   	outsl  %ds:(%rsi),(%dx)
    1023:	6e                   	outsb  %ds:(%rsi),(%dx)
    1024:	5f                   	pop    %rdi
    1025:	70 74                	jo     109b <.plt+0x7b>
    1027:	72 34                	jb     105d <.plt+0x3d>
    1029:	73 77                	jae    10a2 <.plt+0x82>
    102b:	61                   	(bad)  
    102c:	70 45                	jo     1073 <.plt+0x53>
    102e:	52                   	push   %rdx
    102f:	53                   	push   %rbx
    1030:	30 5f 00             	xor    %bl,0x0(%rdi)
    1033:	5f                   	pop    %rdi
    1034:	53                   	push   %rbx
    1035:	43 5f                	rex.XB pop %r15
    1037:	56                   	push   %rsi
    1038:	45 52                	rex.RB push %r10
    103a:	53                   	push   %rbx
    103b:	49                   	rex.WB
    103c:	4f                   	rex.WRXB
    103d:	4e 00 5f 5f          	rex.WRX add %r11b,0x5f(%rdi)
    1041:	69 73 6f 63 39 39 5f 	imul   $0x5f393963,0x6f(%rbx),%esi
    1048:	76 77                	jbe    10c1 <.plt+0xa1>
    104a:	73 63                	jae    10af <.plt+0x8f>
    104c:	61                   	(bad)  
    104d:	6e                   	outsb  %ds:(%rsi),(%dx)
    104e:	66 00 77 6f          	data16 add %dh,0x6f(%rdi)
    1052:	73 74                	jae    10c8 <.plt+0xa8>
    1054:	72 65                	jb     10bb <.plt+0x9b>
    1056:	61                   	(bad)  
    1057:	6d                   	insl   (%dx),%es:(%rdi)
    1058:	00 6e 65             	add    %ch,0x65(%rsi)
    105b:	67 61                	addr32 (bad) 
    105d:	74 69                	je     10c8 <.plt+0xa8>
    105f:	76 65                	jbe    10c6 <.plt+0xa6>
    1061:	5f                   	pop    %rdi
    1062:	73 69                	jae    10cd <.plt+0xad>
    1064:	67 6e                	outsb  %ds:(%esi),(%dx)
    1066:	00 66 77             	add    %ah,0x77(%rsi)
    1069:	69 64 65 00 5f 5f 6c 	imul   $0x6f6c5f5f,0x0(%rbp,%riz,2),%esp
    1070:	6f 
    1071:	63 6b 00             	movslq 0x0(%rbx),%ebp
    1074:	70 72                	jo     10e8 <.plt+0xc8>
    1076:	6f                   	outsl  %ds:(%rsi),(%dx)
    1077:	67 72 61             	addr32 jb 10db <.plt+0xbb>
    107a:	6d                   	insl   (%dx),%es:(%rdi)
    107b:	5f                   	pop    %rdi
    107c:	69 6e 76 6f 63 61 74 	imul   $0x7461636f,0x76(%rsi),%ebp
    1083:	69 6f 6e 5f 6e 61 6d 	imul   $0x6d616e5f,0x6e(%rdi),%ebp
    108a:	65 00 5f 53          	add    %bl,%gs:0x53(%rdi)
    108e:	43 5f                	rex.XB pop %r15
    1090:	53                   	push   %rbx
    1091:	50                   	push   %rax
    1092:	49                   	rex.WB
    1093:	4e 5f                	rex.WRX pop %rdi
    1095:	4c                   	rex.WR
    1096:	4f                   	rex.WRXB
    1097:	43                   	rex.XB
    1098:	4b 53                	rex.WXB push %r11
    109a:	00 5f 5f             	add    %bl,0x5f(%rdi)
    109d:	63 78 61             	movslq 0x61(%rax),%edi
    10a0:	5f                   	pop    %rdi
    10a1:	65 78 63             	gs js  1107 <__cxa_finalize@plt+0x7>
    10a4:	65 70 74             	gs jo  111b <pthread_barrier_init@plt+0xb>
    10a7:	69 6f 6e 5f 74 79 70 	imul   $0x7079745f,0x6e(%rdi),%ebp
    10ae:	65 00 5f 5a          	add    %bl,%gs:0x5a(%rdi)
    10b2:	4e 39 5f 5f          	rex.WRX cmp %r11,0x5f(%rdi)
    10b6:	67 6e                	outsb  %ds:(%esi),(%dx)
    10b8:	75 5f                	jne    1119 <pthread_barrier_init@plt+0x9>
    10ba:	63 78 78             	movslq 0x78(%rax),%edi
    10bd:	32 34 5f             	xor    (%rdi,%rbx,2),%dh
    10c0:	5f                   	pop    %rdi
    10c1:	6e                   	outsb  %ds:(%rsi),(%dx)
    10c2:	75 6d                	jne    1131 <pthread_join@plt+0x1>
    10c4:	65 72 69             	gs jb  1130 <pthread_join@plt>
    10c7:	63 5f 74             	movslq 0x74(%rdi),%ebx
    10ca:	72 61                	jb     112d <strerror@plt+0xd>
    10cc:	69 74 73 5f 69 6e 74 	imul   $0x65746e69,0x5f(%rbx,%rsi,2),%esi
    10d3:	65 
    10d4:	67 65 72 49          	addr32 gs jb 1121 <strerror@plt+0x1>
    10d8:	6d                   	insl   (%dx),%es:(%rdi)
    10d9:	45 31 31             	xor    %r14d,(%r9)
    10dc:	5f                   	pop    %rdi
    10dd:	5f                   	pop    %rdi
    10de:	69 73 5f 73 69 67 6e 	imul   $0x6e676973,0x5f(%rbx),%esi
    10e5:	65 64 45 00 5f 53    	gs add %r11b,%fs:0x53(%r15)
    10eb:	43 5f                	rex.XB pop %r15
    10ed:	55                   	push   %rbp
    10ee:	49                   	rex.WB
    10ef:	4e 54                	rex.WRX push %rsp
    10f1:	5f                   	pop    %rdi
    10f2:	4d                   	rex.WRB
    10f3:	41 58                	pop    %r8
    10f5:	00 5f 53             	add    %bl,0x53(%rdi)
    10f8:	43 5f                	rex.XB pop %r15
    10fa:	32 5f 50             	xor    0x50(%rdi),%bl
    10fd:	42 53                	rex.X push %rbx
    10ff:	5f                   	pop    %rdi
    1100:	54                   	push   %rsp
    1101:	52                   	push   %rdx
    1102:	41                   	rex.B
    1103:	43                   	rex.XB
    1104:	4b 00 73 65          	rex.WXB add %sil,0x65(%r11)
    1108:	74 76                	je     1180 <__cxa_atexit@plt>
    110a:	62                   	(bad)  
    110b:	75 66                	jne    1173 <pthread_mutex_unlock@plt+0x3>
    110d:	00 5f 5a             	add    %bl,0x5a(%rdi)
    1110:	4e 53                	rex.WRX push %rbx
    1112:	74 31                	je     1145 <pthread_create@plt+0x5>
    1114:	35 5f 5f 65 78       	xor    $0x78655f5f,%eax
    1119:	63 65 70             	movslq 0x70(%rbp),%esp
    111c:	74 69                	je     1187 <__cxa_atexit@plt+0x7>
    111e:	6f                   	outsl  %ds:(%rsi),(%dx)
    111f:	6e                   	outsb  %ds:(%rsi),(%dx)
    1120:	5f                   	pop    %rdi
    1121:	70 74                	jo     1197 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt+0x7>
    1123:	72 31                	jb     1156 <pthread_barrier_wait@plt+0x6>
    1125:	33 65 78             	xor    0x78(%rbp),%esp
    1128:	63 65 70             	movslq 0x70(%rbp),%esp
    112b:	74 69                	je     1196 <_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@plt+0x6>
    112d:	6f                   	outsl  %ds:(%rsi),(%dx)
    112e:	6e                   	outsb  %ds:(%rsi),(%dx)
    112f:	5f                   	pop    %rdi
    1130:	70 74                	jo     11a6 <_ZNSolsEPFRSoS_E@plt+0x6>
    1132:	72 44                	jb     1178 <pthread_mutex_unlock@plt+0x8>
    1134:	34 45                	xor    $0x45,%al
    1136:	76 00                	jbe    1138 <pthread_join@plt+0x8>
    1138:	5f                   	pop    %rdi
    1139:	75 6e                	jne    11a9 <_ZNSolsEPFRSoS_E@plt+0x9>
    113b:	75 73                	jne    11b0 <__stack_chk_fail@plt>
    113d:	65 64 32 00          	gs xor %fs:(%rax),%al
    1141:	5f                   	pop    %rdi
    1142:	53                   	push   %rbx
    1143:	43 5f                	rex.XB pop %r15
    1145:	52                   	push   %rdx
    1146:	41 57                	push   %r15
    1148:	5f                   	pop    %rdi
    1149:	53                   	push   %rbx
    114a:	4f                   	rex.WRXB
    114b:	43                   	rex.XB
    114c:	4b                   	rex.WXB
    114d:	45 54                	rex.RB push %r12
    114f:	53                   	push   %rbx
    1150:	00 5f 53             	add    %bl,0x53(%rdi)
    1153:	43 5f                	rex.XB pop %r15
    1155:	54                   	push   %rsp
    1156:	48 52                	rex.W push %rdx
    1158:	45                   	rex.RB
    1159:	41                   	rex.B
    115a:	44 53                	rex.R push %rbx
    115c:	00 70 75             	add    %dh,0x75(%rax)
    115f:	74 77                	je     11d8 <_ZNSt8ios_base4InitC1Ev@plt+0x8>
    1161:	63 68 61             	movslq 0x61(%rax),%ebp
    1164:	72 00                	jb     1166 <sleep@plt+0x6>
    1166:	5f                   	pop    %rdi
    1167:	53                   	push   %rbx
    1168:	43 5f                	rex.XB pop %r15
    116a:	54                   	push   %rsp
    116b:	48 52                	rex.W push %rdx
    116d:	45                   	rex.RB
    116e:	41                   	rex.B
    116f:	44 5f                	rex.R pop %rdi
    1171:	53                   	push   %rbx
    1172:	41                   	rex.B
    1173:	46                   	rex.RX
    1174:	45 5f                	rex.RB pop %r15
    1176:	46 55                	rex.RX push %rbp
    1178:	4e                   	rex.WRX
    1179:	43 54                	rex.XB push %r12
    117b:	49                   	rex.WB
    117c:	4f                   	rex.WRXB
    117d:	4e 53                	rex.WRX push %rbx
    117f:	00 5f 5a             	add    %bl,0x5a(%rdi)
    1182:	4e 39 5f 5f          	rex.WRX cmp %r11,0x5f(%rdi)
    1186:	67 6e                	outsb  %ds:(%esi),(%dx)
    1188:	75 5f                	jne    11e9 <_start+0x9>
    118a:	63 78 78             	movslq 0x78(%rax),%edi
    118d:	32 35 5f 5f 6e 75    	xor    0x756e5f5f(%rip),%dh        # 756e70f2 <_end+0x756e2f2a>
    1193:	6d                   	insl   (%dx),%es:(%rdi)
    1194:	65 72 69             	gs jb  1200 <_start+0x20>
    1197:	63 5f 74             	movslq 0x74(%rdi),%ebx
    119a:	72 61                	jb     11fd <_start+0x1d>
    119c:	69 74 73 5f 66 6c 6f 	imul   $0x616f6c66,0x5f(%rbx,%rsi,2),%esi
    11a3:	61 
    11a4:	74 69                	je     120f <_start+0x2f>
    11a6:	6e                   	outsb  %ds:(%rsi),(%dx)
    11a7:	67 49                	addr32 rex.WB
    11a9:	66 45 31 36          	xor    %r14w,(%r14)
    11ad:	5f                   	pop    %rdi
    11ae:	5f                   	pop    %rdi
    11af:	6d                   	insl   (%dx),%es:(%rdi)
    11b0:	61                   	(bad)  
    11b1:	78 5f                	js     1212 <deregister_tm_clones+0x2>
    11b3:	65 78 70             	gs js  1226 <deregister_tm_clones+0x16>
    11b6:	6f                   	outsl  %ds:(%rsi),(%dx)
    11b7:	6e                   	outsb  %ds:(%rsi),(%dx)
    11b8:	65 6e                	outsb  %gs:(%rsi),(%dx)
    11ba:	74 31                	je     11ed <_start+0xd>
    11bc:	30 45 00             	xor    %al,0x0(%rbp)
    11bf:	5f                   	pop    %rdi
    11c0:	53                   	push   %rbx
    11c1:	43 5f                	rex.XB pop %r15
    11c3:	57                   	push   %rdi
    11c4:	4f 52                	rex.WRXB push %r10
    11c6:	44 5f                	rex.R pop %rdi
    11c8:	42                   	rex.X
    11c9:	49 54                	rex.WB push %r12
    11cb:	00 5f 53             	add    %bl,0x53(%rdi)
    11ce:	43 5f                	rex.XB pop %r15
    11d0:	52                   	push   %rdx
    11d1:	45                   	rex.RB
    11d2:	47                   	rex.RXB
    11d3:	45 58                	rex.RB pop %r8
    11d5:	50                   	push   %rax
    11d6:	00 77 6d             	add    %dh,0x6d(%rdi)
    11d9:	65 6d                	gs insl (%dx),%es:(%rdi)
    11db:	63 6d 70             	movslq 0x70(%rbp),%ebp
    11de:	00 5f 5a             	add    %bl,0x5a(%rdi)
    11e1:	53                   	push   %rbx
    11e2:	74 35                	je     1219 <deregister_tm_clones+0x9>
    11e4:	77 63                	ja     1249 <register_tm_clones+0x9>
    11e6:	6c                   	insb   (%dx),%es:(%rdi)
    11e7:	6f                   	outsl  %ds:(%rsi),(%dx)
    11e8:	67 00 5f 53          	add    %bl,0x53(%edi)
    11ec:	43 5f                	rex.XB pop %r15
    11ee:	41 53                	push   %r11
    11f0:	59                   	pop    %rcx
    11f1:	4e                   	rex.WRX
    11f2:	43                   	rex.XB
    11f3:	48 52                	rex.W push %rdx
    11f5:	4f                   	rex.WRXB
    11f6:	4e                   	rex.WRX
    11f7:	4f 55                	rex.WRXB push %r13
    11f9:	53                   	push   %rbx
    11fa:	5f                   	pop    %rdi
    11fb:	49                   	rex.WB
    11fc:	4f 00 5f 53          	rex.WRXB add %r11b,0x53(%r15)
    1200:	43 5f                	rex.XB pop %r15
    1202:	43                   	rex.XB
    1203:	48                   	rex.W
    1204:	41 52                	push   %r10
    1206:	43                   	rex.XB
    1207:	4c                   	rex.WR
    1208:	41 53                	push   %r11
    120a:	53                   	push   %rbx
    120b:	5f                   	pop    %rdi
    120c:	4e                   	rex.WRX
    120d:	41                   	rex.B
    120e:	4d                   	rex.WRB
    120f:	45 5f                	rex.RB pop %r15
    1211:	4d                   	rex.WRB
    1212:	41 58                	pop    %r8
    1214:	00 5f 5a             	add    %bl,0x5a(%rdi)
    1217:	4e 53                	rex.WRX push %rbx
    1219:	74 31                	je     124c <register_tm_clones+0xc>
    121b:	31 63 68             	xor    %esp,0x68(%rbx)
    121e:	61                   	(bad)  
    121f:	72 5f                	jb     1280 <__do_global_dtors_aux>
    1221:	74 72                	je     1295 <__do_global_dtors_aux+0x15>
    1223:	61                   	(bad)  
    1224:	69 74 73 49 63 45 34 	imul   $0x63344563,0x49(%rbx,%rsi,2),%esi
    122b:	63 
    122c:	6f                   	outsl  %ds:(%rsi),(%dx)
    122d:	70 79                	jo     12a8 <__do_global_dtors_aux+0x28>
    122f:	45 50                	rex.RB push %r8
    1231:	63 50 4b             	movslq 0x4b(%rax),%edx
    1234:	63 6d 00             	movslq 0x0(%rbp),%ebp
    1237:	5f                   	pop    %rdi
    1238:	53                   	push   %rbx
    1239:	43 5f                	rex.XB pop %r15
    123b:	4c                   	rex.WR
    123c:	45 56                	rex.RB push %r14
    123e:	45                   	rex.RB
    123f:	4c 31 5f 44          	xor    %r11,0x44(%rdi)
    1243:	43                   	rex.XB
    1244:	41                   	rex.B
    1245:	43                   	rex.XB
    1246:	48                   	rex.W
    1247:	45 5f                	rex.RB pop %r15
    1249:	41 53                	push   %r11
    124b:	53                   	push   %rbx
    124c:	4f                   	rex.WRXB
    124d:	43 00 66 69          	rex.XB add %spl,0x69(%r14)
    1251:	6e                   	outsb  %ds:(%rsi),(%dx)
    1252:	64 00 5f 53          	add    %bl,%fs:0x53(%rdi)
    1256:	43 5f                	rex.XB pop %r15
    1258:	4c                   	rex.WR
    1259:	45 56                	rex.RB push %r14
    125b:	45                   	rex.RB
    125c:	4c 33 5f 43          	xor    0x43(%rdi),%r11
    1260:	41                   	rex.B
    1261:	43                   	rex.XB
    1262:	48                   	rex.W
    1263:	45 5f                	rex.RB pop %r15
    1265:	4c                   	rex.WR
    1266:	49                   	rex.WB
    1267:	4e                   	rex.WRX
    1268:	45 53                	rex.RB push %r11
    126a:	49 5a                	rex.WB pop %r10
    126c:	45 00 5f 53          	add    %r11b,0x53(%r15)
    1270:	43 5f                	rex.XB pop %r15
    1272:	54                   	push   %rsp
    1273:	48 52                	rex.W push %rdx
    1275:	45                   	rex.RB
    1276:	41                   	rex.B
    1277:	44 5f                	rex.R pop %rdi
    1279:	53                   	push   %rbx
    127a:	54                   	push   %rsp
    127b:	41                   	rex.B
    127c:	43                   	rex.XB
    127d:	4b 5f                	rex.WXB pop %r15
    127f:	4d                   	rex.WRB
    1280:	49                   	rex.WB
    1281:	4e 00 5f 5f          	rex.WRX add %r11b,0x5f(%rdi)
    1285:	75 69                	jne    12f0 <_Z3foov+0x27>
    1287:	6e                   	outsb  %ds:(%rsi),(%dx)
    1288:	74 36                	je     12c0 <frame_dummy>
    128a:	34 5f                	xor    $0x5f,%al
    128c:	74 00                	je     128e <__do_global_dtors_aux+0xe>
    128e:	72 65                	jb     12f5 <_Z3foov+0x2c>
    1290:	6e                   	outsb  %ds:(%rsi),(%dx)
    1291:	61                   	(bad)  
    1292:	6d                   	insl   (%dx),%es:(%rdi)
    1293:	65 00 5f 5f          	add    %bl,%gs:0x5f(%rdi)
    1297:	70 72                	jo     130b <_Z10threadFuncPv+0xf>
    1299:	69 6f 72 69 74 79 00 	imul   $0x797469,0x72(%rdi),%ebp
    12a0:	6f                   	outsl  %ds:(%rsi),(%dx)
    12a1:	70 74                	jo     1317 <_Z10threadFuncPv+0x1b>
    12a3:	69 6e 64 00 5f 53 43 	imul   $0x43535f00,0x64(%rsi),%ebp
    12aa:	5f                   	pop    %rdi
    12ab:	58                   	pop    %rax
    12ac:	4f 50                	rex.WRXB push %r8
    12ae:	45                   	rex.RB
    12af:	4e 5f                	rex.WRX pop %rdi
    12b1:	55                   	push   %rbp
    12b2:	4e                   	rex.WRX
    12b3:	49 58                	rex.WB pop %r8
    12b5:	00 5f 5a             	add    %bl,0x5a(%rdi)
    12b8:	4e 53                	rex.WRX push %rbx
    12ba:	74 31                	je     12ed <_Z3foov+0x24>
    12bc:	35 5f 5f 65 78       	xor    $0x78655f5f,%eax
    12c1:	63 65 70             	movslq 0x70(%rbp),%esp
    12c4:	74 69                	je     132f <_Z10threadFuncPv+0x33>
    12c6:	6f                   	outsl  %ds:(%rsi),(%dx)
    12c7:	6e                   	outsb  %ds:(%rsi),(%dx)
    12c8:	5f                   	pop    %rdi
{
    12c9:	70 74                	jo     133f <_Z10threadFuncPv+0x43>
    12cb:	72 31                	jb     12fe <_Z10threadFuncPv+0x2>
    12cd:	33 65 78             	xor    0x78(%rbp),%esp
    12d0:	63 65 70             	movslq 0x70(%rbp),%esp
  std::cout << "calling foo" << std::endl;
    12d3:	74 69                	je     133e <_Z10threadFuncPv+0x42>
    12d5:	6f                   	outsl  %ds:(%rsi),(%dx)
    12d6:	6e                   	outsb  %ds:(%rsi),(%dx)
    12d7:	5f                   	pop    %rdi
    12d8:	70 74                	jo     134e <main+0x8>
    12da:	72 43                	jb     131f <_Z10threadFuncPv+0x23>
    12dc:	34 45                	xor    $0x45,%al
    12de:	76 00                	jbe    12e0 <_Z3foov+0x17>
    12e0:	5f                   	pop    %rdi
    12e1:	5a                   	pop    %rdx
    12e2:	4e 53                	rex.WRX push %rbx
    12e4:	74 31                	je     1317 <_Z10threadFuncPv+0x1b>
    12e6:	31 63 68             	xor    %esp,0x68(%rbx)
    12e9:	61                   	(bad)  
    12ea:	72 5f                	jb     134b <main+0x5>
    12ec:	74 72                	je     1360 <main+0x1a>
    12ee:	61                   	(bad)  
    12ef:	69 74 73 49 63 45 33 	imul   $0x65334563,0x49(%rbx,%rsi,2),%esi
    12f6:	65 
    12f7:	6f                   	outsl  %ds:(%rsi),(%dx)
    12f8:	66 45 76 00          	data16 rex.RB jbe 12fc <_Z10threadFuncPv>
{
    12fc:	5f                   	pop    %rdi
    12fd:	4d 5f                	rex.WRB pop %r15
    12ff:	72 65                	jb     1366 <main+0x20>
    1301:	6c                   	insb   (%dx),%es:(%rdi)
    1302:	65 61                	gs (bad) 
    1304:	73 65                	jae    136b <main+0x25>
    1306:	00 70 74             	add    %dh,0x74(%rax)
    1309:	68 72 65 61 64       	pushq  $0x64616572
  pthread_mutex_lock(&lock);
    130e:	5f                   	pop    %rdi
    130f:	74 00                	je     1311 <_Z10threadFuncPv+0x15>
    1311:	5f                   	pop    %rdi
    1312:	66 6c                	data16 insb (%dx),%es:(%rdi)
    1314:	61                   	(bad)  
    1315:	67 73 32             	addr32 jae 134a <main+0x4>
  foo();
    1318:	00 5f 53             	add    %bl,0x53(%rdi)
    131b:	43 5f                	rex.XB pop %r15
  pthread_mutex_unlock(&lock);
    131d:	50                   	push   %rax
    131e:	49                   	rex.WB
    131f:	49 5f                	rex.WB pop %r15
    1321:	49                   	rex.WB
    1322:	4e 54                	rex.WRX push %rsp
    1324:	45 52                	rex.RB push %r10
    1326:	4e                   	rex.WRX
    1327:	45 54                	rex.RB push %r12
  sleep(2);
    1329:	5f                   	pop    %rdi
    132a:	53                   	push   %rbx
    132b:	54                   	push   %rsp
    132c:	52                   	push   %rdx
    132d:	45                   	rex.RB
    132e:	41                   	rex.B
    132f:	4d 00 5f 53          	rex.WRB add %r11b,0x53(%r15)
  pthread_barrier_wait(&barrier);
    1333:	43 5f                	rex.XB pop %r15
    1335:	56                   	push   %rsi
    1336:	36 5f                	ss pop %rdi
    1338:	49                   	rex.WB
    1339:	4c 50                	rex.WR push %rax
    133b:	33 32                	xor    (%rdx),%esi
    133d:	5f                   	pop    %rdi
    133e:	4f                   	rex.WRXB
  return NULL;
    133f:	46                   	rex.RX
    1340:	46                   	rex.RX
    1341:	42                   	rex.X
    1342:	49                   	rex.WB
    1343:	47 00 5f 5f          	rex.RXB add %r11b,0x5f(%r15)
{
    1347:	67 6e                	outsb  %ds:(%esi),(%dx)
    1349:	75 5f                	jne    13aa <main+0x64>
    134b:	64 65 62             	fs gs (bad) 
    134e:	75 67                	jne    13b7 <main+0x71>
    1350:	00 5f 5f             	add    %bl,0x5f(%rdi)
    1353:	75 69                	jne    13be <main+0x78>
    1355:	6e                   	outsb  %ds:(%rsi),(%dx)
    1356:	74 5f                	je     13b7 <main+0x71>
    1358:	6c                   	insb   (%dx),%es:(%rdi)
    1359:	65 61                	gs (bad) 
    135b:	73 74                	jae    13d1 <main+0x8b>
    135d:	33 32                	xor    (%rdx),%esi
    135f:	5f                   	pop    %rdi
    1360:	74 00                	je     1362 <main+0x1c>
  pthread_barrier_init(&barrier, NULL, NUM_THREAD);
    1362:	5f                   	pop    %rdi
    1363:	53                   	push   %rbx
    1364:	43 5f                	rex.XB pop %r15
    1366:	54                   	push   %rsp
    1367:	52                   	push   %rdx
    1368:	41                   	rex.B
    1369:	43                   	rex.XB
    136a:	45 5f                	rex.RB pop %r15
    136c:	55                   	push   %rbp
    136d:	53                   	push   %rbx
    136e:	45 52                	rex.RB push %r10
    1370:	5f                   	pop    %rdi
    1371:	45 56                	rex.RB push %r14
    1373:	45                   	rex.RB
    1374:	4e 54                	rex.WRX push %rsp
    1376:	5f                   	pop    %rdi
    1377:	4d                   	rex.WRB
  for (int i = 0; i < NUM_THREAD; i++) {
    1378:	41 58                	pop    %r8
    137a:	00 5f 53             	add    %bl,0x53(%rdi)
    137d:	43 5f                	rex.XB pop %r15
    137f:	47                   	rex.RXB
    1380:	45 54                	rex.RB push %r12
    1382:	47 52                	rex.RXB push %r10
    1384:	5f                   	pop    %rdi
    int err = pthread_create(&threadId[i], NULL, &threadFunc, NULL);
    1385:	52                   	push   %rdx
    1386:	5f                   	pop    %rdi
    1387:	53                   	push   %rbx
    1388:	49 5a                	rex.WB pop %r10
    138a:	45 5f                	rex.RB pop %r15
    138c:	4d                   	rex.WRB
    138d:	41 58                	pop    %r8
    138f:	00 36                	add    %dh,(%rsi)
    1391:	6c                   	insb   (%dx),%es:(%rdi)
    1392:	64 69 76 5f 74 00 5f 	imul   $0x495f0074,%fs:0x5f(%rsi),%esi
    1399:	49 
    139a:	4f 5f                	rex.WRXB pop %r15
    139c:	72 65                	jb     1403 <main+0xbd>
    139e:	61                   	(bad)  
    139f:	64 5f                	fs pop %rdi
    13a1:	62 61                	(bad)  
    13a3:	73 65                	jae    140a <main+0xc4>
    13a5:	00 5f 53             	add    %bl,0x53(%rdi)
    13a8:	43 5f                	rex.XB pop %r15
    13aa:	56                   	push   %rsi
    13ab:	37                   	(bad)  
    13ac:	5f                   	pop    %rdi
    13ad:	49                   	rex.WB
    13ae:	4c 50                	rex.WR push %rax
    13b0:	33 32                	xor    (%rdx),%esi
    if (err)
    13b2:	5f                   	pop    %rdi
    13b3:	4f                   	rex.WRXB
    13b4:	46                   	rex.RX
    13b5:	46                   	rex.RX
    13b6:	42                   	rex.X
    13b7:	49                   	rex.WB
      std::cout << "Thread creation failed : " << strerror(err);
    13b8:	47 00 5f 53          	rex.RXB add %r11b,0x53(%r15)
    13bc:	43 5f                	rex.XB pop %r15
    13be:	53                   	push   %rbx
    13bf:	45                   	rex.RB
    13c0:	4d                   	rex.WRB
    13c1:	41 50                	push   %r8
    13c3:	48                   	rex.W
    13c4:	4f 52                	rex.WRXB push %r10
    13c6:	45 53                	rex.RB push %r11
    13c8:	00 5f 53             	add    %bl,0x53(%rdi)
    13cb:	43 5f                	rex.XB pop %r15
    13cd:	4c                   	rex.WR
    13ce:	45 56                	rex.RB push %r14
    13d0:	45                   	rex.RB
    13d1:	4c 34 5f             	rex.WR xor $0x5f,%al
    13d4:	43                   	rex.XB
    13d5:	41                   	rex.B
    13d6:	43                   	rex.XB
    13d7:	48                   	rex.W
    13d8:	45 5f                	rex.RB pop %r15
    13da:	53                   	push   %rbx
    13db:	49 5a                	rex.WB pop %r10
    13dd:	45 00 5f 5a          	add    %r11b,0x5a(%r15)
    13e1:	53                   	push   %rbx
    13e2:	74 34                	je     1418 <main+0xd2>
      return err;
    13e4:	63 65 72             	movslq 0x72(%rbp),%esp
    13e7:	72 00                	jb     13e9 <main+0xa3>
  for (int i = 0; i < NUM_THREAD; i++) {
    13e9:	63 68 61             	movslq 0x61(%rax),%ebp
    13ec:	72 33                	jb     1421 <main+0xdb>
  for (int i = 0; i < NUM_THREAD; i++) {
    13ee:	32 5f 74             	xor    0x74(%rdi),%bl
    13f1:	00 5f 5a             	add    %bl,0x5a(%rdi)
    13f4:	4e 53                	rex.WRX push %rbx
    13f6:	74 31                	je     1429 <main+0xe3>
    13f8:	31 63 68             	xor    %esp,0x68(%rbx)
    pthread_join(threadId[i], NULL);
    13fb:	61                   	(bad)  
    13fc:	72 5f                	jb     145d <_Z41__static_initialization_and_destruction_0ii+0x25>
    13fe:	74 72                	je     1472 <_Z41__static_initialization_and_destruction_0ii+0x3a>
    1400:	61                   	(bad)  
    1401:	69 74 73 49 77 45 34 	imul   $0x66344577,0x49(%rbx,%rsi,2),%esi
    1408:	66 
    1409:	69 6e 64 45 50 4b 77 	imul   $0x774b5045,0x64(%rsi),%ebp
    1410:	6d                   	insl   (%dx),%es:(%rdi)
    1411:	52                   	push   %rdx
  for (int i = 0; i < NUM_THREAD; i++) {
    1412:	53                   	push   %rbx
    1413:	31 5f 00             	xor    %ebx,0x0(%rdi)
    1416:	5f                   	pop    %rdi
    1417:	53                   	push   %rbx
  return 0;
    1418:	43 5f                	rex.XB pop %r15
    141a:	54                   	push   %rsp
    141b:	48 52                	rex.W push %rdx
}
    141d:	45                   	rex.RB
    141e:	41                   	rex.B
    141f:	44 5f                	rex.R pop %rdi
    1421:	50                   	push   %rax
    1422:	52                   	push   %rdx
    1423:	4f                   	rex.WRXB
    1424:	43                   	rex.XB
    1425:	45 53                	rex.RB push %r11
    1427:	53                   	push   %rbx
    1428:	5f                   	pop    %rdi
    1429:	53                   	push   %rbx
    142a:	48                   	rex.W
    142b:	41 52                	push   %r10
    142d:	45                   	rex.RB
    142e:	44 00 77 63          	add    %r14b,0x63(%rdi)
    1432:	73 74                	jae    14a8 <__libc_csu_init+0x8>
    1434:	6f                   	outsl  %ds:(%rsi),(%dx)
    1435:	6d                   	insl   (%dx),%es:(%rdi)
    1436:	62 73                	(bad)  
    1438:	00 74 6d 5f          	add    %dh,0x5f(%rbp,%rbp,2)
    143c:	67 6d                	insl   (%dx),%es:(%edi)
    143e:	74 6f                	je     14af <__libc_csu_init+0xf>
    1440:	66 66 00 5f 53       	data16 data16 add %bl,0x53(%rdi)
    1445:	43 5f                	rex.XB pop %r15
    1447:	4d 55                	rex.WRB push %r13
    1449:	4c 54                	rex.WR push %rsp
    144b:	49 5f                	rex.WB pop %r15
    144d:	50                   	push   %rax
    144e:	52                   	push   %rdx
    144f:	4f                   	rex.WRXB
    1450:	43                   	rex.XB
    1451:	45 53                	rex.RB push %r11
    1453:	53                   	push   %rbx
    1454:	00 5f 53             	add    %bl,0x53(%rdi)
    1457:	43 5f                	rex.XB pop %r15
    1459:	55                   	push   %rbp
    145a:	53                   	push   %rbx
    145b:	48 52                	rex.W push %rdx
    145d:	54                   	push   %rsp
    145e:	5f                   	pop    %rdi
    145f:	4d                   	rex.WRB
    1460:	41 58                	pop    %r8
    1462:	00 75 69             	add    %dh,0x69(%rbp)
    1465:	6e                   	outsb  %ds:(%rsi),(%dx)
    1466:	74 70                	je     14d8 <__libc_csu_init+0x38>
    1468:	74 72                	je     14dc <__libc_csu_init+0x3c>
    146a:	5f                   	pop    %rdi
    146b:	74 00                	je     146d <_Z41__static_initialization_and_destruction_0ii+0x35>
    146d:	5f                   	pop    %rdi
    146e:	5f                   	pop    %rdi
    146f:	73 69                	jae    14da <__libc_csu_init+0x3a>
    1471:	7a 65                	jp     14d8 <__libc_csu_init+0x38>
    1473:	00 70 69             	add    %dh,0x69(%rax)
    1476:	65 63 65 77          	movslq %gs:0x77(%rbp),%esp
    147a:	69 73 65 5f 63 6f 6e 	imul   $0x6e6f635f,0x65(%rbx),%esi
    1481:	73 74                	jae    14f7 <__libc_csu_init+0x57>
    1483:	72 75                	jb     14fa <__libc_csu_init+0x5a>
    1485:	63 74 5f 74          	movslq 0x74(%rdi,%rbx,2),%esi
    1489:	00 65 71             	add    %ah,0x71(%rbp)
    148c:	5f                   	pop    %rdi
    148d:	69 6e 74 5f 74 79 70 	imul   $0x7079745f,0x74(%rsi),%ebp
    1494:	65 00 5f 5a          	add    %bl,%gs:0x5a(%rdi)
    1498:	4e 53                	rex.WRX push %rbx
    149a:	74 31                	je     14cd <__libc_csu_init+0x2d>
    149c:	31 63 68             	xor    %esp,0x68(%rbx)
    149f:	61                   	(bad)  
    14a0:	72 5f                	jb     1501 <__libc_csu_init+0x61>
    14a2:	74 72                	je     1516 <__libc_csu_fini+0x6>
    14a4:	61                   	(bad)  
    14a5:	69 74 73 49 77 45 36 	imul   $0x6c364577,0x49(%rbx,%rsi,2),%esi
    14ac:	6c 
    14ad:	65 6e                	outsb  %gs:(%rsi),(%dx)
    14af:	67 74 68             	addr32 je 151a <_fini+0x2>
    14b2:	45 50                	rex.RB push %r8
    14b4:	4b 77 00             	rex.WXB ja 14b7 <__libc_csu_init+0x17>
    14b7:	5f                   	pop    %rdi
    14b8:	5a                   	pop    %rdx
    14b9:	4e                   	rex.WRX
    14ba:	4b 53                	rex.WXB push %r11
    14bc:	74 31                	je     14ef <__libc_csu_init+0x4f>
    14be:	35 5f 5f 65 78       	xor    $0x78655f5f,%eax
    14c3:	63 65 70             	movslq 0x70(%rbp),%esp
    14c6:	74 69                	je     1531 <_fini+0x19>
    14c8:	6f                   	outsl  %ds:(%rsi),(%dx)
    14c9:	6e                   	outsb  %ds:(%rsi),(%dx)
    14ca:	5f                   	pop    %rdi
    14cb:	70 74                	jo     1541 <_fini+0x29>
    14cd:	72 31                	jb     1500 <__libc_csu_init+0x60>
    14cf:	33 65 78             	xor    0x78(%rbp),%esp
    14d2:	63 65 70             	movslq 0x70(%rbp),%esp
    14d5:	74 69                	je     1540 <_fini+0x28>
    14d7:	6f                   	outsl  %ds:(%rsi),(%dx)
    14d8:	6e                   	outsb  %ds:(%rsi),(%dx)
    14d9:	5f                   	pop    %rdi
    14da:	70 74                	jo     1550 <_fini+0x38>
    14dc:	72 36                	jb     1514 <__libc_csu_fini+0x4>
    14de:	5f                   	pop    %rdi
    14df:	4d 5f                	rex.WRB pop %r15
    14e1:	67 65 74 45          	addr32 gs je 152a <_fini+0x12>
    14e5:	76 00                	jbe    14e7 <__libc_csu_init+0x47>
    14e7:	5f                   	pop    %rdi
    14e8:	5f                   	pop    %rdi
    14e9:	66 6c                	data16 insb (%dx),%es:(%rdi)
    14eb:	6f                   	outsl  %ds:(%rsi),(%dx)
    14ec:	61                   	(bad)  
    14ed:	74 31                	je     1520 <_fini+0x8>
    14ef:	32 38                	xor    (%rax),%bh
    14f1:	00 5f 53             	add    %bl,0x53(%rdi)
    14f4:	43 5f                	rex.XB pop %r15
    14f6:	55                   	push   %rbp
    14f7:	53                   	push   %rbx
    14f8:	45 52                	rex.RB push %r10
    14fa:	5f                   	pop    %rdi
    14fb:	47 52                	rex.RXB push %r10
    14fd:	4f 55                	rex.WRXB push %r13
    14ff:	50                   	push   %rax
    1500:	53                   	push   %rbx
    1501:	00 5f 53             	add    %bl,0x53(%rdi)
    1504:	43 5f                	rex.XB pop %r15
    1506:	32 5f 4c             	xor    0x4c(%rdi),%bl
    1509:	4f                   	rex.WRXB
    150a:	43                   	rex.XB
    150b:	41                   	rex.B
    150c:	4c                   	rex.WR
    150d:	45                   	rex.RB
    150e:	44                   	rex.R
    150f:	45                   	rex.RB
    1510:	46 00 5f 53          	rex.RX add %r11b,0x53(%rdi)
    1514:	43 5f                	rex.XB pop %r15
    1516:	4c                   	rex.WR
    1517:	49                   	rex.WB
    1518:	4e                   	rex.WRX
    1519:	45 5f                	rex.RB pop %r15
    151b:	4d                   	rex.WRB
    151c:	41 58                	pop    %r8
    151e:	00 5f 53             	add    %bl,0x53(%rdi)
    1521:	5f                   	pop    %rdi
    1522:	72 65                	jb     1589 <_fini+0x71>
    1524:	66 63 6f 75          	movslq 0x75(%rdi),%bp
    1528:	6e                   	outsb  %ds:(%rsi),(%dx)
    1529:	74 00                	je     152b <_fini+0x13>
    152b:	5f                   	pop    %rdi
    152c:	6f                   	outsl  %ds:(%rsi),(%dx)
    152d:	6c                   	insb   (%dx),%es:(%rdi)
    152e:	64 5f                	fs pop %rdi
    1530:	6f                   	outsl  %ds:(%rsi),(%dx)
    1531:	66 66 73 65          	data16 data16 jae 159a <_fini+0x82>
    1535:	74 00                	je     1537 <_fini+0x1f>
    1537:	5f                   	pop    %rdi
    1538:	5a                   	pop    %rdx
    1539:	4e 53                	rex.WRX push %rbx
    153b:	74 31                	je     156e <_fini+0x56>
    153d:	37                   	(bad)  
    153e:	69 6e 74 65 67 72 61 	imul   $0x61726765,0x74(%rsi),%ebp
    1545:	6c                   	insb   (%dx),%es:(%rdi)
    1546:	5f                   	pop    %rdi
    1547:	63 6f 6e             	movslq 0x6e(%rdi),%ebp
    154a:	73 74                	jae    15c0 <_fini+0xa8>
    154c:	61                   	(bad)  
    154d:	6e                   	outsb  %ds:(%rsi),(%dx)
    154e:	74 49                	je     1599 <_fini+0x81>
    1550:	62                   	(bad)  
    1551:	4c 62                	rex.WR (bad) 
    1553:	30 45 45             	xor    %al,0x45(%rbp)
    1556:	35 76 61 6c 75       	xor    $0x756c6176,%eax
    155b:	65 45 00 5f 53       	add    %r11b,%gs:0x53(%r15)
    1560:	43 5f                	rex.XB pop %r15
    1562:	58                   	pop    %rax
    1563:	4f 50                	rex.WRXB push %r8
    1565:	45                   	rex.RB
    1566:	4e 5f                	rex.WRX pop %rdi
    1568:	52                   	push   %rdx
    1569:	45                   	rex.RB
    156a:	41                   	rex.B
    156b:	4c 54                	rex.WR push %rsp
    156d:	49                   	rex.WB
    156e:	4d                   	rex.WRB
    156f:	45 00 66 73          	add    %r12b,0x73(%r14)
    1573:	65 74 70             	gs je  15e6 <_fini+0xce>
    1576:	6f                   	outsl  %ds:(%rsi),(%dx)
    1577:	73 00                	jae    1579 <_fini+0x61>
    1579:	5f                   	pop    %rdi
    157a:	53                   	push   %rbx
    157b:	43 5f                	rex.XB pop %r15
    157d:	53                   	push   %rbx
    157e:	49                   	rex.WB
    157f:	47                   	rex.RXB
    1580:	4e                   	rex.WRX
    1581:	41                   	rex.B
    1582:	4c 53                	rex.WR push %rbx
    1584:	00 69 6e             	add    %ch,0x6e(%rcx)
    1587:	74 5f                	je     15e8 <_fini+0xd0>
    1589:	6e                   	outsb  %ds:(%rsi),(%dx)
    158a:	5f                   	pop    %rdi
    158b:	73 65                	jae    15f2 <_fini+0xda>
    158d:	70 5f                	jo     15ee <_fini+0xd6>
    158f:	62                   	(bad)  
    1590:	79 5f                	jns    15f1 <_fini+0xd9>
    1592:	73 70                	jae    1604 <_fini+0xec>
    1594:	61                   	(bad)  
    1595:	63 65 00             	movslq 0x0(%rbp),%esp
    1598:	5f                   	pop    %rdi
    1599:	54                   	push   %rsp
    159a:	72 61                	jb     15fd <_fini+0xe5>
    159c:	69 74 73 00 5f 53 43 	imul   $0x5f43535f,0x0(%rbx,%rsi,2),%esi
    15a3:	5f 
    15a4:	4d                   	rex.WRB
    15a5:	4f                   	rex.WRXB
    15a6:	4e                   	rex.WRX
    15a7:	4f 54                	rex.WRXB push %r12
    15a9:	4f                   	rex.WRXB
    15aa:	4e                   	rex.WRX
    15ab:	49                   	rex.WB
    15ac:	43 5f                	rex.XB pop %r15
    15ae:	43                   	rex.XB
    15af:	4c                   	rex.WR
    15b0:	4f                   	rex.WRXB
    15b1:	43                   	rex.XB
    15b2:	4b 00 5f 5a          	rex.WXB add %bl,0x5a(%r15)
    15b6:	4e                   	rex.WRX
    15b7:	4b 53                	rex.WXB push %r11
    15b9:	74 31                	je     15ec <_fini+0xd4>
    15bb:	37                   	(bad)  
    15bc:	69 6e 74 65 67 72 61 	imul   $0x61726765,0x74(%rsi),%ebp
    15c3:	6c                   	insb   (%dx),%es:(%rdi)
    15c4:	5f                   	pop    %rdi
    15c5:	63 6f 6e             	movslq 0x6e(%rdi),%ebp
    15c8:	73 74                	jae    163e <_fini+0x126>
    15ca:	61                   	(bad)  
    15cb:	6e                   	outsb  %ds:(%rsi),(%dx)
    15cc:	74 49                	je     1617 <_fini+0xff>
    15ce:	62                   	(bad)  
    15cf:	4c 62                	rex.WR (bad) 
    15d1:	30 45 45             	xor    %al,0x45(%rbp)
    15d4:	63 76 62             	movslq 0x62(%rsi),%esi
    15d7:	45 76 00             	rex.RB jbe 15da <_fini+0xc2>
    15da:	5f                   	pop    %rdi
    15db:	53                   	push   %rbx
    15dc:	43 5f                	rex.XB pop %r15
    15de:	52                   	push   %rdx
    15df:	54                   	push   %rsp
    15e0:	53                   	push   %rbx
    15e1:	49                   	rex.WB
    15e2:	47 5f                	rex.RXB pop %r15
    15e4:	4d                   	rex.WRB
    15e5:	41 58                	pop    %r8
    15e7:	00 5f 5f             	add    %bl,0x5f(%rdi)
    15ea:	69 6e 69 74 69 61 6c 	imul   $0x6c616974,0x69(%rsi),%ebp
    15f1:	69 7a 65 5f 70 00 5f 	imul   $0x5f00705f,0x65(%rdx),%edi
    15f8:	53                   	push   %rbx
    15f9:	43 5f                	rex.XB pop %r15
    15fb:	46                   	rex.RX
    15fc:	49                   	rex.WB
    15fd:	4c                   	rex.WR
    15fe:	45 5f                	rex.RB pop %r15
    1600:	41 54                	push   %r12
    1602:	54                   	push   %rsp
    1603:	52                   	push   %rdx
    1604:	49                   	rex.WB
    1605:	42 55                	rex.X push %rbp
    1607:	54                   	push   %rsp
    1608:	45 53                	rex.RB push %r11
    160a:	00 5f 5f             	add    %bl,0x5f(%rdi)
    160d:	65 6c                	gs insb (%dx),%es:(%rdi)
    160f:	69 73 69 6f 6e 00 5f 	imul   $0x5f006e6f,0x69(%rbx),%esi
    1616:	53                   	push   %rbx
    1617:	43 5f                	rex.XB pop %r15
    1619:	55                   	push   %rbp
    161a:	53                   	push   %rbx
    161b:	45 52                	rex.RB push %r10
    161d:	5f                   	pop    %rdi
    161e:	47 52                	rex.RXB push %r10
    1620:	4f 55                	rex.WRXB push %r13
    1622:	50                   	push   %rax
    1623:	53                   	push   %rbx
    1624:	5f                   	pop    %rdi
    1625:	52                   	push   %rdx
    1626:	00 5f 53             	add    %bl,0x53(%rdi)
    1629:	43 5f                	rex.XB pop %r15
    162b:	58                   	pop    %rax
    162c:	4f 50                	rex.WRXB push %r8
    162e:	45                   	rex.RB
    162f:	4e 5f                	rex.WRX pop %rdi
    1631:	58                   	pop    %rax
    1632:	43 55                	rex.XB push %r13
    1634:	5f                   	pop    %rdi
    1635:	56                   	push   %rsi
    1636:	45 52                	rex.RB push %r10
    1638:	53                   	push   %rbx
    1639:	49                   	rex.WB
    163a:	4f                   	rex.WRXB
    163b:	4e 00 5f 5f          	rex.WRX add %r11b,0x5f(%rdi)
    163f:	75 69                	jne    16aa <_fini+0x192>
    1641:	6e                   	outsb  %ds:(%rsi),(%dx)
    1642:	74 33                	je     1677 <_fini+0x15f>
    1644:	32 5f 74             	xor    0x74(%rdi),%bl
    1647:	00 5f 73             	add    %bl,0x73(%rdi)
    164a:	79 73                	jns    16bf <_fini+0x1a7>
    164c:	5f                   	pop    %rdi
    164d:	6e                   	outsb  %ds:(%rsi),(%dx)
    164e:	65 72 72             	gs jb  16c3 <_fini+0x1ab>
    1651:	00 5f 53             	add    %bl,0x53(%rdi)
    1654:	43 5f                	rex.XB pop %r15
    1656:	50                   	push   %rax
    1657:	49                   	rex.WB
    1658:	49 5f                	rex.WB pop %r15
    165a:	58                   	pop    %rax
    165b:	54                   	push   %rsp
    165c:	49 00 5f 53          	rex.WB add %bl,0x53(%r15)
    1660:	43 5f                	rex.XB pop %r15
    1662:	58                   	pop    %rax
    1663:	4f 50                	rex.WRXB push %r8
    1665:	45                   	rex.RB
    1666:	4e 5f                	rex.WRX pop %rdi
    1668:	52                   	push   %rdx
    1669:	45                   	rex.RB
    166a:	41                   	rex.B
    166b:	4c 54                	rex.WR push %rsp
    166d:	49                   	rex.WB
    166e:	4d                   	rex.WRB
    166f:	45 5f                	rex.RB pop %r15
    1671:	54                   	push   %rsp
    1672:	48 52                	rex.W push %rdx
    1674:	45                   	rex.RB
    1675:	41                   	rex.B
    1676:	44 53                	rex.R push %rbx
    1678:	00 6c 6f 6e          	add    %ch,0x6e(%rdi,%rbp,2)
    167c:	67 20 6c 6f 6e       	and    %ch,0x6e(%edi,%ebp,2)
    1681:	67 20 69 6e          	and    %ch,0x6e(%ecx)
    1685:	74 00                	je     1687 <_fini+0x16f>
    1687:	5f                   	pop    %rdi
    1688:	53                   	push   %rbx
    1689:	43 5f                	rex.XB pop %r15
    168b:	58                   	pop    %rax
    168c:	42 53                	rex.X push %rbx
    168e:	35 5f 49 4c 50       	xor    $0x504c495f,%eax
    1693:	33 32                	xor    (%rdx),%esi
    1695:	5f                   	pop    %rdi
    1696:	4f                   	rex.WRXB
    1697:	46                   	rex.RX
    1698:	46 33 32             	rex.RX xor (%rdx),%r14d
    169b:	00 5f 53             	add    %bl,0x53(%rdi)
    169e:	43 5f                	rex.XB pop %r15
    16a0:	4c                   	rex.WR
    16a1:	4f                   	rex.WRXB
    16a2:	4e                   	rex.WRX
    16a3:	47 5f                	rex.RXB pop %r15
    16a5:	42                   	rex.X
    16a6:	49 54                	rex.WB push %r12
    16a8:	00 5f 5f             	add    %bl,0x5f(%rdi)
    16ab:	6d                   	insl   (%dx),%es:(%rdi)
    16ac:	61                   	(bad)  
    16ad:	78 5f                	js     170e <_fini+0x1f6>
    16af:	65 78 70             	gs js  1722 <_fini+0x20a>
    16b2:	6f                   	outsl  %ds:(%rsi),(%dx)
    16b3:	6e                   	outsb  %ds:(%rsi),(%dx)
    16b4:	65 6e                	outsb  %gs:(%rsi),(%dx)
    16b6:	74 31                	je     16e9 <_fini+0x1d1>
    16b8:	30 00                	xor    %al,(%rax)
    16ba:	77 6d                	ja     1729 <_fini+0x211>
    16bc:	65 6d                	gs insl (%dx),%es:(%rdi)
    16be:	63 70 79             	movslq 0x79(%rax),%esi
    16c1:	00 74 6d 5f          	add    %dh,0x5f(%rbp,%rbp,2)
    16c5:	6d                   	insl   (%dx),%es:(%rdi)
    16c6:	6f                   	outsl  %ds:(%rsi),(%dx)
    16c7:	6e                   	outsb  %ds:(%rsi),(%dx)
    16c8:	00 5f 5a             	add    %bl,0x5a(%rdi)
    16cb:	4e 53                	rex.WRX push %rbx
    16cd:	74 31                	je     1700 <_fini+0x1e8>
    16cf:	35 5f 5f 65 78       	xor    $0x78655f5f,%eax
    16d4:	63 65 70             	movslq 0x70(%rbp),%esp
    16d7:	74 69                	je     1742 <_fini+0x22a>
    16d9:	6f                   	outsl  %ds:(%rsi),(%dx)
    16da:	6e                   	outsb  %ds:(%rsi),(%dx)
    16db:	5f                   	pop    %rdi
    16dc:	70 74                	jo     1752 <_fini+0x23a>
    16de:	72 31                	jb     1711 <_fini+0x1f9>
    16e0:	33 65 78             	xor    0x78(%rbp),%esp
    16e3:	63 65 70             	movslq 0x70(%rbp),%esp
    16e6:	74 69                	je     1751 <_fini+0x239>
    16e8:	6f                   	outsl  %ds:(%rsi),(%dx)
    16e9:	6e                   	outsb  %ds:(%rsi),(%dx)
    16ea:	5f                   	pop    %rdi
    16eb:	70 74                	jo     1761 <_fini+0x249>
    16ed:	72 43                	jb     1732 <_fini+0x21a>
    16ef:	34 45                	xor    $0x45,%al
    16f1:	52                   	push   %rdx
    16f2:	4b 53                	rex.WXB push %r11
    16f4:	30 5f 00             	xor    %bl,0x0(%rdi)
    16f7:	77 63                	ja     175c <_fini+0x244>
    16f9:	73 74                	jae    176f <_fini+0x257>
    16fb:	6f                   	outsl  %ds:(%rsi),(%dx)
    16fc:	66 00 5f 53          	data16 add %bl,0x53(%rdi)
    1700:	43 5f                	rex.XB pop %r15
    1702:	50                   	push   %rax
    1703:	48 59                	rex.W pop %rcx
    1705:	53                   	push   %rbx
    1706:	5f                   	pop    %rdi
    1707:	50                   	push   %rax
    1708:	41                   	rex.B
    1709:	47                   	rex.RXB
    170a:	45 53                	rex.RB push %r11
    170c:	00 5f 66             	add    %bl,0x66(%rdi)
    170f:	72 65                	jb     1776 <_fini+0x25e>
    1711:	65 72 65             	gs jb  1779 <_fini+0x261>
    1714:	73 5f                	jae    1775 <_fini+0x25d>
    1716:	6c                   	insb   (%dx),%es:(%rdi)
    1717:	69 73 74 00 5f 5f 69 	imul   $0x695f5f00,0x74(%rbx),%esi
    171e:	73 5f                	jae    177f <_fini+0x267>
    1720:	69 6e 74 65 67 65 72 	imul   $0x72656765,0x74(%rsi),%ebp
    1727:	3c 6c                	cmp    $0x6c,%al
    1729:	6f                   	outsl  %ds:(%rsi),(%dx)
    172a:	6e                   	outsb  %ds:(%rsi),(%dx)
    172b:	67 20 64 6f 75       	and    %ah,0x75(%edi,%ebp,2)
    1730:	62                   	(bad)  
    1731:	6c                   	insb   (%dx),%es:(%rdi)
    1732:	65 3e 00 77 63       	gs add %dh,%ds:0x63(%rdi)
    1737:	73 74                	jae    17ad <_fini+0x295>
    1739:	6f                   	outsl  %ds:(%rsi),(%dx)
    173a:	6c                   	insb   (%dx),%es:(%rdi)
    173b:	00 5f 5a             	add    %bl,0x5a(%rdi)
    173e:	4e 53                	rex.WRX push %rbx
    1740:	74 31                	je     1773 <_fini+0x25b>
    1742:	31 63 68             	xor    %esp,0x68(%rbx)
    1745:	61                   	(bad)  
    1746:	72 5f                	jb     17a7 <_fini+0x28f>
    1748:	74 72                	je     17bc <_fini+0x2a4>
    174a:	61                   	(bad)  
    174b:	69 74 73 49 63 45 34 	imul   $0x66344563,0x49(%rbx,%rsi,2),%esi
    1752:	66 
    1753:	69 6e 64 45 50 4b 63 	imul   $0x634b5045,0x64(%rsi),%ebp
    175a:	6d                   	insl   (%dx),%es:(%rdi)
    175b:	52                   	push   %rdx
    175c:	53                   	push   %rbx
    175d:	31 5f 00             	xor    %ebx,0x0(%rdi)
    1760:	6d                   	insl   (%dx),%es:(%rdi)
    1761:	62                   	(bad)  
    1762:	74 6f                	je     17d3 <_fini+0x2bb>
    1764:	77 63                	ja     17c9 <_fini+0x2b1>
    1766:	00 5f 49             	add    %bl,0x49(%rdi)
    1769:	4f 5f                	rex.WRXB pop %r15
    176b:	77 72                	ja     17df <_fini+0x2c7>
    176d:	69 74 65 5f 65 6e 64 	imul   $0x646e65,0x5f(%rbp,%riz,2),%esi
    1774:	00 
    1775:	5f                   	pop    %rdi
    1776:	5a                   	pop    %rdx
    1777:	4e 53                	rex.WRX push %rbx
    1779:	74 38                	je     17b3 <_fini+0x29b>
    177b:	69 6f 73 5f 62 61 73 	imul   $0x7361625f,0x73(%rdi),%ebp
    1782:	65 34 49             	gs xor $0x49,%al
    1785:	6e                   	outsb  %ds:(%rsi),(%dx)
    1786:	69 74 44 34 45 76 00 	imul   $0x5f007645,0x34(%rsp,%rax,2),%esi
    178d:	5f 
    178e:	53                   	push   %rbx
    178f:	43 5f                	rex.XB pop %r15
    1791:	55                   	push   %rbp
    1792:	43                   	rex.XB
    1793:	48                   	rex.W
    1794:	41 52                	push   %r10
    1796:	5f                   	pop    %rdi
    1797:	4d                   	rex.WRB
    1798:	41 58                	pop    %r8
    179a:	00 5f 5a             	add    %bl,0x5a(%rdi)
    179d:	4e 39 5f 5f          	rex.WRX cmp %r11,0x5f(%rdi)
    17a1:	67 6e                	outsb  %ds:(%esi),(%dx)
    17a3:	75 5f                	jne    1804 <_fini+0x2ec>
    17a5:	63 78 78             	movslq 0x78(%rax),%edi
    17a8:	32 34 5f             	xor    (%rdi,%rbx,2),%dh
    17ab:	5f                   	pop    %rdi
    17ac:	6e                   	outsb  %ds:(%rsi),(%dx)
    17ad:	75 6d                	jne    181c <_fini+0x304>
    17af:	65 72 69             	gs jb  181b <_fini+0x303>
    17b2:	63 5f 74             	movslq 0x74(%rdi),%ebx
    17b5:	72 61                	jb     1818 <_fini+0x300>
    17b7:	69 74 73 5f 69 6e 74 	imul   $0x65746e69,0x5f(%rbx,%rsi,2),%esi
    17be:	65 
    17bf:	67 65 72 49          	addr32 gs jb 180c <_fini+0x2f4>
    17c3:	73 45                	jae    180a <_fini+0x2f2>
    17c5:	35 5f 5f 6d 69       	xor    $0x696d5f5f,%eax
    17ca:	6e                   	outsb  %ds:(%rsi),(%dx)
    17cb:	45 00 70 69          	add    %r14b,0x69(%r8)
    17cf:	65 63 65 77          	movslq %gs:0x77(%rbp),%esp
    17d3:	69 73 65 5f 63 6f 6e 	imul   $0x6e6f635f,0x65(%rbx),%esi
    17da:	73 74                	jae    1850 <_fini+0x338>
    17dc:	72 75                	jb     1853 <_fini+0x33b>
    17de:	63 74 00 77          	movslq 0x77(%rax,%rax,1),%esi
    17e2:	63 74 6f 62          	movslq 0x62(%rdi,%rbp,2),%esi
    17e6:	00 5f 53             	add    %bl,0x53(%rdi)
    17e9:	43 5f                	rex.XB pop %r15
    17eb:	50                   	push   %rax
    17ec:	49 50                	rex.WB push %r8
    17ee:	45 00 5f 53          	add    %r11b,0x53(%r15)
    17f2:	43 5f                	rex.XB pop %r15
    17f4:	54                   	push   %rsp
    17f5:	59                   	pop    %rcx
    17f6:	50                   	push   %rax
    17f7:	45                   	rex.RB
    17f8:	44 5f                	rex.R pop %rdi
    17fa:	4d                   	rex.WRB
    17fb:	45                   	rex.RB
    17fc:	4d                   	rex.WRB
    17fd:	4f 52                	rex.WRXB push %r10
    17ff:	59                   	pop    %rcx
    1800:	5f                   	pop    %rdi
    1801:	4f                   	rex.WRXB
    1802:	42                   	rex.X
    1803:	4a                   	rex.WX
    1804:	45                   	rex.RB
    1805:	43 54                	rex.XB push %r12
    1807:	53                   	push   %rbx
    1808:	00 5f 53             	add    %bl,0x53(%rdi)
    180b:	43 5f                	rex.XB pop %r15
    180d:	4c                   	rex.WR
    180e:	4f                   	rex.WRXB
    180f:	47                   	rex.RXB
    1810:	49                   	rex.WB
    1811:	4e 5f                	rex.WRX pop %rdi
    1813:	4e                   	rex.WRX
    1814:	41                   	rex.B
    1815:	4d                   	rex.WRB
    1816:	45 5f                	rex.RB pop %r15
    1818:	4d                   	rex.WRB
    1819:	41 58                	pop    %r8
    181b:	00 67 70             	add    %ah,0x70(%rdi)
    181e:	5f                   	pop    %rdi
    181f:	6f                   	outsl  %ds:(%rsi),(%dx)
    1820:	66 66 73 65          	data16 data16 jae 1889 <_fini+0x371>
    1824:	74 00                	je     1826 <_fini+0x30e>
    1826:	5f                   	pop    %rdi
    1827:	53                   	push   %rbx
    1828:	43 5f                	rex.XB pop %r15
    182a:	54                   	push   %rsp
    182b:	48 52                	rex.W push %rdx
    182d:	45                   	rex.RB
    182e:	41                   	rex.B
    182f:	44 5f                	rex.R pop %rdi
    1831:	4b                   	rex.WXB
    1832:	45 59                	rex.RB pop %r9
    1834:	53                   	push   %rbx
    1835:	5f                   	pop    %rdi
    1836:	4d                   	rex.WRB
    1837:	41 58                	pop    %r8
    1839:	00 5f 5a             	add    %bl,0x5a(%rdi)
    183c:	4e 39 5f 5f          	rex.WRX cmp %r11,0x5f(%rdi)
    1840:	67 6e                	outsb  %ds:(%esi),(%dx)
    1842:	75 5f                	jne    18a3 <_fini+0x38b>
    1844:	63 78 78             	movslq 0x78(%rax),%edi
    1847:	32 34 5f             	xor    (%rdi,%rbx,2),%dh
    184a:	5f                   	pop    %rdi
    184b:	6e                   	outsb  %ds:(%rsi),(%dx)
    184c:	75 6d                	jne    18bb <_fini+0x3a3>
    184e:	65 72 69             	gs jb  18ba <_fini+0x3a2>
    1851:	63 5f 74             	movslq 0x74(%rdi),%ebx
    1854:	72 61                	jb     18b7 <_fini+0x39f>
    1856:	69 74 73 5f 69 6e 74 	imul   $0x65746e69,0x5f(%rbx,%rsi,2),%esi
    185d:	65 
    185e:	67 65 72 49          	addr32 gs jb 18ab <_fini+0x393>
    1862:	6d                   	insl   (%dx),%es:(%rdi)
    1863:	45 38 5f 5f          	cmp    %r11b,0x5f(%r15)
    1867:	64 69 67 69 74 73 45 	imul   $0x457374,%fs:0x69(%rdi),%esp
    186e:	00 
    186f:	5f                   	pop    %rdi
    1870:	53                   	push   %rbx
    1871:	43 5f                	rex.XB pop %r15
    1873:	41                   	rex.B
    1874:	44 56                	rex.R push %rsi
    1876:	49 53                	rex.WB push %r11
    1878:	4f 52                	rex.WRXB push %r10
    187a:	59                   	pop    %rcx
    187b:	5f                   	pop    %rdi
    187c:	49                   	rex.WB
    187d:	4e                   	rex.WRX
    187e:	46                   	rex.RX
    187f:	4f 00 66 6c          	rex.WRXB add %r12b,0x6c(%r14)
    1883:	6f                   	outsl  %ds:(%rsi),(%dx)
    1884:	61                   	(bad)  
    1885:	74 00                	je     1887 <_fini+0x36f>
    1887:	64 65 63 6c 74 79    	fs movslq %gs:0x79(%rsp,%rsi,2),%ebp
    188d:	70 65                	jo     18f4 <_fini+0x3dc>
    188f:	28 6e 75             	sub    %ch,0x75(%rsi)
    1892:	6c                   	insb   (%dx),%es:(%rdi)
    1893:	6c                   	insb   (%dx),%es:(%rdi)
    1894:	70 74                	jo     190a <_fini+0x3f2>
    1896:	72 29                	jb     18c1 <_fini+0x3a9>
    1898:	00 31                	add    %dh,(%rcx)
    189a:	37                   	(bad)  
    189b:	70 74                	jo     1911 <_fini+0x3f9>
    189d:	68 72 65 61 64       	pushq  $0x64616572
    18a2:	5f                   	pop    %rdi
    18a3:	62 61                	(bad)  
    18a5:	72 72                	jb     1919 <_fini+0x401>
    18a7:	69 65 72 5f 74 00 5f 	imul   $0x5f00745f,0x72(%rbp),%esp
    18ae:	5a                   	pop    %rdx
    18af:	53                   	push   %rbx
    18b0:	74 34                	je     18e6 <_fini+0x3ce>
    18b2:	63 6f 75             	movslq 0x75(%rdi),%ebp
    18b5:	74 00                	je     18b7 <_fini+0x39f>
    18b7:	76 66                	jbe    191f <_fini+0x407>
    18b9:	77 70                	ja     192b <_fini+0x413>
    18bb:	72 69                	jb     1926 <_fini+0x40e>
    18bd:	6e                   	outsb  %ds:(%rsi),(%dx)
    18be:	74 66                	je     1926 <_fini+0x40e>
    18c0:	00 5f 5f             	add    %bl,0x5f(%rdi)
    18c3:	69 6e 74 6d 61 78 5f 	imul   $0x5f78616d,0x74(%rsi),%ebp
    18ca:	74 00                	je     18cc <_fini+0x3b4>
    18cc:	5f                   	pop    %rdi
    18cd:	49                   	rex.WB
    18ce:	4f 5f                	rex.WRXB pop %r15
    18d0:	62                   	(bad)  
    18d1:	75 66                	jne    1939 <_fini+0x421>
    18d3:	5f                   	pop    %rdi
    18d4:	62 61                	(bad)  
    18d6:	73 65                	jae    193d <_fini+0x425>
    18d8:	00 5f 53             	add    %bl,0x53(%rdi)
    18db:	43 5f                	rex.XB pop %r15
    18dd:	32 5f 43             	xor    0x43(%rdi),%bl
    18e0:	5f                   	pop    %rdi
    18e1:	42                   	rex.X
    18e2:	49                   	rex.WB
    18e3:	4e                   	rex.WRX
    18e4:	44 00 5f 5a          	add    %r11b,0x5a(%rdi)
    18e8:	4e 39 5f 5f          	rex.WRX cmp %r11,0x5f(%rdi)
    18ec:	67 6e                	outsb  %ds:(%esi),(%dx)
    18ee:	75 5f                	jne    194f <_fini+0x437>
    18f0:	63 78 78             	movslq 0x78(%rax),%edi
    18f3:	32 34 5f             	xor    (%rdi,%rbx,2),%dh
    18f6:	5f                   	pop    %rdi
    18f7:	6e                   	outsb  %ds:(%rsi),(%dx)
    18f8:	75 6d                	jne    1967 <_fini+0x44f>
    18fa:	65 72 69             	gs jb  1966 <_fini+0x44e>
    18fd:	63 5f 74             	movslq 0x74(%rdi),%ebx
    1900:	72 61                	jb     1963 <_fini+0x44b>
    1902:	69 74 73 5f 69 6e 74 	imul   $0x65746e69,0x5f(%rbx,%rsi,2),%esi
    1909:	65 
    190a:	67 65 72 49          	addr32 gs jb 1957 <_fini+0x43f>
    190e:	6c                   	insb   (%dx),%es:(%rdi)
    190f:	45 35 5f 5f 6d 69    	rex.RB xor $0x696d5f5f,%eax
    1915:	6e                   	outsb  %ds:(%rsi),(%dx)
    1916:	45 00 5f 5a          	add    %r11b,0x5a(%r15)
    191a:	4e 39 5f 5f          	rex.WRX cmp %r11,0x5f(%rdi)
    191e:	67 6e                	outsb  %ds:(%esi),(%dx)
    1920:	75 5f                	jne    1981 <_fini+0x469>
    1922:	63 78 78             	movslq 0x78(%rax),%edi
    1925:	32 34 5f             	xor    (%rdi,%rbx,2),%dh
    1928:	5f                   	pop    %rdi
    1929:	6e                   	outsb  %ds:(%rsi),(%dx)
    192a:	75 6d                	jne    1999 <_fini+0x481>
    192c:	65 72 69             	gs jb  1998 <_fini+0x480>
    192f:	63 5f 74             	movslq 0x74(%rdi),%ebx
    1932:	72 61                	jb     1995 <_fini+0x47d>
    1934:	69 74 73 5f 69 6e 74 	imul   $0x65746e69,0x5f(%rbx,%rsi,2),%esi
    193b:	65 
    193c:	67 65 72 49          	addr32 gs jb 1989 <_fini+0x471>
    1940:	6c                   	insb   (%dx),%es:(%rdi)
    1941:	45 31 31             	xor    %r14d,(%r9)
    1944:	5f                   	pop    %rdi
    1945:	5f                   	pop    %rdi
    1946:	69 73 5f 73 69 67 6e 	imul   $0x6e676973,0x5f(%rbx),%esi
    194d:	65 64 45 00 63 68    	gs add %r12b,%fs:0x68(%r11)
    1953:	61                   	(bad)  
    1954:	72 5f                	jb     19b5 <_fini+0x49d>
    1956:	74 72                	je     19ca <_fini+0x4b2>
    1958:	61                   	(bad)  
    1959:	69 74 73 3c 63 68 61 	imul   $0x72616863,0x3c(%rbx,%rsi,2),%esi
    1960:	72 
    1961:	3e 00 70 65          	add    %dh,%ds:0x65(%rax)
    1965:	72 72                	jb     19d9 <_fini+0x4c1>
    1967:	6f                   	outsl  %ds:(%rsi),(%dx)
    1968:	72 00                	jb     196a <_fini+0x452>
    196a:	77 63                	ja     19cf <_fini+0x4b7>
    196c:	73 73                	jae    19e1 <_fini+0x4c9>
    196e:	70 6e                	jo     19de <_fini+0x4c6>
    1970:	00 5f 53             	add    %bl,0x53(%rdi)
    1973:	43 5f                	rex.XB pop %r15
    1975:	54                   	push   %rsp
    1976:	48 52                	rex.W push %rdx
    1978:	45                   	rex.RB
    1979:	41                   	rex.B
    197a:	44 5f                	rex.R pop %rdi
    197c:	41 54                	push   %r12
    197e:	54                   	push   %rsp
    197f:	52                   	push   %rdx
    1980:	5f                   	pop    %rdi
    1981:	53                   	push   %rbx
    1982:	54                   	push   %rsp
    1983:	41                   	rex.B
    1984:	43                   	rex.XB
    1985:	4b                   	rex.WXB
    1986:	41                   	rex.B
    1987:	44                   	rex.R
    1988:	44 52                	rex.R push %rdx
    198a:	00 6f 70             	add    %ch,0x70(%rdi)
    198d:	65 72 61             	gs jb  19f1 <_fini+0x4d9>
    1990:	74 6f                	je     1a01 <_fini+0x4e9>
    1992:	72 20                	jb     19b4 <_fini+0x49c>
    1994:	62                   	(bad)  
    1995:	6f                   	outsl  %ds:(%rsi),(%dx)
    1996:	6f                   	outsl  %ds:(%rsi),(%dx)
    1997:	6c                   	insb   (%dx),%es:(%rdi)
    1998:	00 5f 5a             	add    %bl,0x5a(%rdi)
    199b:	4e 53                	rex.WRX push %rbx
    199d:	74 31                	je     19d0 <_fini+0x4b8>
    199f:	31 63 68             	xor    %esp,0x68(%rbx)
    19a2:	61                   	(bad)  
    19a3:	72 5f                	jb     1a04 <_fini+0x4ec>
    19a5:	74 72                	je     1a19 <_fini+0x501>
    19a7:	61                   	(bad)  
    19a8:	69 74 73 49 63 45 31 	imul   $0x31314563,0x49(%rbx,%rsi,2),%esi
    19af:	31 
    19b0:	65 71 5f             	gs jno 1a12 <_fini+0x4fa>
    19b3:	69 6e 74 5f 74 79 70 	imul   $0x7079745f,0x74(%rsi),%ebp
    19ba:	65 45 52             	gs rex.RB push %r10
    19bd:	4b 69 53 32 5f 00 5f 	rex.WXB imul $0x535f005f,0x32(%r11),%rdx
    19c4:	53 
    19c5:	43 5f                	rex.XB pop %r15
    19c7:	43                   	rex.XB
    19c8:	4f                   	rex.WRXB
    19c9:	4c                   	rex.WR
    19ca:	4c 5f                	rex.WR pop %rdi
    19cc:	57                   	push   %rdi
    19cd:	45                   	rex.RB
    19ce:	49                   	rex.WB
    19cf:	47                   	rex.RXB
    19d0:	48 54                	rex.W push %rsp
    19d2:	53                   	push   %rbx
    19d3:	5f                   	pop    %rdi
    19d4:	4d                   	rex.WRB
    19d5:	41 58                	pop    %r8
    19d7:	00 5f 53             	add    %bl,0x53(%rdi)
    19da:	43 5f                	rex.XB pop %r15
    19dc:	50                   	push   %rax
    19dd:	49                   	rex.WB
    19de:	49 5f                	rex.WB pop %r15
    19e0:	4f 53                	rex.WRXB push %r11
    19e2:	49 5f                	rex.WB pop %r15
    19e4:	4d 00 5f 53          	rex.WRB add %r11b,0x53(%r15)
    19e8:	43 5f                	rex.XB pop %r15
    19ea:	32 5f 43             	xor    0x43(%rdi),%bl
    19ed:	5f                   	pop    %rdi
    19ee:	44                   	rex.R
    19ef:	45 56                	rex.RB push %r14
    19f1:	00 5f 5a             	add    %bl,0x5a(%rdi)
    19f4:	4e                   	rex.WRX
    19f5:	4b 53                	rex.WXB push %r11
    19f7:	74 31                	je     1a2a <_fini+0x512>
    19f9:	37                   	(bad)  
    19fa:	69 6e 74 65 67 72 61 	imul   $0x61726765,0x74(%rsi),%ebp
    1a01:	6c                   	insb   (%dx),%es:(%rdi)
    1a02:	5f                   	pop    %rdi
    1a03:	63 6f 6e             	movslq 0x6e(%rdi),%ebp
    1a06:	73 74                	jae    1a7c <_fini+0x564>
    1a08:	61                   	(bad)  
    1a09:	6e                   	outsb  %ds:(%rsi),(%dx)
    1a0a:	74 49                	je     1a55 <_fini+0x53d>
    1a0c:	62                   	(bad)  
    1a0d:	4c 62 31 45 45 63 76 	rex.WR vpacksswb 0x1880(%rsi),%zmm23,%zmm14{%k5}
    1a14:	62 
    1a15:	45 76 00             	rex.RB jbe 1a18 <_fini+0x500>
    1a18:	66 73 65             	data16 jae 1a80 <_fini+0x568>
    1a1b:	65 6b 00 5f          	imul   $0x5f,%gs:(%rax),%eax
    1a1f:	5f                   	pop    %rdi
    1a20:	70 61                	jo     1a83 <_fini+0x56b>
    1a22:	64 35 00 5f 53 43    	fs xor $0x43535f00,%eax
    1a28:	5f                   	pop    %rdi
    1a29:	53                   	push   %rbx
    1a2a:	59                   	pop    %rcx
    1a2b:	53                   	push   %rbx
    1a2c:	54                   	push   %rsp
    1a2d:	45                   	rex.RB
    1a2e:	4d 5f                	rex.WRB pop %r15
    1a30:	44                   	rex.R
    1a31:	41 54                	push   %r12
    1a33:	41                   	rex.B
    1a34:	42                   	rex.X
    1a35:	41 53                	push   %r11
    1a37:	45 5f                	rex.RB pop %r15
    1a39:	52                   	push   %rdx
    1a3a:	00 6d 62             	add    %ch,0x62(%rbp)
    1a3d:	72 74                	jb     1ab3 <_fini+0x59b>
    1a3f:	6f                   	outsl  %ds:(%rsi),(%dx)
    1a40:	77 63                	ja     1aa5 <_fini+0x58d>
    1a42:	00 5f 53             	add    %bl,0x53(%rdi)
    1a45:	43 5f                	rex.XB pop %r15
    1a47:	50                   	push   %rax
    1a48:	52                   	push   %rdx
    1a49:	49                   	rex.WB
    1a4a:	4f 52                	rex.WRXB push %r10
    1a4c:	49 54                	rex.WB push %r12
    1a4e:	59                   	pop    %rcx
    1a4f:	5f                   	pop    %rdi
    1a50:	53                   	push   %rbx
    1a51:	43                   	rex.XB
    1a52:	48                   	rex.W
    1a53:	45                   	rex.RB
    1a54:	44 55                	rex.R push %rbp
    1a56:	4c                   	rex.WR
    1a57:	49                   	rex.WB
    1a58:	4e                   	rex.WRX
    1a59:	47 00 5f 5a          	rex.RXB add %r11b,0x5a(%r15)
    1a5d:	4e 53                	rex.WRX push %rbx
    1a5f:	74 31                	je     1a92 <_fini+0x57a>
    1a61:	31 63 68             	xor    %esp,0x68(%rbx)
    1a64:	61                   	(bad)  
    1a65:	72 5f                	jb     1ac6 <_fini+0x5ae>
    1a67:	74 72                	je     1adb <_fini+0x5c3>
    1a69:	61                   	(bad)  
    1a6a:	69 74 73 49 63 45 31 	imul   $0x32314563,0x49(%rbx,%rsi,2),%esi
    1a71:	32 
    1a72:	74 6f                	je     1ae3 <_fini+0x5cb>
    1a74:	5f                   	pop    %rdi
    1a75:	63 68 61             	movslq 0x61(%rax),%ebp
    1a78:	72 5f                	jb     1ad9 <_fini+0x5c1>
    1a7a:	74 79                	je     1af5 <_fini+0x5dd>
    1a7c:	70 65                	jo     1ae3 <_fini+0x5cb>
    1a7e:	45 52                	rex.RB push %r10
    1a80:	4b 69 00 5f 53 43 5f 	rex.WXB imul $0x5f43535f,(%r8),%rax
    1a87:	54                   	push   %rsp
    1a88:	52                   	push   %rdx
    1a89:	41                   	rex.B
    1a8a:	43                   	rex.XB
    1a8b:	45 5f                	rex.RB pop %r15
    1a8d:	45 56                	rex.RB push %r14
    1a8f:	45                   	rex.RB
    1a90:	4e 54                	rex.WRX push %rsp
    1a92:	5f                   	pop    %rdi
    1a93:	4e                   	rex.WRX
    1a94:	41                   	rex.B
    1a95:	4d                   	rex.WRB
    1a96:	45 5f                	rex.RB pop %r15
    1a98:	4d                   	rex.WRB
    1a99:	41 58                	pop    %r8
    1a9b:	00 73 79             	add    %dh,0x79(%rbx)
    1a9e:	73 74                	jae    1b14 <_fini+0x5fc>
    1aa0:	65 6d                	gs insl (%dx),%es:(%rdi)
    1aa2:	00 5f 5a             	add    %bl,0x5a(%rdi)
    1aa5:	4e 53                	rex.WRX push %rbx
    1aa7:	74 31                	je     1ada <_fini+0x5c2>
    1aa9:	31 63 68             	xor    %esp,0x68(%rbx)
    1aac:	61                   	(bad)  
    1aad:	72 5f                	jb     1b0e <_fini+0x5f6>
    1aaf:	74 72                	je     1b23 <_fini+0x60b>
    1ab1:	61                   	(bad)  
    1ab2:	69 74 73 49 77 45 31 	imul   $0x31314577,0x49(%rbx,%rsi,2),%esi
    1ab9:	31 
    1aba:	65 71 5f             	gs jno 1b1c <_fini+0x604>
    1abd:	69 6e 74 5f 74 79 70 	imul   $0x7079745f,0x74(%rsi),%ebp
    1ac4:	65 45 52             	gs rex.RB push %r10
    1ac7:	4b 6a 53             	rex.WXB pushq $0x53
    1aca:	32 5f 00             	xor    0x0(%rdi),%bl
    1acd:	5f                   	pop    %rdi
    1ace:	53                   	push   %rbx
    1acf:	43 5f                	rex.XB pop %r15
    1ad1:	49 50                	rex.WB push %r8
    1ad3:	56                   	push   %rsi
    1ad4:	36 00 5f 53          	add    %bl,%ss:0x53(%rdi)
    1ad8:	43 5f                	rex.XB pop %r15
    1ada:	48                   	rex.W
    1adb:	4f 53                	rex.WRXB push %r11
    1add:	54                   	push   %rsp
    1ade:	5f                   	pop    %rdi
    1adf:	4e                   	rex.WRX
    1ae0:	41                   	rex.B
    1ae1:	4d                   	rex.WRB
    1ae2:	45 5f                	rex.RB pop %r15
    1ae4:	4d                   	rex.WRB
    1ae5:	41 58                	pop    %r8
    1ae7:	00 5f 53             	add    %bl,0x53(%rdi)
    1aea:	43 5f                	rex.XB pop %r15
    1aec:	42                   	rex.X
    1aed:	43 5f                	rex.XB pop %r15
    1aef:	53                   	push   %rbx
    1af0:	54                   	push   %rsp
    1af1:	52                   	push   %rdx
    1af2:	49                   	rex.WB
    1af3:	4e                   	rex.WRX
    1af4:	47 5f                	rex.RXB pop %r15
    1af6:	4d                   	rex.WRB
    1af7:	41 58                	pop    %r8
    1af9:	00 6d 6f             	add    %ch,0x6f(%rbp)
    1afc:	6e                   	outsb  %ds:(%rsi),(%dx)
    1afd:	5f                   	pop    %rdi
    1afe:	64 65 63 69 6d       	fs movslq %gs:0x6d(%rcx),%ebp
    1b03:	61                   	(bad)  
    1b04:	6c                   	insb   (%dx),%es:(%rdi)
    1b05:	5f                   	pop    %rdi
    1b06:	70 6f                	jo     1b77 <_fini+0x65f>
    1b08:	69 6e 74 00 6f 76 65 	imul   $0x65766f00,0x74(%rsi),%ebp
    1b0f:	72 66                	jb     1b77 <_fini+0x65f>
    1b11:	6c                   	insb   (%dx),%es:(%rdi)
    1b12:	6f                   	outsl  %ds:(%rsi),(%dx)
    1b13:	77 5f                	ja     1b74 <_fini+0x65c>
    1b15:	61                   	(bad)  
    1b16:	72 67                	jb     1b7f <_fini+0x667>
    1b18:	5f                   	pop    %rdi
    1b19:	61                   	(bad)  
    1b1a:	72 65                	jb     1b81 <_fini+0x669>
    1b1c:	61                   	(bad)  
    1b1d:	00 5f 53             	add    %bl,0x53(%rdi)
    1b20:	43 5f                	rex.XB pop %r15
    1b22:	54                   	push   %rsp
    1b23:	48 52                	rex.W push %rdx
    1b25:	45                   	rex.RB
    1b26:	41                   	rex.B
    1b27:	44 5f                	rex.R pop %rdi
    1b29:	50                   	push   %rax
    1b2a:	52                   	push   %rdx
    1b2b:	49                   	rex.WB
    1b2c:	4f 52                	rex.WRXB push %r10
    1b2e:	49 54                	rex.WB push %r12
    1b30:	59                   	pop    %rcx
    1b31:	5f                   	pop    %rdi
    1b32:	53                   	push   %rbx
    1b33:	43                   	rex.XB
    1b34:	48                   	rex.W
    1b35:	45                   	rex.RB
    1b36:	44 55                	rex.R push %rbp
    1b38:	4c                   	rex.WR
    1b39:	49                   	rex.WB
    1b3a:	4e                   	rex.WRX
    1b3b:	47 00 5f 66          	rex.RXB add %r11b,0x66(%r15)
    1b3f:	6c                   	insb   (%dx),%es:(%rdi)
    1b40:	61                   	(bad)  
    1b41:	67 73 00             	addr32 jae 1b44 <_fini+0x62c>
    1b44:	70 72                	jo     1bb8 <_fini+0x6a0>
    1b46:	6f                   	outsl  %ds:(%rsi),(%dx)
    1b47:	67 72 61             	addr32 jb 1bab <_fini+0x693>
    1b4a:	6d                   	insl   (%dx),%es:(%rdi)
    1b4b:	5f                   	pop    %rdi
    1b4c:	69 6e 76 6f 63 61 74 	imul   $0x7461636f,0x76(%rsi),%ebp
    1b53:	69 6f 6e 5f 73 68 6f 	imul   $0x6f68735f,0x6e(%rdi),%ebp
    1b5a:	72 74                	jb     1bd0 <_fini+0x6b8>
    1b5c:	5f                   	pop    %rdi
    1b5d:	6e                   	outsb  %ds:(%rsi),(%dx)
    1b5e:	61                   	(bad)  
    1b5f:	6d                   	insl   (%dx),%es:(%rdi)
    1b60:	65 00 5f 6d          	add    %bl,%gs:0x6d(%rdi)
    1b64:	6f                   	outsl  %ds:(%rsi),(%dx)
    1b65:	64 65 00 7e 65       	fs add %bh,%gs:0x65(%rsi)
    1b6a:	78 63                	js     1bcf <_fini+0x6b7>
    1b6c:	65 70 74             	gs jo  1be3 <_fini+0x6cb>
    1b6f:	69 6f 6e 5f 70 74 72 	imul   $0x7274705f,0x6e(%rdi),%ebp
    1b76:	00 67 65             	add    %ah,0x65(%rdi)
    1b79:	74 63                	je     1bde <_fini+0x6c6>
    1b7b:	68 61 72 00 5f       	pushq  $0x5f007261
    1b80:	5a                   	pop    %rdx
    1b81:	4e 53                	rex.WRX push %rbx
    1b83:	74 32                	je     1bb7 <_fini+0x69f>
    1b85:	31 70 69             	xor    %esi,0x69(%rax)
    1b88:	65 63 65 77          	movslq %gs:0x77(%rbp),%esp
    1b8c:	69 73 65 5f 63 6f 6e 	imul   $0x6e6f635f,0x65(%rbx),%esi
    1b93:	73 74                	jae    1c09 <_fini+0x6f1>
    1b95:	72 75                	jb     1c0c <_fini+0x6f4>
    1b97:	63 74 5f 74          	movslq 0x74(%rdi,%rbx,2),%esi
    1b9b:	43 34 45             	rex.XB xor $0x45,%al
    1b9e:	76 00                	jbe    1ba0 <_fini+0x688>
    1ba0:	5f                   	pop    %rdi
    1ba1:	5f                   	pop    %rdi
    1ba2:	63 6f 75             	movslq 0x75(%rdi),%ebp
    1ba5:	6e                   	outsb  %ds:(%rsi),(%dx)
    1ba6:	74 00                	je     1ba8 <_fini+0x690>
    1ba8:	5f                   	pop    %rdi
    1ba9:	53                   	push   %rbx
    1baa:	43 5f                	rex.XB pop %r15
    1bac:	32 5f 53             	xor    0x53(%rdi),%bl
    1baf:	57                   	push   %rdi
    1bb0:	5f                   	pop    %rdi
    1bb1:	44                   	rex.R
    1bb2:	45 56                	rex.RB push %r14
    1bb4:	00 5f 5f             	add    %bl,0x5f(%rdi)
    1bb7:	67 6e                	outsb  %ds:(%esi),(%dx)
    1bb9:	75 5f                	jne    1c1a <_fini+0x702>
    1bbb:	63 78 78             	movslq 0x78(%rax),%edi
    1bbe:	00 5f 53             	add    %bl,0x53(%rdi)
    1bc1:	43 5f                	rex.XB pop %r15
    1bc3:	52                   	push   %rdx
    1bc4:	45                   	rex.RB
    1bc5:	41                   	rex.B
    1bc6:	4c 54                	rex.WR push %rsp
    1bc8:	49                   	rex.WB
    1bc9:	4d                   	rex.WRB
    1bca:	45 5f                	rex.RB pop %r15
    1bcc:	53                   	push   %rbx
    1bcd:	49                   	rex.WB
    1bce:	47                   	rex.RXB
    1bcf:	4e                   	rex.WRX
    1bd0:	41                   	rex.B
    1bd1:	4c 53                	rex.WR push %rbx
    1bd3:	00 5f 5a             	add    %bl,0x5a(%rdi)
    1bd6:	4e                   	rex.WRX
    1bd7:	4b 53                	rex.WXB push %r11
    1bd9:	74 31                	je     1c0c <_fini+0x6f4>
    1bdb:	37                   	(bad)  
    1bdc:	69 6e 74 65 67 72 61 	imul   $0x61726765,0x74(%rsi),%ebp
    1be3:	6c                   	insb   (%dx),%es:(%rdi)
    1be4:	5f                   	pop    %rdi
    1be5:	63 6f 6e             	movslq 0x6e(%rdi),%ebp
    1be8:	73 74                	jae    1c5e <_fini+0x746>
    1bea:	61                   	(bad)  
    1beb:	6e                   	outsb  %ds:(%rsi),(%dx)
    1bec:	74 49                	je     1c37 <_fini+0x71f>
    1bee:	62                   	(bad)  
    1bef:	4c 62                	rex.WR (bad) 
    1bf1:	30 45 45             	xor    %al,0x45(%rbp)
    1bf4:	63 6c 45 76          	movslq 0x76(%rbp,%rax,2),%ebp
    1bf8:	00 5f 5a             	add    %bl,0x5a(%rdi)
    1bfb:	4e 53                	rex.WRX push %rbx
    1bfd:	74 31                	je     1c30 <_fini+0x718>
    1bff:	31 63 68             	xor    %esp,0x68(%rbx)
    1c02:	61                   	(bad)  
    1c03:	72 5f                	jb     1c64 <_fini+0x74c>
    1c05:	74 72                	je     1c79 <_fini+0x761>
    1c07:	61                   	(bad)  
    1c08:	69 74 73 49 77 45 32 	imul   $0x6c324577,0x49(%rbx,%rsi,2),%esi
    1c0f:	6c 
    1c10:	74 45                	je     1c57 <_fini+0x73f>
    1c12:	52                   	push   %rdx
    1c13:	4b 77 53             	rex.WXB ja 1c69 <_fini+0x751>
    1c16:	32 5f 00             	xor    0x0(%rdi),%bl
    1c19:	66 65 6f             	outsw  %gs:(%rsi),(%dx)
    1c1c:	66 00 5f 5f          	data16 add %bl,0x5f(%rdi)
    1c20:	75 6e                	jne    1c90 <_fini+0x778>
    1c22:	6b 6e 6f 77          	imul   $0x77,0x6f(%rsi),%ebp
    1c26:	6e                   	outsb  %ds:(%rsi),(%dx)
    1c27:	5f                   	pop    %rdi
    1c28:	5f                   	pop    %rdi
    1c29:	00 5f 5a             	add    %bl,0x5a(%rdi)
    1c2c:	4e 53                	rex.WRX push %rbx
    1c2e:	74 31                	je     1c61 <_fini+0x749>
    1c30:	31 63 68             	xor    %esp,0x68(%rbx)
    1c33:	61                   	(bad)  
    1c34:	72 5f                	jb     1c95 <_fini+0x77d>
    1c36:	74 72                	je     1caa <_fini+0x792>
    1c38:	61                   	(bad)  
    1c39:	69 74 73 49 63 45 36 	imul   $0x61364563,0x49(%rbx,%rsi,2),%esi
    1c40:	61 
    1c41:	73 73                	jae    1cb6 <_fini+0x79e>
    1c43:	69 67 6e 45 50 63 6d 	imul   $0x6d635045,0x6e(%rdi),%esp
    1c4a:	63 00                	movslq (%rax),%eax
    1c4c:	5f                   	pop    %rdi
    1c4d:	53                   	push   %rbx
    1c4e:	43 5f                	rex.XB pop %r15
    1c50:	58                   	pop    %rax
    1c51:	42 53                	rex.X push %rbx
    1c53:	35 5f 4c 50 42       	xor    $0x42504c5f,%eax
    1c58:	49                   	rex.WB
    1c59:	47 5f                	rex.RXB pop %r15
    1c5b:	4f                   	rex.WRXB
    1c5c:	46                   	rex.RX
    1c5d:	46                   	rex.RX
    1c5e:	42                   	rex.X
    1c5f:	49                   	rex.WB
    1c60:	47 00 5f 53          	rex.RXB add %r11b,0x53(%r15)
    1c64:	43 5f                	rex.XB pop %r15
    1c66:	32 5f 50             	xor    0x50(%rdi),%bl
    1c69:	42 53                	rex.X push %rbx
    1c6b:	5f                   	pop    %rdi
    1c6c:	41                   	rex.B
    1c6d:	43                   	rex.XB
    1c6e:	43                   	rex.XB
    1c6f:	4f 55                	rex.WRXB push %r13
    1c71:	4e 54                	rex.WRX push %rsp
    1c73:	49                   	rex.WB
    1c74:	4e                   	rex.WRX
    1c75:	47 00 5f 53          	rex.RXB add %r11b,0x53(%r15)
    1c79:	43 5f                	rex.XB pop %r15
    1c7b:	54                   	push   %rsp
    1c7c:	48 52                	rex.W push %rdx
    1c7e:	45                   	rex.RB
    1c7f:	41                   	rex.B
    1c80:	44 5f                	rex.R pop %rdi
    1c82:	44                   	rex.R
    1c83:	45 53                	rex.RB push %r11
    1c85:	54                   	push   %rsp
    1c86:	52                   	push   %rdx
    1c87:	55                   	push   %rbp
    1c88:	43 54                	rex.XB push %r12
    1c8a:	4f 52                	rex.WRXB push %r10
    1c8c:	5f                   	pop    %rdi
    1c8d:	49 54                	rex.WB push %r12
    1c8f:	45 52                	rex.RB push %r10
    1c91:	41 54                	push   %r12
    1c93:	49                   	rex.WB
    1c94:	4f                   	rex.WRXB
    1c95:	4e 53                	rex.WRX push %rbx
    1c97:	00 71 73             	add    %dh,0x73(%rcx)
    1c9a:	6f                   	outsl  %ds:(%rsi),(%dx)
    1c9b:	72 74                	jb     1d11 <_fini+0x7f9>
    1c9d:	00 5f 53             	add    %bl,0x53(%rdi)
    1ca0:	43 5f                	rex.XB pop %r15
    1ca2:	44                   	rex.R
    1ca3:	45 56                	rex.RB push %r14
    1ca5:	49                   	rex.WB
    1ca6:	43                   	rex.XB
    1ca7:	45 5f                	rex.RB pop %r15
    1ca9:	53                   	push   %rbx
    1caa:	50                   	push   %rax
    1cab:	45                   	rex.RB
    1cac:	43                   	rex.XB
    1cad:	49                   	rex.WB
    1cae:	46                   	rex.RX
    1caf:	49                   	rex.WB
    1cb0:	43 00 5f 5f          	rex.XB add %bl,0x5f(%r15)
    1cb4:	69 73 6f 63 39 39 5f 	imul   $0x5f393963,0x6f(%rbx),%esi
    1cbb:	77 73                	ja     1d30 <_fini+0x818>
    1cbd:	63 61 6e             	movslq 0x6e(%rcx),%esp
    1cc0:	66 00 5f 53          	data16 add %bl,0x53(%rdi)
    1cc4:	43 5f                	rex.XB pop %r15
    1cc6:	54                   	push   %rsp
    1cc7:	52                   	push   %rdx
    1cc8:	41                   	rex.B
    1cc9:	43                   	rex.XB
    1cca:	45 5f                	rex.RB pop %r15
    1ccc:	4c                   	rex.WR
    1ccd:	4f                   	rex.WRXB
    1cce:	47 00 5f 5f          	rex.RXB add %r11b,0x5f(%r15)
    1cd2:	6f                   	outsl  %ds:(%rsi),(%dx)
    1cd3:	77 6e                	ja     1d43 <_fini+0x82b>
    1cd5:	65 72 00             	gs jb  1cd8 <_fini+0x7c0>
    1cd8:	6c                   	insb   (%dx),%es:(%rdi)
    1cd9:	6f                   	outsl  %ds:(%rsi),(%dx)
    1cda:	6e                   	outsb  %ds:(%rsi),(%dx)
    1cdb:	67 20 64 6f 75       	and    %ah,0x75(%edi,%ebp,2)
    1ce0:	62                   	(bad)  
    1ce1:	6c                   	insb   (%dx),%es:(%rdi)
    1ce2:	65 00 5f 53          	add    %bl,%gs:0x53(%rdi)
    1ce6:	43 5f                	rex.XB pop %r15
    1ce8:	4d                   	rex.WRB
    1ce9:	45                   	rex.RB
    1cea:	4d                   	rex.WRB
    1ceb:	4c                   	rex.WR
    1cec:	4f                   	rex.WRXB
    1ced:	43                   	rex.XB
    1cee:	4b 00 5f 53          	rex.WXB add %bl,0x53(%r15)
    1cf2:	43 5f                	rex.XB pop %r15
    1cf4:	50                   	push   %rax
    1cf5:	49                   	rex.WB
    1cf6:	49 5f                	rex.WB pop %r15
    1cf8:	4f 53                	rex.WRXB push %r11
    1cfa:	49 00 5f 53          	rex.WB add %bl,0x53(%r15)
    1cfe:	43 5f                	rex.XB pop %r15
    1d00:	44                   	rex.R
    1d01:	45                   	rex.RB
    1d02:	4c                   	rex.WR
    1d03:	41 59                	pop    %r9
    1d05:	54                   	push   %rsp
    1d06:	49                   	rex.WB
    1d07:	4d                   	rex.WRB
    1d08:	45 52                	rex.RB push %r10
    1d0a:	5f                   	pop    %rdi
    1d0b:	4d                   	rex.WRB
    1d0c:	41 58                	pop    %r8
    1d0e:	00 5f 53             	add    %bl,0x53(%rdi)
    1d11:	43 5f                	rex.XB pop %r15
    1d13:	32 5f 46             	xor    0x46(%rdi),%bl
    1d16:	4f 52                	rex.WRXB push %r10
    1d18:	54                   	push   %rsp
    1d19:	5f                   	pop    %rdi
    1d1a:	52                   	push   %rdx
    1d1b:	55                   	push   %rbp
    1d1c:	4e 00 5f 53          	rex.WRX add %r11b,0x53(%rdi)
    1d20:	43 5f                	rex.XB pop %r15
    1d22:	56                   	push   %rsi
    1d23:	37                   	(bad)  
    1d24:	5f                   	pop    %rdi
    1d25:	4c 50                	rex.WR push %rax
    1d27:	36 34 5f             	ss xor $0x5f,%al
    1d2a:	4f                   	rex.WRXB
    1d2b:	46                   	rex.RX
    1d2c:	46                   	rex.RX
    1d2d:	36 34 00             	ss xor $0x0,%al
    1d30:	5f                   	pop    %rdi
    1d31:	53                   	push   %rbx
    1d32:	43 5f                	rex.XB pop %r15
    1d34:	4e 50                	rex.WRX push %rax
    1d36:	52                   	push   %rdx
    1d37:	4f                   	rex.WRXB
    1d38:	43                   	rex.XB
    1d39:	45 53                	rex.RB push %r11
    1d3b:	53                   	push   %rbx
    1d3c:	4f 52                	rex.WRXB push %r10
    1d3e:	53                   	push   %rbx
    1d3f:	5f                   	pop    %rdi
    1d40:	43                   	rex.XB
    1d41:	4f                   	rex.WRXB
    1d42:	4e                   	rex.WRX
    1d43:	46 00 5f 53          	rex.RX add %r11b,0x53(%rdi)
    1d47:	43 5f                	rex.XB pop %r15
    1d49:	53                   	push   %rbx
    1d4a:	48 52                	rex.W push %rdx
    1d4c:	54                   	push   %rsp
    1d4d:	5f                   	pop    %rdi
    1d4e:	4d                   	rex.WRB
    1d4f:	41 58                	pop    %r8
    1d51:	00 5f 53             	add    %bl,0x53(%rdi)
    1d54:	43 5f                	rex.XB pop %r15
    1d56:	41                   	rex.B
    1d57:	49                   	rex.WB
    1d58:	4f 5f                	rex.WRXB pop %r15
    1d5a:	4d                   	rex.WRB
    1d5b:	41 58                	pop    %r8
    1d5d:	00 5f 5f             	add    %bl,0x5f(%rdi)
    1d60:	6e                   	outsb  %ds:(%rsi),(%dx)
    1d61:	75 6d                	jne    1dd0 <_fini+0x8b8>
    1d63:	65 72 69             	gs jb  1dcf <_fini+0x8b7>
    1d66:	63 5f 74             	movslq 0x74(%rdi),%ebx
    1d69:	72 61                	jb     1dcc <_fini+0x8b4>
    1d6b:	69 74 73 5f 69 6e 74 	imul   $0x65746e69,0x5f(%rbx,%rsi,2),%esi
    1d72:	65 
    1d73:	67 65 72 3c          	addr32 gs jb 1db3 <_fini+0x89b>
    1d77:	6c                   	insb   (%dx),%es:(%rdi)
    1d78:	6f                   	outsl  %ds:(%rsi),(%dx)
    1d79:	6e                   	outsb  %ds:(%rsi),(%dx)
    1d7a:	67 20 69 6e          	and    %ch,0x6e(%ecx)
    1d7e:	74 3e                	je     1dbe <_fini+0x8a6>
    1d80:	00 5f 53             	add    %bl,0x53(%rdi)
    1d83:	43 5f                	rex.XB pop %r15
    1d85:	52                   	push   %rdx
    1d86:	45                   	rex.RB
    1d87:	47                   	rex.RXB
    1d88:	45 58                	rex.RB pop %r8
    1d8a:	5f                   	pop    %rdi
    1d8b:	56                   	push   %rsi
    1d8c:	45 52                	rex.RB push %r10
    1d8e:	53                   	push   %rbx
    1d8f:	49                   	rex.WB
    1d90:	4f                   	rex.WRXB
    1d91:	4e 00 5f 53          	rex.WRX add %r11b,0x53(%rdi)
    1d95:	43 5f                	rex.XB pop %r15
    1d97:	4c                   	rex.WR
    1d98:	45 56                	rex.RB push %r14
    1d9a:	45                   	rex.RB
    1d9b:	4c 32 5f 43          	rex.WR xor 0x43(%rdi),%r11b
    1d9f:	41                   	rex.B
    1da0:	43                   	rex.XB
    1da1:	48                   	rex.W
    1da2:	45 5f                	rex.RB pop %r15
    1da4:	4c                   	rex.WR
    1da5:	49                   	rex.WB
    1da6:	4e                   	rex.WRX
    1da7:	45 53                	rex.RB push %r11
    1da9:	49 5a                	rex.WB pop %r10
    1dab:	45 00 5f 5f          	add    %r11b,0x5f(%r15)
    1daf:	6e                   	outsb  %ds:(%rsi),(%dx)
    1db0:	75 6d                	jne    1e1f <_fini+0x907>
    1db2:	65 72 69             	gs jb  1e1e <_fini+0x906>
    1db5:	63 5f 74             	movslq 0x74(%rdi),%ebx
    1db8:	72 61                	jb     1e1b <_fini+0x903>
    1dba:	69 74 73 5f 66 6c 6f 	imul   $0x616f6c66,0x5f(%rbx,%rsi,2),%esi
    1dc1:	61 
    1dc2:	74 69                	je     1e2d <_fini+0x915>
    1dc4:	6e                   	outsb  %ds:(%rsi),(%dx)
    1dc5:	67 3c 64             	addr32 cmp $0x64,%al
    1dc8:	6f                   	outsl  %ds:(%rsi),(%dx)
    1dc9:	75 62                	jne    1e2d <_fini+0x915>
    1dcb:	6c                   	insb   (%dx),%es:(%rdi)
    1dcc:	65 3e 00 74 6d 5f    	gs add %dh,%ds:0x5f(%rbp,%rbp,2)
    1dd2:	6d                   	insl   (%dx),%es:(%rdi)
    1dd3:	64 61                	fs (bad) 
    1dd5:	79 00                	jns    1dd7 <_fini+0x8bf>
    1dd7:	77 63                	ja     1e3c <_fini+0x924>
    1dd9:	73 6e                	jae    1e49 <_fini+0x931>
    1ddb:	63 70 79             	movslq 0x79(%rax),%esi
    1dde:	00 5f 53             	add    %bl,0x53(%rdi)
    1de1:	43 5f                	rex.XB pop %r15
    1de3:	53                   	push   %rbx
    1de4:	48                   	rex.W
    1de5:	41 52                	push   %r10
    1de7:	45                   	rex.RB
    1de8:	44 5f                	rex.R pop %rdi
    1dea:	4d                   	rex.WRB
    1deb:	45                   	rex.RB
    1dec:	4d                   	rex.WRB
    1ded:	4f 52                	rex.WRXB push %r10
    1def:	59                   	pop    %rcx
    1df0:	5f                   	pop    %rdi
    1df1:	4f                   	rex.WRXB
    1df2:	42                   	rex.X
    1df3:	4a                   	rex.WX
    1df4:	45                   	rex.RB
    1df5:	43 54                	rex.XB push %r12
    1df7:	53                   	push   %rbx
    1df8:	00 5f 5f             	add    %bl,0x5f(%rdi)
    1dfb:	77 63                	ja     1e60 <_fini+0x948>
    1dfd:	68 62 00 62 73       	pushq  $0x73620062
    1e02:	65 61                	gs (bad) 
    1e04:	72 63                	jb     1e69 <_fini+0x951>
    1e06:	68 00 5f 5a 4e       	pushq  $0x4e5a5f00
    1e0b:	4b 53                	rex.WXB push %r11
    1e0d:	74 31                	je     1e40 <_fini+0x928>
    1e0f:	37                   	(bad)  
    1e10:	69 6e 74 65 67 72 61 	imul   $0x61726765,0x74(%rsi),%ebp
    1e17:	6c                   	insb   (%dx),%es:(%rdi)
    1e18:	5f                   	pop    %rdi
    1e19:	63 6f 6e             	movslq 0x6e(%rdi),%ebp
    1e1c:	73 74                	jae    1e92 <_fini+0x97a>
    1e1e:	61                   	(bad)  
    1e1f:	6e                   	outsb  %ds:(%rsi),(%dx)
    1e20:	74 49                	je     1e6b <_fini+0x953>
    1e22:	62                   	(bad)  
    1e23:	4c 62 31 45 45 63 6c 	rex.WR vpacksswb 0x1d80(%rbp,%r8,2),%zmm23,%zmm13{%k5}
    1e2a:	45 76 
    1e2c:	00 67 65             	add    %ah,0x65(%rdi)
    1e2f:	74 64                	je     1e95 <_fini+0x97d>
    1e31:	61                   	(bad)  
    1e32:	74 65                	je     1e99 <_fini+0x981>
    1e34:	5f                   	pop    %rdi
    1e35:	65 72 72             	gs jb  1eaa <_fini+0x992>
    1e38:	00 5f 5a             	add    %bl,0x5a(%rdi)
    1e3b:	31 30                	xor    %esi,(%rax)
    1e3d:	74 68                	je     1ea7 <_fini+0x98f>
    1e3f:	72 65                	jb     1ea6 <_fini+0x98e>
    1e41:	61                   	(bad)  
    1e42:	64 46 75 6e          	fs rex.RX jne 1eb4 <_fini+0x99c>
    1e46:	63 50 76             	movslq 0x76(%rax),%edx
    1e49:	00 6f 70             	add    %ch,0x70(%rdi)
    1e4c:	74 6f                	je     1ebd <_fini+0x9a5>
    1e4e:	70 74                	jo     1ec4 <_fini+0x9ac>
    1e50:	00 5f 5a             	add    %bl,0x5a(%rdi)
    1e53:	4e 53                	rex.WRX push %rbx
    1e55:	74 31                	je     1e88 <_fini+0x970>
    1e57:	31 63 68             	xor    %esp,0x68(%rbx)
    1e5a:	61                   	(bad)  
    1e5b:	72 5f                	jb     1ebc <_fini+0x9a4>
    1e5d:	74 72                	je     1ed1 <_fini+0x9b9>
    1e5f:	61                   	(bad)  
    1e60:	69 74 73 49 77 45 36 	imul   $0x61364577,0x49(%rbx,%rsi,2),%esi
    1e67:	61 
    1e68:	73 73                	jae    1edd <_fini+0x9c5>
    1e6a:	69 67 6e 45 52 77 52 	imul   $0x52775245,0x6e(%rdi),%esp
    1e71:	4b 77 00             	rex.WXB ja 1e74 <_fini+0x95c>
    1e74:	5f                   	pop    %rdi
    1e75:	5f                   	pop    %rdi
    1e76:	69 6e 74 38 5f 74 00 	imul   $0x745f38,0x74(%rsi),%ebp
    1e7d:	5f                   	pop    %rdi
    1e7e:	5f                   	pop    %rdi
    1e7f:	69 73 5f 69 6e 74 65 	imul   $0x65746e69,0x5f(%rbx),%esi
    1e86:	67 65 72 3c          	addr32 gs jb 1ec6 <_fini+0x9ae>
    1e8a:	64 6f                	outsl  %fs:(%rsi),(%dx)
    1e8c:	75 62                	jne    1ef0 <_fini+0x9d8>
    1e8e:	6c                   	insb   (%dx),%es:(%rdi)
    1e8f:	65 3e 00 5f 5f       	gs add %bl,%ds:0x5f(%rdi)
    1e94:	73 74                	jae    1f0a <_fini+0x9f2>
    1e96:	61                   	(bad)  
    1e97:	74 69                	je     1f02 <_fini+0x9ea>
    1e99:	63 5f 69             	movslq 0x69(%rdi),%ebx
    1e9c:	6e                   	outsb  %ds:(%rsi),(%dx)
    1e9d:	69 74 69 61 6c 69 7a 	imul   $0x617a696c,0x61(%rcx,%rbp,2),%esi
    1ea4:	61 
    1ea5:	74 69                	je     1f10 <_fini+0x9f8>
    1ea7:	6f                   	outsl  %ds:(%rsi),(%dx)
    1ea8:	6e                   	outsb  %ds:(%rsi),(%dx)
    1ea9:	5f                   	pop    %rdi
    1eaa:	61                   	(bad)  
    1eab:	6e                   	outsb  %ds:(%rsi),(%dx)
    1eac:	64 5f                	fs pop %rdi
    1eae:	64 65 73 74          	fs gs jae 1f26 <_fini+0xa0e>
    1eb2:	72 75                	jb     1f29 <_fini+0xa11>
    1eb4:	63 74 69 6f          	movslq 0x6f(%rcx,%rbp,2),%esi
    1eb8:	6e                   	outsb  %ds:(%rsi),(%dx)
    1eb9:	5f                   	pop    %rdi
    1eba:	30 00                	xor    %al,(%rax)
    1ebc:	5f                   	pop    %rdi
    1ebd:	5a                   	pop    %rdx
    1ebe:	4e 53                	rex.WRX push %rbx
    1ec0:	74 31                	je     1ef3 <_fini+0x9db>
    1ec2:	31 63 68             	xor    %esp,0x68(%rbx)
    1ec5:	61                   	(bad)  
    1ec6:	72 5f                	jb     1f27 <_fini+0xa0f>
    1ec8:	74 72                	je     1f3c <_fini+0xa24>
    1eca:	61                   	(bad)  
    1ecb:	69 74 73 49 63 45 37 	imul   $0x63374563,0x49(%rbx,%rsi,2),%esi
    1ed2:	63 
    1ed3:	6f                   	outsl  %ds:(%rsi),(%dx)
    1ed4:	6d                   	insl   (%dx),%es:(%rdi)
    1ed5:	70 61                	jo     1f38 <_fini+0xa20>
    1ed7:	72 65                	jb     1f3e <_fini+0xa26>
    1ed9:	45 50                	rex.RB push %r8
    1edb:	4b 63 53 32          	rex.WXB movslq 0x32(%r11),%rdx
    1edf:	5f                   	pop    %rdi
    1ee0:	6d                   	insl   (%dx),%es:(%rdi)
    1ee1:	00 5f 53             	add    %bl,0x53(%rdi)
    1ee4:	43 5f                	rex.XB pop %r15
    1ee6:	58                   	pop    %rax
    1ee7:	42 53                	rex.X push %rbx
    1ee9:	35 5f 4c 50 36       	xor    $0x36504c5f,%eax
    1eee:	34 5f                	xor    $0x5f,%al
    1ef0:	4f                   	rex.WRXB
    1ef1:	46                   	rex.RX
    1ef2:	46                   	rex.RX
    1ef3:	36 34 00             	ss xor $0x0,%al
    1ef6:	6c                   	insb   (%dx),%es:(%rdi)
    1ef7:	6f                   	outsl  %ds:(%rsi),(%dx)
    1ef8:	6e                   	outsb  %ds:(%rsi),(%dx)
    1ef9:	67 20 6c 6f 6e       	and    %ch,0x6e(%edi,%ebp,2)
    1efe:	67 20 75 6e          	and    %dh,0x6e(%ebp)
    1f02:	73 69                	jae    1f6d <_fini+0xa55>
    1f04:	67 6e                	outsb  %ds:(%esi),(%dx)
    1f06:	65 64 20 69 6e       	gs and %ch,%fs:0x6e(%rcx)
    1f0b:	74 00                	je     1f0d <_fini+0x9f5>
    1f0d:	5f                   	pop    %rdi
    1f0e:	5a                   	pop    %rdx
    1f0f:	53                   	push   %rbx
    1f10:	74 37                	je     1f49 <_fini+0xa31>
    1f12:	6e                   	outsb  %ds:(%rsi),(%dx)
    1f13:	6f                   	outsl  %ds:(%rsi),(%dx)
    1f14:	74 68                	je     1f7e <_fini+0xa66>
    1f16:	72 6f                	jb     1f87 <_fini+0xa6f>
    1f18:	77 00                	ja     1f1a <_fini+0xa02>
    1f1a:	73 77                	jae    1f93 <_fini+0xa7b>
    1f1c:	61                   	(bad)  
    1f1d:	70 00                	jo     1f1f <_fini+0xa07>
    1f1f:	5f                   	pop    %rdi
    1f20:	53                   	push   %rbx
    1f21:	43 5f                	rex.XB pop %r15
    1f23:	56                   	push   %rsi
    1f24:	37                   	(bad)  
    1f25:	5f                   	pop    %rdi
    1f26:	4c 50                	rex.WR push %rax
    1f28:	42                   	rex.X
    1f29:	49                   	rex.WB
    1f2a:	47 5f                	rex.RXB pop %r15
    1f2c:	4f                   	rex.WRXB
    1f2d:	46                   	rex.RX
    1f2e:	46                   	rex.RX
    1f2f:	42                   	rex.X
    1f30:	49                   	rex.WB
    1f31:	47 00 5f 5f          	rex.RXB add %r11b,0x5f(%r15)
    1f35:	6c                   	insb   (%dx),%es:(%rdi)
    1f36:	69 73 74 00 77 63 73 	imul   $0x73637700,0x74(%rbx),%esi
    1f3d:	74 6f                	je     1fae <_fini+0xa96>
    1f3f:	6c                   	insb   (%dx),%es:(%rdi)
    1f40:	64 00 5f 5a          	add    %bl,%fs:0x5a(%rdi)
    1f44:	4e 39 5f 5f          	rex.WRX cmp %r11,0x5f(%rdi)
    1f48:	67 6e                	outsb  %ds:(%esi),(%dx)
    1f4a:	75 5f                	jne    1fab <_fini+0xa93>
    1f4c:	63 78 78             	movslq 0x78(%rax),%edi
    1f4f:	32 34 5f             	xor    (%rdi,%rbx,2),%dh
    1f52:	5f                   	pop    %rdi
    1f53:	6e                   	outsb  %ds:(%rsi),(%dx)
    1f54:	75 6d                	jne    1fc3 <_fini+0xaab>
    1f56:	65 72 69             	gs jb  1fc2 <_fini+0xaaa>
    1f59:	63 5f 74             	movslq 0x74(%rdi),%ebx
    1f5c:	72 61                	jb     1fbf <_fini+0xaa7>
    1f5e:	69 74 73 5f 69 6e 74 	imul   $0x65746e69,0x5f(%rbx,%rsi,2),%esi
    1f65:	65 
    1f66:	67 65 72 49          	addr32 gs jb 1fb3 <_fini+0xa9b>
    1f6a:	6c                   	insb   (%dx),%es:(%rdi)
    1f6b:	45 35 5f 5f 6d 61    	rex.RB xor $0x616d5f5f,%eax
    1f71:	78 45                	js     1fb8 <_fini+0xaa0>
    1f73:	00 5f 53             	add    %bl,0x53(%rdi)
    1f76:	43 5f                	rex.XB pop %r15
    1f78:	4e                   	rex.WRX
    1f79:	4c 5f                	rex.WR pop %rdi
    1f7b:	41 52                	push   %r10
    1f7d:	47                   	rex.RXB
    1f7e:	4d                   	rex.WRB
    1f7f:	41 58                	pop    %r8
    1f81:	00 77 63             	add    %dh,0x63(%rdi)
    1f84:	73 74                	jae    1ffa <_fini+0xae2>
    1f86:	6f                   	outsl  %ds:(%rsi),(%dx)
    1f87:	6c                   	insb   (%dx),%es:(%rdi)
    1f88:	6c                   	insb   (%dx),%es:(%rdi)
    1f89:	00 5f 5f             	add    %bl,0x5f(%rdi)
    1f8c:	6f                   	outsl  %ds:(%rsi),(%dx)
    1f8d:	66 66 5f             	data16 pop %di
    1f90:	74 00                	je     1f92 <_fini+0xa7a>
    1f92:	74 65                	je     1ff9 <_fini+0xae1>
    1f94:	73 74                	jae    200a <_ZStL19piecewise_construct+0x6>
    1f96:	2e 63 63 00          	movslq %cs:0x0(%rbx),%esp
    1f9a:	5f                   	pop    %rdi
    1f9b:	5a                   	pop    %rdx
    1f9c:	33 66 6f             	xor    0x6f(%rsi),%esp
    1f9f:	6f                   	outsl  %ds:(%rsi),(%dx)
    1fa0:	76 00                	jbe    1fa2 <_fini+0xa8a>
    1fa2:	77 63                	ja     2007 <_ZStL19piecewise_construct+0x3>
    1fa4:	73 73                	jae    2019 <_ZStL19piecewise_construct+0x15>
    1fa6:	74 72                	je     201a <_ZStL19piecewise_construct+0x16>
    1fa8:	00 74 68 72          	add    %dh,0x72(%rax,%rbp,2)
    1fac:	65 61                	gs (bad) 
    1fae:	64 46 75 6e          	fs rex.RX jne 2020 <_ZStL19piecewise_construct+0x1c>
    1fb2:	63 00                	movslq (%rax),%eax
    1fb4:	5f                   	pop    %rdi
    1fb5:	5a                   	pop    %rdx
    1fb6:	4e 39 5f 5f          	rex.WRX cmp %r11,0x5f(%rdi)
    1fba:	67 6e                	outsb  %ds:(%esi),(%dx)
    1fbc:	75 5f                	jne    201d <_ZStL19piecewise_construct+0x19>
    1fbe:	63 78 78             	movslq 0x78(%rax),%edi
    1fc1:	32 34 5f             	xor    (%rdi,%rbx,2),%dh
    1fc4:	5f                   	pop    %rdi
    1fc5:	6e                   	outsb  %ds:(%rsi),(%dx)
    1fc6:	75 6d                	jne    2035 <__GNU_EH_FRAME_HDR+0x9>
    1fc8:	65 72 69             	gs jb  2034 <__GNU_EH_FRAME_HDR+0x8>
    1fcb:	63 5f 74             	movslq 0x74(%rdi),%ebx
    1fce:	72 61                	jb     2031 <__GNU_EH_FRAME_HDR+0x5>
    1fd0:	69 74 73 5f 69 6e 74 	imul   $0x65746e69,0x5f(%rbx,%rsi,2),%esi
    1fd7:	65 
    1fd8:	67 65 72 49          	addr32 gs jb 2025 <_ZStL19piecewise_construct+0x21>
    1fdc:	63 45 35             	movslq 0x35(%rbp),%eax
    1fdf:	5f                   	pop    %rdi
    1fe0:	5f                   	pop    %rdi
    1fe1:	6d                   	insl   (%dx),%es:(%rdi)
    1fe2:	61                   	(bad)  
    1fe3:	78 45                	js     202a <_ZStL19piecewise_construct+0x26>
    1fe5:	00 5f 53             	add    %bl,0x53(%rdi)
    1fe8:	43 5f                	rex.XB pop %r15
    1fea:	53                   	push   %rbx
    1feb:	49                   	rex.WB
    1fec:	4e                   	rex.WRX
    1fed:	47                   	rex.RXB
    1fee:	4c                   	rex.WR
    1fef:	45 5f                	rex.RB pop %r15
    1ff1:	50                   	push   %rax
    1ff2:	52                   	push   %rdx
    1ff3:	4f                   	rex.WRXB
    1ff4:	43                   	rex.XB
    1ff5:	45 53                	rex.RB push %r11
    1ff7:	53                   	push   %rbx
    1ff8:	00 5f 5a             	add    %bl,0x5a(%rdi)
    1ffb:	4e 53                	rex.WRX push %rbx
    1ffd:	74 31                	je     2030 <__GNU_EH_FRAME_HDR+0x4>
    1fff:	35 5f 5f 65 78       	xor    $0x78655f5f,%eax
    2004:	63 65 70             	movslq 0x70(%rbp),%esp
    2007:	74 69                	je     2072 <__GNU_EH_FRAME_HDR+0x46>
    2009:	6f                   	outsl  %ds:(%rsi),(%dx)
    200a:	6e                   	outsb  %ds:(%rsi),(%dx)
    200b:	5f                   	pop    %rdi
    200c:	70 74                	jo     2082 <__GNU_EH_FRAME_HDR+0x56>
    200e:	72 31                	jb     2041 <__GNU_EH_FRAME_HDR+0x15>
    2010:	33 65 78             	xor    0x78(%rbp),%esp
    2013:	63 65 70             	movslq 0x70(%rbp),%esp
    2016:	74 69                	je     2081 <__GNU_EH_FRAME_HDR+0x55>
    2018:	6f                   	outsl  %ds:(%rsi),(%dx)
    2019:	6e                   	outsb  %ds:(%rsi),(%dx)
    201a:	5f                   	pop    %rdi
    201b:	70 74                	jo     2091 <__GNU_EH_FRAME_HDR+0x65>
    201d:	72 43                	jb     2062 <__GNU_EH_FRAME_HDR+0x36>
    201f:	34 45                	xor    $0x45,%al
    2021:	44 6e                	rex.R outsb %ds:(%rsi),(%dx)
    2023:	00 5f 5a             	add    %bl,0x5a(%rdi)
    2026:	53                   	push   %rbx
    2027:	74 31                	je     205a <__GNU_EH_FRAME_HDR+0x2e>
    2029:	37                   	(bad)  
    202a:	72 65                	jb     2091 <__GNU_EH_FRAME_HDR+0x65>
    202c:	74 68                	je     2096 <__GNU_EH_FRAME_HDR+0x6a>
    202e:	72 6f                	jb     209f <__GNU_EH_FRAME_HDR+0x73>
    2030:	77 5f                	ja     2091 <__GNU_EH_FRAME_HDR+0x65>
    2032:	65 78 63             	gs js  2098 <__GNU_EH_FRAME_HDR+0x6c>
    2035:	65 70 74             	gs jo  20ac <__GNU_EH_FRAME_HDR+0x80>
    2038:	69 6f 6e 4e 53 74 31 	imul   $0x3174534e,0x6e(%rdi),%ebp
    203f:	35 5f 5f 65 78       	xor    $0x78655f5f,%eax
    2044:	63 65 70             	movslq 0x70(%rbp),%esp
    2047:	74 69                	je     20b2 <__GNU_EH_FRAME_HDR+0x86>
    2049:	6f                   	outsl  %ds:(%rsi),(%dx)
    204a:	6e                   	outsb  %ds:(%rsi),(%dx)
    204b:	5f                   	pop    %rdi
    204c:	70 74                	jo     20c2 <__GNU_EH_FRAME_HDR+0x96>
    204e:	72 31                	jb     2081 <__GNU_EH_FRAME_HDR+0x55>
    2050:	33 65 78             	xor    0x78(%rbp),%esp
    2053:	63 65 70             	movslq 0x70(%rbp),%esp
    2056:	74 69                	je     20c1 <__GNU_EH_FRAME_HDR+0x95>
    2058:	6f                   	outsl  %ds:(%rsi),(%dx)
    2059:	6e                   	outsb  %ds:(%rsi),(%dx)
    205a:	5f                   	pop    %rdi
    205b:	70 74                	jo     20d1 <__GNU_EH_FRAME_HDR+0xa5>
    205d:	72 45                	jb     20a4 <__GNU_EH_FRAME_HDR+0x78>
    205f:	00 5f 53             	add    %bl,0x53(%rdi)
    2062:	43 5f                	rex.XB pop %r15
    2064:	43                   	rex.XB
    2065:	48                   	rex.W
    2066:	49                   	rex.WB
    2067:	4c                   	rex.WR
    2068:	44 5f                	rex.R pop %rdi
    206a:	4d                   	rex.WRB
    206b:	41 58                	pop    %r8
    206d:	00 73 65             	add    %dh,0x65(%rbx)
    2070:	74 62                	je     20d4 <__GNU_EH_FRAME_HDR+0xa8>
    2072:	75 66                	jne    20da <__GNU_EH_FRAME_HDR+0xae>
    2074:	00 74 6d 5f          	add    %dh,0x5f(%rbp,%rbp,2)
    2078:	73 65                	jae    20df <__GNU_EH_FRAME_HDR+0xb3>
    207a:	63 00                	movslq (%rax),%eax
    207c:	5f                   	pop    %rdi
    207d:	53                   	push   %rbx
    207e:	43 5f                	rex.XB pop %r15
    2080:	41 56                	push   %r14
    2082:	50                   	push   %rax
    2083:	48 59                	rex.W pop %rcx
    2085:	53                   	push   %rbx
    2086:	5f                   	pop    %rdi
    2087:	50                   	push   %rax
    2088:	41                   	rex.B
    2089:	47                   	rex.RXB
    208a:	45 53                	rex.RB push %r11
    208c:	00 5f 53             	add    %bl,0x53(%rdi)
    208f:	43 5f                	rex.XB pop %r15
    2091:	58                   	pop    %rax
    2092:	4f 50                	rex.WRXB push %r8
    2094:	45                   	rex.RB
    2095:	4e 5f                	rex.WRX pop %rdi
    2097:	53                   	push   %rbx
    2098:	48                   	rex.W
    2099:	4d 00 5f 53          	rex.WRB add %r11b,0x53(%r15)
    209d:	43 5f                	rex.XB pop %r15
    209f:	54                   	push   %rsp
    20a0:	48 52                	rex.W push %rdx
    20a2:	45                   	rex.RB
    20a3:	41                   	rex.B
    20a4:	44 5f                	rex.R pop %rdi
    20a6:	53                   	push   %rbx
    20a7:	50                   	push   %rax
    20a8:	4f 52                	rex.WRXB push %r10
    20aa:	41                   	rex.B
    20ab:	44                   	rex.R
    20ac:	49                   	rex.WB
    20ad:	43 5f                	rex.XB pop %r15
    20af:	53                   	push   %rbx
    20b0:	45 52                	rex.RB push %r10
    20b2:	56                   	push   %rsi
    20b3:	45 52                	rex.RB push %r10
    20b5:	00 77 63             	add    %dh,0x63(%rdi)
    20b8:	73 72                	jae    212c <__GNU_EH_FRAME_HDR+0x100>
    20ba:	74 6f                	je     212b <__GNU_EH_FRAME_HDR+0xff>
    20bc:	6d                   	insl   (%dx),%es:(%rdi)
    20bd:	62 73                	(bad)  
    20bf:	00 5f 5f             	add    %bl,0x5f(%rdi)
    20c2:	69 6e 74 5f 6c 65 61 	imul   $0x61656c5f,0x74(%rsi),%ebp
    20c9:	73 74                	jae    213f <__GNU_EH_FRAME_HDR+0x113>
    20cb:	31 36                	xor    %esi,(%rsi)
    20cd:	5f                   	pop    %rdi
    20ce:	74 00                	je     20d0 <__GNU_EH_FRAME_HDR+0xa4>
    20d0:	5f                   	pop    %rdi
    20d1:	66 72 65             	data16 jb 2139 <__GNU_EH_FRAME_HDR+0x10d>
    20d4:	65 72 65             	gs jb  213c <__GNU_EH_FRAME_HDR+0x110>
    20d7:	73 5f                	jae    2138 <__GNU_EH_FRAME_HDR+0x10c>
    20d9:	62                   	(bad)  
    20da:	75 66                	jne    2142 <__GNU_EH_FRAME_HDR+0x116>
    20dc:	00 74 6d 5f          	add    %dh,0x5f(%rbp,%rbp,2)
    20e0:	77 64                	ja     2146 <__GNU_EH_FRAME_HDR+0x11a>
    20e2:	61                   	(bad)  
    20e3:	79 00                	jns    20e5 <__GNU_EH_FRAME_HDR+0xb9>
    20e5:	5f                   	pop    %rdi
    20e6:	5a                   	pop    %rdx
    20e7:	4e 53                	rex.WRX push %rbx
    20e9:	74 31                	je     211c <__GNU_EH_FRAME_HDR+0xf0>
    20eb:	31 63 68             	xor    %esp,0x68(%rbx)
    20ee:	61                   	(bad)  
    20ef:	72 5f                	jb     2150 <__GNU_EH_FRAME_HDR+0x124>
    20f1:	74 72                	je     2165 <__GNU_EH_FRAME_HDR+0x139>
    20f3:	61                   	(bad)  
    20f4:	69 74 73 49 63 45 32 	imul   $0x65324563,0x49(%rbx,%rsi,2),%esi
    20fb:	65 
    20fc:	71 45                	jno    2143 <__GNU_EH_FRAME_HDR+0x117>
    20fe:	52                   	push   %rdx
    20ff:	4b 63 53 32          	rex.WXB movslq 0x32(%r11),%rdx
    2103:	5f                   	pop    %rdi
    2104:	00 5f 5a             	add    %bl,0x5a(%rdi)
    2107:	53                   	push   %rbx
    2108:	74 33                	je     213d <__GNU_EH_FRAME_HDR+0x111>
    210a:	61                   	(bad)  
    210b:	62 73                	(bad)  
    210d:	78 00                	js     210f <__GNU_EH_FRAME_HDR+0xe3>
    210f:	5f                   	pop    %rdi
    2110:	53                   	push   %rbx
    2111:	43 5f                	rex.XB pop %r15
    2113:	53                   	push   %rbx
    2114:	53                   	push   %rbx
    2115:	5f                   	pop    %rdi
    2116:	52                   	push   %rdx
    2117:	45 50                	rex.RB push %r8
    2119:	4c 5f                	rex.WR pop %rdi
    211b:	4d                   	rex.WRB
    211c:	41 58                	pop    %r8
    211e:	00 6d 62             	add    %ch,0x62(%rbp)
    2121:	73 69                	jae    218c <__GNU_EH_FRAME_HDR+0x160>
    2123:	6e                   	outsb  %ds:(%rsi),(%dx)
    2124:	69 74 00 6f 70 65 72 	imul   $0x61726570,0x6f(%rax,%rax,1),%esi
    212b:	61 
    212c:	74 6f                	je     219d <__GNU_EH_FRAME_HDR+0x171>
    212e:	72 28                	jb     2158 <__GNU_EH_FRAME_HDR+0x12c>
    2130:	29 00                	sub    %eax,(%rax)
    2132:	5f                   	pop    %rdi
    2133:	5f                   	pop    %rdi
    2134:	75 69                	jne    219f <__GNU_EH_FRAME_HDR+0x173>
    2136:	6e                   	outsb  %ds:(%rsi),(%dx)
    2137:	74 31                	je     216a <__GNU_EH_FRAME_HDR+0x13e>
    2139:	36 5f                	ss pop %rdi
    213b:	74 00                	je     213d <__GNU_EH_FRAME_HDR+0x111>
    213d:	77 63                	ja     21a2 <__GNU_EH_FRAME_HDR+0x176>
    213f:	73 74                	jae    21b5 <__GNU_EH_FRAME_HDR+0x189>
    2141:	6f                   	outsl  %ds:(%rsi),(%dx)
    2142:	64 00 5f 53          	add    %bl,%fs:0x53(%rdi)
    2146:	43 5f                	rex.XB pop %r15
    2148:	4e                   	rex.WRX
    2149:	4c 5f                	rex.WR pop %rdi
    214b:	4e                   	rex.WRX
    214c:	4d                   	rex.WRB
    214d:	41 58                	pop    %r8
    214f:	00 69 6e             	add    %ch,0x6e(%rcx)
    2152:	74 65                	je     21b9 <__GNU_EH_FRAME_HDR+0x18d>
    2154:	67 72 61             	addr32 jb 21b8 <__GNU_EH_FRAME_HDR+0x18c>
    2157:	6c                   	insb   (%dx),%es:(%rdi)
    2158:	5f                   	pop    %rdi
    2159:	63 6f 6e             	movslq 0x6e(%rdi),%ebp
    215c:	73 74                	jae    21d2 <__GNU_EH_FRAME_HDR+0x1a6>
    215e:	61                   	(bad)  
    215f:	6e                   	outsb  %ds:(%rsi),(%dx)
    2160:	74 3c                	je     219e <__GNU_EH_FRAME_HDR+0x172>
    2162:	62                   	(bad)  
    2163:	6f                   	outsl  %ds:(%rsi),(%dx)
    2164:	6f                   	outsl  %ds:(%rsi),(%dx)
    2165:	6c                   	insb   (%dx),%es:(%rdi)
    2166:	2c 20                	sub    $0x20,%al
    2168:	66 61                	data16 (bad) 
    216a:	6c                   	insb   (%dx),%es:(%rdi)
    216b:	73 65                	jae    21d2 <__GNU_EH_FRAME_HDR+0x1a6>
    216d:	3e 00 77 63          	add    %dh,%ds:0x63(%rdi)
    2171:	73 74                	jae    21e7 <__GNU_EH_FRAME_HDR+0x1bb>
    2173:	6f                   	outsl  %ds:(%rsi),(%dx)
    2174:	6b 00 5f             	imul   $0x5f,(%rax),%eax
    2177:	5f                   	pop    %rdi
    2178:	63 78 78             	movslq 0x78(%rax),%edi
    217b:	31 31                	xor    %esi,(%rcx)
    217d:	00 5f 5f             	add    %bl,0x5f(%rdi)
    2180:	66 70 6f             	data16 jo 21f2 <__GNU_EH_FRAME_HDR+0x1c6>
    2183:	73 5f                	jae    21e4 <__GNU_EH_FRAME_HDR+0x1b8>
    2185:	74 00                	je     2187 <__GNU_EH_FRAME_HDR+0x15b>
    2187:	5f                   	pop    %rdi
    2188:	5a                   	pop    %rdx
    2189:	53                   	push   %rbx
    218a:	74 33                	je     21bf <__GNU_EH_FRAME_HDR+0x193>
    218c:	64 69 76 6c 6c 00 71 	imul   $0x7571006c,%fs:0x6c(%rsi),%esi
    2193:	75 
    2194:	6f                   	outsl  %ds:(%rsi),(%dx)
    2195:	74 00                	je     2197 <__GNU_EH_FRAME_HDR+0x16b>
    2197:	5f                   	pop    %rdi
    2198:	5f                   	pop    %rdi
    2199:	46                   	rex.RX
    219a:	49                   	rex.WB
    219b:	4c                   	rex.WR
    219c:	45 00 77 69          	add    %r14b,0x69(%r15)
    21a0:	73 74                	jae    2216 <__GNU_EH_FRAME_HDR+0x1ea>
    21a2:	72 65                	jb     2209 <__GNU_EH_FRAME_HDR+0x1dd>
    21a4:	61                   	(bad)  
    21a5:	6d                   	insl   (%dx),%es:(%rdi)
    21a6:	00 62 61             	add    %ah,0x61(%rdx)
    21a9:	73 69                	jae    2214 <__GNU_EH_FRAME_HDR+0x1e8>
    21ab:	63 5f 69             	movslq 0x69(%rdi),%ebx
    21ae:	73 74                	jae    2224 <__FRAME_END__+0x8>
    21b0:	72 65                	jb     2217 <__GNU_EH_FRAME_HDR+0x1eb>
    21b2:	61                   	(bad)  
    21b3:	6d                   	insl   (%dx),%es:(%rdi)
    21b4:	3c 77                	cmp    $0x77,%al
    21b6:	63 68 61             	movslq 0x61(%rax),%ebp
    21b9:	72 5f                	jb     221a <__GNU_EH_FRAME_HDR+0x1ee>
    21bb:	74 2c                	je     21e9 <__GNU_EH_FRAME_HDR+0x1bd>
    21bd:	20 73 74             	and    %dh,0x74(%rbx)
    21c0:	64 3a 3a             	cmp    %fs:(%rdx),%bh
    21c3:	63 68 61             	movslq 0x61(%rax),%ebp
    21c6:	72 5f                	jb     2227 <__FRAME_END__+0xb>
    21c8:	74 72                	je     223c <__FRAME_END__+0x20>
    21ca:	61                   	(bad)  
    21cb:	69 74 73 3c 77 63 68 	imul   $0x61686377,0x3c(%rbx,%rsi,2),%esi
    21d2:	61 
    21d3:	72 5f                	jb     2234 <__FRAME_END__+0x18>
    21d5:	74 3e                	je     2215 <__GNU_EH_FRAME_HDR+0x1e9>
    21d7:	20 3e                	and    %bh,(%rsi)
    21d9:	00 5f 5f             	add    %bl,0x5f(%rdi)
    21dc:	69 6e 74 31 36 5f 74 	imul   $0x745f3631,0x74(%rsi),%ebp
    21e3:	00 75 69             	add    %dh,0x69(%rbp)
    21e6:	6e                   	outsb  %ds:(%rsi),(%dx)
    21e7:	74 5f                	je     2248 <__FRAME_END__+0x2c>
    21e9:	66 61                	data16 (bad) 
    21eb:	73 74                	jae    2261 <__FRAME_END__+0x45>
    21ed:	38 5f 74             	cmp    %bl,0x74(%rdi)
    21f0:	00 5f 49             	add    %bl,0x49(%rdi)
    21f3:	4f 5f                	rex.WRXB pop %r15
    21f5:	62 61                	(bad)  
    21f7:	63 6b 75             	movslq 0x75(%rbx),%ebp
    21fa:	70 5f                	jo     225b <__FRAME_END__+0x3f>
    21fc:	62 61                	(bad)  
    21fe:	73 65                	jae    2265 <__FRAME_END__+0x49>
    2200:	00 73 65             	add    %dh,0x65(%rbx)
    2203:	74 6c                	je     2271 <__FRAME_END__+0x55>
    2205:	6f                   	outsl  %ds:(%rsi),(%dx)
    2206:	63 61 6c             	movslq 0x6c(%rcx),%esp
    2209:	65 00 5f 73          	add    %bl,%gs:0x73(%rdi)
    220d:	68 6f 72 74 62       	pushq  $0x6274726f
    2212:	75 66                	jne    227a <__FRAME_END__+0x5e>
    2214:	00 5f 53             	add    %bl,0x53(%rdi)
    2217:	43 5f                	rex.XB pop %r15
    2219:	32 5f 50             	xor    0x50(%rdi),%bl
    221c:	42 53                	rex.X push %rbx
    221e:	5f                   	pop    %rdi
    221f:	4d                   	rex.WRB
    2220:	45 53                	rex.RB push %r11
    2222:	53                   	push   %rbx
    2223:	41                   	rex.B
    2224:	47                   	rex.RXB
    2225:	45 00 5f 5f          	add    %r11b,0x5f(%r15)
    2229:	69 73 6f 63 39 39 5f 	imul   $0x5f393963,0x6f(%rbx),%esi
    2230:	76 73                	jbe    22a5 <__FRAME_END__+0x89>
    2232:	77 73                	ja     22a7 <__FRAME_END__+0x8b>
    2234:	63 61 6e             	movslq 0x6e(%rcx),%esp
    2237:	66 00 5f 53          	data16 add %bl,0x53(%rdi)
    223b:	43 5f                	rex.XB pop %r15
    223d:	53                   	push   %rbx
    223e:	45                   	rex.RB
    223f:	4d 5f                	rex.WRB pop %r15
    2241:	4e 53                	rex.WRX push %rbx
    2243:	45                   	rex.RB
    2244:	4d 53                	rex.WRB push %r11
    2246:	5f                   	pop    %rdi
    2247:	4d                   	rex.WRB
    2248:	41 58                	pop    %r8
    224a:	00 77 69             	add    %dh,0x69(%rdi)
    224d:	6e                   	outsb  %ds:(%rsi),(%dx)
    224e:	74 5f                	je     22af <__FRAME_END__+0x93>
    2250:	74 00                	je     2252 <__FRAME_END__+0x36>
    2252:	5f                   	pop    %rdi
    2253:	53                   	push   %rbx
    2254:	43 5f                	rex.XB pop %r15
    2256:	54                   	push   %rsp
    2257:	5f                   	pop    %rdi
    2258:	49                   	rex.WB
    2259:	4f 56                	rex.WRXB push %r14
    225b:	5f                   	pop    %rdi
    225c:	4d                   	rex.WRB
    225d:	41 58                	pop    %r8
    225f:	00 5f 53             	add    %bl,0x53(%rdi)
    2262:	43 5f                	rex.XB pop %r15
    2264:	50                   	push   %rax
    2265:	52                   	push   %rdx
    2266:	49                   	rex.WB
    2267:	4f 52                	rex.WRXB push %r10
    2269:	49 54                	rex.WB push %r12
    226b:	49 5a                	rex.WB pop %r10
    226d:	45                   	rex.RB
    226e:	44 5f                	rex.R pop %rdi
    2270:	49                   	rex.WB
    2271:	4f 00 5f 5f          	rex.WRXB add %r11b,0x5f(%r15)
    2275:	69 6e 74 31 32 38 00 	imul   $0x383231,0x74(%rsi),%ebp
    227c:	5f                   	pop    %rdi
    227d:	5f                   	pop    %rdi
    227e:	61                   	(bad)  
    227f:	6c                   	insb   (%dx),%es:(%rdi)
    2280:	69 67 6e 00 69 6f 73 	imul   $0x736f6900,0x6e(%rdi),%esp
    2287:	5f                   	pop    %rdi
    2288:	62 61                	(bad)  
    228a:	73 65                	jae    22f1 <__FRAME_END__+0xd5>
    228c:	00 5f 5f             	add    %bl,0x5f(%rdi)
    228f:	6f                   	outsl  %ds:(%rsi),(%dx)
    2290:	66 66 36 34 5f       	data16 data16 ss xor $0x5f,%al
    2295:	74 00                	je     2297 <__FRAME_END__+0x7b>
    2297:	5f                   	pop    %rdi
    2298:	53                   	push   %rbx
    2299:	43 5f                	rex.XB pop %r15
    229b:	56                   	push   %rsi
    229c:	36 5f                	ss pop %rdi
    229e:	49                   	rex.WB
    229f:	4c 50                	rex.WR push %rax
    22a1:	33 32                	xor    (%rdx),%esi
    22a3:	5f                   	pop    %rdi
    22a4:	4f                   	rex.WRXB
    22a5:	46                   	rex.RX
    22a6:	46 33 32             	rex.RX xor (%rdx),%r14d
    22a9:	00 5f 53             	add    %bl,0x53(%rdi)
    22ac:	43 5f                	rex.XB pop %r15
    22ae:	53                   	push   %rbx
    22af:	54                   	push   %rsp
    22b0:	52                   	push   %rdx
    22b1:	45                   	rex.RB
    22b2:	41                   	rex.B
    22b3:	4d 5f                	rex.WRB pop %r15
    22b5:	4d                   	rex.WRB
    22b6:	41 58                	pop    %r8
    22b8:	00 66 6f             	add    %ah,0x6f(%rsi)
    22bb:	70 65                	jo     2322 <__FRAME_END__+0x106>
    22bd:	6e                   	outsb  %ds:(%rsi),(%dx)
    22be:	00 5f 53             	add    %bl,0x53(%rdi)
    22c1:	43 5f                	rex.XB pop %r15
    22c3:	54                   	push   %rsp
    22c4:	5a                   	pop    %rdx
    22c5:	4e                   	rex.WRX
    22c6:	41                   	rex.B
    22c7:	4d                   	rex.WRB
    22c8:	45 5f                	rex.RB pop %r15
    22ca:	4d                   	rex.WRB
    22cb:	41 58                	pop    %r8
    22cd:	00 5f 53             	add    %bl,0x53(%rdi)
    22d0:	43 5f                	rex.XB pop %r15
    22d2:	32 5f 50             	xor    0x50(%rdi),%bl
    22d5:	42 53                	rex.X push %rbx
    22d7:	5f                   	pop    %rdi
    22d8:	43                   	rex.XB
    22d9:	48                   	rex.W
    22da:	45                   	rex.RB
    22db:	43                   	rex.XB
    22dc:	4b 50                	rex.WXB push %r8
    22de:	4f                   	rex.WRXB
    22df:	49                   	rex.WB
    22e0:	4e 54                	rex.WRX push %rsp
    22e2:	00 5f 53             	add    %bl,0x53(%rdi)
    22e5:	43 5f                	rex.XB pop %r15
    22e7:	53                   	push   %rbx
    22e8:	50                   	push   %rax
    22e9:	41 57                	push   %r15
    22eb:	4e 00 5f 53          	rex.WRX add %r11b,0x53(%rdi)
    22ef:	43 5f                	rex.XB pop %r15
    22f1:	4d                   	rex.WRB
    22f2:	45                   	rex.RB
    22f3:	4d                   	rex.WRB
    22f4:	4c                   	rex.WR
    22f5:	4f                   	rex.WRXB
    22f6:	43                   	rex.XB
    22f7:	4b 5f                	rex.WXB pop %r15
    22f9:	52                   	push   %rdx
    22fa:	41                   	rex.B
    22fb:	4e                   	rex.WRX
    22fc:	47                   	rex.RXB
    22fd:	45 00 5f 53          	add    %r11b,0x53(%r15)
    2301:	43 5f                	rex.XB pop %r15
    2303:	42                   	rex.X
    2304:	43 5f                	rex.XB pop %r15
    2306:	53                   	push   %rbx
    2307:	43                   	rex.XB
    2308:	41                   	rex.B
    2309:	4c                   	rex.WR
    230a:	45 5f                	rex.RB pop %r15
    230c:	4d                   	rex.WRB
    230d:	41 58                	pop    %r8
    230f:	00 5f 5f             	add    %bl,0x5f(%rdi)
    2312:	69 73 6f 63 39 39 5f 	imul   $0x5f393963,0x6f(%rbx),%esi
    2319:	76 66                	jbe    2381 <__FRAME_END__+0x165>
    231b:	77 73                	ja     2390 <__FRAME_END__+0x174>
    231d:	63 61 6e             	movslq 0x6e(%rcx),%esp
    2320:	66 00 5f 53          	data16 add %bl,0x53(%rdi)
    2324:	43 5f                	rex.XB pop %r15
    2326:	54                   	push   %rsp
    2327:	52                   	push   %rdx
    2328:	41                   	rex.B
    2329:	43                   	rex.XB
    232a:	45 5f                	rex.RB pop %r15
    232c:	53                   	push   %rbx
    232d:	59                   	pop    %rcx
    232e:	53                   	push   %rbx
    232f:	5f                   	pop    %rdi
    2330:	4d                   	rex.WRB
    2331:	41 58                	pop    %r8
    2333:	00 5f 53             	add    %bl,0x53(%rdi)
    2336:	43 5f                	rex.XB pop %r15
    2338:	53                   	push   %rbx
    2339:	59                   	pop    %rcx
    233a:	4d                   	rex.WRB
    233b:	4c                   	rex.WR
    233c:	4f                   	rex.WRXB
    233d:	4f 50                	rex.WRXB push %r8
    233f:	5f                   	pop    %rdi
    2340:	4d                   	rex.WRB
    2341:	41 58                	pop    %r8
    2343:	00 6d 62             	add    %ch,0x62(%rbp)
    2346:	6c                   	insb   (%dx),%es:(%rdi)
    2347:	65 6e                	outsb  %gs:(%rsi),(%dx)
    2349:	00 72 65             	add    %dh,0x65(%rdx)
    234c:	77 69                	ja     23b7 <__FRAME_END__+0x19b>
    234e:	6e                   	outsb  %ds:(%rsi),(%dx)
    234f:	64 00 5f 49          	add    %bl,%fs:0x49(%rdi)
    2353:	4f 5f                	rex.WRXB pop %r15
    2355:	62                   	(bad)  
    2356:	75 66                	jne    23be <__FRAME_END__+0x1a2>
    2358:	5f                   	pop    %rdi
    2359:	65 6e                	outsb  %gs:(%rsi),(%dx)
    235b:	64 00 5f 5a          	add    %bl,%fs:0x5a(%rdi)
    235f:	4e 53                	rex.WRX push %rbx
    2361:	74 39                	je     239c <__FRAME_END__+0x180>
    2363:	6e                   	outsb  %ds:(%rsi),(%dx)
    2364:	6f                   	outsl  %ds:(%rsi),(%dx)
    2365:	74 68                	je     23cf <__FRAME_END__+0x1b3>
    2367:	72 6f                	jb     23d8 <__FRAME_END__+0x1bc>
    2369:	77 5f                	ja     23ca <__FRAME_END__+0x1ae>
    236b:	74 43                	je     23b0 <__FRAME_END__+0x194>
    236d:	34 45                	xor    $0x45,%al
    236f:	76 00                	jbe    2371 <__FRAME_END__+0x155>
    2371:	5f                   	pop    %rdi
    2372:	53                   	push   %rbx
    2373:	43 5f                	rex.XB pop %r15
    2375:	46                   	rex.RX
    2376:	44 5f                	rex.R pop %rdi
    2378:	4d                   	rex.WRB
    2379:	47                   	rex.RXB
    237a:	4d 54                	rex.WRB push %r12
    237c:	00 77 63             	add    %dh,0x63(%rdi)
    237f:	73 6c                	jae    23ed <__FRAME_END__+0x1d1>
    2381:	65 6e                	outsb  %gs:(%rsi),(%dx)
    2383:	00 5f 53             	add    %bl,0x53(%rdi)
    2386:	43 5f                	rex.XB pop %r15
    2388:	58                   	pop    %rax
    2389:	4f 50                	rex.WRXB push %r8
    238b:	45                   	rex.RB
    238c:	4e 5f                	rex.WRX pop %rdi
    238e:	43 52                	rex.XB push %r10
    2390:	59                   	pop    %rcx
    2391:	50                   	push   %rax
    2392:	54                   	push   %rsp
    2393:	00 5f 53             	add    %bl,0x53(%rdi)
    2396:	43 5f                	rex.XB pop %r15
    2398:	4c                   	rex.WR
    2399:	45 56                	rex.RB push %r14
    239b:	45                   	rex.RB
    239c:	4c 31 5f 49          	xor    %r11,0x49(%rdi)
    23a0:	43                   	rex.XB
    23a1:	41                   	rex.B
    23a2:	43                   	rex.XB
    23a3:	48                   	rex.W
    23a4:	45 5f                	rex.RB pop %r15
    23a6:	4c                   	rex.WR
    23a7:	49                   	rex.WB
    23a8:	4e                   	rex.WRX
    23a9:	45 53                	rex.RB push %r11
    23ab:	49 5a                	rex.WB pop %r10
    23ad:	45 00 5f 53          	add    %r11b,0x53(%r15)
    23b1:	43 5f                	rex.XB pop %r15
    23b3:	43 5f                	rex.XB pop %r15
    23b5:	4c                   	rex.WR
    23b6:	41                   	rex.B
    23b7:	4e                   	rex.WRX
    23b8:	47 5f                	rex.RXB pop %r15
    23ba:	53                   	push   %rbx
    23bb:	55                   	push   %rbp
    23bc:	50                   	push   %rax
    23bd:	50                   	push   %rax
    23be:	4f 52                	rex.WRXB push %r10
    23c0:	54                   	push   %rsp
    23c1:	5f                   	pop    %rdi
    23c2:	52                   	push   %rdx
    23c3:	00 62 61             	add    %ah,0x61(%rdx)
    23c6:	72 72                	jb     243a <__FRAME_END__+0x21e>
    23c8:	69 65 72 00 5f 5a 4e 	imul   $0x4e5a5f00,0x72(%rbp),%esp
    23cf:	53                   	push   %rbx
    23d0:	74 31                	je     2403 <__FRAME_END__+0x1e7>
    23d2:	31 63 68             	xor    %esp,0x68(%rbx)
    23d5:	61                   	(bad)  
    23d6:	72 5f                	jb     2437 <__FRAME_END__+0x21b>
    23d8:	74 72                	je     244c <__FRAME_END__+0x230>
    23da:	61                   	(bad)  
    23db:	69 74 73 49 77 45 37 	imul   $0x6e374577,0x49(%rbx,%rsi,2),%esi
    23e2:	6e 
    23e3:	6f                   	outsl  %ds:(%rsi),(%dx)
    23e4:	74 5f                	je     2445 <__FRAME_END__+0x229>
    23e6:	65 6f                	outsl  %gs:(%rsi),(%dx)
    23e8:	66 45 52             	rex.RB push %r10w
    23eb:	4b 6a 00             	rex.WXB pushq $0x0
    23ee:	5f                   	pop    %rdi
    23ef:	53                   	push   %rbx
    23f0:	43 5f                	rex.XB pop %r15
    23f2:	54                   	push   %rsp
    23f3:	49                   	rex.WB
    23f4:	4d                   	rex.WRB
    23f5:	45 52                	rex.RB push %r10
    23f7:	5f                   	pop    %rdi
    23f8:	4d                   	rex.WRB
    23f9:	41 58                	pop    %r8
    23fb:	00 73 74             	add    %dh,0x74(%rbx)
    23fe:	72 74                	jb     2474 <__FRAME_END__+0x258>
    2400:	6f                   	outsl  %ds:(%rsi),(%dx)
    2401:	64 00 74 6f 5f       	add    %dh,%fs:0x5f(%rdi,%rbp,2)
    2406:	69 6e 74 5f 74 79 70 	imul   $0x7079745f,0x74(%rsi),%ebp
    240d:	65 00 73 74          	add    %dh,%gs:0x74(%rbx)
    2411:	72 74                	jb     2487 <__FRAME_END__+0x26b>
    2413:	6f                   	outsl  %ds:(%rsi),(%dx)
    2414:	66 00 5f 53          	data16 add %bl,0x53(%rdi)
    2418:	43 5f                	rex.XB pop %r15
    241a:	32 5f 50             	xor    0x50(%rdi),%bl
    241d:	42 53                	rex.X push %rbx
    241f:	00 5f 5a             	add    %bl,0x5a(%rdi)
    2422:	4e 39 5f 5f          	rex.WRX cmp %r11,0x5f(%rdi)
    2426:	67 6e                	outsb  %ds:(%esi),(%dx)
    2428:	75 5f                	jne    2489 <__FRAME_END__+0x26d>
    242a:	63 78 78             	movslq 0x78(%rax),%edi
    242d:	32 34 5f             	xor    (%rdi,%rbx,2),%dh
    2430:	5f                   	pop    %rdi
    2431:	6e                   	outsb  %ds:(%rsi),(%dx)
    2432:	75 6d                	jne    24a1 <__FRAME_END__+0x285>
    2434:	65 72 69             	gs jb  24a0 <__FRAME_END__+0x284>
    2437:	63 5f 74             	movslq 0x74(%rdi),%ebx
    243a:	72 61                	jb     249d <__FRAME_END__+0x281>
    243c:	69 74 73 5f 69 6e 74 	imul   $0x65746e69,0x5f(%rbx,%rsi,2),%esi
    2443:	65 
    2444:	67 65 72 49          	addr32 gs jb 2491 <__FRAME_END__+0x275>
    2448:	73 45                	jae    248f <__FRAME_END__+0x273>
    244a:	38 5f 5f             	cmp    %bl,0x5f(%rdi)
    244d:	64 69 67 69 74 73 45 	imul   $0x457374,%fs:0x69(%rdi),%esp
    2454:	00 
    2455:	5f                   	pop    %rdi
    2456:	53                   	push   %rbx
    2457:	43 5f                	rex.XB pop %r15
    2459:	43 50                	rex.XB push %r8
    245b:	55                   	push   %rbp
    245c:	54                   	push   %rsp
    245d:	49                   	rex.WB
    245e:	4d                   	rex.WRB
    245f:	45 00 74 6f 5f       	add    %r14b,0x5f(%r15,%rbp,2)
    2464:	63 68 61             	movslq 0x61(%rax),%ebp
    2467:	72 5f                	jb     24c8 <__FRAME_END__+0x2ac>
    2469:	74 79                	je     24e4 <__FRAME_END__+0x2c8>
    246b:	70 65                	jo     24d2 <__FRAME_END__+0x2b6>
    246d:	00 73 74             	add    %dh,0x74(%rbx)
    2470:	72 74                	jb     24e6 <__FRAME_END__+0x2ca>
    2472:	6f                   	outsl  %ds:(%rsi),(%dx)
    2473:	6c                   	insb   (%dx),%es:(%rdi)
    2474:	00 5f 5f             	add    %bl,0x5f(%rdi)
    2477:	64 65 62             	fs gs (bad) 
    247a:	75 67                	jne    24e3 <__FRAME_END__+0x2c7>
    247c:	00 5f 53             	add    %bl,0x53(%rdi)
    247f:	43 5f                	rex.XB pop %r15
    2481:	53                   	push   %rbx
    2482:	50                   	push   %rax
    2483:	4f 52                	rex.WRXB push %r10
    2485:	41                   	rex.B
    2486:	44                   	rex.R
    2487:	49                   	rex.WB
    2488:	43 5f                	rex.XB pop %r15
    248a:	53                   	push   %rbx
    248b:	45 52                	rex.RB push %r10
    248d:	56                   	push   %rsi
    248e:	45 52                	rex.RB push %r10
    2490:	00 66 65             	add    %ah,0x65(%rsi)
    2493:	72 72                	jb     2507 <__FRAME_END__+0x2eb>
    2495:	6f                   	outsl  %ds:(%rsi),(%dx)
    2496:	72 00                	jb     2498 <__FRAME_END__+0x27c>
    2498:	63 75 72             	movslq 0x72(%rbp),%esi
    249b:	72 65                	jb     2502 <__FRAME_END__+0x2e6>
    249d:	6e                   	outsb  %ds:(%rsi),(%dx)
    249e:	63 79 5f             	movslq 0x5f(%rcx),%edi
    24a1:	73 79                	jae    251c <__FRAME_END__+0x300>
    24a3:	6d                   	insl   (%dx),%es:(%rdi)
    24a4:	62                   	(bad)  
    24a5:	6f                   	outsl  %ds:(%rsi),(%dx)
    24a6:	6c                   	insb   (%dx),%es:(%rdi)
    24a7:	00 73 74             	add    %dh,0x74(%rbx)
    24aa:	64 65 72 72          	fs gs jb 2520 <__FRAME_END__+0x304>
    24ae:	00 73 68             	add    %dh,0x68(%rbx)
    24b1:	6f                   	outsl  %ds:(%rsi),(%dx)
    24b2:	72 74                	jb     2528 <__FRAME_END__+0x30c>
    24b4:	20 69 6e             	and    %ch,0x6e(%rcx)
    24b7:	74 00                	je     24b9 <__FRAME_END__+0x29d>
    24b9:	5f                   	pop    %rdi
    24ba:	4d 5f                	rex.WRB pop %r15
    24bc:	65 78 63             	gs js  2522 <__FRAME_END__+0x306>
    24bf:	65 70 74             	gs jo  2536 <__FRAME_END__+0x31a>
    24c2:	69 6f 6e 5f 6f 62 6a 	imul   $0x6a626f5f,0x6e(%rdi),%ebp
    24c9:	65 63 74 00 5f       	movslq %gs:0x5f(%rax,%rax,1),%esi
    24ce:	5a                   	pop    %rdx
    24cf:	4e 53                	rex.WRX push %rbx
    24d1:	74 31                	je     2504 <__FRAME_END__+0x2e8>
    24d3:	31 63 68             	xor    %esp,0x68(%rbx)
    24d6:	61                   	(bad)  
    24d7:	72 5f                	jb     2538 <__FRAME_END__+0x31c>
    24d9:	74 72                	je     254d <__FRAME_END__+0x331>
    24db:	61                   	(bad)  
    24dc:	69 74 73 49 63 45 36 	imul   $0x6c364563,0x49(%rbx,%rsi,2),%esi
    24e3:	6c 
    24e4:	65 6e                	outsb  %gs:(%rsi),(%dx)
    24e6:	67 74 68             	addr32 je 2551 <__FRAME_END__+0x335>
    24e9:	45 50                	rex.RB push %r8
    24eb:	4b 63 00             	rex.WXB movslq (%r8),%rax
    24ee:	5f                   	pop    %rdi
    24ef:	5a                   	pop    %rdx
    24f0:	4e 53                	rex.WRX push %rbx
    24f2:	74 31                	je     2525 <__FRAME_END__+0x309>
    24f4:	31 63 68             	xor    %esp,0x68(%rbx)
    24f7:	61                   	(bad)  
    24f8:	72 5f                	jb     2559 <__FRAME_END__+0x33d>
    24fa:	74 72                	je     256e <__FRAME_END__+0x352>
    24fc:	61                   	(bad)  
    24fd:	69 74 73 49 77 45 36 	imul   $0x61364577,0x49(%rbx,%rsi,2),%esi
    2504:	61 
    2505:	73 73                	jae    257a <__FRAME_END__+0x35e>
    2507:	69 67 6e 45 50 77 6d 	imul   $0x6d775045,0x6e(%rdi),%esp
    250e:	77 00                	ja     2510 <__FRAME_END__+0x2f4>
    2510:	77 63                	ja     2575 <__FRAME_END__+0x359>
    2512:	73 66                	jae    257a <__FRAME_END__+0x35e>
    2514:	74 69                	je     257f <__FRAME_END__+0x363>
    2516:	6d                   	insl   (%dx),%es:(%rdi)
    2517:	65 00 5f 53          	add    %bl,%gs:0x53(%rdi)
    251b:	43 5f                	rex.XB pop %r15
    251d:	54                   	push   %rsp
    251e:	48 52                	rex.W push %rdx
    2520:	45                   	rex.RB
    2521:	41                   	rex.B
    2522:	44 5f                	rex.R pop %rdi
    2524:	41 54                	push   %r12
    2526:	54                   	push   %rsp
    2527:	52                   	push   %rdx
    2528:	5f                   	pop    %rdi
    2529:	53                   	push   %rbx
    252a:	54                   	push   %rsp
    252b:	41                   	rex.B
    252c:	43                   	rex.XB
    252d:	4b 53                	rex.WXB push %r11
    252f:	49 5a                	rex.WB pop %r10
    2531:	45 00 5f 5a          	add    %r11b,0x5a(%r15)
    2535:	4e 53                	rex.WRX push %rbx
    2537:	74 31                	je     256a <__FRAME_END__+0x34e>
    2539:	31 63 68             	xor    %esp,0x68(%rbx)
    253c:	61                   	(bad)  
    253d:	72 5f                	jb     259e <__FRAME_END__+0x382>
    253f:	74 72                	je     25b3 <__FRAME_END__+0x397>
    2541:	61                   	(bad)  
    2542:	69 74 73 49 77 45 34 	imul   $0x6d344577,0x49(%rbx,%rsi,2),%esi
    2549:	6d 
    254a:	6f                   	outsl  %ds:(%rsi),(%dx)
    254b:	76 65                	jbe    25b2 <__FRAME_END__+0x396>
    254d:	45 50                	rex.RB push %r8
    254f:	77 50                	ja     25a1 <__FRAME_END__+0x385>
    2551:	4b 77 6d             	rex.WXB ja 25c1 <__FRAME_END__+0x3a5>
    2554:	00 5f 53             	add    %bl,0x53(%rdi)
    2557:	43 5f                	rex.XB pop %r15
    2559:	4e                   	rex.WRX
    255a:	45 54                	rex.RB push %r12
    255c:	57                   	push   %rdi
    255d:	4f 52                	rex.WRXB push %r10
    255f:	4b                   	rex.WXB
    2560:	49                   	rex.WB
    2561:	4e                   	rex.WRX
    2562:	47 00 5f 5a          	rex.RXB add %r11b,0x5a(%r15)
    2566:	4e 53                	rex.WRX push %rbx
    2568:	74 31                	je     259b <__FRAME_END__+0x37f>
    256a:	35 5f 5f 65 78       	xor    $0x78655f5f,%eax
    256f:	63 65 70             	movslq 0x70(%rbp),%esp
    2572:	74 69                	je     25dd <__FRAME_END__+0x3c1>
    2574:	6f                   	outsl  %ds:(%rsi),(%dx)
    2575:	6e                   	outsb  %ds:(%rsi),(%dx)
    2576:	5f                   	pop    %rdi
    2577:	70 74                	jo     25ed <__FRAME_END__+0x3d1>
    2579:	72 31                	jb     25ac <__FRAME_END__+0x390>
    257b:	33 65 78             	xor    0x78(%rbp),%esp
    257e:	63 65 70             	movslq 0x70(%rbp),%esp
    2581:	74 69                	je     25ec <__FRAME_END__+0x3d0>
    2583:	6f                   	outsl  %ds:(%rsi),(%dx)
    2584:	6e                   	outsb  %ds:(%rsi),(%dx)
    2585:	5f                   	pop    %rdi
    2586:	70 74                	jo     25fc <__FRAME_END__+0x3e0>
    2588:	72 61                	jb     25eb <__FRAME_END__+0x3cf>
    258a:	53                   	push   %rbx
    258b:	45                   	rex.RB
    258c:	4f 53                	rex.WRXB push %r11
    258e:	30 5f 00             	xor    %bl,0x0(%rdi)
    2591:	5f                   	pop    %rdi
    2592:	5f                   	pop    %rdi
    2593:	73 74                	jae    2609 <__FRAME_END__+0x3ed>
    2595:	61                   	(bad)  
    2596:	74 65                	je     25fd <__FRAME_END__+0x3e1>
    2598:	00 5f 53             	add    %bl,0x53(%rdi)
    259b:	43 5f                	rex.XB pop %r15
    259d:	4c                   	rex.WR
    259e:	45 56                	rex.RB push %r14
    25a0:	45                   	rex.RB
    25a1:	4c 34 5f             	rex.WR xor $0x5f,%al
    25a4:	43                   	rex.XB
    25a5:	41                   	rex.B
    25a6:	43                   	rex.XB
    25a7:	48                   	rex.W
    25a8:	45 5f                	rex.RB pop %r15
    25aa:	4c                   	rex.WR
    25ab:	49                   	rex.WB
    25ac:	4e                   	rex.WRX
    25ad:	45 53                	rex.RB push %r11
    25af:	49 5a                	rex.WB pop %r10
    25b1:	45 00 5f 53          	add    %r11b,0x53(%r15)
    25b5:	43 5f                	rex.XB pop %r15
    25b7:	41 54                	push   %r12
    25b9:	45 58                	rex.RB pop %r8
    25bb:	49 54                	rex.WB push %r12
    25bd:	5f                   	pop    %rdi
    25be:	4d                   	rex.WRB
    25bf:	41 58                	pop    %r8
    25c1:	00 61 74             	add    %ah,0x74(%rcx)
    25c4:	65 78 69             	gs js  2630 <__FRAME_END__+0x414>
    25c7:	74 00                	je     25c9 <__FRAME_END__+0x3ad>
    25c9:	5f                   	pop    %rdi
    25ca:	53                   	push   %rbx
    25cb:	43 5f                	rex.XB pop %r15
    25cd:	50                   	push   %rax
    25ce:	49                   	rex.WB
    25cf:	49 5f                	rex.WB pop %r15
    25d1:	4f 53                	rex.WRXB push %r11
    25d3:	49 5f                	rex.WB pop %r15
    25d5:	43                   	rex.XB
    25d6:	4f 54                	rex.WRXB push %r12
    25d8:	53                   	push   %rbx
    25d9:	00 5f 5a             	add    %bl,0x5a(%rdi)
    25dc:	4e                   	rex.WRX
    25dd:	4b 53                	rex.WXB push %r11
    25df:	74 31                	je     2612 <__FRAME_END__+0x3f6>
    25e1:	35 5f 5f 65 78       	xor    $0x78655f5f,%eax
    25e6:	63 65 70             	movslq 0x70(%rbp),%esp
    25e9:	74 69                	je     2654 <__FRAME_END__+0x438>
    25eb:	6f                   	outsl  %ds:(%rsi),(%dx)
    25ec:	6e                   	outsb  %ds:(%rsi),(%dx)
    25ed:	5f                   	pop    %rdi
    25ee:	70 74                	jo     2664 <__FRAME_END__+0x448>
    25f0:	72 31                	jb     2623 <__FRAME_END__+0x407>
    25f2:	33 65 78             	xor    0x78(%rbp),%esp
    25f5:	63 65 70             	movslq 0x70(%rbp),%esp
    25f8:	74 69                	je     2663 <__FRAME_END__+0x447>
    25fa:	6f                   	outsl  %ds:(%rsi),(%dx)
    25fb:	6e                   	outsb  %ds:(%rsi),(%dx)
    25fc:	5f                   	pop    %rdi
    25fd:	70 74                	jo     2673 <__FRAME_END__+0x457>
    25ff:	72 63                	jb     2664 <__FRAME_END__+0x448>
    2601:	76 62                	jbe    2665 <__FRAME_END__+0x449>
    2603:	45 76 00             	rex.RB jbe 2606 <__FRAME_END__+0x3ea>
    2606:	5f                   	pop    %rdi
    2607:	5f                   	pop    %rdi
    2608:	69 6e 74 5f 6c 65 61 	imul   $0x61656c5f,0x74(%rsi),%ebp
    260f:	73 74                	jae    2685 <__FRAME_END__+0x469>
    2611:	36 34 5f             	ss xor $0x5f,%al
    2614:	74 00                	je     2616 <__FRAME_END__+0x3fa>
    2616:	5f                   	pop    %rdi
    2617:	5a                   	pop    %rdx
    2618:	53                   	push   %rbx
    2619:	74 34                	je     264f <__FRAME_END__+0x433>
    261b:	77 63                	ja     2680 <__FRAME_END__+0x464>
    261d:	69 6e 00 5f 76 74 61 	imul   $0x6174765f,0x0(%rsi),%ebp
    2624:	62                   	(bad)  
    2625:	6c                   	insb   (%dx),%es:(%rdi)
    2626:	65 5f                	gs pop %rdi
    2628:	6f                   	outsl  %ds:(%rsi),(%dx)
    2629:	66 66 73 65          	data16 data16 jae 2692 <__FRAME_END__+0x476>
    262d:	74 00                	je     262f <__FRAME_END__+0x413>
    262f:	6d                   	insl   (%dx),%es:(%rdi)
    2630:	6f                   	outsl  %ds:(%rsi),(%dx)
    2631:	6e                   	outsb  %ds:(%rsi),(%dx)
    2632:	5f                   	pop    %rdi
    2633:	67 72 6f             	addr32 jb 26a5 <__FRAME_END__+0x489>
    2636:	75 70                	jne    26a8 <__FRAME_END__+0x48c>
    2638:	69 6e 67 00 5f 53 43 	imul   $0x43535f00,0x67(%rsi),%ebp
    263f:	5f                   	pop    %rdi
    2640:	53                   	push   %rbx
    2641:	45                   	rex.RB
    2642:	4d 5f                	rex.WRB pop %r15
    2644:	56                   	push   %rsi
    2645:	41                   	rex.B
    2646:	4c 55                	rex.WR push %rbp
    2648:	45 5f                	rex.RB pop %r15
    264a:	4d                   	rex.WRB
    264b:	41 58                	pop    %r8
    264d:	00 5f 53             	add    %bl,0x53(%rdi)
    2650:	43 5f                	rex.XB pop %r15
    2652:	43 5f                	rex.XB pop %r15
    2654:	4c                   	rex.WR
    2655:	41                   	rex.B
    2656:	4e                   	rex.WRX
    2657:	47 5f                	rex.RXB pop %r15
    2659:	53                   	push   %rbx
    265a:	55                   	push   %rbp
    265b:	50                   	push   %rax
    265c:	50                   	push   %rax
    265d:	4f 52                	rex.WRXB push %r10
    265f:	54                   	push   %rsp
    2660:	00 5f 73             	add    %bl,0x73(%rdi)
    2663:	79 73                	jns    26d8 <__FRAME_END__+0x4bc>
    2665:	5f                   	pop    %rdi
    2666:	65 72 72             	gs jb  26db <__FRAME_END__+0x4bf>
    2669:	6c                   	insb   (%dx),%es:(%rdi)
    266a:	69 73 74 00 5f 53 43 	imul   $0x43535f00,0x74(%rbx),%esi
    2671:	5f                   	pop    %rdi
    2672:	54                   	push   %rsp
    2673:	49                   	rex.WB
    2674:	4d                   	rex.WRB
    2675:	45 52                	rex.RB push %r10
    2677:	53                   	push   %rbx
    2678:	00 5f 53             	add    %bl,0x53(%rdi)
    267b:	43 5f                	rex.XB pop %r15
    267d:	50                   	push   %rax
    267e:	41 53                	push   %r11
    2680:	53                   	push   %rbx
    2681:	5f                   	pop    %rdi
    2682:	4d                   	rex.WRB
    2683:	41 58                	pop    %r8
    2685:	00 5f 5f             	add    %bl,0x5f(%rdi)
    2688:	75 69                	jne    26f3 <__FRAME_END__+0x4d7>
    268a:	6e                   	outsb  %ds:(%rsi),(%dx)
    268b:	74 6d                	je     26fa <__FRAME_END__+0x4de>
    268d:	61                   	(bad)  
    268e:	78 5f                	js     26ef <__FRAME_END__+0x4d3>
    2690:	74 00                	je     2692 <__FRAME_END__+0x476>
    2692:	5f                   	pop    %rdi
    2693:	5a                   	pop    %rdx
    2694:	4e 39 5f 5f          	rex.WRX cmp %r11,0x5f(%rdi)
    2698:	67 6e                	outsb  %ds:(%esi),(%dx)
    269a:	75 5f                	jne    26fb <__FRAME_END__+0x4df>
    269c:	63 78 78             	movslq 0x78(%rax),%edi
    269f:	33 64 69 76          	xor    0x76(%rcx,%rbp,2),%esp
    26a3:	45 78 78             	rex.RB js 271e <__FRAME_END__+0x502>
    26a6:	00 5f 53             	add    %bl,0x53(%rdi)
    26a9:	43 5f                	rex.XB pop %r15
    26ab:	46 53                	rex.RX push %rbx
    26ad:	59                   	pop    %rcx
    26ae:	4e                   	rex.WRX
    26af:	43 00 5f 5a          	rex.XB add %bl,0x5a(%r15)
    26b3:	4e 53                	rex.WRX push %rbx
    26b5:	74 31                	je     26e8 <__FRAME_END__+0x4cc>
    26b7:	31 63 68             	xor    %esp,0x68(%rbx)
    26ba:	61                   	(bad)  
    26bb:	72 5f                	jb     271c <__FRAME_END__+0x500>
    26bd:	74 72                	je     2731 <__FRAME_END__+0x515>
    26bf:	61                   	(bad)  
    26c0:	69 74 73 49 63 45 36 	imul   $0x61364563,0x49(%rbx,%rsi,2),%esi
    26c7:	61 
    26c8:	73 73                	jae    273d <__FRAME_END__+0x521>
    26ca:	69 67 6e 45 52 63 52 	imul   $0x52635245,0x6e(%rdi),%esp
    26d1:	4b 63 00             	rex.WXB movslq (%r8),%rax
    26d4:	5f                   	pop    %rdi
    26d5:	5a                   	pop    %rdx
    26d6:	53                   	push   %rbx
    26d7:	74 33                	je     270c <__FRAME_END__+0x4f0>
    26d9:	63 69 6e             	movslq 0x6e(%rcx),%ebp
    26dc:	00 5f 53             	add    %bl,0x53(%rdi)
    26df:	43 5f                	rex.XB pop %r15
    26e1:	53                   	push   %rbx
    26e2:	45                   	rex.RB
    26e3:	4c                   	rex.WR
    26e4:	45                   	rex.RB
    26e5:	43 54                	rex.XB push %r12
    26e7:	00 77 63             	add    %dh,0x63(%rdi)
    26ea:	73 63                	jae    274f <__FRAME_END__+0x533>
    26ec:	61                   	(bad)  
    26ed:	74 00                	je     26ef <__FRAME_END__+0x4d3>
    26ef:	74 6d                	je     275e <__FRAME_END__+0x542>
    26f1:	70 66                	jo     2759 <__FRAME_END__+0x53d>
    26f3:	69 6c 65 00 31 31 5f 	imul   $0x5f5f3131,0x0(%rbp,%riz,2),%ebp
    26fa:	5f 
    26fb:	6d                   	insl   (%dx),%es:(%rdi)
    26fc:	62 73 74 61 74       	(bad)
    2701:	65 5f                	gs pop %rdi
    2703:	74 00                	je     2705 <__FRAME_END__+0x4e9>
    2705:	5f                   	pop    %rdi
    2706:	5f                   	pop    %rdi
    2707:	64 69 67 69 74 73 00 	imul   $0x70007374,%fs:0x69(%rdi),%esp
    270e:	70 
    270f:	74 72                	je     2783 <__FRAME_END__+0x567>
    2711:	64 69 66 66 5f 74 00 	imul   $0x6900745f,%fs:0x66(%rsi),%esp
    2718:	69 
    2719:	6e                   	outsb  %ds:(%rsi),(%dx)
    271a:	74 5f                	je     277b <__FRAME_END__+0x55f>
    271c:	70 5f                	jo     277d <__FRAME_END__+0x561>
    271e:	73 69                	jae    2789 <__FRAME_END__+0x56d>
    2720:	67 6e                	outsb  %ds:(%esi),(%dx)
    2722:	5f                   	pop    %rdi
    2723:	70 6f                	jo     2794 <__FRAME_END__+0x578>
    2725:	73 6e                	jae    2795 <__FRAME_END__+0x579>
    2727:	00 5f 5a             	add    %bl,0x5a(%rdi)
    272a:	4e 39 5f 5f          	rex.WRX cmp %r11,0x5f(%rdi)
    272e:	67 6e                	outsb  %ds:(%esi),(%dx)
    2730:	75 5f                	jne    2791 <__FRAME_END__+0x575>
    2732:	63 78 78             	movslq 0x78(%rax),%edi
    2735:	32 34 5f             	xor    (%rdi,%rbx,2),%dh
    2738:	5f                   	pop    %rdi
    2739:	6e                   	outsb  %ds:(%rsi),(%dx)
    273a:	75 6d                	jne    27a9 <__FRAME_END__+0x58d>
    273c:	65 72 69             	gs jb  27a8 <__FRAME_END__+0x58c>
    273f:	63 5f 74             	movslq 0x74(%rdi),%ebx
    2742:	72 61                	jb     27a5 <__FRAME_END__+0x589>
    2744:	69 74 73 5f 69 6e 74 	imul   $0x65746e69,0x5f(%rbx,%rsi,2),%esi
    274b:	65 
    274c:	67 65 72 49          	addr32 gs jb 2799 <__FRAME_END__+0x57d>
    2750:	63 45 38             	movslq 0x38(%rbp),%eax
    2753:	5f                   	pop    %rdi
    2754:	5f                   	pop    %rdi
    2755:	64 69 67 69 74 73 45 	imul   $0x457374,%fs:0x69(%rdi),%esp
    275c:	00 
    275d:	5f                   	pop    %rdi
    275e:	5f                   	pop    %rdi
    275f:	64 61                	fs (bad) 
    2761:	79 6c                	jns    27cf <__FRAME_END__+0x5b3>
    2763:	69 67 68 74 00 74 6d 	imul   $0x6d740074,0x68(%rdi),%esp
    276a:	5f                   	pop    %rdi
    276b:	7a 6f                	jp     27dc <__FRAME_END__+0x5c0>
    276d:	6e                   	outsb  %ds:(%rsi),(%dx)
    276e:	65 00 5f 5a          	add    %bl,%gs:0x5a(%rdi)
    2772:	4e 39 5f 5f          	rex.WRX cmp %r11,0x5f(%rdi)
    2776:	67 6e                	outsb  %ds:(%esi),(%dx)
    2778:	75 5f                	jne    27d9 <__FRAME_END__+0x5bd>
    277a:	63 78 78             	movslq 0x78(%rax),%edi
    277d:	32 34 5f             	xor    (%rdi,%rbx,2),%dh
    2780:	5f                   	pop    %rdi
    2781:	6e                   	outsb  %ds:(%rsi),(%dx)
    2782:	75 6d                	jne    27f1 <__FRAME_END__+0x5d5>
    2784:	65 72 69             	gs jb  27f0 <__FRAME_END__+0x5d4>
    2787:	63 5f 74             	movslq 0x74(%rdi),%ebx
    278a:	72 61                	jb     27ed <__FRAME_END__+0x5d1>
    278c:	69 74 73 5f 69 6e 74 	imul   $0x65746e69,0x5f(%rbx,%rsi,2),%esi
    2793:	65 
    2794:	67 65 72 49          	addr32 gs jb 27e1 <__FRAME_END__+0x5c5>
    2798:	63 45 31             	movslq 0x31(%rbp),%eax
    279b:	31 5f 5f             	xor    %ebx,0x5f(%rdi)
    279e:	69 73 5f 73 69 67 6e 	imul   $0x6e676973,0x5f(%rbx),%esi
    27a5:	65 64 45 00 5f 5f    	gs add %r11b,%fs:0x5f(%r15)
    27ab:	69 6e 74 36 34 5f 74 	imul   $0x745f3436,0x74(%rsi),%ebp
    27b2:	00 75 6e             	add    %dh,0x6e(%rbp)
    27b5:	67 65 74 63          	addr32 gs je 281c <__FRAME_END__+0x600>
    27b9:	00 5f 53             	add    %bl,0x53(%rdi)
    27bc:	43 5f                	rex.XB pop %r15
    27be:	50                   	push   %rax
    27bf:	4f                   	rex.WRXB
    27c0:	4c                   	rex.WR
    27c1:	4c 00 77 63          	rex.WR add %r14b,0x63(%rdi)
    27c5:	72 74                	jb     283b <__FRAME_END__+0x61f>
    27c7:	6f                   	outsl  %ds:(%rsi),(%dx)
    27c8:	6d                   	insl   (%dx),%es:(%rdi)
    27c9:	62                   	(bad)  
    27ca:	00 6c 63 6f          	add    %ch,0x6f(%rbx,%riz,2)
    27ce:	6e                   	outsb  %ds:(%rsi),(%dx)
    27cf:	76 00                	jbe    27d1 <__FRAME_END__+0x5b5>
    27d1:	5f                   	pop    %rdi
    27d2:	5a                   	pop    %rdx
    27d3:	4e 39 5f 5f          	rex.WRX cmp %r11,0x5f(%rdi)
    27d7:	67 6e                	outsb  %ds:(%esi),(%dx)
    27d9:	75 5f                	jne    283a <__FRAME_END__+0x61e>
    27db:	63 78 78             	movslq 0x78(%rax),%edi
    27de:	32 34 5f             	xor    (%rdi,%rbx,2),%dh
    27e1:	5f                   	pop    %rdi
    27e2:	6e                   	outsb  %ds:(%rsi),(%dx)
    27e3:	75 6d                	jne    2852 <__FRAME_END__+0x636>
    27e5:	65 72 69             	gs jb  2851 <__FRAME_END__+0x635>
    27e8:	63 5f 74             	movslq 0x74(%rdi),%ebx
    27eb:	72 61                	jb     284e <__FRAME_END__+0x632>
    27ed:	69 74 73 5f 69 6e 74 	imul   $0x65746e69,0x5f(%rbx,%rsi,2),%esi
    27f4:	65 
    27f5:	67 65 72 49          	addr32 gs jb 2842 <__FRAME_END__+0x626>
    27f9:	73 45                	jae    2840 <__FRAME_END__+0x624>
    27fb:	31 31                	xor    %esi,(%rcx)
    27fd:	5f                   	pop    %rdi
    27fe:	5f                   	pop    %rdi
    27ff:	69 73 5f 73 69 67 6e 	imul   $0x6e676973,0x5f(%rbx),%esi
    2806:	65 64 45 00 5f 53    	gs add %r11b,%fs:0x53(%r15)
    280c:	43 5f                	rex.XB pop %r15
    280e:	4c                   	rex.WR
    280f:	45 56                	rex.RB push %r14
    2811:	45                   	rex.RB
    2812:	4c 32 5f 43          	rex.WR xor 0x43(%rdi),%r11b
    2816:	41                   	rex.B
    2817:	43                   	rex.XB
    2818:	48                   	rex.W
    2819:	45 5f                	rex.RB pop %r15
    281b:	41 53                	push   %r11
    281d:	53                   	push   %rbx
    281e:	4f                   	rex.WRXB
    281f:	43 00 5f 5f          	rex.XB add %bl,0x5f(%r15)
    2823:	6d                   	insl   (%dx),%es:(%rdi)
    2824:	61                   	(bad)  
    2825:	78 00                	js     2827 <__FRAME_END__+0x60b>
    2827:	5f                   	pop    %rdi
    2828:	49                   	rex.WB
    2829:	4f 5f                	rex.WRXB pop %r15
    282b:	72 65                	jb     2892 <__FRAME_END__+0x676>
    282d:	61                   	(bad)  
    282e:	64 5f                	fs pop %rdi
    2830:	65 6e                	outsb  %gs:(%rsi),(%dx)
    2832:	64 00 6d 62          	add    %ch,%fs:0x62(%rbp)
    2836:	73 74                	jae    28ac <__FRAME_END__+0x690>
    2838:	6f                   	outsl  %ds:(%rsi),(%dx)
    2839:	77 63                	ja     289e <__FRAME_END__+0x682>
    283b:	73 00                	jae    283d <__FRAME_END__+0x621>
    283d:	5f                   	pop    %rdi
    283e:	53                   	push   %rbx
    283f:	43 5f                	rex.XB pop %r15
    2841:	42                   	rex.X
    2842:	43 5f                	rex.XB pop %r15
    2844:	42                   	rex.X
    2845:	41 53                	push   %r11
    2847:	45 5f                	rex.RB pop %r15
    2849:	4d                   	rex.WRB
    284a:	41 58                	pop    %r8
    284c:	00 77 63             	add    %dh,0x63(%rdi)
    284f:	73 6e                	jae    28bf <__FRAME_END__+0x6a3>
    2851:	63 61 74             	movslq 0x74(%rcx),%esp
    2854:	00 5f 5f             	add    %bl,0x5f(%rdi)
    2857:	6e                   	outsb  %ds:(%rsi),(%dx)
    2858:	75 6d                	jne    28c7 <__FRAME_END__+0x6ab>
    285a:	65 72 69             	gs jb  28c6 <__FRAME_END__+0x6aa>
    285d:	63 5f 74             	movslq 0x74(%rdi),%ebx
    2860:	72 61                	jb     28c3 <__FRAME_END__+0x6a7>
    2862:	69 74 73 5f 69 6e 74 	imul   $0x65746e69,0x5f(%rbx,%rsi,2),%esi
    2869:	65 
    286a:	67 65 72 3c          	addr32 gs jb 28aa <__FRAME_END__+0x68e>
    286e:	73 68                	jae    28d8 <__FRAME_END__+0x6bc>
    2870:	6f                   	outsl  %ds:(%rsi),(%dx)
    2871:	72 74                	jb     28e7 <__FRAME_END__+0x6cb>
    2873:	20 69 6e             	and    %ch,0x6e(%rcx)
    2876:	74 3e                	je     28b6 <__FRAME_END__+0x69a>
    2878:	00 5f 53             	add    %bl,0x53(%rdi)
    287b:	43 5f                	rex.XB pop %r15
    287d:	4c                   	rex.WR
    287e:	45 56                	rex.RB push %r14
    2880:	45                   	rex.RB
    2881:	4c 32 5f 43          	rex.WR xor 0x43(%rdi),%r11b
    2885:	41                   	rex.B
    2886:	43                   	rex.XB
    2887:	48                   	rex.W
    2888:	45 5f                	rex.RB pop %r15
    288a:	53                   	push   %rbx
    288b:	49 5a                	rex.WB pop %r10
    288d:	45 00 63 68          	add    %r12b,0x68(%r11)
    2891:	61                   	(bad)  
    2892:	72 5f                	jb     28f3 <__FRAME_END__+0x6d7>
    2894:	74 72                	je     2908 <__FRAME_END__+0x6ec>
    2896:	61                   	(bad)  
    2897:	69 74 73 3c 77 63 68 	imul   $0x61686377,0x3c(%rbx,%rsi,2),%esi
    289e:	61 
    289f:	72 5f                	jb     2900 <__FRAME_END__+0x6e4>
    28a1:	74 3e                	je     28e1 <__FRAME_END__+0x6c5>
    28a3:	00 5f 53             	add    %bl,0x53(%rdi)
    28a6:	43 5f                	rex.XB pop %r15
    28a8:	45 58                	rex.RB pop %r8
    28aa:	50                   	push   %rax
    28ab:	52                   	push   %rdx
    28ac:	5f                   	pop    %rdi
    28ad:	4e                   	rex.WRX
    28ae:	45 53                	rex.RB push %r11
    28b0:	54                   	push   %rsp
    28b1:	5f                   	pop    %rdi
    28b2:	4d                   	rex.WRB
    28b3:	41 58                	pop    %r8
    28b5:	00 5f 53             	add    %bl,0x53(%rdi)
    28b8:	43 5f                	rex.XB pop %r15
    28ba:	54                   	push   %rsp
    28bb:	48 52                	rex.W push %rdx
    28bd:	45                   	rex.RB
    28be:	41                   	rex.B
    28bf:	44 5f                	rex.R pop %rdi
    28c1:	54                   	push   %rsp
    28c2:	48 52                	rex.W push %rdx
    28c4:	45                   	rex.RB
    28c5:	41                   	rex.B
    28c6:	44 53                	rex.R push %rbx
    28c8:	5f                   	pop    %rdi
    28c9:	4d                   	rex.WRB
    28ca:	41 58                	pop    %r8
    28cc:	00 5f 5f             	add    %bl,0x5f(%rdi)
    28cf:	64 73 6f             	fs jae 2941 <__FRAME_END__+0x725>
    28d2:	5f                   	pop    %rdi
    28d3:	68 61 6e 64 6c       	pushq  $0x6c646e61
    28d8:	65 00 5f 53          	add    %bl,%gs:0x53(%rdi)
    28dc:	43 5f                	rex.XB pop %r15
    28de:	53                   	push   %rbx
    28df:	59                   	pop    %rcx
    28e0:	4e                   	rex.WRX
    28e1:	43                   	rex.XB
    28e2:	48 52                	rex.W push %rdx
    28e4:	4f                   	rex.WRXB
    28e5:	4e                   	rex.WRX
    28e6:	49 5a                	rex.WB pop %r10
    28e8:	45                   	rex.RB
    28e9:	44 5f                	rex.R pop %rdi
    28eb:	49                   	rex.WB
    28ec:	4f 00 69 6e          	rex.WRXB add %r13b,0x6e(%r9)
    28f0:	74 5f                	je     2951 <__FRAME_END__+0x735>
    28f2:	6e                   	outsb  %ds:(%rsi),(%dx)
    28f3:	5f                   	pop    %rdi
    28f4:	73 69                	jae    295f <__FRAME_END__+0x743>
    28f6:	67 6e                	outsb  %ds:(%esi),(%dx)
    28f8:	5f                   	pop    %rdi
    28f9:	70 6f                	jo     296a <__FRAME_END__+0x74e>
    28fb:	73 6e                	jae    296b <__FRAME_END__+0x74f>
    28fd:	00 5f 66             	add    %bl,0x66(%rdi)
    2900:	69 6c 65 6e 6f 00 5f 	imul   $0x535f006f,0x6e(%rbp,%riz,2),%ebp
    2907:	53 
    2908:	43 5f                	rex.XB pop %r15
    290a:	58                   	pop    %rax
    290b:	4f 50                	rex.WRXB push %r8
    290d:	45                   	rex.RB
    290e:	4e 5f                	rex.WRX pop %rdi
    2910:	53                   	push   %rbx
    2911:	54                   	push   %rsp
    2912:	52                   	push   %rdx
    2913:	45                   	rex.RB
    2914:	41                   	rex.B
    2915:	4d 53                	rex.WRB push %r11
    2917:	00 5f 53             	add    %bl,0x53(%rdi)
    291a:	43 5f                	rex.XB pop %r15
    291c:	4c                   	rex.WR
    291d:	45 56                	rex.RB push %r14
    291f:	45                   	rex.RB
    2920:	4c 31 5f 44          	xor    %r11,0x44(%rdi)
    2924:	43                   	rex.XB
    2925:	41                   	rex.B
    2926:	43                   	rex.XB
    2927:	48                   	rex.W
    2928:	45 5f                	rex.RB pop %r15
    292a:	53                   	push   %rbx
    292b:	49 5a                	rex.WB pop %r10
    292d:	45 00 75 69          	add    %r14b,0x69(%r13)
    2931:	6e                   	outsb  %ds:(%rsi),(%dx)
    2932:	74 5f                	je     2993 <__FRAME_END__+0x777>
    2934:	66 61                	data16 (bad) 
    2936:	73 74                	jae    29ac <__FRAME_END__+0x790>
    2938:	31 36                	xor    %esi,(%rsi)
    293a:	5f                   	pop    %rdi
    293b:	74 00                	je     293d <__FRAME_END__+0x721>
    293d:	74 68                	je     29a7 <__FRAME_END__+0x78b>
    293f:	72 65                	jb     29a6 <__FRAME_END__+0x78a>
    2941:	61                   	(bad)  
    2942:	64 49                	fs rex.WB
    2944:	64 00 5f 53          	add    %bl,%fs:0x53(%rdi)
    2948:	43 5f                	rex.XB pop %r15
    294a:	53                   	push   %rbx
    294b:	48 52                	rex.W push %rdx
    294d:	54                   	push   %rsp
    294e:	5f                   	pop    %rdi
    294f:	4d                   	rex.WRB
    2950:	49                   	rex.WB
    2951:	4e 00 6d 62          	rex.WRX add %r13b,0x62(%rbp)
    2955:	73 72                	jae    29c9 <__FRAME_END__+0x7ad>
    2957:	74 6f                	je     29c8 <__FRAME_END__+0x7ac>
    2959:	77 63                	ja     29be <__FRAME_END__+0x7a2>
    295b:	73 00                	jae    295d <__FRAME_END__+0x741>
    295d:	5f                   	pop    %rdi
    295e:	5f                   	pop    %rdi
    295f:	6e                   	outsb  %ds:(%rsi),(%dx)
    2960:	75 6d                	jne    29cf <__FRAME_END__+0x7b3>
    2962:	65 72 69             	gs jb  29ce <__FRAME_END__+0x7b2>
    2965:	63 5f 74             	movslq 0x74(%rdi),%ebx
    2968:	72 61                	jb     29cb <__FRAME_END__+0x7af>
    296a:	69 74 73 5f 66 6c 6f 	imul   $0x616f6c66,0x5f(%rbx,%rsi,2),%esi
    2971:	61 
    2972:	74 69                	je     29dd <__FRAME_END__+0x7c1>
    2974:	6e                   	outsb  %ds:(%rsi),(%dx)
    2975:	67 3c 66             	addr32 cmp $0x66,%al
    2978:	6c                   	insb   (%dx),%es:(%rdi)
    2979:	6f                   	outsl  %ds:(%rsi),(%dx)
    297a:	61                   	(bad)  
    297b:	74 3e                	je     29bb <__FRAME_END__+0x79f>
    297d:	00 5f 5a             	add    %bl,0x5a(%rdi)
    2980:	4e 53                	rex.WRX push %rbx
    2982:	74 31                	je     29b5 <__FRAME_END__+0x799>
    2984:	35 5f 5f 65 78       	xor    $0x78655f5f,%eax
    2989:	63 65 70             	movslq 0x70(%rbp),%esp
    298c:	74 69                	je     29f7 <__FRAME_END__+0x7db>
    298e:	6f                   	outsl  %ds:(%rsi),(%dx)
    298f:	6e                   	outsb  %ds:(%rsi),(%dx)
    2990:	5f                   	pop    %rdi
    2991:	70 74                	jo     2a07 <__FRAME_END__+0x7eb>
    2993:	72 31                	jb     29c6 <__FRAME_END__+0x7aa>
    2995:	33 65 78             	xor    0x78(%rbp),%esp
    2998:	63 65 70             	movslq 0x70(%rbp),%esp
    299b:	74 69                	je     2a06 <__FRAME_END__+0x7ea>
    299d:	6f                   	outsl  %ds:(%rsi),(%dx)
    299e:	6e                   	outsb  %ds:(%rsi),(%dx)
    299f:	5f                   	pop    %rdi
    29a0:	70 74                	jo     2a16 <__FRAME_END__+0x7fa>
    29a2:	72 31                	jb     29d5 <__FRAME_END__+0x7b9>
    29a4:	30 5f 4d             	xor    %bl,0x4d(%rdi)
    29a7:	5f                   	pop    %rdi
    29a8:	72 65                	jb     2a0f <__FRAME_END__+0x7f3>
    29aa:	6c                   	insb   (%dx),%es:(%rdi)
    29ab:	65 61                	gs (bad) 
    29ad:	73 65                	jae    2a14 <__FRAME_END__+0x7f8>
    29af:	45 76 00             	rex.RB jbe 29b2 <__FRAME_END__+0x796>
    29b2:	6f                   	outsl  %ds:(%rsi),(%dx)
    29b3:	70 74                	jo     2a29 <__FRAME_END__+0x80d>
    29b5:	61                   	(bad)  
    29b6:	72 67                	jb     2a1f <__FRAME_END__+0x803>
    29b8:	00 5f 5f             	add    %bl,0x5f(%rdi)
    29bb:	69 6e 74 5f 6c 65 61 	imul   $0x61656c5f,0x74(%rsi),%ebp
    29c2:	73 74                	jae    2a38 <__FRAME_END__+0x81c>
    29c4:	33 32                	xor    (%rdx),%esi
    29c6:	5f                   	pop    %rdi
    29c7:	74 00                	je     29c9 <__FRAME_END__+0x7ad>
    29c9:	5f                   	pop    %rdi
    29ca:	53                   	push   %rbx
    29cb:	43 5f                	rex.XB pop %r15
    29cd:	56                   	push   %rsi
    29ce:	36 5f                	ss pop %rdi
    29d0:	4c 50                	rex.WR push %rax
    29d2:	42                   	rex.X
    29d3:	49                   	rex.WB
    29d4:	47 5f                	rex.RXB pop %r15
    29d6:	4f                   	rex.WRXB
    29d7:	46                   	rex.RX
    29d8:	46                   	rex.RX
    29d9:	42                   	rex.X
    29da:	49                   	rex.WB
    29db:	47 00 5f 5f          	rex.RXB add %r11b,0x5f(%r15)
    29df:	6d                   	insl   (%dx),%es:(%rdi)
    29e0:	61                   	(bad)  
    29e1:	78 5f                	js     2a42 <__FRAME_END__+0x826>
    29e3:	64 69 67 69 74 73 31 	imul   $0x30317374,%fs:0x69(%rdi),%esp
    29ea:	30 
    29eb:	00 66 70             	add    %ah,0x70(%rsi)
    29ee:	75 74                	jne    2a64 <__FRAME_END__+0x848>
    29f0:	77 63                	ja     2a55 <__FRAME_END__+0x839>
    29f2:	00 5f 5f             	add    %bl,0x5f(%rdi)
    29f5:	6e                   	outsb  %ds:(%rsi),(%dx)
    29f6:	75 6d                	jne    2a65 <__FRAME_END__+0x849>
    29f8:	65 72 69             	gs jb  2a64 <__FRAME_END__+0x848>
    29fb:	63 5f 74             	movslq 0x74(%rdi),%ebx
    29fe:	72 61                	jb     2a61 <__FRAME_END__+0x845>
    2a00:	69 74 73 5f 69 6e 74 	imul   $0x65746e69,0x5f(%rbx,%rsi,2),%esi
    2a07:	65 
    2a08:	67 65 72 3c          	addr32 gs jb 2a48 <__FRAME_END__+0x82c>
    2a0c:	6c                   	insb   (%dx),%es:(%rdi)
    2a0d:	6f                   	outsl  %ds:(%rsi),(%dx)
    2a0e:	6e                   	outsb  %ds:(%rsi),(%dx)
    2a0f:	67 20 75 6e          	and    %dh,0x6e(%ebp)
    2a13:	73 69                	jae    2a7e <__FRAME_END__+0x862>
    2a15:	67 6e                	outsb  %ds:(%esi),(%dx)
    2a17:	65 64 20 69 6e       	gs and %ch,%fs:0x6e(%rcx)
    2a1c:	74 3e                	je     2a5c <__FRAME_END__+0x840>
    2a1e:	00 74 6d 5f          	add    %dh,0x5f(%rbp,%rbp,2)
    2a22:	79 65                	jns    2a89 <__FRAME_END__+0x86d>
    2a24:	61                   	(bad)  
    2a25:	72 00                	jb     2a27 <__FRAME_END__+0x80b>
    2a27:	5f                   	pop    %rdi
    2a28:	5a                   	pop    %rdx
    2a29:	4e 53                	rex.WRX push %rbx
    2a2b:	74 31                	je     2a5e <__FRAME_END__+0x842>
    2a2d:	35 5f 5f 65 78       	xor    $0x78655f5f,%eax
    2a32:	63 65 70             	movslq 0x70(%rbp),%esp
    2a35:	74 69                	je     2aa0 <__FRAME_END__+0x884>
    2a37:	6f                   	outsl  %ds:(%rsi),(%dx)
    2a38:	6e                   	outsb  %ds:(%rsi),(%dx)
    2a39:	5f                   	pop    %rdi
    2a3a:	70 74                	jo     2ab0 <__FRAME_END__+0x894>
    2a3c:	72 31                	jb     2a6f <__FRAME_END__+0x853>
    2a3e:	33 65 78             	xor    0x78(%rbp),%esp
    2a41:	63 65 70             	movslq 0x70(%rbp),%esp
    2a44:	74 69                	je     2aaf <__FRAME_END__+0x893>
    2a46:	6f                   	outsl  %ds:(%rsi),(%dx)
    2a47:	6e                   	outsb  %ds:(%rsi),(%dx)
    2a48:	5f                   	pop    %rdi
    2a49:	70 74                	jo     2abf <__FRAME_END__+0x8a3>
    2a4b:	72 43                	jb     2a90 <__FRAME_END__+0x874>
    2a4d:	34 45                	xor    $0x45,%al
    2a4f:	4f 53                	rex.WRXB push %r11
    2a51:	30 5f 00             	xor    %bl,0x0(%rdi)
    2a54:	73 68                	jae    2abe <__FRAME_END__+0x8a2>
    2a56:	6f                   	outsl  %ds:(%rsi),(%dx)
    2a57:	72 74                	jb     2acd <__FRAME_END__+0x8b1>
    2a59:	20 75 6e             	and    %dh,0x6e(%rbp)
    2a5c:	73 69                	jae    2ac7 <__FRAME_END__+0x8ab>
    2a5e:	67 6e                	outsb  %ds:(%esi),(%dx)
    2a60:	65 64 20 69 6e       	gs and %ch,%fs:0x6e(%rcx)
    2a65:	74 00                	je     2a67 <__FRAME_END__+0x84b>
    2a67:	73 74                	jae    2add <__FRAME_END__+0x8c1>
    2a69:	64 6f                	outsl  %fs:(%rsi),(%dx)
    2a6b:	75 74                	jne    2ae1 <__FRAME_END__+0x8c5>
    2a6d:	00 5f 53             	add    %bl,0x53(%rdi)
    2a70:	43 5f                	rex.XB pop %r15
    2a72:	4c                   	rex.WR
    2a73:	45 56                	rex.RB push %r14
    2a75:	45                   	rex.RB
    2a76:	4c 31 5f 49          	xor    %r11,0x49(%rdi)
    2a7a:	43                   	rex.XB
    2a7b:	41                   	rex.B
    2a7c:	43                   	rex.XB
    2a7d:	48                   	rex.W
    2a7e:	45 5f                	rex.RB pop %r15
    2a80:	53                   	push   %rbx
    2a81:	49 5a                	rex.WB pop %r10
    2a83:	45 00 5f 5f          	add    %r11b,0x5f(%r15)
    2a87:	70 74                	jo     2afd <__FRAME_END__+0x8e1>
    2a89:	68 72 65 61 64       	pushq  $0x64616572
    2a8e:	5f                   	pop    %rdi
    2a8f:	6d                   	insl   (%dx),%es:(%rdi)
    2a90:	75 74                	jne    2b06 <__FRAME_END__+0x8ea>
    2a92:	65 78 5f             	gs js  2af4 <__FRAME_END__+0x8d8>
    2a95:	73 00                	jae    2a97 <__FRAME_END__+0x87b>
    2a97:	5f                   	pop    %rdi
    2a98:	53                   	push   %rbx
    2a99:	43 5f                	rex.XB pop %r15
    2a9b:	58                   	pop    %rax
    2a9c:	42 53                	rex.X push %rbx
    2a9e:	35 5f 49 4c 50       	xor    $0x504c495f,%eax
    2aa3:	33 32                	xor    (%rdx),%esi
    2aa5:	5f                   	pop    %rdi
    2aa6:	4f                   	rex.WRXB
    2aa7:	46                   	rex.RX
    2aa8:	46                   	rex.RX
    2aa9:	42                   	rex.X
    2aaa:	49                   	rex.WB
    2aab:	47 00 66 72          	rex.RXB add %r12b,0x72(%r14)
    2aaf:	65 61                	gs (bad) 
    2ab1:	64 00 5f 53          	add    %bl,%fs:0x53(%rdi)
    2ab5:	43 5f                	rex.XB pop %r15
    2ab7:	55                   	push   %rbp
    2ab8:	49                   	rex.WB
    2ab9:	4f 5f                	rex.WRXB pop %r15
    2abb:	4d                   	rex.WRB
    2abc:	41 58                	pop    %r8
    2abe:	49                   	rex.WB
    2abf:	4f 56                	rex.WRXB push %r14
    2ac1:	00 5f 53             	add    %bl,0x53(%rdi)
    2ac4:	43 5f                	rex.XB pop %r15
    2ac6:	45 51                	rex.RB push %r9
    2ac8:	55                   	push   %rbp
    2ac9:	49 56                	rex.WB push %r14
    2acb:	5f                   	pop    %rdi
    2acc:	43                   	rex.XB
    2acd:	4c                   	rex.WR
    2ace:	41 53                	push   %r11
    2ad0:	53                   	push   %rbx
    2ad1:	5f                   	pop    %rdi
    2ad2:	4d                   	rex.WRB
    2ad3:	41 58                	pop    %r8
    2ad5:	00 5f 5f             	add    %bl,0x5f(%rdi)
    2ad8:	6f                   	outsl  %ds:(%rsi),(%dx)
    2ad9:	70 73                	jo     2b4e <__FRAME_END__+0x932>
    2adb:	00 5f 49             	add    %bl,0x49(%rdi)
    2ade:	4f 5f                	rex.WRXB pop %r15
    2ae0:	77 72                	ja     2b54 <__FRAME_END__+0x938>
    2ae2:	69 74 65 5f 70 74 72 	imul   $0x727470,0x5f(%rbp,%riz,2),%esi
    2ae9:	00 
    2aea:	66 70 75             	data16 jo 2b62 <__FRAME_END__+0x946>
    2aed:	74 77                	je     2b66 <__FRAME_END__+0x94a>
    2aef:	73 00                	jae    2af1 <__FRAME_END__+0x8d5>
    2af1:	5f                   	pop    %rdi
    2af2:	53                   	push   %rbx
    2af3:	43 5f                	rex.XB pop %r15
    2af5:	42                   	rex.X
    2af6:	41 53                	push   %r11
    2af8:	45 00 66 67          	add    %r12b,0x67(%r14)
    2afc:	65 74 63             	gs je  2b62 <__FRAME_END__+0x946>
    2aff:	00 5f 5a             	add    %bl,0x5a(%rdi)
    2b02:	4e 53                	rex.WRX push %rbx
    2b04:	74 31                	je     2b37 <__FRAME_END__+0x91b>
    2b06:	31 63 68             	xor    %esp,0x68(%rbx)
    2b09:	61                   	(bad)  
    2b0a:	72 5f                	jb     2b6b <__FRAME_END__+0x94f>
    2b0c:	74 72                	je     2b80 <__FRAME_END__+0x964>
    2b0e:	61                   	(bad)  
    2b0f:	69 74 73 49 77 45 31 	imul   $0x31314577,0x49(%rbx,%rsi,2),%esi
    2b16:	31 
    2b17:	74 6f                	je     2b88 <__FRAME_END__+0x96c>
    2b19:	5f                   	pop    %rdi
    2b1a:	69 6e 74 5f 74 79 70 	imul   $0x7079745f,0x74(%rsi),%ebp
    2b21:	65 45 52             	gs rex.RB push %r10
    2b24:	4b 77 00             	rex.WXB ja 2b27 <__FRAME_END__+0x90b>
    2b27:	5f                   	pop    %rdi
    2b28:	5a                   	pop    %rdx
    2b29:	4e 53                	rex.WRX push %rbx
    2b2b:	74 38                	je     2b65 <__FRAME_END__+0x949>
    2b2d:	69 6f 73 5f 62 61 73 	imul   $0x7361625f,0x73(%rdi),%ebp
    2b34:	65 34 49             	gs xor $0x49,%al
    2b37:	6e                   	outsb  %ds:(%rsi),(%dx)
    2b38:	69 74 43 34 45 76 00 	imul   $0x5f007645,0x34(%rbx,%rax,2),%esi
    2b3f:	5f 
    2b40:	5f                   	pop    %rdi
    2b41:	65 78 63             	gs js  2ba7 <__FRAME_END__+0x98b>
    2b44:	65 70 74             	gs jo  2bbb <__FRAME_END__+0x99f>
    2b47:	69 6f 6e 5f 70 74 72 	imul   $0x7274705f,0x6e(%rdi),%ebp
    2b4e:	00 5f 5f             	add    %bl,0x5f(%rdi)
    2b51:	69 6e 74 33 32 5f 74 	imul   $0x745f3233,0x74(%rsi),%ebp
    2b58:	00 5f 49             	add    %bl,0x49(%rdi)
    2b5b:	4f 5f                	rex.WRXB pop %r15
    2b5d:	72 65                	jb     2bc4 <__FRAME_END__+0x9a8>
    2b5f:	61                   	(bad)  
    2b60:	64 5f                	fs pop %rdi
    2b62:	70 74                	jo     2bd8 <__FRAME_END__+0x9bc>
    2b64:	72 00                	jb     2b66 <__FRAME_END__+0x94a>
    2b66:	5f                   	pop    %rdi
    2b67:	53                   	push   %rbx
    2b68:	43 5f                	rex.XB pop %r15
    2b6a:	4d                   	rex.WRB
    2b6b:	45 53                	rex.RB push %r11
    2b6d:	53                   	push   %rbx
    2b6e:	41                   	rex.B
    2b6f:	47                   	rex.RXB
    2b70:	45 5f                	rex.RB pop %r15
    2b72:	50                   	push   %rax
    2b73:	41 53                	push   %r11
    2b75:	53                   	push   %rbx
    2b76:	49                   	rex.WB
    2b77:	4e                   	rex.WRX
    2b78:	47 00 5f 5f          	rex.RXB add %r11b,0x5f(%r15)
    2b7c:	73 77                	jae    2bf5 <__FRAME_END__+0x9d9>
    2b7e:	61                   	(bad)  
    2b7f:	70 70                	jo     2bf1 <__FRAME_END__+0x9d5>
    2b81:	61                   	(bad)  
    2b82:	62                   	(bad)  
    2b83:	6c                   	insb   (%dx),%es:(%rdi)
    2b84:	65 5f                	gs pop %rdi
    2b86:	77 69                	ja     2bf1 <__FRAME_END__+0x9d5>
    2b88:	74 68                	je     2bf2 <__FRAME_END__+0x9d6>
    2b8a:	5f                   	pop    %rdi
    2b8b:	64 65 74 61          	fs gs je 2bf0 <__FRAME_END__+0x9d4>
    2b8f:	69 6c 73 00 5f 5a 4e 	imul   $0x4b4e5a5f,0x0(%rbx,%rsi,2),%ebp
    2b96:	4b 
    2b97:	53                   	push   %rbx
    2b98:	74 31                	je     2bcb <__FRAME_END__+0x9af>
    2b9a:	35 5f 5f 65 78       	xor    $0x78655f5f,%eax
    2b9f:	63 65 70             	movslq 0x70(%rbp),%esp
    2ba2:	74 69                	je     2c0d <__FRAME_END__+0x9f1>
    2ba4:	6f                   	outsl  %ds:(%rsi),(%dx)
    2ba5:	6e                   	outsb  %ds:(%rsi),(%dx)
    2ba6:	5f                   	pop    %rdi
    2ba7:	70 74                	jo     2c1d <__FRAME_END__+0xa01>
    2ba9:	72 31                	jb     2bdc <__FRAME_END__+0x9c0>
    2bab:	33 65 78             	xor    0x78(%rbp),%esp
    2bae:	63 65 70             	movslq 0x70(%rbp),%esp
    2bb1:	74 69                	je     2c1c <__FRAME_END__+0xa00>
    2bb3:	6f                   	outsl  %ds:(%rsi),(%dx)
    2bb4:	6e                   	outsb  %ds:(%rsi),(%dx)
    2bb5:	5f                   	pop    %rdi
    2bb6:	70 74                	jo     2c2c <__FRAME_END__+0xa10>
    2bb8:	72 32                	jb     2bec <__FRAME_END__+0x9d0>
    2bba:	30 5f 5f             	xor    %bl,0x5f(%rdi)
    2bbd:	63 78 61             	movslq 0x61(%rax),%edi
    2bc0:	5f                   	pop    %rdi
    2bc1:	65 78 63             	gs js  2c27 <__FRAME_END__+0xa0b>
    2bc4:	65 70 74             	gs jo  2c3b <__FRAME_END__+0xa1f>
    2bc7:	69 6f 6e 5f 74 79 70 	imul   $0x7079745f,0x6e(%rdi),%ebp
    2bce:	65 45 76 00          	gs rex.RB jbe 2bd2 <__FRAME_END__+0x9b6>
    2bd2:	5f                   	pop    %rdi
    2bd3:	53                   	push   %rbx
    2bd4:	43 5f                	rex.XB pop %r15
    2bd6:	47                   	rex.RXB
    2bd7:	45 54                	rex.RB push %r12
    2bd9:	50                   	push   %rax
    2bda:	57                   	push   %rdi
    2bdb:	5f                   	pop    %rdi
    2bdc:	52                   	push   %rdx
    2bdd:	5f                   	pop    %rdi
    2bde:	53                   	push   %rbx
    2bdf:	49 5a                	rex.WB pop %r10
    2be1:	45 5f                	rex.RB pop %r15
    2be3:	4d                   	rex.WRB
    2be4:	41 58                	pop    %r8
    2be6:	00 5f 53             	add    %bl,0x53(%rdi)
    2be9:	43 5f                	rex.XB pop %r15
    2beb:	58                   	pop    %rax
    2bec:	4f 50                	rex.WRXB push %r8
    2bee:	45                   	rex.RB
    2bef:	4e 5f                	rex.WRX pop %rdi
    2bf1:	4c                   	rex.WR
    2bf2:	45                   	rex.RB
    2bf3:	47                   	rex.RXB
    2bf4:	41                   	rex.B
    2bf5:	43 59                	rex.XB pop %r9
    2bf7:	00 69 73             	add    %ch,0x73(%rcx)
    2bfa:	77 63                	ja     2c5f <__FRAME_END__+0xa43>
    2bfc:	74 79                	je     2c77 <__FRAME_END__+0xa5b>
    2bfe:	70 65                	jo     2c65 <__FRAME_END__+0xa49>
    2c00:	00 5f 53             	add    %bl,0x53(%rdi)
    2c03:	43 5f                	rex.XB pop %r15
    2c05:	54                   	push   %rsp
    2c06:	48 52                	rex.W push %rdx
    2c08:	45                   	rex.RB
    2c09:	41                   	rex.B
    2c0a:	44 5f                	rex.R pop %rdi
    2c0c:	50                   	push   %rax
    2c0d:	52                   	push   %rdx
    2c0e:	49                   	rex.WB
    2c0f:	4f 5f                	rex.WRXB pop %r15
    2c11:	49                   	rex.WB
    2c12:	4e                   	rex.WRX
    2c13:	48                   	rex.W
    2c14:	45 52                	rex.RB push %r10
    2c16:	49 54                	rex.WB push %r12
    2c18:	00 61 73             	add    %ah,0x73(%rcx)
    2c1b:	73 69                	jae    2c86 <__FRAME_END__+0xa6a>
    2c1d:	67 6e                	outsb  %ds:(%esi),(%dx)
    2c1f:	00 2f                	add    %ch,(%rdi)
    2c21:	68 6f 6d 65 2f       	pushq  $0x2f656d6f
    2c26:	6b 73 75 6e          	imul   $0x6e,0x75(%rbx),%esi
    2c2a:	67 6b 65 75 6e       	imul   $0x6e,0x75(%ebp),%esp
    2c2f:	38 34 2f             	cmp    %dh,(%rdi,%rbp,1)
    2c32:	67 69 74 2f 44 43 43 	imul   $0x2f454343,0x44(%edi,%ebp,1),%esi
    2c39:	45 2f 
    2c3b:	44 72 43             	rex.R jb 2c81 <__FRAME_END__+0xa65>
    2c3e:	43 54                	rex.XB push %r12
    2c40:	50                   	push   %rax
    2c41:	72 6f                	jb     2cb2 <__FRAME_END__+0xa96>
    2c43:	66 2f                	data16 (bad) 
    2c45:	73 72                	jae    2cb9 <__FRAME_END__+0xa9d>
    2c47:	63 2f                	movslq (%rdi),%ebp
    2c49:	63 6c 69 65          	movslq 0x65(%rcx,%rbp,2),%ebp
    2c4d:	6e                   	outsb  %ds:(%rsi),(%dx)
    2c4e:	74 73                	je     2cc3 <__FRAME_END__+0xaa7>
    2c50:	2f                   	(bad)  
    2c51:	64 72 63             	fs jb  2cb7 <__FRAME_END__+0xa9b>
    2c54:	63 74 6c 69          	movslq 0x69(%rsp,%rbp,2),%esi
    2c58:	62                   	(bad)  
    2c59:	5f                   	pop    %rdi
    2c5a:	62 61                	(bad)  
    2c5c:	72 72                	jb     2cd0 <__FRAME_END__+0xab4>
    2c5e:	69 65 72 5f 65 6c 69 	imul   $0x696c655f,0x72(%rbp),%esp
    2c65:	73 69                	jae    2cd0 <__FRAME_END__+0xab4>
    2c67:	6f                   	outsl  %ds:(%rsi),(%dx)
    2c68:	6e                   	outsb  %ds:(%rsi),(%dx)
    2c69:	00 5f 53             	add    %bl,0x53(%rdi)
    2c6c:	43 5f                	rex.XB pop %r15
    2c6e:	54                   	push   %rsp
    2c6f:	52                   	push   %rdx
    2c70:	41                   	rex.B
    2c71:	43                   	rex.XB
    2c72:	45 00 5f 5a          	add    %r11b,0x5a(%r15)
    2c76:	4e 53                	rex.WRX push %rbx
    2c78:	74 31                	je     2cab <__FRAME_END__+0xa8f>
    2c7a:	31 63 68             	xor    %esp,0x68(%rbx)
    2c7d:	61                   	(bad)  
    2c7e:	72 5f                	jb     2cdf <__FRAME_END__+0xac3>
    2c80:	74 72                	je     2cf4 <__FRAME_END__+0xad8>
    2c82:	61                   	(bad)  
    2c83:	69 74 73 49 63 45 37 	imul   $0x6e374563,0x49(%rbx,%rsi,2),%esi
    2c8a:	6e 
    2c8b:	6f                   	outsl  %ds:(%rsi),(%dx)
    2c8c:	74 5f                	je     2ced <__FRAME_END__+0xad1>
    2c8e:	65 6f                	outsl  %gs:(%rsi),(%dx)
    2c90:	66 45 52             	rex.RB push %r10w
    2c93:	4b 69 00 66 66 6c 75 	rex.WXB imul $0x756c6666,(%r8),%rax
    2c9a:	73 68                	jae    2d04 <__FRAME_END__+0xae8>
    2c9c:	00 5f 53             	add    %bl,0x53(%rdi)
    2c9f:	43 5f                	rex.XB pop %r15
    2ca1:	4e                   	rex.WRX
    2ca2:	4c 5f                	rex.WR pop %rdi
    2ca4:	53                   	push   %rbx
    2ca5:	45 54                	rex.RB push %r12
    2ca7:	4d                   	rex.WRB
    2ca8:	41 58                	pop    %r8
    2caa:	00 77 63             	add    %dh,0x63(%rdi)
    2cad:	68 61 72 5f 74       	pushq  $0x745f7261
    2cb2:	00 74 79 70          	add    %dh,0x70(%rcx,%rdi,2)
    2cb6:	65 64 65 66 20 5f 5f 	gs fs data16 and %bl,%gs:0x5f(%rdi)
    2cbd:	76 61                	jbe    2d20 <__FRAME_END__+0xb04>
    2cbf:	5f                   	pop    %rdi
    2cc0:	6c                   	insb   (%dx),%es:(%rdi)
    2cc1:	69 73 74 5f 74 61 67 	imul   $0x6761745f,0x74(%rbx),%esi
    2cc8:	20 5f 5f             	and    %bl,0x5f(%rdi)
    2ccb:	76 61                	jbe    2d2e <__FRAME_END__+0xb12>
    2ccd:	5f                   	pop    %rdi
    2cce:	6c                   	insb   (%dx),%es:(%rdi)
    2ccf:	69 73 74 5f 74 61 67 	imul   $0x6761745f,0x74(%rbx),%esi
    2cd6:	00 77 63             	add    %dh,0x63(%rdi)
    2cd9:	73 74                	jae    2d4f <__FRAME_END__+0xb33>
    2cdb:	6f                   	outsl  %ds:(%rsi),(%dx)
    2cdc:	75 6c                	jne    2d4a <__FRAME_END__+0xb2e>
    2cde:	00 5f 5a             	add    %bl,0x5a(%rdi)
    2ce1:	4e 53                	rex.WRX push %rbx
    2ce3:	74 31                	je     2d16 <__FRAME_END__+0xafa>
    2ce5:	31 63 68             	xor    %esp,0x68(%rbx)
    2ce8:	61                   	(bad)  
    2ce9:	72 5f                	jb     2d4a <__FRAME_END__+0xb2e>
    2ceb:	74 72                	je     2d5f <__FRAME_END__+0xb43>
    2ced:	61                   	(bad)  
    2cee:	69 74 73 49 63 45 31 	imul   $0x31314563,0x49(%rbx,%rsi,2),%esi
    2cf5:	31 
    2cf6:	74 6f                	je     2d67 <__FRAME_END__+0xb4b>
    2cf8:	5f                   	pop    %rdi
    2cf9:	69 6e 74 5f 74 79 70 	imul   $0x7079745f,0x74(%rsi),%ebp
    2d00:	65 45 52             	gs rex.RB push %r10
    2d03:	4b 63 00             	rex.WXB movslq (%r8),%rax
    2d06:	66 72 65             	data16 jb 2d6e <__FRAME_END__+0xb52>
    2d09:	6f                   	outsl  %ds:(%rsi),(%dx)
    2d0a:	70 65                	jo     2d71 <__FRAME_END__+0xb55>
    2d0c:	6e                   	outsb  %ds:(%rsi),(%dx)
	...
