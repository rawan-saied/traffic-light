
_main:

;lighttrafficembeded.c,14 :: 		void main()
;lighttrafficembeded.c,16 :: 		trisd=0;     portd=0;
	CLRF       TRISD+0
	CLRF       PORTD+0
;lighttrafficembeded.c,17 :: 		trisc=0;     portc=0;
	CLRF       TRISC+0
	CLRF       PORTC+0
;lighttrafficembeded.c,18 :: 		trisb.b0=1;
	BSF        TRISB+0, 0
;lighttrafficembeded.c,19 :: 		trisA.b4=1;
	BSF        TRISA+0, 4
;lighttrafficembeded.c,20 :: 		while(portA.b4);
L_main0:
	BTFSS      PORTA+0, 4
	GOTO       L_main1
	GOTO       L_main0
L_main1:
;lighttrafficembeded.c,21 :: 		while(!portA.b4);
L_main2:
	BTFSC      PORTA+0, 4
	GOTO       L_main3
	GOTO       L_main2
L_main3:
;lighttrafficembeded.c,22 :: 		while(1)
L_main4:
;lighttrafficembeded.c,25 :: 		if(!is_Manual)
	BTFSC      PORTB+0, 0
	GOTO       L_main6
;lighttrafficembeded.c,27 :: 		west7seg=1;    south7seg=1;
	BSF        PORTD+0, 7
	BSF        PORTD+0, 6
;lighttrafficembeded.c,28 :: 		west_red=1;   west_green=0;   west_yellow=0;
	BSF        PORTD+0, 3
	BCF        PORTD+0, 5
	BCF        PORTD+0, 4
;lighttrafficembeded.c,29 :: 		south_red=0;  south_green=1;  south_yellow=0;
	BCF        PORTD+0, 0
	BSF        PORTD+0, 2
	BCF        PORTD+0, 1
;lighttrafficembeded.c,30 :: 		if(!is_Manual)
	BTFSC      PORTB+0, 0
	GOTO       L_main7
;lighttrafficembeded.c,31 :: 		counter(15,0,0);
	MOVLW      15
	MOVWF      FARG_counter+0
	CLRF       FARG_counter+0
	CLRF       FARG_counter+0
	CALL       _counter+0
L_main7:
;lighttrafficembeded.c,32 :: 		west_red=0;   west_green=1;   west_yellow=0;
	BCF        PORTD+0, 3
	BSF        PORTD+0, 5
	BCF        PORTD+0, 4
;lighttrafficembeded.c,33 :: 		south_red=1;  south_green=0;  south_yellow=0;
	BSF        PORTD+0, 0
	BCF        PORTD+0, 2
	BCF        PORTD+0, 1
;lighttrafficembeded.c,34 :: 		if(!is_Manual)
	BTFSC      PORTB+0, 0
	GOTO       L_main8
;lighttrafficembeded.c,35 :: 		counter(23,1,0) ;
	MOVLW      23
	MOVWF      FARG_counter+0
	MOVLW      1
	MOVWF      FARG_counter+0
	CLRF       FARG_counter+0
	CALL       _counter+0
L_main8:
;lighttrafficembeded.c,36 :: 		}else if(is_Manual && West_Man)    //Manual and west is ON
	GOTO       L_main9
L_main6:
	BTFSS      PORTB+0, 0
	GOTO       L_main12
	BTFSS      PORTB+0, 1
	GOTO       L_main12
L__main93:
;lighttrafficembeded.c,38 :: 		west7seg=1;    south7seg=0;
	BSF        PORTD+0, 7
	BCF        PORTD+0, 6
;lighttrafficembeded.c,39 :: 		west_red=0;   west_green=0;   west_yellow=1;
	BCF        PORTD+0, 3
	BCF        PORTD+0, 5
	BSF        PORTD+0, 4
;lighttrafficembeded.c,40 :: 		south_red=1;  south_green=0;  south_yellow=0;
	BSF        PORTD+0, 0
	BCF        PORTD+0, 2
	BCF        PORTD+0, 1
;lighttrafficembeded.c,41 :: 		if(is_Manual && West_Man)
	BTFSS      PORTB+0, 0
	GOTO       L_main15
	BTFSS      PORTB+0, 1
	GOTO       L_main15
L__main92:
;lighttrafficembeded.c,42 :: 		counter(3,-1,1);
	MOVLW      3
	MOVWF      FARG_counter+0
	MOVLW      255
	MOVWF      FARG_counter+0
	MOVLW      1
	MOVWF      FARG_counter+0
	CALL       _counter+0
L_main15:
;lighttrafficembeded.c,43 :: 		west7seg=0;    south7seg=0;
	BCF        PORTD+0, 7
	BCF        PORTD+0, 6
;lighttrafficembeded.c,44 :: 		west_red=0;   west_green=1;   west_yellow=0;
	BCF        PORTD+0, 3
	BSF        PORTD+0, 5
	BCF        PORTD+0, 4
;lighttrafficembeded.c,45 :: 		while(is_Manual && West_Man);
L_main16:
	BTFSS      PORTB+0, 0
	GOTO       L_main17
	BTFSS      PORTB+0, 1
	GOTO       L_main17
L__main91:
	GOTO       L_main16
L_main17:
;lighttrafficembeded.c,46 :: 		west_red=0;   west_green=0;   west_yellow=0;
	BCF        PORTD+0, 3
	BCF        PORTD+0, 5
	BCF        PORTD+0, 4
;lighttrafficembeded.c,47 :: 		}else if(is_Manual && !West_Man)    //Manual and south is ON
	GOTO       L_main20
L_main12:
	BTFSS      PORTB+0, 0
	GOTO       L_main23
	BTFSC      PORTB+0, 1
	GOTO       L_main23
L__main90:
;lighttrafficembeded.c,49 :: 		west7seg=0;    south7seg=1;
	BCF        PORTD+0, 7
	BSF        PORTD+0, 6
;lighttrafficembeded.c,50 :: 		west_red=1;   west_green=0;   west_yellow=0;
	BSF        PORTD+0, 3
	BCF        PORTD+0, 5
	BCF        PORTD+0, 4
;lighttrafficembeded.c,51 :: 		south_red=0;  south_green=0;  south_yellow=1;
	BCF        PORTD+0, 0
	BCF        PORTD+0, 2
	BSF        PORTD+0, 1
;lighttrafficembeded.c,52 :: 		if(is_Manual && !West_Man)
	BTFSS      PORTB+0, 0
	GOTO       L_main26
	BTFSC      PORTB+0, 1
	GOTO       L_main26
L__main89:
;lighttrafficembeded.c,53 :: 		counter(3,-1,2);
	MOVLW      3
	MOVWF      FARG_counter+0
	MOVLW      255
	MOVWF      FARG_counter+0
	MOVLW      2
	MOVWF      FARG_counter+0
	CALL       _counter+0
L_main26:
;lighttrafficembeded.c,54 :: 		west7seg=0;    south7seg=0;
	BCF        PORTD+0, 7
	BCF        PORTD+0, 6
;lighttrafficembeded.c,55 :: 		south_red=0;  south_green=1;  south_yellow=0;
	BCF        PORTD+0, 0
	BSF        PORTD+0, 2
	BCF        PORTD+0, 1
;lighttrafficembeded.c,56 :: 		while( is_Manual&&!West_Man );
L_main27:
	BTFSS      PORTB+0, 0
	GOTO       L_main28
	BTFSC      PORTB+0, 1
	GOTO       L_main28
L__main88:
	GOTO       L_main27
L_main28:
;lighttrafficembeded.c,57 :: 		south_red=0;  south_green=0;  south_yellow=0;
	BCF        PORTD+0, 0
	BCF        PORTD+0, 2
	BCF        PORTD+0, 1
;lighttrafficembeded.c,58 :: 		}
L_main23:
L_main20:
L_main9:
;lighttrafficembeded.c,59 :: 		}
	GOTO       L_main4
;lighttrafficembeded.c,60 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_counter:

;lighttrafficembeded.c,63 :: 		void counter(short count,short flag,short cur_state)  {
;lighttrafficembeded.c,64 :: 		portC=count%10+16*(count/10);
	MOVLW      10
	MOVWF      R4+0
	MOVF       FARG_counter_count+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      FLOC__counter+0
	MOVLW      10
	MOVWF      R4+0
	MOVF       FARG_counter_count+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_S+0
	MOVLW      4
	MOVWF      R2+0
	MOVF       R0+0, 0
	MOVWF      R1+0
	MOVF       R2+0, 0
L__counter116:
	BTFSC      STATUS+0, 2
	GOTO       L__counter117
	RLF        R1+0, 1
	BCF        R1+0, 0
	ADDLW      255
	GOTO       L__counter116
L__counter117:
	MOVF       R1+0, 0
	ADDWF      FLOC__counter+0, 0
	MOVWF      PORTC+0
;lighttrafficembeded.c,65 :: 		while(1)
L_counter31:
;lighttrafficembeded.c,67 :: 		for(i=count%10;i>0;i--)
	MOVLW      10
	MOVWF      R4+0
	MOVF       FARG_counter_count+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      _i+0
L_counter33:
	MOVLW      128
	XORLW      0
	MOVWF      R0+0
	MOVLW      128
	XORWF      _i+0, 0
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_counter34
;lighttrafficembeded.c,69 :: 		if(flag==0 && count==3){
	MOVF       FARG_counter_flag+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_counter38
	MOVF       FARG_counter_count+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_counter38
L__counter113:
;lighttrafficembeded.c,70 :: 		south_green=0;  south_yellow=1;
	BCF        PORTD+0, 2
	BSF        PORTD+0, 1
;lighttrafficembeded.c,71 :: 		}
L_counter38:
;lighttrafficembeded.c,72 :: 		if(flag==1 && count==3){
	MOVF       FARG_counter_flag+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_counter41
	MOVF       FARG_counter_count+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_counter41
L__counter112:
;lighttrafficembeded.c,73 :: 		west_green=0;  west_yellow=1;
	BCF        PORTD+0, 5
	BSF        PORTD+0, 4
;lighttrafficembeded.c,74 :: 		}
L_counter41:
;lighttrafficembeded.c,75 :: 		x=2000;
	MOVLW      208
	MOVWF      _x+0
;lighttrafficembeded.c,76 :: 		while(x--)
L_counter42:
	MOVF       _x+0, 0
	MOVWF      R0+0
	DECF       _x+0, 1
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_counter43
;lighttrafficembeded.c,78 :: 		delay_ms(3);
	MOVLW      8
	MOVWF      R12+0
	MOVLW      201
	MOVWF      R13+0
L_counter44:
	DECFSZ     R13+0, 1
	GOTO       L_counter44
	DECFSZ     R12+0, 1
	GOTO       L_counter44
	NOP
	NOP
;lighttrafficembeded.c,79 :: 		if((cur_state==0 && is_Manual) || (cur_state==1 &&(!is_Manual || !West_Man))|| (cur_state==2 &&(!is_Manual || West_Man)))
	MOVF       FARG_counter_cur_state+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__counter111
	BTFSS      PORTB+0, 0
	GOTO       L__counter111
	GOTO       L__counter106
L__counter111:
	MOVF       FARG_counter_cur_state+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L__counter109
	BTFSS      PORTB+0, 0
	GOTO       L__counter110
	BTFSS      PORTB+0, 1
	GOTO       L__counter110
	GOTO       L__counter109
L__counter110:
	GOTO       L__counter106
L__counter109:
	MOVF       FARG_counter_cur_state+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L__counter107
	BTFSS      PORTB+0, 0
	GOTO       L__counter108
	BTFSC      PORTB+0, 1
	GOTO       L__counter108
	GOTO       L__counter107
L__counter108:
	GOTO       L__counter106
L__counter107:
	GOTO       L_counter57
L__counter106:
;lighttrafficembeded.c,80 :: 		return;
	GOTO       L_end_counter
L_counter57:
;lighttrafficembeded.c,81 :: 		}
	GOTO       L_counter42
L_counter43:
;lighttrafficembeded.c,82 :: 		portC--;
	DECF       PORTC+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      PORTC+0
;lighttrafficembeded.c,83 :: 		count--;
	DECF       FARG_counter_count+0, 1
;lighttrafficembeded.c,67 :: 		for(i=count%10;i>0;i--)
	DECF       _i+0, 1
;lighttrafficembeded.c,84 :: 		}
	GOTO       L_counter33
L_counter34:
;lighttrafficembeded.c,85 :: 		if(count==0)
	MOVF       FARG_counter_count+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_counter58
;lighttrafficembeded.c,86 :: 		return;
	GOTO       L_end_counter
L_counter58:
;lighttrafficembeded.c,87 :: 		if((cur_state==0 && is_Manual) || (cur_state==1 &&(!is_Manual || !West_Man))|| (cur_state==2 &&(!is_Manual || West_Man)))
	MOVF       FARG_counter_cur_state+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__counter105
	BTFSS      PORTB+0, 0
	GOTO       L__counter105
	GOTO       L__counter100
L__counter105:
	MOVF       FARG_counter_cur_state+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L__counter103
	BTFSS      PORTB+0, 0
	GOTO       L__counter104
	BTFSS      PORTB+0, 1
	GOTO       L__counter104
	GOTO       L__counter103
L__counter104:
	GOTO       L__counter100
L__counter103:
	MOVF       FARG_counter_cur_state+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L__counter101
	BTFSS      PORTB+0, 0
	GOTO       L__counter102
	BTFSC      PORTB+0, 1
	GOTO       L__counter102
	GOTO       L__counter101
L__counter102:
	GOTO       L__counter100
L__counter101:
	GOTO       L_counter71
L__counter100:
;lighttrafficembeded.c,88 :: 		return;
	GOTO       L_end_counter
L_counter71:
;lighttrafficembeded.c,90 :: 		x=2000;
	MOVLW      208
	MOVWF      _x+0
;lighttrafficembeded.c,91 :: 		while(x--)
L_counter72:
	MOVF       _x+0, 0
	MOVWF      R0+0
	DECF       _x+0, 1
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_counter73
;lighttrafficembeded.c,93 :: 		delay_ms(3);
	MOVLW      8
	MOVWF      R12+0
	MOVLW      201
	MOVWF      R13+0
L_counter74:
	DECFSZ     R13+0, 1
	GOTO       L_counter74
	DECFSZ     R12+0, 1
	GOTO       L_counter74
	NOP
	NOP
;lighttrafficembeded.c,94 :: 		if((cur_state==0 && is_Manual) || (cur_state==1 &&(!is_Manual || !West_Man))|| (cur_state==2 &&(!is_Manual || West_Man)))
	MOVF       FARG_counter_cur_state+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__counter99
	BTFSS      PORTB+0, 0
	GOTO       L__counter99
	GOTO       L__counter94
L__counter99:
	MOVF       FARG_counter_cur_state+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L__counter97
	BTFSS      PORTB+0, 0
	GOTO       L__counter98
	BTFSS      PORTB+0, 1
	GOTO       L__counter98
	GOTO       L__counter97
L__counter98:
	GOTO       L__counter94
L__counter97:
	MOVF       FARG_counter_cur_state+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L__counter95
	BTFSS      PORTB+0, 0
	GOTO       L__counter96
	BTFSC      PORTB+0, 1
	GOTO       L__counter96
	GOTO       L__counter95
L__counter96:
	GOTO       L__counter94
L__counter95:
	GOTO       L_counter87
L__counter94:
;lighttrafficembeded.c,95 :: 		return;
	GOTO       L_end_counter
L_counter87:
;lighttrafficembeded.c,96 :: 		}
	GOTO       L_counter72
L_counter73:
;lighttrafficembeded.c,97 :: 		portC-=16;
	MOVLW      16
	SUBWF      PORTC+0, 1
;lighttrafficembeded.c,98 :: 		count--;
	DECF       FARG_counter_count+0, 1
;lighttrafficembeded.c,99 :: 		portC+=count%10;
	MOVLW      10
	MOVWF      R4+0
	MOVF       FARG_counter_count+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	ADDWF      PORTC+0, 1
;lighttrafficembeded.c,100 :: 		}
	GOTO       L_counter31
;lighttrafficembeded.c,101 :: 		}
L_end_counter:
	RETURN
; end of _counter
