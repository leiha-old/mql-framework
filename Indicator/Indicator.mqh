// ------------------------------------------------
#property copyright "Copyright 2015, Leiha Sellier"
#property link      "https://github.com/leiha"
#property version   "1.00"

#ifdef __MQL5__
   #include "./Indicator.mql5.mqh"
#else
   #include "./Indicator.mql4.mqh"
#endif

/* 
 * ------
 */
MovingAverage* 
   Indicator::ma
      ( int period, int smooth = 0, Calculator* calculator = NULL ) 
{
   MovingAverage* m = new MovingAverage( period );
   if( smooth > 0 ) {
      m.smooth( smooth );
   }
   
   if( calculator ) {
      calculator.add( m );
   }
   else {
      _calculators.add( m );
   }
   
   return m;
};

/* 
 * ------
 */
SignalZone* 
   Indicator::sz
      ( double bought, double sold, Calculator* calculator = NULL ) 
{
   SignalZone* s = new SignalZone(  );
   
   s.overZone( bought, sold );

   if( calculator ) {
      calculator.add( s );
   }
   else {
      _calculators.add( s );
   }

   return s;
};

/* 
 * ------
 */
SignalCrossing* 
   Indicator::sc
      ( Calculator* calculator, Calculator* calculator2 = NULL ) 
{
   SignalCrossing* s = new SignalCrossing(  );
   
   s.add( calculator2 ? calculator2 : pointer( this ) );
   s.add( calculator );

   _calculators.add( s );

   return s;
};

/* 
 * ------
 */
SignalTrend* 
   Indicator::st
      ( Calculator* calculator = NULL ) 
{
   SignalTrend* s = new SignalTrend(  );
   
   if( calculator ) {
      calculator.add( s );
   }
   else {
      _calculators.add( s );
   } 

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
   
   
   int calculated = this.barsCalulated();
   if( calculated < rates_total ) {
      //int error = GetLastError();
      return rates_total;
   }
   
   int start = 0;
   if( prev_calculated > 0 ) {
      start = prev_calculated - 1;
   }
   int end = rates_total - start;
   
   
   double bufferSrc[];
   this.onCalculate ( start, end, bufferSrc, rates_total, prev_calculated );
   this.onCalculate (             bufferSrc, rates_total, start );
   return rates_total;
};