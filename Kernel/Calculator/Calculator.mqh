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
      virtual int getCandlesToPreload            (  ) { return 1; };
            
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
      virtual void onIterateCandleNotEnoughData  ( double &bufferSrc[], int candle, double value ){};
      
      /** 
       */
      virtual void onIterateCandle               ( double &bufferSrc[], int candle, double value ){};
      
      /** 
       */
      virtual void onFinished                    ( double &bufferSrc[] ){};
      
      /** 
       */
      void onCalculate                           ( double &bufferSrc[], int rates_total, int prev_calculated );
      
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
      virtual Calculator* shift( int back, int front );
   
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
   if( candle <= this.getCandlesToPreload() ) 
   {
      this.onIterateCandleNotEnoughData( bufferSrc, candle, value );
   } 
   else 
   {
      this.onIterateCandle( bufferSrc, candle, value );
   }
};