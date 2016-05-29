// ------------------------------------------------
#property copyright "Copyright 2015, Leiha Sellier"
#property link      "https://github.com/leiha"
#property version   "1.00"

#include "../Object/Object.mqh"

/**
 * Base class of Loop System
 */
class Loop
   : public Object
{  

public 
   :

/* --------------------
 * Constructors
 * ----- 
 */          
   /** 
    */
   Loop (  ) 
      : Object    (   ) ,
        __total   ( 0 ) ,
        __reverse ( false )
   {
      limit (  );
   };

/* --------------------
 * Methods
 * ----- 
 */ 
   /**
    * Modifies the limits of the loop
    */
   void
      limit
         ( int left = 0 , int right = NULL )
   {
      __limitLeft  = left  ;
      __limitRight = right ;
   };

   /**
    * Enable / Disable the reverse mode for loop
    */
   void
      reverse
         ( bool enable )
   {
      __reverse = enable ;
   };
   
   /**
    * Returns the state of the reverse mode for loop
    */
   bool
      reverse 
         (  )
   {
      return __reverse ;
   };
     
   /**
    * Returns the total of iterations for loop
    */
   virtual
   int
      total
         (  )
   {
      return __total ;
   };
   
   /**
    * Handling of Loop
    */
   template < typename T >
   bool
      run
         ( T value = NULL )
   {  
      return 
         reverse (  )
            ? loopDesc ( value )
            : loopAsc  ( value )
         ;         
   };
   
protected 
   :
      
   /**
    * Handling of state "True" Loop  
    */
   template < typename T >
   bool 
      loopTrue 
         ( int index , T value = NULL ) 
   { 
      return NULL ;
   };
   
   /**
    * Handling of state "False" Loop  
    */
   template < typename T >
   bool 
      loopFalse 
         ( int index , T value = NULL ) 
   { 
      return NULL ;
   };
   
   /**
    * Handling of switcher "True / False" of loop
    */
   template < typename T >
   bool
      loopTrueFalse
         ( int index , T value = NULL )
   {
      return true ;
   };
   
   /**
    * Handling of Ascendant Loop  
    */
   template < typename T >
   bool
      loopAsc
         ( T value = NULL )
   {
      int  left  = loopLimitLeft  (  );
      int  right = loopLimitRight (  );
      bool ret   = false ;
      
      for( ; left < right ; left ++ ) 
      {      
         if
            ( ( ret = loopItem ( left ) ) != NULL )
         {
            return ret ;
         }
      }
      
      return ret ;
   };
   
   /**
    * Handling of Descendant Loop  
    */
   template < typename T >
   bool
      loopDesc
         ( T value = NULL )
   {
      int  left  = loopLimitLeft  (  );
      int  right = loopLimitRight (  );
      bool ret   = false ;
      
      for( ; right >= left ; right -- ) 
      {      
         if
            ( ( ret = loopItem ( right , value ) ) != NULL ) 
         {
            return ret ;
         }
      }
      
      return ret ;
   };
   
   /**
    * Handling of Item
    */
   template < typename T >
   bool
      loopItem
         ( int index , T value = NULL )
   {
      return 
         loopTrueFalse  ( index , value )
            ? loopTrue  ( index )
            : loopFalse ( index )
         ;
   };
   
   /**
    * Handling of Left Limits the loop 
    */
   int
      loopLimitLeft
         (  )
   {
      int  total = total (  )  ;
      int  left  = __limitLeft ;
      if
         ( left < 0 || left > total - 1 )  
      {
         left = 0 ;
      }
      return left ;
   };
   
   /**
    * Handling of Right Limits the loop 
    */
   int
      loopLimitRight
         (  )
   {
      int  total = total (  )   ;
      int  right = __limitRight ;
      if
         ( right == NULL || right > total ) 
      {
         right = total ;
      }
      else if
         ( right < 0 )  
      {
         right = total + right ;
      }
      return right ;
   };
   
   /**
    * Sets the total of iterations for loop
    */
   void
      total
         ( int total )
   {
      __total = total ;
   };
      
/* --------------------
 * Properties
 * ----- 
 */     
private
   :
   
   int  __total      ;
   bool __reverse    ;
   
   int  __limitLeft  ;
   int  __limitRight ;
   
// -----
// --------------------     
};