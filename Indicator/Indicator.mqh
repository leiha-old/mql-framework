// ------------------------------------------------
#property copyright "Copyright 2015, Leiha Sellier"
#property link      "https://github.com/leiha"
#property version   "1.00"

class Indicator : public Buffer
{  
   protected :
   
      int _handle;
      
      /** 
       */
      Indicator* set(ENUM_CUSTOMIND_PROPERTY_STRING property, string value) {
         IndicatorSetString(property, value);  
         return GetPointer(this);
      };
      
      /** 
       */
      Indicator* set(ENUM_CUSTOMIND_PROPERTY_INTEGER property, int value) {
         IndicatorSetInteger(property, value);  
         return GetPointer(this);
      };
      
      /** 
       */
      Indicator* set(ENUM_CUSTOMIND_PROPERTY_DOUBLE property, double value) {
         IndicatorSetDouble(property, value);  
         return GetPointer(this);
      };
   
   public : 
           
      /** 
       */
      Indicator( bool display = true ) 
         : Buffer(display)
         {}
         ;
         
      /** 
       */
      int handle (  ) 
      {
         return _handle;
      };
      
      /**
       */
      Indicator* minimum(double value) {
         return set(INDICATOR_MINIMUM, value);
      };
      
      /**
       */
      Indicator* maximum(double value) {
         return set(INDICATOR_MAXIMUM, value);
      };
      
      /**
       */
      Indicator* shortName(string name) {
         return set(INDICATOR_SHORTNAME, name);
      };
      
      /**
       */
      Indicator* digits(int digits) {
         return set(INDICATOR_DIGITS, digits);
      };
      
      /** 
       */
      Indicator* handle ( int handle ) 
      {
         _handle = handle;
         return pointer(this);
      };
      
      /** 
       */
      virtual int onCalculate ( int rates_total, int prev_calculated ) 
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
            copy( buffer );
         }
         
         if( CopyBuffer( handle(), 0, start, to_copy, buffer ) <= 0 ) {
            return rates_total; 
         }
      
         onCalculate ( buffer, rates_total, prev_calculated );
         return rates_total;
      };
};