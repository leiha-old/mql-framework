// ------------------------------------------------
#property copyright "Copyright 2015, Leiha Sellier"
#property link      "https://github.com/leiha"
#property version   "1.00"

#include "./Object.mqh"

class Array : public Object
{ 
   protected :
   
      double _items[];      
      
   public :
   
      /** 
       */
      Array* add  ( double item );
      
      /** 
       */
      Array* add  ( int i, double item );
      
      /** 
       */
      Array* set  ( int i, double item );
      
      /**
       */
      double get  ( int i );
      
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
   _items[ i ] = item;
   
   return pointer( this );
};

/** 
 */
Array* 
   Array::set 
      ( int i, double item ) 
{
   _items[ i ] = item;
   
   return pointer( this );
};

/**
 */
double 
   Array::get
      ( int i ) 
{
   return _items[ i ];
};      

/**
 */
int 
   Array::length 
      (  ) 
{
   return ArraySize( _items );
};

/**
 */
int 
   Array::extend 
      ( int number = 1 ) 
{
   int l = length(  ) + number;
       l = ArrayResize( _items, l );
       
   return l;
};

/**
 */
int 
   Array::add 
      ( double &items[], int start1 = 0, int start2 = 0, int count = WHOLE_ARRAY ) 
{
   return ArrayCopy( _items, items, start1, start2, count ); 
};

/**
 */
int 
   Array::copy 
      ( double &items[], int start1 = 0, int start2 = 0, int count = WHOLE_ARRAY ) 
{
   return ArrayCopy( items, _items, start1, start2, count ); 
};