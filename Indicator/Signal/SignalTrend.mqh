// ------------------------------------------------
#property copyright "Copyright 2015, Leiha Sellier"
#property link      "https://github.com/leiha"
#property version   "1.00"

#include "./Signal.mqh"

class SignalTrend : public Signal
{
   public :   

/* --------------------
 * Constructors
 * ----- 
 */   
      /** 
       */
      SignalTrend(  )
         : Signal(  )
         {}
      ;

/* --------------------
 * Methods
 * ----- 
 */  
   
   protected :
   
      /** 
       */
      virtual bool isLong         ( double &buffer[], int candle );
      
      /** 
       */
      virtual bool isShort        ( double &buffer[], int candle );
      
/* --------------------
 * Properties
 * ----- 
 */
    
      
// -----
// --------------------    
};

/** 
 */
bool 
   SignalTrend::isLong
      ( double &buffer[], int candle )
{
   double pivot = buffer[ candle ];
   
   if( pivot  > buffer[ candle - 1 ]
      //&& isShiftTrend( buffer, candle, pivot )
    ) {      
      
      return true;
    }
    return false;
};

/** 
 */
bool 
   SignalTrend::isShort
      ( double &buffer[], int candle )
{
   double pivot = buffer[ candle ];
   
   if( pivot  < buffer[ candle - 1 ]
      //&& isShiftTrend( buffer, candle, pivot )
    ) {
    
      return true;
    }
    return false;
};