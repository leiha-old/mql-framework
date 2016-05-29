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
      MovingAverage* ma ( int period, int smooth = 0, Calculator* calculator = NULL );
      
      /** 
       */
      SignalZone* sz ( double bought, double sold, Calculator* calculator = NULL );
      
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
      virtual void onCalculate( int start, int end, double &bufferSrc[], int rates_total, int prev_calculated );
      
      /**
       */
      virtual void onCalculate( double &bufferSrc[], int candle );
      
      /**
       */
      virtual double onCalculate( int candle ) { return 0; };
      
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


/* 
 * ------
 */
int 
   Indicator::barsCalulated
      (  )
{
   return IndicatorCounted( );
};

/* 
 * ------
 */
void 
   Indicator::onCalculate
      ( int start, int end, double &bufferSrc[], int rates_total, int prev_calculated )
{
   this.buffer().copy( bufferSrc );
   
   for( int i = start; i < end; i++ ) {
      this.onCalculate( bufferSrc, i );
   }         
};

/* 
 * ------
 */
void 
   Indicator::onCalculate
      ( double &bufferSrc[], int candle )
{
   bufferSrc[candle] = this.onCalculate( candle );   
};