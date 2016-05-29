// ------------------------------------------------
#property copyright "Copyright 2015, Leiha Sellier"
#property link      "https://github.com/leiha"
#property version   "1.00"

#include "./Array.mqh"

/**
 * Base class of all Array Pointer
 */
class ArrayPointer
   : public Array
{  
/* --------------------
 * #Scope > Public
 * ----- 
 */
public 
   :
   
   template < typename T >
   T _data [];
   
/* --------------------
 * Constructors
 * ----- 
 */  
   /**
    */
   ArrayPointer 
      ( ) 
         : 
            Array (  )        
   {
      
   };   

/* --------------------
 * Methods
 * ----- 
 */
   /**
    * Returns the total of items
    */
   int
      total
         (  )
   {
      return ArraySize ( _data );
   };
   
   /*
    * Resize the collection
    *
    * @return Index of first new reserved space
    */
   int
      resize
         ( int shift = 1 )
   {
      int    i = total (  );
      int    l = ArrayResize ( _data , i + shift );
            
      return i ;
   };
 
   /**
    */
   template < typename T >
   int
      hydrate
         ( T * & array [] , HYDRATE mode = HYDRATE_APPEND ) 
   {      
      int startDest , startSrc ;
      hydratorLimits 
         ( mode , startDest , startSrc )
         ;
      
      ArrayCopy 
         ( _data , array , startDest , startSrc , WHOLE_ARRAY )
         ;
            
      return total (  ) ;
   };
   
/* --------------------
 * #Scope > Protected
 * ----- 
 */      
protected 
   :
   /**
    * Add an item pointer in collection
    *
    * @return Index of inserted element
    */      
   template < typename T >
   int
      add
         ( T * item ) 
   {
      int     i   = resize ( 1 );   
      _data [ i ] = item ;
             
      return i ;
   };
   
   /**
    * Update an item pointer already present in the collection
    *
    * If the index is not present by default, the item is added
    *
    * @return Returns the index of the updated item
    */      
   template < typename T >
   int
      update 
         ( int index , T * item , bool addMode = true ) 
   {
      if 
         ( index < ( total (  ) - 1 ) ) 
      {
         _data [ i ] = item ;   
         return  i ;
      }
   
      return 
         addMode 
         ? add ( item ) 
         : NULL 
         ;
   };
   
   /**
    * Copy the data of the container directly in a primary Array
    *
    * The limits ( left and right ) can be specified, otherwise all data will be copied
    *
    * if the value is modified in the variable "items" ( array of pointers )
    *  then the value will be  modified in the collection
    *
    * @return The total of elements copied
    */
   template < typename T >
   int
      copy 
         ( T * & items [] , int left = 0 , int right = NULL ) 
   {
      return ArrayCopy ( _data , items , left , 0 , WHOLE_ARRAY ) ;
   };
  
   
/* --------------------
 * Properties
 * ----- 
 */

// -----
// --------------------     
};