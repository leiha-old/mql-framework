// ------------------------------------------------
#property copyright "Copyright 2015, Leiha Sellier"
#property link      "https://github.com/leiha"
#property version   "1.00"

#include "./Signal.mqh"

class SignalCrossing : public Signal
{
   public :   

/* --------------------
 * Constructors
 * ----- 
 */   
      /** 
       */
      SignalCrossing
         (   )
         : Signal(  )
         {}
      ;

/* --------------------
 * Methods
 * ----- 
 */   
      /**
       */
      int add( Calculator* calculator, int bufferIndex = 0 );
      
      /** 
       */
      virtual bool isShort( double &bufferSrc[], int candle );
      
      /** 
       */
      virtual bool isLong ( double &bufferSrc[], int candle );
   
   protected :
      
/* --------------------
 * Properties
 * ----- 
 */
      /**
       */
      virtual void onIterateCandle( double &bufferSrc[], int candle, double value ) ;
      
// -----
// --------------------    
};

/** 
 */
void 
   SignalCrossing::onIterateCandle 
      ( double &bufferSrc[], int candle, double value ) 
{
   double v = 
    ( ( buffer( 2 ).value( candle - 1 ) + buffer( 2 ).value( candle ) ) /  2 )
    
    ;
   
   buffer(0).add( candle, ( isLong ( bufferSrc, candle) ? v : 0 ) );
   buffer(1).add( candle, ( isShort( bufferSrc, candle) ? v : 0 ) );   
};

/**
 */
int 
   SignalCrossing::add
      ( Calculator* calculator, int bufferIndex = 0 )
{
   _buffers.add( calculator.buffer( bufferIndex ) );
   return 0;
};
     

/** 
 */
bool 
   SignalCrossing::isLong
      ( double &bufferSrc[], int candle )
{
   if(   buffer( 2 ).value( candle     ) >  buffer( 3 ).value( candle     )
      && buffer( 2 ).value( candle - 1 ) <= buffer( 3 ).value( candle - 1 )
   ) {
      return true;
   }         
   return false;
};

/** 
 */
bool 
   SignalCrossing::isShort
      ( double &bufferSrc[], int candle )
{
   if(   buffer( 2 ).value( candle     ) <  buffer( 3 ).value( candle     )
      && buffer( 2 ).value( candle - 1 ) >= buffer( 3 ).value( candle - 1 )
   ) {
      return true;
   }         
   return false;
};