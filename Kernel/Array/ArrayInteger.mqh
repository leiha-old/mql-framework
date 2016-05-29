// ------------------------------------------------
#property copyright "Copyright 2015, Leiha Sellier"
#property link      "https://github.com/leiha"
#property version   "1.00"

#include "./ArrayData.mqh"

/**
 * Base class of all Integer array
 */
class ArrayInteger
   : public ArrayData
{  
/* --------------------
 * #Scope > Public
 * ----- 
 */
public 
   :
#include "./_/Array.p.mqh"

/* --------------------
 * Constructors
 * ----- 
 */          
   /** 
    */
   ArrayInteger 
      ( int & array [] ) 
      : 
         ArrayData (  )
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
#include "./_/Array.pp.mqh"

/* --------------------
 * Properties
 * ----- 
 */
   
// -----
// --------------------     
};