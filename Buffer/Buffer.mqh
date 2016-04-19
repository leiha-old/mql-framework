// ------------------------------------------------
#property copyright "Copyright 2015, Leiha Sellier"
#property link      "https://github.com/leiha"
#property version   "1.00"

class Buffer : public Array 
{  
   protected :
      
      Map                   _buffers;
      int                   _slot;
      ENUM_INDEXBUFFER_TYPE _type;
      bool                  _display;
      Plot*                 _plot;
      int                   _candlesToPreload;
      int                   _iterationOnBuffer;
      int                   _internalBuffers;
      
      /**
       */
      virtual void onInit ( 
         double &buffer   [], 
         double &bufferSrc[], 
         int     rates_total, 
         int     prev_calculated
      ) {
      
         ArrayResize( buffer, ArraySize( bufferSrc ) + 1 );
         
      };
      
      /**
       */
      virtual void onBegin ( 
         double &buffer   [], 
         double &bufferSrc[], 
         int     rates_total, 
         int     prev_calculated
      ) {
      
         copy( buffer );
         
      };
      
      /**
       */
      virtual void onIterateCandleNotEnoughData ( 
         double  value, 
         double &buffer   [], 
         double &bufferSrc[], 
         int     candle 
      ) {
      
         buffer[ candle ] = value;
         
      };
      
      /**
       */
      virtual void onIterateCandle ( 
         double  value, 
         double &buffer   [], 
         double &bufferSrc[], 
         int     candle 
      ) {
      
         buffer[ candle ] = value;
         
      };
      
      /**
       */
      virtual void onIterate (
         double &buffer   [], 
         double &bufferSrc[], 
         int     iterator, 
         int     rates_total, 
         int     prev_calculated
      ) {
      
      };
      
      /**
       */
      virtual void onIterateFinished ( 
         double &buffer   [], 
         double &bufferSrc[], 
         int     rates_total, 
         int     prev_calculated
      ) {
         
      };
      
      /**
       */
      virtual void onFinished ( 
         double &buffer   [], 
         double &bufferSrc[], 
         int     rates_total, 
         int     prev_calculated
      ) {
      
         add( buffer );
                           
      };
      
      /** 
       */
      double formatDouble (double value) 
      {
         return NormalizeDouble(value, 15);
      };
      
   public :
   
      int static TOTAL_BUFFERS;
      
      /** 
       */
      Buffer( int iterationOnBuffer = 1, int candlesToPreload = 1, bool display = true ) 
         : _slot              ( TOTAL_BUFFERS++ ), 
           _display           ( display ), 
           _type              ( display == true ? INDICATOR_DATA : INDICATOR_CALCULATIONS ),
           _candlesToPreload  ( candlesToPreload ),
           _iterationOnBuffer ( iterationOnBuffer )
         {
            _buffers.add(pointer(this));
            SetIndexBuffer(slot(), _items, _type);
           _internalBuffers = 1;
         }
         ;
      
      /** 
       */
      virtual void onCalculate ( 
         double &bufferLong [], 
         double &bufferShort[], 
         double &bufferSrc  [], 
         int     rates_total, 
         int     prev_calculated
      ) {}
      
      /** 
       */
      virtual void onInit () {};
      
      /** 
       */
      virtual void onCalculate ( double &bufferSrc[], int rates_total, int prev_calculated ) 
      {
         double buffer[];
         double bufferSrcCopy[];
         ArrayCopy( bufferSrcCopy, bufferSrc );
         
         if( prev_calculated == 0 ) 
         {
            onInit( buffer, bufferSrc, rates_total, prev_calculated );
         } 
         else 
         {
            onBegin( buffer, bufferSrc, rates_total, prev_calculated );
         }
         
         for( int i = 1; i <= _iterationOnBuffer; i++ ) 
         {  
            for( int ii = prev_calculated; ii < rates_total; ii++ ) 
            {
               double value = formatDouble( bufferSrcCopy[ ii ] );
               if( ii <= _candlesToPreload + 1 ) 
               {
                  onIterateCandleNotEnoughData( value, buffer, bufferSrcCopy, ii );
                  continue;
               }              
               
               onIterateCandle( value, buffer, bufferSrcCopy, ii );
            }
            onIterate( buffer, bufferSrcCopy, i, rates_total, prev_calculated );
         }
         
         onIterateFinished( buffer, bufferSrc, rates_total, prev_calculated );
         
         for( int i = _internalBuffers, t = _buffers.length(); i < t; i++ ) {
            buffer( i ).onCalculate( buffer, rates_total, prev_calculated );
         }                  
         
         onFinished( buffer, bufferSrc, rates_total, prev_calculated );
      };
      
      /** 
       */
      virtual Buffer* buffer(  ) 
      {
         return _buffers.get( 0 );
      };     
      
      /** 
       */
      Buffer* buffer( int i ) 
      {
         return _buffers.get( i );
      };      
      
      /** 
       */
      Buffer* buffer( Buffer * buffer ) 
      {
         _buffers.add( buffer);
         return pointer(this);
      };
      
      /** 
       */
      Buffer* buffer( Buffer * buffer, bool chain ) 
      {
         return _buffers.add( buffer, chain );
      };
      
      /** 
       */
      int slot() {
         return _slot;
      };
      
      /** 
       */
      Plot* plot(int i) {
         return buffer(i).plot();
      };
      
      /** 
       */
      Plot* plot() {
         if(_plot == NULL) {
            _plot = new Plot(slot());
         }
         return _plot;
      };
};
int Buffer::TOTAL_BUFFERS = 0;