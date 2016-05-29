// ------------------------------------------------
#property copyright "Copyright 2015, Leiha Sellier"
#property link      "https://github.com/leiha"
#property version   "1.00"

#include "./ArrayPointer.mqh"

/**
 * Base class of all Array Object
 */
class ArrayObject
   : public ArrayPointer
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
   template < typename T >
   ArrayObject
      ( Object * & array [] ) 
         : 
            ArrayPointer (  )
   {
      hydrate 
         ( array , HYDRATE_RESET ) 
         ;
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