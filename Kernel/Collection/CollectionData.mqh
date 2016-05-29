// ------------------------------------------------
#property copyright "Copyright 2015, Leiha Sellier"
#property link      "https://github.com/leiha"
#property version   "1.00"

#include "../Object/Object.mqh"

/**
 * Base class of all Data Container of Collections
 */
class CollectionData
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
   CollectionData (  ) 
      : Object (  )
   {
      
   };
   
/* --------------------
 * Methods
 * ----- 
 */  
   /**
    * Returns the total of items in the collection
    */
   int 
      total 
         (  ) 
   {
      return 0 ;
   };
     
   /**
    * Returns an item by the index linked in moment he was inserted
    */      
   virtual 
      Object * 
         get 
            ( int index ) 
   {
      return NULL ;
   };
   
   /**
    * Add an item pointer in collection
    *
    * @return int Index of inserted element
    */      
   template < typename T >
   int
      set
         ( T * item ) 
   {
      return NULL ;
   };
   
   /*
    * Add an item reference in collection
    *
    * @return Index of inserted element
    */
   template < typename T >
   int
      set
         ( T & item ) 
   {
      return set ( pointer ( item ) );
   };
   
   /*
    * Add an item in collection
    *
    * @return Index of inserted element
    */
   template < typename T >
   int
      set
         ( T item ) 
   {
      return set ( pointer ( item ) );
   };
   
   /**
    * Update an item pointer already present in the collection
    *
    * If the index is not present by default, the item is added
    *
    * @return Success ( true ) or not ( false )
    */      
   template < typename T >
   bool 
      update 
         ( int index , T * item , bool add = true ) 
   {
      return NULL ;
   };
   
   /**
    * Update an item reference already present in the collection
    *
    * If the index is not present, by default the item is added
    *
    * @return Success ( true ) or not ( false )
    */      
   template < typename T >
   bool
      update 
         ( int index , T & item , bool add = true ) 
   {
      return update ( index , pointer ( item ) , add );
   };
   
   /**
    * Update an item already present in the collection
    *
    * If the index is not present, by default the item is added
    *
    * @return Success ( true ) or not ( false )
    */      
   template < typename T >
   bool
      update 
         ( int index , T item , bool add = true ) 
   {
      return update ( index , pointer ( item ) , add );
   };
   
   
   
   /**
    * Copys the data of the container in an another container
    *
    * The limits ( left and right ) can be specified, otherwise all data will be copied
    *
    * if the value is modified in the new "items" ( array of pointers )
    *  then the value will be  modified in the collection
    *
    * @return The total of elements copied
    */
   int
      copy 
         ( CollectionData * items , int left = 0 , int right = NULL ) 
   {
      return NULL;
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