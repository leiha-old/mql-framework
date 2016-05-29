// ------------------------------------------------
#property copyright "Copyright 2015, Leiha Sellier"
#property link      "https://github.com/leiha"
#property version   "1.00"

#include "./ArrayData.mqh"

/**
 * Base class of all String array
 */
class ArrayString
   : public ArrayData
{
/* --------------------
 * #Scope > Public
 * ----- 
 */ 
public 
   :
/* --------------------
 * Constructors
 * ----- 
 */          
   /** 
    */
   ArrayString 
      (  ) 
      : 
         ArrayData   ( ),
         _data<string>(  )
   {
      
   };   
   
/* --------------------
 * Methods
 * ----- 
 */
  
/* --------------------
 * #Scope > Protected
 * ----- 
 */
protected 
   :

/* --------------------
 * Properties
 * ----- 
 */
     
   
     
// -----
// --------------------     
};