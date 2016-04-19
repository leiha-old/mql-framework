// ------------------------------------------------
#property copyright "Copyright 2015, Leiha Sellier"
#property link      "https://github.com/leiha"
#property version   "1.00"

class BufferMA : public Buffer
{
   protected :
   
      int _period;
      
      /**
       */
      virtual void onIterate (
         double &buffer   [], 
         double &bufferSrc[], 
         int     iterator, 
         int     rates_total, 
         int     prev_calculated
      ) {
         ArrayCopy(bufferSrc, buffer);
      };
      
      /** 
       */
      virtual void onIterateCandle ( double value, double &buffer[], double &bufferSrc[], int candle ) 
      {
         for( int ii = 1; ii < _period; ii++ ) 
         {
            value += formatDouble(bufferSrc[ candle - ii ]);
         }
         buffer[ candle ] = ( value / _period );
      };
      
   public : 
        
      /** 
       */
      BufferMA( int period,  int smoothLevel = 1, bool display = true ) 
         :  Buffer( smoothLevel, period, display ), 
           _period( period )           
         {
            
         }
         ;
      
      BufferMA* smooth(int level = 1) {
         _iterationOnBuffer = level;
         return pointer(this);
      };
      
};