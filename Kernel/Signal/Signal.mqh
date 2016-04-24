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
      virtual bool isShiftTrend( double &buffer[], int candle, double pivot ) ;
     
// -----
// --------------------     
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