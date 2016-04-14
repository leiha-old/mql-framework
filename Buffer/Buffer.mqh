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
      
   public :
   
      int static TOTAL_BUFFERS;
      
      /** 
       *//*
      Buffer(ENUM_INDEXBUFFER_TYPE bufferType = INDICATOR_DATA) 
         : _slot((TOTAL_BUFFERS++)), _type(bufferType)
      {      
         SetIndexBuffer(slot(), _items, bufferType);
      };*/
      
      /** 
       */
      Buffer( int iterationOnBuffer = 1, int candlesToPreload = 1, bool display = true ) 
         :  _slot             ( TOTAL_BUFFERS++ ), 
           _display           ( display ), 
           _type              ( display == true ? INDICATOR_DATA : INDICATOR_CALCULATIONS ),
           _candlesToPreload  ( candlesToPreload ),
           _iterationOnBuffer ( iterationOnBuffer )
         {
            _buffers.add(pointer(this));
            SetIndexBuffer(slot(), _items, _type);
         }
         ;
      
      /** 
       */
      virtual void onInit () {};
      
      /** 
       */
      virtual int onCalculate ( int rates_total, int prev_calculated ) 
      {
         double b[];
         onCalculate ( b, rates_total, prev_calculated );
      
         for( int i = 1, t = _buffers.length(); i < t; i++ ) {
            buffer(i).onCalculate( b, rates_total, prev_calculated );
         }
         return rates_total;
      };
      
      double formatDouble (double value) 
      {
         return NormalizeDouble(value, 15);
      };
      
      /** 
       */
      virtual void onCalculate ( double &buffer[], int rates_total, int prev_calculated ) 
      {
         double b[];
         if(prev_calculated > 0){
            copy(b);
         } else {
            ArrayResize( b, ArraySize( buffer ) + 1 );
         }         
         
         for( int i = 1; i <= _iterationOnBuffer; i++ ) 
         {  
            int iii = 0;
            for( int ii = prev_calculated; ii < rates_total; ii++ ) 
            {
               if( ii <= _candlesToPreload + 1 ) {
                  continue;
               }
               
               double value = onCalculate( buffer, ii, buffer[iii] );
               if(value != NULL) {
                  b[ii] = value;
               }
               
               iii++;
            }
            
            ArrayCopy( buffer, b );
         }
         add( buffer );
      };
      
      /** 
       */
      virtual double onCalculate ( double &buffer[], int candle, double value ) 
      {
         return value;
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