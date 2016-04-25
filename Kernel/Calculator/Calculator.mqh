// ------------------------------------------------
#property copyright "Copyright 2015, Leiha Sellier"
#property link      "https://github.com/leiha"
#property version   "1.00"

#include "../Core/Object.mqh"
#include "../Buffer/Buffer.mqh"

class Calculator : public Object
{
   public :

/* --------------------
 * Constructors
 * ----- 
 */     
      /** 
       */
      Calculator(  )
         : Object(  )
         {
            _buffers     = new Buffer(); 
            _calculators = new Map();
         }
      ;

/* --------------------
 * Methods
 * ----- 
 */     
      /** 
       */
      virtual int getIterationsNeeded            (  ) { return 1; };
      
      /** 
       */
      int preloadCandles                         (  ) { return _shiftTotal; };
      
      /** 
       */
      Calculator* preloadCandles                 ( int candles ) 
      {       
         _shiftBack  = candles; 
         _shiftTotal = _shiftBack + _shiftFront;
         return pointer( this );
      };
            
      /** 
       */
      template < typename T >
      T formatValue                              ( T value ) { return value; };
      
      /** 
       */
      virtual void onBeginFirstOnly              ( double &bufferSrc[] ){};
      
      /** 
       */
      virtual void onBeginFirstExcluded          ( double &bufferSrc[] ){};
      
      /** 
       */
      virtual void onBegin                       ( double &bufferSrc[] ){};
      
      /** 
       */
      virtual void onIterateCandleNotEnoughData  ( double &bufferSrc[], int candle, double value );
      
      /** 
       */
      virtual void onIterateCandle               ( double &bufferSrc[], int candle, double value );
      
      /** 
       */
      virtual void onFinished                    ( double &bufferSrc[] ){};
      
      /** 
       */
      void onCalculate                           ( double &bufferSrc[], int rates_total, int prev_calculated );
      
      /** 
       */
      virtual void onCalculate                   ( Buffer* buffer, int rates_total, int prev_calculated );
      
      /** 
       */
      void onIterate                             ( double &bufferSrc[], int rates_total, int prev_calculated, int candle );
      
      /** 
       * Get Calculator by index
       */
      virtual Calculator* get( int i );
      
      /** 
       * Get first Calculator 
       * The Calculator is created if not already present
       */
      virtual Calculator* get(  );   
      
      /** 
       * Get Buffer by index
       */
      virtual Buffer* buffer( int index );
      
      /** 
       * Get first Buffer 
       * The Buffer is created if not already present
       */
      virtual Buffer* buffer(  ); 
      
      /** 
       */
      Plot* plot( int i );
      
      /** 
       */
      Calculator* plot( int i, int c0lor, ENUM_DRAW_TYPE type = DRAW_LINE, ENUM_LINE_STYLE style = STYLE_SOLID );
      
      /** 
       */
      Plot* plot(  );
      
      /** 
       */
      virtual Calculator* shift( int back, int front );
      
      /**
       */
      virtual Calculator* end();
   
   protected :
   
      /**
       * Create a new Calculator 
       */
      virtual Calculator* create(  );
 
/* --------------------
 * Properties
 * ----- 
 */
   /**
    * Container of Buffers needed for the calculator
    */
   Buffer* _buffers;
   
   /**
    * Container of Calculators Children who need this Calculator on slave
    */
   Map*    _calculators;
   
   /**
    */
   int     _shiftBack;
   
   /**
    */
   int     _shiftFront;
   
   /**
    */
   int     _shiftTotal;

// -----
// -------------------- 
};

/*
 * ------
 */
void 
   Calculator::onIterateCandleNotEnoughData  
      ( double &bufferSrc[], int candle, double value )
{
   buffer().add( candle, bufferSrc[candle] );
};

/*
 * ------
 */
void 
    Calculator::onIterateCandle
      ( double &bufferSrc[], int candle, double value )
{
   buffer().add( candle, bufferSrc[candle] );
};

/*
 * ------
 */
Calculator* 
   Calculator::create
      (  ) 
{
   return new Calculator();
};

/* 
 * ------
 */
Calculator* 
   Calculator::end
      (  )
{
   return Object::end(  );
};

/* 
 * ------
 */
Calculator* 
   Calculator::get
      ( int i ) 
{
   return _calculators.get( i );
};

/* 
 * ------
 */
Calculator* 
   Calculator::get
      (  ) 
{
   if( _calculators.length() == 0 ) 
   {
      _calculators.add( pointer( this ) );
   }
   
   return _calculators.get( 0 );
}; 

/* 
 * ------
 */
Buffer* 
   Calculator::buffer
      ( int i ) 
{
   return _buffers.get( i );
};

/* 
 * ------
 */
Buffer* 
   Calculator::buffer
      (  ) 
{
   return _buffers.get();
};

/* 
 * ------
 */
Plot* 
   Calculator::plot
      ( int i ) 
{
   return buffer( i ).plot(  );
};

/* 
 * ------
 */
Plot* 
   Calculator::plot
      (  ) 
{
   return buffer(  ).plot(  );
};

 /** 
  */
Calculator* 
   Calculator::plot
      ( int i, int c0lor, ENUM_DRAW_TYPE type = DRAW_LINE, ENUM_LINE_STYLE style = STYLE_SOLID )
{
   this.plot( i )
      .c0lor( c0lor ) 
      .type ( type  )
      .style( style )
      ;
      
   return pointer( this );   
};

/* 
 * ------
 */
Calculator* 
   Calculator::shift
      ( int back, int front ) 
{
   _shiftBack  = back;
   _shiftFront = front;
   _shiftTotal = back + front + 1;
   
   return pointer( this );
};

/* 
 * ------
 */
void 
   Calculator::onCalculate 
      ( Buffer* buffer, int rates_total, int prev_calculated )
{
   double b[];
   buffer.copy( b );
   this.onCalculate( b, rates_total, prev_calculated );
};

/* 
 * ------
 */
void 
   Calculator::onCalculate 
      ( double &bufferSrc[], int rates_total, int prev_calculated ) 
{
   if( prev_calculated == 0 ) 
   {
      this.onBeginFirstOnly    ( bufferSrc );
   } 
   else 
   {
      this.onBeginFirstExcluded( bufferSrc );
   }
   
   this.onBegin( bufferSrc );
   
   for( int i = 1; i <= this.getIterationsNeeded(); i++ ) 
   {  
      for( int candle = prev_calculated; candle < rates_total; candle++ ) 
      {
         this.onIterate( bufferSrc, rates_total, prev_calculated, candle );
      }      
   }
   
   for( int i = 0, t = _calculators.length(); i < t; i++ ) 
   {
      this.get( i )
         .onCalculate( this.buffer(), rates_total, prev_calculated )
         ;
   }
   
   this.onFinished( bufferSrc );
};

/* 
 * ------
 */
void 
   Calculator::onIterate 
      ( double &bufferSrc[], int rates_total, int prev_calculated, int candle )
{
   double value = this.formatValue( bufferSrc[ candle ] );
   if( candle <= this.preloadCandles() ) 
   {
      this.onIterateCandleNotEnoughData( bufferSrc, candle, value );
   } 
   else 
   {
      this.onIterateCandle( bufferSrc, candle, value );
   }
};