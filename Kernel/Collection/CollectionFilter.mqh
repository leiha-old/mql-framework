// ------------------------------------------------
#property copyright "Copyright 2015, Leiha Sellier"
#property link      "https://github.com/leiha"
#property version   "1.00"

#include "../Loop/Loop.mqh"
#include "./CollectionData.mqh"

/**
 * Base class of all Filters of Collections
 */
class CollectionFilter
   : public Loop
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
   CollectionFilter 
         ( CollectionData * collection ) 
      : Loop (  )
   {
      
   };

/* --------------------
 * Methods
 * ----- 
 */        
   /**
    * Executes the filter on the specified data container
    */
   bool 
      run
         ( CollectionData * collection ) 
   {
      return NULL ;
   };
   
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