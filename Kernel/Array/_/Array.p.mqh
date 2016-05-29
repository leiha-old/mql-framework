// ------------------------------------------------
#property copyright "Copyright 2015, Leiha Sellier"
#property link      "https://github.com/leiha"
#property version   "1.00"

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

/**
 */
template < typename T >
int 
   hydrate
      ( T & array [] , HYDRATE mode = HYDRATE_APPEND ) 
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