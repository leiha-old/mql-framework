// ------------------------------------------------
#property copyright "Copyright 2015, Leiha Sellier"
#property link      "https://github.com/leiha"
#property version   "1.00"

class SignalTrend : public BufferSignal
{
   public :
   
      /** 
       */
      SignalTrend( int back = 0, int front = 0, bool display = true )
         : BufferSignal( back, front, display )
         {}
      ;
   
      /** 
       */
      virtual bool isLong( double &buffer[], int candle )
      {
         double pivot = buffer[ candle ];
         
         if(   candle > shiftTotal 
            && pivot  > buffer[ candle - 1 ]
            //&& isShiftTrend( buffer, candle, pivot )
          ) {      
            
            return true;
          }
          return false;
      };
      
      /** 
       */
      virtual bool isShort( double &buffer[], int candle )
      {
         double pivot = buffer[ candle ];
         
         if(   candle > shiftTotal 
            && pivot  < buffer[ candle - 1 ]
            //&& isShiftTrend( buffer, candle, pivot )
          ) {
          
            return true;
          }
          return false;
      };
};