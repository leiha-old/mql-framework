// ------------------------------------------------
#property copyright "Copyright 2015, Leiha Sellier"
#property link      "https://github.com/leiha"
#property version   "1.00"

#include "../Calculator/Calculator.mqh"
#include "../MovingAverage/MovingAverage.mqh"
#include "../Signal/SignalZone.mqh"
#include "../Signal/SignalCrossing.mqh"
#include "../Signal/SignalTrend.mqh"

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
      MovingAverage* ma ( int period, int smooth = 0 );
      
      /** 
       */
      SignalZone* sz ( double bought, double sold );
      
      /** 
       */
      SignalTrend* st ( Calculator* calculator = NULL );
      
      /** 
       */
      SignalCrossing* sc ( Calculator* calculator, Calculator* calculator2 = NULL );
      
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
      
      /**
       */
      void onCalculate( int start, int end, double &bufferSrc[], int rates_total, int prev_calculated );
      
      /**
       */
      int barsCalulated();
      
/* --------------------
 * Properties
 * ----- 
 */     
     int _handle;
     
// -----
// --------------------     
};

#include "./Indicator.inc.mqh"

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
int 
   Indicator::barsCalulated
      (  )
{
   return BarsCalculated( handle() );
};   

/* 
 * ------
 */
void 
   Indicator::onCalculate
      ( int start, int end, double &bufferSrc[], int rates_total, int prev_calculated ) 
{
   int to_copy = rates_total;
   if( prev_calculated < rates_total || prev_calculated >= 0 ) {
      to_copy = rates_total - prev_calculated;
      if( prev_calculated > 0 ) { 
         to_copy++;
      }
   }

   double b[];
   if( CopyBuffer( this.handle(), 0, 0, to_copy, b ) <= 0 ) {
      return; 
   }
   
   this.buffer().copy( bufferSrc );
   
   int ii = start;
   for( int i = 0; i < end; i++ ) {
      bufferSrc[ii++] = b[i];
   }
};      