// ------------------------------------------------
#property copyright "Copyright 2015, Leiha Sellier"
#property link      "https://github.com/leiha"
#property version   "1.00"

#include "../Calculator/Calculator.mqh"

class Trader : public Calculator
{  
   public : 

/* --------------------
 * Constructors
 * ----- 
 */          
      /** 
       */
      Trader(  ) 
         : Calculator(  )
         {}
         ;

/* --------------------
 * Methods
 * ----- 
 */         
      /** 
       */
      virtual int onCalculate ( int rates_total, int prev_calculated );
      
   protected :
      
      
/* --------------------
 * Properties
 * ----- 
 */     
     
// -----
// --------------------     
};

int 
   Trader::onCalculate 
      ( int rates_total, int prev_calculated ) 
{
   
   return rates_total;
};