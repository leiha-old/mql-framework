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
      Indicator* setString( ENUM_CUSTOMIND_PROPERTY_STRING property, string value );
      
      /** 
       */
      Indicator* setInteger( ENUM_CUSTOMIND_PROPERTY_INTEGER property, int value );
      
      /** 
       */
      Indicator* setDouble( ENUM_CUSTOMIND_PROPERTY_DOUBLE property, double value );
      
      /**
       */
      virtual void onCalculate( int start, int end, double &bufferSrc[], int rates_total, int prev_calculated ){};
      
      /**
       */
      int barsCalulated();
      
/* --------------------
 * Properties
 * ----- 
 */     
     
// -----
// --------------------     
};

#include "./Indicator.inc.mqh"

/* 
 * ------
 */
int 
   Indicator::barsCalulated
      (  )
{
   return IndicatorCounted( );
};     