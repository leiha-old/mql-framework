// ------------------------------------------------
#property copyright "Copyright 2015, Leiha Sellier"
#property link      "https://github.com/leiha"
#property version   "1.00"

#include "../Object/Object.mqh"
#include "./CollectionData.mqh"
#include "./CollectionFilter.mqh"

/**
 * Base class of all Collections
 */
class Collection
   : public Object
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
   Collection 
         ( CollectionData * collection = NULL ) 
      : Object (  )        
   {
      
   };

/* --------------------
 * Methods
 * ----- 
 */   
   /**
    * Returns the data container
    */      
   virtual
   CollectionData * 
      data
         (  ) 
   {
      return _data ;
   };
   
   /**
    * Sets the data container
    */      
   bool 
      data
         ( CollectionData * collection ) 
   {
      bool 
         already = false 
         ;
      
      if ( collection == NULL ) 
      {
         already    = true ;
         collection = newInstanceOfCollectionData (  );            
      }
      
      _data = collection ;
      
      return already ;
   };
   
   /**
    * Filtering the Collection
    *
    * Returns a new instance of Collection with the data filtered.
    *          
    * NB : if the value is modified in the new Collection,
    * then the value will be modified in the collection of origin
    */
   Collection *
      select
         ( CollectionFilter * filter = NULL ) 
   {
      if( filter == NULL ) 
      {
         filter = newInstanceOfCollectionFilter (  );
      }
      
      CollectionData * dataFiltered = newInstanceOfCollectionData (  );
      if ( filter.run ( dataFiltered ) ) 
      {
         return newInstanceOfCollection ( dataFiltered );   
      }
      
      return NULL;
   };

/* --------------------
 * #Scope > Protected
 * ----- 
 */
protected 
   :
   
   /**
    * Returns a new instance of Collection
    */
   Collection * 
      newInstanceOfCollection
         ( CollectionData * collection = NULL )
   {
      return new Collection ( collection );
   };
   
   /**
    * Returns a new instance of Filter
    */
   CollectionFilter * 
      newInstanceOfCollectionFilter
         (  )
   {
      return new CollectionFilter ( data (  ) );
   };
   
   /**
    * Returns a new instance of Data Container 
    */
   CollectionData * 
      newInstanceOfCollectionData 
         (  )
   {
      return new CollectionData (  );
   };
      
/* --------------------
 * Properties
 * ----- 
 */
   CollectionData * _data ;
         
// -----
// --------------------     
};