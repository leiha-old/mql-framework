// ------------------------------------------------
#property copyright "Copyright 2015, Leiha Sellier"
#property link      "https://github.com/leiha"
#property version   "1.00"

#include "../Calculator/Calculator.mqh"

class MovingAverage : public Calculator
{
   public : 

/* --------------------
 * Constructors
 * ----- 
 */           
      /** 
       */
      MovingAverage(  ) 
         :  Calculator(  )
         {
            
         }
         ;

/* --------------------
 * Methods
 * ----- 
 */  
      /**
       */
      int period(  );
      
      /**
       */
      MovingAverage* period( int shift );
      
      /**
       */
      MovingAverage* smooth( int level = 1 );
   
   protected :
      
      /** 
       */
      virtual void MovingAverage::onIterateCandle ( double &bufferSrc[], int candle, double value ); 
      

/* --------------------
 * Properties
 * ----- 
 */
   /**
    */
   int _smooth;
   
   /**
    */
   int _period;
      
// -----
// --------------------          
};

/** 
 */
void 
   MovingAverage::onIterateCandle 
      ( double &bufferSrc[], int candle, double value ) 
{
   int period = this.period();
   for( int ii = 1; ii < period; ii++ ) 
   {
      value += this.formatValue( bufferSrc[ candle - ii ] );
   }
   
   bufferSrc[ candle ] = ( value / period );
};

/** 
 */
MovingAverage*
   MovingAverage::smooth
      ( int level = 1 ) 
{ 
   _smooth = level;
   
   return pointer(this);
};

/**
 */
int 
   MovingAverage::period
      (  ) 
{
   return _period;
};

/**
 */
MovingAverage*
   MovingAverage::period
      ( int shift ) 
{
   _period = shift;
   return pointer( this );
};