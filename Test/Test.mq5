
// ------------------------------------------------

#property copyright "Copyright 2015, Leiha Sellier"
#property link      "https://github.com/leiha"
#property version   "1.00"

// -------------------------

#property indicator_separate_window

#property indicator_minimum 0
#property indicator_maximum 100
#property indicator_level1  30
#property indicator_level2  50
#property indicator_level3  70

#property indicator_buffers 20
#property indicator_plots   20

#include "../includes.mqh"

// ------------------------------------------------

class Test : public Indicator
{
   public :
      
      /** 
       */
      void onInit () 
      {  
         
      };
};

Test *test = new Test();

// ------------------------------------------------

#include "bootstrap.mqh"