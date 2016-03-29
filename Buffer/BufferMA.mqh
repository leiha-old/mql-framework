// ------------------------------------------------
#property copyright "Copyright 2015, Leiha Sellier"
#property link      "https://github.com/leiha"
#property version   "1.00"

class BufferMA : public Buffer
{
   protected :
   
      int period;
      int ma_shift;
      ENUM_MA_METHOD ma_method;
      int shift;
      
   public : 
        
      /** 
       */
      BufferMA( int aperiod, ENUM_MA_METHOD ama_method = MODE_EMA, int ama_shift = 0, bool display = true ) 
         : Buffer( display ), period(aperiod), ma_shift(ama_shift), ma_method(ama_method)
         {
            
         }
         ;
         
      /** 
       */
      virtual void onCalculateSecond ( Buffer* buffer, int rates_total, int prev_calculated ) 
      {  
      
         double a[];
         
         //double dSmoothFactor=2.0/(1.0+period);
         for( int i = prev_calculated, t = rates_total; i < t; i++ ) {
            ArrayResize(a, i+1);
            if(i <= period + 1) {
               a[i] = buffer.get(i);
            } else {
               double m = buffer.get(i);
               for( int ii = 1; ii < period; ii++ ) {
                  m += buffer.get(i-ii);
               }               
               a[i] = (m / period);
               //add(i, get(i-1)+(buffer.get(i)-buffer.get(i-period))/period);
               //add( i, buffer.get(i)*dSmoothFactor+get(i-1)*(1.0-dSmoothFactor));
            }
         }
         
         double aa[];
         
         for( int i = prev_calculated, t = rates_total; i < t; i++ ) {
            ArrayResize(aa, i+1);
            if(i <= period + 1) {
               aa[i] = a[i];
            } else {
               double m = a[i];
               for( int ii = 1; ii < period; ii++ ) {
                  m += a[i-ii];
               }               
               aa[i] = (m / period);
               //add(i, get(i-1)+(buffer.get(i)-buffer.get(i-period))/period);
               //add( i, buffer.get(i)*dSmoothFactor+get(i-1)*(1.0-dSmoothFactor));
            }
         }
         
         double aaa[];
         
         for( int i = prev_calculated, t = rates_total; i < t; i++ ) {
            ArrayResize(aaa, i+1);
            if(i <= period + 1) {
               aaa[i] = aa[i];
            } else {
               double m = aa[i];
               for( int ii = 1; ii < period; ii++ ) {
                  m += aa[i-ii];
               }               
               aaa[i] = (m / period);
               //add(i, get(i-1)+(buffer.get(i)-buffer.get(i-period))/period);
               //add( i, buffer.get(i)*dSmoothFactor+get(i-1)*(1.0-dSmoothFactor));
            }
         }
         
        double aaaa[];
         
        for( int i = prev_calculated, t = rates_total; i < t; i++ ) {
            ArrayResize(aaaa, i+1);
            if(i <= period + 1) {
               aaaa[i] = aaa[i];
            } else {
               double m = aaa[i];
               for( int ii = 1; ii < period; ii++ ) {
                  m += aaa[i-ii];
               }               
               aaaa[i] = (m / period);
               //add(i, get(i-1)+(buffer.get(i)-buffer.get(i-period))/period);
               //add( i, buffer.get(i)*dSmoothFactor+get(i-1)*(1.0-dSmoothFactor));
            }
         }
         
         for( int i = prev_calculated, t = rates_total; i < t; i++ ) {
            add(i, aaaa[i]  );
         }
         
         double aaaaa[];
         
         for( int i = prev_calculated, t = rates_total; i < t; i++ ) {
            ArrayResize(aaaaa, i+1);
            if(i <= period + 1) {
               aaaaa[i] = aaaa[i];
            } else {
               double m = aaa[i];
               for( int ii = 1; ii < period; ii++ ) {
                  m += aaaa[i-ii];
               }               
               aaaaa[i] = (m / period);
               //add(i, get(i-1)+(buffer.get(i)-buffer.get(i-period))/period);
               //add( i, buffer.get(i)*dSmoothFactor+get(i-1)*(1.0-dSmoothFactor));
            }
         }
         
         for( int i = prev_calculated, t = rates_total; i < t; i++ ) {
            add(i, aaaaa[i]  );
         }
      };
};