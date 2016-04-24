// ------------------------------------------------
#property copyright "Copyright 2015, Leiha Sellier"
#property link      "https://github.com/leiha"
#property version   "1.00"

#include "./Signal.mqh"

class SignalZone : public Signal
{
   public :   

/* --------------------
 * Constructors
 * ----- 
 */   
      /** 
       */
      SignalZone(  )
         : Signal(  )
         {}
      ;

/* --------------------
 * Methods
 * ----- 
 */  
      /** 
       */
      SignalZone* overZone( double bought, double sold );
   
   protected :
      
/* --------------------
 * Properties
 * ----- 
 */
    
      
// -----
// --------------------    
};

/** 
 */
SignalZone* 
   SignalZone::overZone( double bought, double sold ) 
{
   return pointer(this);
};