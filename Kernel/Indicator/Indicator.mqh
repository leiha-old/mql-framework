// ------------------------------------------------
#property copyright "Copyright 2015, Leiha Sellier"
#property link      "https://github.com/leiha"
#property version   "1.00"

#include "../Calculator/Calculator.mqh"

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
      virtual int onCalculate ( int rates_total, int prev_calculated );
      
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
   double buffer[];
   if( prev_calculated > 0 ) {
      start = prev_calculated - 1;
      //copy( buffer );
   }
   
   if( CopyBuffer( handle(), 0, start, to_copy, buffer ) <= 0 ) {
      return rates_total; 
   }

   //onCalculate ( buffer, rates_total, prev_calculated );
   return rates_total;
};