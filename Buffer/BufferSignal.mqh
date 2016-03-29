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
      bool isShiftTrend ( Buffer* buffer, int i, double pivot ) 
      {
         if( i > shiftTotal ) 
         {
            for( int ii = 1; ii  <= shiftFront; ii++ ) {
               if( buffer.get( i - ( shiftFront - ii ) ) < pivot ) {
                  return false;
               }                      
            }
            
            for( int ii = 1; ii  <= shiftBack; ii++ ) {
               if( buffer.get( i - ( shiftFront + ii ) ) > pivot ) {
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
            _buffers.add(new Buffer(display));            
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
      virtual bool isShort( Buffer* buffer, int i ) 
      {
         return false;   
      };
      
      /** 
       */
      virtual bool isLong( Buffer* buffer, int i ) 
      {
         return false;
      };
      
      /** 
       */
      virtual void onCalculateCandle ( Buffer* parentBuffer, int candle ) 
      {
         if( isLong( parentBuffer, candle ) ) {
            add( candle, (parentBuffer.get( candle - 1 ) + parentBuffer.get( candle )) / 2 );
         } 
         else if( isShort(parentBuffer, candle ) ) {
            buffer(1).add( candle, (parentBuffer.get( candle - 1 ) + parentBuffer.get( candle )) / 2 );
         }
      };      
};