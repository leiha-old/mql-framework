// ------------------------------------------------
#property copyright "Copyright 2015, Leiha Sellier"
#property link      "https://github.com/leiha"
#property version   "1.00"

#include "./Object.mqh"

class Array : public Object
{ 
   protected :
   
            
      
   public :
   
      double data[];
   
      /** 
       */
      Array* add  ( double item );
      
      /** 
       */
      Array* add  ( int i, double item );
      
      /** 
       */
      Array* value  ( int i, double item );
      
      /**
       */
      double value  ( int i );
      
      /**
       */
      int length  (  );
      
      /**
       */
      int extend  ( int number = 1 );
      
      int add     ( double &items[], int start1 = 0, int start2 = 0, int count = WHOLE_ARRAY );
      
      int copy    ( double &items[], int start1 = 0, int start2 = 0, int count = WHOLE_ARRAY );
      
};

/** 
 */
Array* 
   Array::add 
      ( double item ) 
{
   return add( extend(1), item );
};

/** 
 */
Array* 
   Array::add 
      ( int i, double item ) 
{
   extend( 1 );
   data[ i ] = item;
   
   return pointer( this );
};

/** 
 */
Array* 
   Array::value 
      ( int i, double item ) 
{
   data[ i ] = item;
   
   return pointer( this );
};

/**
 */
double 
   Array::value
      ( int i ) 
{
   return data[ i ];
};      

/**
 */
int 
   Array::length 
      (  ) 
{
   return ArraySize( data );
};

/**
 */
int 
   Array::extend 
      ( int number = 1 ) 
{
   int l = length(  ) + number;
       l = ArrayResize( data, l );
       
   return l;
};

/**
 */
int 
   Array::add 
      ( double &items[], int start1 = 0, int start2 = 0, int count = WHOLE_ARRAY ) 
{
   return ArrayCopy( data, items, start1, start2, count ); 
};

/**
 */
int 
   Array::copy 
      ( double &items[], int start1 = 0, int start2 = 0, int count = WHOLE_ARRAY ) 
{
   return ArrayCopy( items, data, start1, start2, count ); 
};