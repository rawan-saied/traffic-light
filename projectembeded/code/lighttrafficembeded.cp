#line 1 "C:/Users/rawan/OneDrive/Documents/Desktop/projectembeded/code/lighttrafficembeded.c"

 short i=0,x;










void counter(short,short,short);
void main()
{
 trisd=0; portd=0;
 trisc=0; portc=0;
 trisb.b0=1;
 trisA.b4=1;
 while(portA.b4);
 while(!portA.b4);
 while(1)
 {

 if(! portb.B0 )
 {
  portd.b7 =1;  portd.b6 =1;
  portd.b3 =1;  portd.b5 =0;  portd.b4 =0;
  portd.b0 =0;  portd.B2 =1;  portd.b1 =0;
 if(! portb.B0 )
 counter(15,0,0);
  portd.b3 =0;  portd.b5 =1;  portd.b4 =0;
  portd.b0 =1;  portd.B2 =0;  portd.b1 =0;
 if(! portb.B0 )
 counter(23,1,0) ;
 }else if( portb.B0  &&  portb.b1 )
 {
  portd.b7 =1;  portd.b6 =0;
  portd.b3 =0;  portd.b5 =0;  portd.b4 =1;
  portd.b0 =1;  portd.B2 =0;  portd.b1 =0;
 if( portb.B0  &&  portb.b1 )
 counter(3,-1,1);
  portd.b7 =0;  portd.b6 =0;
  portd.b3 =0;  portd.b5 =1;  portd.b4 =0;
 while( portb.B0  &&  portb.b1 );
  portd.b3 =0;  portd.b5 =0;  portd.b4 =0;
 }else if( portb.B0  && ! portb.b1 )
 {
  portd.b7 =0;  portd.b6 =1;
  portd.b3 =1;  portd.b5 =0;  portd.b4 =0;
  portd.b0 =0;  portd.B2 =0;  portd.b1 =1;
 if( portb.B0  && ! portb.b1 )
 counter(3,-1,2);
  portd.b7 =0;  portd.b6 =0;
  portd.b0 =0;  portd.B2 =1;  portd.b1 =0;
 while(  portb.B0 &&! portb.b1  );
  portd.b0 =0;  portd.B2 =0;  portd.b1 =0;
 }
 }
}


void counter(short count,short flag,short cur_state) {
 portC=count%10+16*(count/10);
 while(1)
 {
 for(i=count%10;i>0;i--)
 {
 if(flag==0 && count==3){
  portd.B2 =0;  portd.b1 =1;
 }
 if(flag==1 && count==3){
  portd.b5 =0;  portd.b4 =1;
 }
 x=2000;
 while(x--)
 {
 delay_ms(3);
 if((cur_state==0 &&  portb.B0 ) || (cur_state==1 &&(! portb.B0  || ! portb.b1 ))|| (cur_state==2 &&(! portb.B0  ||  portb.b1 )))
 return;
 }
 portC--;
 count--;
 }
 if(count==0)
 return;
 if((cur_state==0 &&  portb.B0 ) || (cur_state==1 &&(! portb.B0  || ! portb.b1 ))|| (cur_state==2 &&(! portb.B0  ||  portb.b1 )))
 return;

 x=2000;
 while(x--)
 {
 delay_ms(3);
 if((cur_state==0 &&  portb.B0 ) || (cur_state==1 &&(! portb.B0  || ! portb.b1 ))|| (cur_state==2 &&(! portb.B0  ||  portb.b1 )))
 return;
 }
 portC-=16;
 count--;
 portC+=count%10;
 }
}
