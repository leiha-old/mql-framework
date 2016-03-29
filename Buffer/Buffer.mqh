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
      Buffer( bool display = true ) 
         :  _slot  ( TOTAL_BUFFERS++ ), 
           _display( display ), 
           _type   ( display == true ? INDICATOR_DATA : INDICATOR_CALCULATIONS )
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
      virtual void onCalculate ( double &buffer[], int rates_total, int prev_calculated ) 
      {
         for(int i = prev_calculated, _i = 0 ; i < rates_total ; i++) {
            onCalculateCandle( i, buffer[_i++] );
         }
      };
      
      /** 
       */
      virtual int onCalculate ( int rates_total, int prev_calculated ) 
      {
         onCalculateFirst( rates_total, prev_calculated );
         for( int i = 1, t = _buffers.length(); i < t; i++ ) {
            //buffer(i).onCalculateFirst ( rates_total, prev_calculated );
            buffer(i).onCalculateSecond( pointer(this), rates_total, prev_calculated );
         }
         return rates_total;
      };
      
      /** 
       */
      virtual void onCalculateFirst ( int rates_total, int prev_calculated ) 
      {
         
      };
      
      /** 
       */
      virtual void onCalculateSecond ( Buffer* parentBuffer, int rates_total, int prev_calculated ) 
      {         
         for(int i = prev_calculated; i < parentBuffer.length() ; i++) {
            onCalculateCandle(parentBuffer, i);
         }         
      };
      
      /** 
       */
      virtual void onCalculateCandle ( Buffer* parentBuffer, int candle ) 
      {
         onCalculateCandle( candle, parentBuffer.get( candle ) );
      };
      
      /** 
       */
      virtual void onCalculateCandle ( int candle, double value ) 
      {
         add( candle, value > 0 ? value : 0 );
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