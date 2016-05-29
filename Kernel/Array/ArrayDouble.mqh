// ------------------------------------------------
#property copyright "Copyright 2015, Leiha Sellier"
#property link      "https://github.com/leiha"
#property version   "1.00"

#include "./ArrayData.mqh"

/**
 * Base class of all Double array
 */
class ArrayDouble
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
   ArrayDouble 
      ( double & array [] ) 
      : 
         ArrayData   (  )
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