// ------------------------------------------------
#property copyright "Copyright 2015, Leiha Sellier"
#property link      "https://github.com/leiha"
#property version   "1.00"

#include "../Object/Object.mqh"

/**
 * Base class of all Array
 */
class Array
   : public Object
{  
/* --------------------
 * #Scope > Public
 * ----- 
 */
public 
   :
   
   /**
    */
   enum HYDRATE {
      HYDRATE_RESET ,
      HYDRATE_APPEND
   };
   
/* --------------------
 * Constructors
 * ----- 
 */  
   /**
    */
   Array 
      (  ) 
      : 
         Object (  )        
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
   
   
 
// -----
// --------------------     
};