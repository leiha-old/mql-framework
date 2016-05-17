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
      MovingAverage( int period ) 
         :  Calculator(  ),
            _period         ( period ),
            _currentPeriod  ( period )
         {
            _shiftTotal = period;   
         }
         ;

/* --------------------
 * Methods
 * ----- 
 */  
      /**
       */
      MovingAverage* smooth( int period = 14 );
   
   protected :
      
      /** 
       */
      virtual void onIterateCandle        ( double &bufferSrc[], int candle, double value ); 
      
      /** 
       */
      virtual void onEachBeginIteration   ( double &bufferSrc[], int rates_total, int prev_calculated, int iteration );
      
      /** 
       */
      virtual void onEachEndIteration     ( double &bufferSrc[], int rates_total, int prev_calculated, int iteration );
      
      /** 
       */
      virtual void onFinished             ( double &bufferSrc[] );
      
      /** 
       */
      virtual int getIterationsNeeded     (  ) 
      { 
         return ArraySize( _smoothPeriods ) + Calculator::getIterationsNeeded(  );
      };
      

/* --------------------
 * Properties
 * ----- 
 */
   /**
    */
   int _smoothPeriods   [];
   
   /**
    */
   int _period;
   
   /**
    */
   int _currentPeriod;
      
// -----
// --------------------          
};

/** 
 */
void 
   MovingAverage::onFinished
      ( double &bufferSrc[] )
{
   _currentPeriod = _period;
};


/** 
 */
void 
  MovingAverage::onEachBeginIteration
   ( double &bufferSrc[], int rates_total, int prev_calculated, int iteration )
{
   if( iteration == 1 ) {
      _currentPeriod = _period;
   } else {
      _currentPeriod = _smoothPeriods[ iteration - 2 ];
   }
};

/** 
 */
void 
  MovingAverage::onEachEndIteration
   ( double &bufferSrc[], int rates_total, int prev_calculated, int iteration )
   {
      buffer(  ).copy( bufferSrc );
   };

/** 
 */
void 
   MovingAverage::onIterateCandle 
      ( double &bufferSrc[], int candle, double value ) 
{

   for( int ii = 1, t = _currentPeriod; ii < t; ii++ ) 
   {
      value += bufferSrc[ candle - ii ];
   }
   
   buffer().data[candle] = ( value / _currentPeriod );
   //buffer().data[candle] = iMAOnArray( bufferSrc, 0, _currentPeriod, 0, MODE_EMA, candle );
};

/** 
 */
MovingAverage*
   MovingAverage::smooth
      ( int period = 14 ) 
{ 
   int i = ArraySize( _smoothPeriods );
   int s = i + 1;
   
   ArrayResize( _smoothPeriods, s );
   
   _smoothPeriods [ i ] = period;
   
   if( _shiftTotal < period ) {
      _shiftTotal = period;
   }
   
   return pointer(this);
};