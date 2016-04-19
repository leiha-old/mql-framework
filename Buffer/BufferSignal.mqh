// ------------------------------------------------
#property copyright "Copyright 2015, Leiha Sellier"
#property link      "https://github.com/leiha"
#property version   "1.00"

class BufferSignal : public Buffer 
{  
   protected :
   
      int shiftTotal, shiftBack, shiftFront;
      
      /**
       */
      virtual void onInit ( 
         double &bufferLong [], 
         double &bufferShort[], 
         double &bufferSrc  [], 
         int     rates_total, 
         int     prev_calculated
      ) {
         
         int size = 
         ArraySize  ( bufferSrc ) + 1
         ;
         
         ArrayResize( bufferLong , size );
         ArrayResize( bufferShort, size );
         
      };
      
      /**
       */
      virtual void onBegin ( 
         double &bufferLong [], 
         double &bufferShort[], 
         double &bufferSrc  [], 
         int     rates_total, 
         int     prev_calculated
      ) {
      
         buffer(0).copy( bufferLong  );
         buffer(1).copy( bufferShort );
         
      };
      
      /**
       */
      virtual void onIterate (
         double &bufferLong [], 
         double &bufferShort[], 
         double &bufferSrc  [],
         int     iterator, 
         int     rates_total, 
         int     prev_calculated
      ) {
      
         
      };
      
      /**
       */
      virtual void onIterateCandleNotEnoughData ( 
         double  value, 
         double &bufferLong [], 
         double &bufferShort[], 
         double &bufferSrc  [], 
         int     candle
      ) {
      
         bufferLong [ candle ] = 0;
         bufferShort[ candle ] = 0;
         
      };
      
      /**
       */
      virtual void onIterateCandle (
         double  value, 
         double &bufferLong [], 
         double &bufferShort[], 
         double &bufferSrc  [], 
         int     candle
      ) {
         
        double v = ( ( value + formatDouble( bufferSrc[ candle - 1 ] ) ) / 2 );
         
         bufferLong [ candle ] = isLong ( bufferSrc, candle) ? v : 0;
         bufferShort[ candle ] = isShort( bufferSrc, candle) ? v : 0;
         
      };
      
      /**
       */
      virtual void onIterateFinished (
         double &bufferLong [], 
         double &bufferShort[], 
         double &bufferSrc  [], 
         int     rates_total, 
         int     prev_calculated
      ) {
         
      
      
      };
      
      /**
       */
      virtual void onFinished (
         double &bufferLong [], 
         double &bufferShort[], 
         double &bufferSrc  [], 
         int     rates_total, 
         int     prev_calculated
      ) {
      
         buffer(0).add( bufferLong  );
         buffer(1).add( bufferShort );
      
      };   
      
      /**
       */
      bool isShiftTrend ( double &buffer[], int i, double pivot ) 
      {
         if( i > shiftTotal ) 
         {
            for( int ii = 1; ii  <= shiftFront; ii++ ) {
               if( buffer[ i - ( shiftFront - ii ) ] < pivot ) {
                  return false;
               }                      
            }
            
            for( int ii = 1; ii  <= shiftBack; ii++ ) {
               if( buffer[ i - ( shiftFront + ii ) ] > pivot ) {
                  return false;
               }                      
            }
            
            return true;
         }
         
         return false;
      };

   public :
   
      /** 
       */
      BufferSignal( int back = 0, int front = 0, bool display = true )
         : Buffer( display )
         {
                     shift( back, front );
            _buffers.add  ( new Buffer( display ) );
            _internalBuffers = _internalBuffers + 1;
         }
      ;
            
      /** 
       */
      BufferSignal* shift( int back, int front ) 
      {
         shiftBack  = back;
         shiftFront = front;
         shiftTotal = back + front + 1;
         
         return GetPointer( this );
      };
      
      /** 
       */
      virtual void onCalculate ( double &bufferSrc[], int rates_total, int prev_calculated ) 
      {
         double bufferLong [];
         double bufferShort[];
         
         if( prev_calculated == 0 ) 
         {
            onInit( bufferLong, bufferShort, bufferSrc, rates_total, prev_calculated );
         } 
         else 
         {
            onBegin( bufferLong, bufferShort, bufferSrc, rates_total, prev_calculated );
         }
         
         for( int i = 1; i <= _iterationOnBuffer; i++ ) 
         {  
            for( int ii = prev_calculated; ii < rates_total; ii++ ) 
            {
               double value = formatDouble( bufferSrc[ ii ] );
               if( ii <= _candlesToPreload + 1 ) 
               {
                  onIterateCandleNotEnoughData( value, bufferLong, bufferShort, bufferSrc, ii );
                  continue;
               }              
               
               onIterateCandle( value, bufferLong, bufferShort, bufferSrc, ii );
            }
            onIterate( bufferLong, bufferShort, bufferSrc, i, rates_total, prev_calculated );
         }
         
         onIterateFinished( bufferLong, bufferShort, bufferSrc, rates_total, prev_calculated );
         
         for( int i = _internalBuffers, t = _buffers.length(); i < t; i++ ) {
            buffer( i ).onCalculate( bufferLong, bufferShort, bufferSrc, rates_total, prev_calculated );
         }                  
         
         onFinished( bufferLong, bufferShort, bufferSrc, rates_total, prev_calculated );
      };
      
      /** 
       */
      virtual bool isShort( double &buffer[], int candle ) 
      {
         return false;   
      };
      
      /** 
       */
      virtual bool isLong( double &buffer[], int candle ) 
      {
         return false;
      };
};