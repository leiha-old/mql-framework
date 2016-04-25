// ------------------------------------------------
#property copyright "Copyright 2015, Leiha Sellier"
#property link      "https://github.com/leiha"
#property version   "1.00"

#include "../Calculator/Calculator.mqh"
#include "../MovingAverage/MovingAverage.mqh"
#include "../Signal/SignalZone.mqh"

class Indicator : public Calculator
{  
   public : 

/* --------------------
 * Constructors
 * ----- 
 */          
      /** 
       */
      Indicator(  ) 
         : Calculator(  )
         {}
         ;

/* --------------------
 * Methods
 * ----- 
 */         
      /**
       */
      Indicator* minimum( double value );
      
      /**
       */
      Indicator* maximum( double value );
      
      /**
       */
      Indicator* shortName( string name );
      
      /**
       */
      Indicator* digits( int digits );
      
      /**
       */
      Indicator* handle( int handle );
      
      /** 
       */
      virtual int onCalculate ( int rates_total, int prev_calculated );
      
      /** 
       */
      MovingAverage* ma ( int period );
      
      /** 
       */
      SignalZone* sz ( double bought, double sold ) ;
      
   protected :
      
      /** 
       */
      int handle (  );
   
      /** 
       */
      Indicator* setString( ENUM_CUSTOMIND_PROPERTY_STRING property, string value );
      
      /** 
       */
      Indicator* setInteger( ENUM_CUSTOMIND_PROPERTY_INTEGER property, int value );
      
      /** 
       */
      Indicator* setDouble( ENUM_CUSTOMIND_PROPERTY_DOUBLE property, double value );
      
/* --------------------
 * Properties
 * ----- 
 */     
     int _handle;
     
// -----
// --------------------     
};

/* 
 * ------
 */
int 
   Indicator::handle 
      (  ) 
{
   return _handle;
};

/* 
 * ------
 */
Indicator*
   Indicator::handle 
      ( int handle ) 
{
   _handle = handle;
   return pointer( this );
};

/* 
 * ------
 */
MovingAverage* 
   Indicator::ma
      ( int period ) 
{
   MovingAverage* m = new MovingAverage(  );
   m.period( period );

   _calculators.add( m );

   return m;
};

/* 
 * ------
 */
SignalZone* 
   Indicator::sz
      ( double bought, double sold ) 
{
   SignalZone* s = new SignalZone(  );
   
   s.overZone( bought, sold );

   _calculators.add( s );

   return s;
};

/* 
 * ------
 */
Indicator* 
   Indicator::minimum
      ( double value ) 
{
   return this.setDouble( INDICATOR_MINIMUM, value );
};

/* 
 * ------
 */
Indicator* 
   Indicator::maximum
      ( double value ) 
{
   return this.setDouble( INDICATOR_MAXIMUM, value );
};

/* 
 * ------
 */
Indicator* 
   Indicator::shortName
      ( string name ) 
{
   return this.setString( INDICATOR_SHORTNAME, name );
};

/* 
 * ------
 */
Indicator* 
   Indicator::digits
      ( int digits ) 
{
   return this.setInteger( INDICATOR_DIGITS, digits );
};

/* 
 * ------
 */
Indicator* 
   Indicator::setString
      ( ENUM_CUSTOMIND_PROPERTY_STRING property, string value ) 
{
   IndicatorSetString( property, value );
   return pointer( this );
};

/* 
 * ------
 */
Indicator* 
   Indicator::setInteger
      ( ENUM_CUSTOMIND_PROPERTY_INTEGER property, int value ) 
{
   IndicatorSetInteger( property, value );  
   return pointer( this );
};

/* 
 * ------
 */
Indicator* 
   Indicator::setDouble
      ( ENUM_CUSTOMIND_PROPERTY_DOUBLE property, double value ) 
{
   IndicatorSetDouble( property, value );  
   return pointer( this );
};

/* 
 * ------
 */
int 
   Indicator::onCalculate 
      ( int rates_total, int prev_calculated ) 
{
   if(IsStopped()) {
      return rates_total;
   }
   
   int calculated = BarsCalculated( handle() );
   if( calculated < rates_total ) {
      //int error = GetLastError();
      return rates_total;
   }
   
   int to_copy = rates_total;
   if( prev_calculated < rates_total || prev_calculated >= 0 ) {
      to_copy = rates_total - prev_calculated;
      if( prev_calculated > 0 ) { 
         to_copy++;
      }
   }
   
   int    start = 0;
   double bufferSrc[];
   if( prev_calculated > 0 ) {
      start = prev_calculated - 1;
      buffer().copy( bufferSrc );
   }
   
   if( CopyBuffer( handle(), 0, start, to_copy, bufferSrc ) <= 0 ) {
      return rates_total; 
   }

   onCalculate ( bufferSrc, rates_total, prev_calculated );
   return rates_total;
};