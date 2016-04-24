// ------------------------------------------------
#property copyright "Copyright 2015, Leiha Sellier"
#property link      "https://github.com/leiha"
#property version   "1.00"

#include "../Core/Array.mqh"
#include "../Core/Map.mqh"
#include "../Plot/Plot.mqh"

class Buffer : public Array
{
   public :   

/* --------------------
 * Constructors
 * ----- 
 */   
      /** 
       */
      Buffer(  )
         //: 
         {
         
         }
         ;  

/* --------------------
 * Methods
 * ----- 
 */
      /**
       * Get a slot
       */
      int slot();
      
      /** 
       * Get buffer by slot
       */
      virtual Buffer* get( int slot );
      
      /** 
       * Get first buffer 
       * The buffer is created if not already present
       */
      virtual Buffer* get(  );   
      
   protected :
   
      /**
       * Create a new buffer 
       */
      virtual Buffer* create(  );

/* --------------------
 * Properties
 * ----- 
 */
   /**
    */
   Map* _buffers;
      
// -----
// --------------------     
};

/**
 */
Buffer* Buffer::create() 
{
   return new Buffer();
};

/** 
 */
Buffer* Buffer::get( int i ) 
{
   return _buffers.get( i );
};

/** 
 */
Buffer* Buffer::get() 
{
   if( length() == 0 ) 
   {
      _buffers.add( pointer( this ) );
   }
   
   return _buffers.get( 0 );
}; 