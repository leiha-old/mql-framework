// ------------------------------------------------
#property copyright "Copyright 2015, Leiha Sellier"
#property link      "https://github.com/leiha"
#property version   "1.00"

class BufferMA : public Buffer
{
   protected :
   
      int _period;
      
   public : 
        
      /** 
       */
      BufferMA( int period,  int smoothLevel = 1, bool display = true ) 
         :  Buffer( smoothLevel, period, display ), 
           _period( period )           
         {
            
         }
         ;
         
      /** 
       */
      virtual double onCalculate ( double &buffer[], int candle, double value ) 
      {
         for( int ii = 1; ii < _period; ii++ ) 
         {
            value += buffer[ candle - ii ];
         }
         return ( value / _period );
      };
      
      BufferMA* smooth(int level = 1) {
         _iterationOnBuffer = level;
         return pointer(this);
      };
      
};