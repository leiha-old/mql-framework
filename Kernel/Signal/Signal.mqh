// ------------------------------------------------
#property copyright "Copyright 2015, Leiha Sellier"
#property link      "https://github.com/leiha"
#property version   "1.00"

#include "../Calculator/Calculator.mqh"

class Signal : public Calculator
{
   public :   

/* --------------------
 * Constructors
 * ----- 
 */   
      /** 
       */
      Signal(  )
         : Calculator(  )
         {
           _buffers.add( new Buffer() );
         }
         ;
         
      /** 
       */
      virtual bool isLong ( int candle );
      
      /** 
       */
      virtual bool isShort( int candle );    

/* --------------------
 * Methods
 * ----- 
 */ 
      
   protected :

/* --------------------
 * Properties
 * ----- 
 */
      /** 
       */
      virtual bool isLong ( double &buffer[], int candle );
      
      /** 
       */
      virtual bool isShort( double &buffer[], int candle );
      
      /**
       */
      virtual bool isShiftTrend( double &buffer[], int candle, double pivot );
      
      virtual void onIterateCandle( double &bufferSrc[], int candle, double value ) ;
     
// -----
// --------------------     
};

/** 
 */
void 
   Signal::onIterateCandle 
      ( double &bufferSrc[], int candle, double value ) 
{
   double v = ( ( value + NormalizeDouble( bufferSrc[ candle - 1 ], 20 ) ) / 2 );
   buffer(0).add( candle, ( isLong ( bufferSrc, candle) ? v : 0 ) );
   buffer(1).add( candle, ( isShort( bufferSrc, candle) ? v : 0 ) );
   
};

/** 
 */
bool 
   Signal::isLong
      ( int candle )
{
   return false;
};

/** 
 */
bool 
   Signal::isShort
      ( int candle )
{
   return false;
};

/** 
 */
bool 
   Signal::isLong
      ( double &buffer[], int candle )
{
   return false;
};

/** 
 */
bool 
   Signal::isShort
      ( double &buffer[], int candle )
{
   return false;
};

/**
 */
bool 
   Signal::isShiftTrend
      ( double &buffer[], int i, double pivot ) 
{
   for( int ii = 1; ii  <= _shiftFront; ii++ ) 
   {
      if( buffer[ i + ii ] < pivot ) {
         return false;
      }                      
   }
   
   for( int ii = 1; ii  <= _shiftBack; ii++ ) 
   {
      if( buffer[ i - ii ] > pivot ) {
         return false;
      }                      
   }
   
   return true;
};