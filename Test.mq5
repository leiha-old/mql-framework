
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

#include "includes.mqh"

// ------------------------------------------------

class Test : public Indicator
{
   public :
      
      /** 
       */
      void onInit () 
      {
         BufferMA*       maA = new BufferMA  (7);
         BufferMA*       maB = new BufferMA  (21);         
         BufferMA*       maC = new BufferMA  (55);
         
         BufferMA*       maBB = new BufferMA (21);
         
         maB.buffer(maBB);
         maBB.plot()
            .c0lor(clrGreen)
            .type (DRAW_LINE)            
            ;
         
         
         SignalCrossing* scA = new SignalCrossing(maB, maC);
         SignalZone*     szA = new SignalZone(70, 30);
         
         maA.plot()
            .c0lor(clrRed)
            .type (DRAW_LINE)            
            ;
         
         maB.plot()
            .c0lor(clrBlue)
            .type (DRAW_LINE)
            ;
            
         maC.plot()
            .c0lor(clrOrange)
            .type (DRAW_LINE)
            ;
         
         szA.plot(0)
            .emptyValue()
            .c0lor(clrViolet)
            .type (DRAW_ARROW)
            .width(5)
            ;
            
         szA.plot(1)
            .emptyValue()
            .c0lor(clrGreen)
            .type (DRAW_ARROW)
            .width(5)
            ;
            
         scA.plot(0)
            .emptyValue()
            .c0lor(clrBlue)
            .type (DRAW_ARROW)
            .width(5)
            ;
         
         scA.plot(1)
            .emptyValue()
            .c0lor(clrOrange)
            .type (DRAW_ARROW)
            .width(5)
            ;
      
         this.handle(iRSI( NULL, PERIOD_M30, 14, PRICE_CLOSE))
            .digits(2)
            .buffer(maA)
            .buffer(maB)
            .buffer(maC)
            .buffer(szA)
            .buffer(scA)
            .plot()
               .c0lor(clrGray)
               .type (DRAW_LINE)
               .style(STYLE_DASHDOT)          
            ;
         
         //buffer().handle(iMA( NULL, PERIOD_M30, 21, 0, MODE_EMA, PRICE_CLOSE));

      };
};

Test *test = new Test();

// ------------------------------------------------

#include "bootstrap.mqh"