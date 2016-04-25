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
      
      /** 
       */
      virtual bool isShort( double &buffer[], int candle );
      
      /** 
       */
      virtual bool isLong( double &buffer[], int candle );
   
   protected :
      
/* --------------------
 * Properties
 * ----- 
 */
    
    double _overbought, _oversold;
      
// -----
// --------------------    
};

/** 
 */
SignalZone* 
   SignalZone::overZone( double bought, double sold ) 
{
   _overbought = bought;
   _oversold   = sold;
   return pointer(this);
};

/** 
 */
bool 
   SignalZone::isShort
      ( double &buffer[], int candle ) 
{
   if(   buffer[ candle ]     <  _overbought  
      && buffer[ candle - 1 ] >= _overbought
   ) {
      for( int ii = 1; ii  <= _shiftBack; ii++ ) 
      {
         if( buffer[ candle - ii ] < _overbought ) 
         {
            return false;
         }                      
      }
      
      for( int ii = 1; ii  <= _shiftFront; ii++ ) 
      {
         if( buffer[ candle + ii ] > _overbought ) 
         {
            return false;
         }                      
      }
      
      return true;
   }         
   return false;
};

/** 
 */
bool 
   SignalZone::isLong
      ( double &buffer[], int candle ) 
{
   if(   buffer[ candle ]     >= _oversold 
      && buffer[ candle - 1 ] <  _oversold
   ) {
      for( int ii = 1; ii  <= _shiftBack; ii++ ) 
      {
         if( buffer[ candle - ii ] > _oversold ) 
         {
            return false;
         }                      
      }
      
      for( int ii = 1; ii  <= _shiftFront; ii++ ) 
      {
         if( buffer[ candle + ii ] < _oversold ) 
         {
            return false;
         }                      
      }
      return true;
   }         
   return false;
};