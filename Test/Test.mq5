
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
      void onInit () 
      {  
         
         /**/
         this.handle ( iRSI( NULL, PERIOD_CURRENT, 14, PRICE_CLOSE ) )
             .digits ( 0 )
             .plot   (   )
                  .c0lor( clrGray       )
                  .type ( DRAW_LINE     )
                  .style( STYLE_DASHDOT )
         ;         
         
         /**/
         this.ma( 7 )
            .plot(  )
               .c0lor( clrRed      )
               .type ( DRAW_LINE   )
               .style( STYLE_SOLID )
         ;
         
         /**/
         this.sz( 70, 30 )
            .shift( 1, 1 )
            .plot ( 0, clrBlue , DRAW_ARROW, STYLE_SOLID )
            .plot ( 1, clrGreen, DRAW_ARROW, STYLE_SOLID )
         ;
      };
};

Test *test = new Test();

// ------------------------------------------------

#include "bootstrap.mqh"