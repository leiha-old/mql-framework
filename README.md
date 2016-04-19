# mql-framework

This framework help you to build your own Indicator with MQL 5 (MetaQuotes Query Language)

NB : It's the second iteration but it's an active project so if you find a bug or you want a new feature make an issue ;)

Example of custom indicator :

```c++

#property indicator_separate_window

#property indicator_minimum 0
#property indicator_maximum 100
#property indicator_level1  30
#property indicator_level2  50
#property indicator_level3  70

#property indicator_buffers 20
#property indicator_plots   20

#include "includes.mqh" // includes all files of the framework (path to edit)

// ------------------------------------------------

class Test : public Indicator
{
   public :
      
      /** 
       */
      void onInit () 
      {
         BufferMA*       maA = new BufferMA      (  7 );
         BufferMA*       maB = new BufferMA      ( 21 );         
         BufferMA*       maC = new BufferMA      ( 55 );
         SignalZone*     szA = new SignalZone    ( 70, 30 );
         SignalZone*     szB = new SignalZone    ( 70, 30 );
         SignalCrossing* scA = new SignalCrossing( maB, maC );
         SignalTrend*    stA = new SignalTrend   (  );
         
         maA
            .smooth(1)
            .buffer(maB)
            .buffer(szB)
            .plot()            
               .c0lor(clrLightPink)
               .type (DRAW_LINE)
               .style(STYLE_DOT)
            ;
         
         maB
            .smooth(2)
            .buffer(stA)
            .plot()
               .c0lor(clrBlue)
               .type (DRAW_NONE)
               .style(STYLE_DOT)
            ;
            
         maC
            .smooth(2)
            .plot()
               .c0lor(clrOrange)
               .type (DRAW_LINE)
            ;
         
         stA.plot(0)
            .emptyValue()
            .c0lor(clrGreen)
            .type (DRAW_LINE)
            .width(1)
            ;
         
         stA.plot(1)
            .emptyValue()
            .c0lor(clrRed)
            .type (DRAW_LINE)
            .width(1)
            ;
            
         szA.plot(0)
            .emptyValue()
            .c0lor(clrPink)
            .type (DRAW_ARROW)
            .width(1)
            ;
            
         szA.plot(1)
            .emptyValue()
            .c0lor(clrLightGreen)
            .type (DRAW_ARROW)
            .width(1)
            ;
            
         szB.plot(0)
            .emptyValue()
            .c0lor(clrRed)
            .type (DRAW_ARROW)
            .width(5)
            ;
            
         szB.plot(1)
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
      
         this.handle(iRSI( NULL, PERIOD_CURRENT, 14, PRICE_CLOSE))
            .digits(2)
            
            .buffer(maA)
            .buffer(maC)
            
            .buffer(scA)
            .buffer(szA)
            
            .plot()
               .c0lor(clrGray)
               .type (DRAW_NONE)
               .style(STYLE_DASHDOT)          
            ;

      };
};

Test *test = new Test();

// ------------------------------------------------

#include "bootstrap.mqh" // Includes test handling

```

Enjoy ;)
