
// ------------------------------------------------

#property copyright "Copyright 2015, Leiha Sellier"
#property link      "https://github.com/leiha"
#property version   "1.00"

// -------------------------

#property indicator_separate_window

#property indicator_minimum 0
#property indicator_maximum 100
#property indicator_level1  30
#property indicator_level2  50
#property indicator_level3  70

#property indicator_buffers 20
#property indicator_plots   20


#include "../includes.mqh"

// ------------------------------------------------

class Test : public Indicator
{
   public :
   
   
      /**
       */
      void onCalculate( int start, int end, double &bufferSrc[], int rates_total, int prev_calculated )
      {
         this.buffer().copy( bufferSrc );
         
         for( int i = start; i < end; i++ ) {
            bufferSrc[i] = iRSI( NULL, 0, 14, PRICE_CLOSE, i );
         }         
      };
   
      
      /** 
       */
      void onInit () 
      {  
         
         /**/
         this
             .digits ( 2 )
             .plot   (   )
                  .c0lor( clrGray       )
                  .type ( DRAW_LINE     )
                  .style( STYLE_DASHDOT )
         ;         
         
         /**/
         MovingAverage  * maA  = ma (  7 );
         MovingAverage  * maB  = ma ( 21 );
         MovingAverage  * maC  = ma ( 55 );
         SignalZone     * szA  = sz ( 70, 30 );
         SignalCrossing * scA  = sc ( maA, maB );
         SignalTrend    * stA  = st ( maC );
                  
         maA
            .plot(  )
               .c0lor      ( clrSalmon   )
               .type       ( DRAW_LINE   )
               .style      ( STYLE_SOLID )
         ;
                  
         maB
            .plot(  )
               .c0lor      ( clrOrange   )
               .type       ( DRAW_LINE   )
               .style      ( STYLE_SOLID )
         ;
         
         maC
            .plot(  )
               .c0lor      ( clrPurple   )
               .type       ( DRAW_NONE   )
               .style      ( STYLE_SOLID )
         ;
                  
         szA
            .plot(  )
               .emptyValue ( 0           )
               .style      ( STYLE_SOLID )
               .type       ( DRAW_ARROW  )
               .c0lor      ( Signal::LONG , clrBlue  )
               .c0lor      ( Signal::SHORT, clrGreen )
        ;
        
        scA
            .plot(  )
               .emptyValue ( 0            )
               .style      ( STYLE_SOLID  )
               .type       ( DRAW_ARROW   )
               .c0lor      ( Signal::LONG , clrOrange )
               .c0lor      ( Signal::SHORT, clrPurple )
        ;
        
        stA
            .plot(  )
               .emptyValue ( 0            )
               .style      ( STYLE_SOLID  )
               .type       ( DRAW_LINE   )
               .c0lor      ( Signal::LONG , clrGreen )
               .c0lor      ( Signal::SHORT, clrRed   )
        ;
         
      };
};


Test *test = new Test();

// ------------------------------------------------

#include "bootstrap.mqh"
