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
      virtual bool isLong( Buffer* buffer, int i )
      {
         double pivot = buffer.get( i - shiftFront );
         if(   i     > shiftTotal 
            && pivot > buffer.get( i - ( shiftFront + 1 ) )
            && isShiftTrend( buffer, i, pivot )
          ) {      
            return true;
          }
          return false;
      };
      
      /** 
       */
      virtual bool isShort( Buffer* buffer, int i )
      {
         double pivot = buffer.get( i - shiftFront );
         if(   i     > shiftTotal 
            && pivot < buffer.get( i - ( shiftFront + 1 ) )
            && isShiftTrend( buffer, i, pivot )
          ) {      
            return true;
          }
          return false;
      };
};