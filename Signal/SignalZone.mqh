// ------------------------------------------------
#property copyright "Copyright 2015, Leiha Sellier"
#property link      "https://github.com/leiha"
#property version   "1.00"

class SignalZone : public BufferSignal 
{  
   protected :
      
      double overbought, oversold;
      
   public :
   
      /** 
       */
      SignalZone( int bought, int sold, int back = 0, int front = 0, bool display = true ) 
         : BufferSignal( back, front, display )           
         {
            overZone(bought, sold);
         }
         ;
         
      /** 
       */
      SignalZone* overZone(double bought, double sold) 
      {
         overbought  = bought;
         oversold    = sold;
         
         return GetPointer(this);
      };
   
      /** 
       */
      virtual bool isShort( double &buffer[], int candle ) 
      {
         if(   candle > shiftTotal
            && buffer[ candle -  shiftFront ]        <  overbought 
            && buffer[ candle - ( shiftFront + 1 ) ] >= overbought
            && isShiftTrend( buffer, candle, overbought )
         ) {
            return true;
         }         
         return false;
      };
      
      /** 
       */
      virtual bool isLong( double &buffer[], int candle ) 
      {
         if(   candle > shiftTotal
            && buffer[ candle -  shiftFront ]        >= oversold 
            && buffer[ candle - ( shiftFront + 1 ) ] <  oversold
            && isShiftTrend( buffer, candle, oversold )
         ) {
            return true;
         }         
         return false;
      }; 
};