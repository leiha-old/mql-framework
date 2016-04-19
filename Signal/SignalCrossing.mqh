// ------------------------------------------------
#property copyright "Copyright 2015, Leiha Sellier"
#property link      "https://github.com/leiha"
#property version   "1.00"

class SignalCrossing : public BufferSignal
{
   protected :
   
      /**
       */
      virtual void onIterateCandle (
         double  value, 
         double &bufferLong [], 
         double &bufferShort[], 
         double &bufferSrc  [], 
         int     candle
      ) {
      
         double v = (buffer( 2 ).get( candle ) + buffer( 3 ).get( candle )) / 2;
        
         bufferLong [ candle ] = isLong ( bufferSrc, candle) ? v : 0;
         bufferShort[ candle ] = isShort( bufferSrc, candle) ? v : 0;
         
      };

   public :
   
      /** 
       */
      SignalCrossing( Buffer* buffer1, Buffer* buffer2, int back = 0, int front = 0, bool display = true )
         : BufferSignal( back, front, display )
         {
            _buffers.add  ( buffer1 );
            _buffers.add  ( buffer2 );
            _internalBuffers = _internalBuffers + 2;
         }
      ;
      
      /** 
       */
      virtual bool isLong( double &buffer[], int candle )
      {
         if(   candle > shiftTotal
            && buffer( 2 ).get( candle     ) >  buffer( 3 ).get( candle     )
            && buffer( 2 ).get( candle - 1 ) <= buffer( 3 ).get( candle - 1 )
            //&& isShiftTrend( buffer, candle, overbought )
         ) {
            return true;
         }         
         return false;
      };
      
      /** 
       */
      virtual bool isShort( double &buffer[], int candle )
      {
         if(   candle > shiftTotal
            && buffer( 2 ).get( candle     ) <  buffer( 3 ).get( candle     )
            && buffer( 2 ).get( candle - 1 ) >= buffer( 3 ).get( candle - 1 )
            //&& isShiftTrend( buffer, candle, overbought )
         ) {
            return true;
         }         
         return false;
      };
};