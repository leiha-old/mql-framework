// ------------------------------------------------
#property copyright "Copyright 2015, Leiha Sellier"
#property link      "https://github.com/leiha"
#property version   "1.00"

#include "../../Kernel/Core/Object.mqh"

class Trade : public Object
{  
   public : 

/* --------------------
 * Constructors
 * ----- 
 */          
   /** 
    */
   Trade(  ) 
      : Object(  )
   {
      
   };

/* --------------------
 * Methods
 * ----- 
 */   
      void          iterate  (       );
      
      virtual int   total    (       ) { return  0   ; };
      
      virtual bool  check    ( int i ) { return true ; };
      
   protected :
      
/* --------------------
 * Properties
 * ----- 
 */     
      
// -----
// --------------------     
};

/*
 * ------
 */
bool
   Trade::iterate
      ( bool order = true, int begin = 0, int end = NULL )
{
   return iterate( NULL, order, begin, end );
};

/*
 * ------
 */
bool
   Trade::iterate
      ( T* data, bool order = true, int begin = 0, int end = NULL )
{  
   bool ret;
 
   if( end == NULL ) {
      end = total(  );
   }
   else if( end < 0 )  {
      end = total(  ) + end;
   }
   
   if( order ) {
      ret = iterateAsc ( data, begin, end );
   }
   else 
   {
      ret = iterateDesc( data, begin, end );
   }
   
   return ret;
};

/*
 * ------
 */
bool
   Trade::iterateAsc
      ( T* data = NULL, int begin = 0, int end = NULL )
{
   bool ret;
   
   for( ; start < end ; start++ ) 
   {      
      if( ( ret = iterate( start, data ) ) != NULL ) 
      {
         return ret;
      }
   }
   
   return ret;   
};

/*
 * ------
 */
bool
   Trade::iterateDesc
      ( T* data = NULL, int begin = 0, int end = NULL )
{
   bool ret;         
   
   for( ; end >= begin ; end-- ) 
   {      
      if( ( ret = iterate( end, data ) ) != NULL ) 
      {
         return ret;
      }
   }
   
   return ret;   
};

bool
   Trade::iterate
      ( int index, T* data )
{
   bool ret; 
   
   if( check ( i ) ) 
   {
      ret = iterateOnItem    ( i, data );
   } 
   else {
      ret = iterateOnBadItem ( i, data );
   }      
   
   return ret;
};