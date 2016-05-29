// ------------------------------------------------
#property copyright "Copyright 2015, Leiha Sellier"
#property link      "https://github.com/leiha"
#property version   "1.00"

#include "../../Loop/LoopArray.mqh"

/**
 * Plugin of Array for find the index of a value
 */
class Array_IndexOf
   : public LoopArray
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
   Array_IndexOf ( T ) 
      : Loop (  )
   {
      
   };
   
   /**
    * Handling of Loop
    */
   template < typename T >
   bool
      run
         ( T & loopable [] , T value = NULL )
   { 
      data ( loopable );
      
      return 
         run ( value ) 
         ;
   };
   
   /**
    * Handling of Loop
    */
   template < typename T >
   bool
      run
         ( T * & loopable [] , T value = NULL )
   {  
      data ( loopable );
      
      return 
         run ( value ) 
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
   
   /**
    * @inherited
    */
   template < typename T >
   bool
      loopTrueFalse
         ( int index , T value = NULL )
   {
      return ( value == data ( index ) );
   };
   
   /**
    * @inherited
    */
   template < typename T >
   bool
      loopTrue
         ( int index , T value = NULL )
   {
      return index ;
   };

/* --------------------
 * Properties
 * ----- 
 */  

// -----
// --------------------     
};