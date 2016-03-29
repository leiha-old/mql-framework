// ------------------------------------------------
#property copyright "Copyright 2015, Leiha Sellier"
#property link      "https://github.com/leiha"
#property version   "1.00"

class SignalCrossing : public BufferSignal
{
   protected :
   
      Buffer* _buffer1;
      Buffer* _buffer2;

   public :
   
      /** 
       */
      SignalCrossing( Buffer* buffer1, Buffer* buffer2, int back = 0, int front = 0, bool display = true )
         : BufferSignal( back, front, display )
         {
            _buffer1 = buffer1;
            _buffer2 = buffer2;
         }
      ;
      
      /** 
       */
      virtual void onCalculateCandle ( Buffer* parentBuffer, int candle ) 
      {
         BufferSignal::onCalculateCandle( _buffer1, candle );
      };
   
      /** 
       */
      virtual bool isLong( Buffer* buffer, int i )
      {
         if(   i > shiftTotal
            && _buffer1.get( i -   shiftFront )       >  _buffer2.get( i -   shiftFront )
            && _buffer1.get( i - ( shiftFront + 1 ) ) <= _buffer2.get( i - ( shiftFront + 1 ) )
            //&& isShiftTrend( buffer, i, overbought )
         ) {
            return true;
         }         
         return false;
      };
      
      /** 
       */
      virtual bool isShort( Buffer* buffer, int i )
      {
         if(   i > shiftTotal
            && _buffer1.get( i -   shiftFront )       <  _buffer2.get( i -   shiftFront )
            && _buffer1.get( i - ( shiftFront + 1 ) ) >= _buffer2.get( i - ( shiftFront + 1 ) )
            //&& isShiftTrend( buffer, i, overbought )
         ) {
            return true;
         }         
         return false;
      };
};